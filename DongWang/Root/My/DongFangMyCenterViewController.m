//
//  DongFangMyCenterViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/27.
//

#import "DongFangMyCenterViewController.h"
#import "DongwangMyCenterTableViewCell.h"
#import "DongwangMyHeaderView.h"
#import "DongwangMyPrizeViewController.h"
#import "DongwangPropsViewController.h"
#import "DongwangGradesViewController.h"
#import "DongwangMyInfoViewController.h"
#import "DongwangSettingViewController.h"
#import "DongwangMsgViewController.h"
#import "DongwangMyyueViewController.h"
#import "DongwangMyjifenViewController.h"
#import "DongwangSigninQiandaoViewController.h"
#import "DongwangActityView.h"
#import "DongwangAutorAlterView.h"
#import "DongwangRealAuotrViewController.h"
#import "DongwangMyViewModel.h"
#import <POP.h>
#import <LOTAnimationView.h>
#import "DongwangMyChatListViewController.h"
#import "DongwangFenleiViewController.h"
#import "DongwangTixianViewController_V3.h"
@interface DongFangMyCenterViewController ()<UITableViewDelegate,UITableViewDataSource,DongwangMyHeaderViewDelegate,DongwangAutorAlterViewDelegate>
@property(nonatomic,strong) UITableView *  DongwangTableView;
@property(nonatomic,strong) NSMutableArray  *  DongwangDataArr;
@property(nonatomic,strong) DongwangMyHeaderView * Header;
@property(nonatomic,strong) UIView * headerBgView;
@property(nonatomic,strong) DongwangActityView * dongwangView;
@property(nonatomic,strong) DongwangAutorAlterView * dongwangalterView;
@property (nonatomic, assign) CGFloat currentPostion;
@property (nonatomic, assign) CGFloat lastPosition;
@property (nonatomic, assign) CGFloat stopPosition;
@property (nonatomic, assign) BOOL topBool;
@property (nonatomic, assign) BOOL bottomBool;
@property(nonatomic,strong)  NSString * showTimeStr;
@property(nonatomic,strong)  NSString * leaveTimeStr;
@property(nonatomic,strong) LOTAnimationView * animationView;
@property(nonatomic,strong) UITableView * DongwangBaseTableview;
@end

@implementation DongFangMyCenterViewController
-(NSMutableArray *)DongwangDataArr{
    if (!_DongwangDataArr) {
        _DongwangDataArr = [[NSMutableArray alloc]initWithArray:@[@"我的奖品",@"我的道具",@"我的成绩",@"我的任务",@"我的圈子"]];
    }
    return _DongwangDataArr;
}
-(LOTAnimationView *)animationView{
    if (!_animationView) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
        _animationView = [[LOTAnimationView alloc]initWithContentsOfURL:[NSURL URLWithString:@"http://192.168.3.157/dongwang_h5/Banner_Lottie/data.json"]];
        //[LOTAnimationView animationWithFilePath:path];
        _animationView.frame = CGRectMake(0, RealWidth(100), SCREEN_WIDTH, RealWidth(550));
        _animationView.contentMode =  UIViewContentModeScaleToFill;
        _animationView.loopAnimation = YES;
        _animationView.backgroundColor = [UIColor clearColor];
        _animationView.userInteractionEnabled = YES;
    }
    return _animationView;
}
-(UIView*)headerBgView{
if(!_headerBgView){
_headerBgView = [UIView new];
_headerBgView.backgroundColor= [UIColor colorWithHexString:@"#3F2B9A"];
}
return _headerBgView;
}
-(DongwangAutorAlterView *)dongwangalterView{
    if (!_dongwangalterView) {
        _dongwangalterView = [[DongwangAutorAlterView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _dongwangalterView.delegate =self;
    }
    return _dongwangalterView;
}
-(DongwangActityView *)dongwangView{
    if (!_dongwangView) {
        _dongwangView = [[DongwangActityView alloc]initWithFrame:CGRectMake(K(276), K(500)+StatuBar_Height, K(86), K(74.5))];
        _dongwangView.dragEnable = NO;
        _dongwangView.hidden = YES;
        _dongwangView.backgroundColor = [UIColor clearColor];
        MJWeakSelf;
        _dongwangView.clickDragViewBlock = ^(WMDragView *dragView) {
            DongwangMyInfoViewController * DongwangInfoVc = [[DongwangMyInfoViewController alloc]init];
            DongwangInfoVc.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:DongwangInfoVc animated:YES];
        };
    }
    return _dongwangView;
}
-(UITableView *)DongwangBaseTableview{
    if (!_DongwangBaseTableview) {
        _DongwangBaseTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-kTabBarHeight) style:UITableViewStylePlain];
        _DongwangBaseTableview.showsVerticalScrollIndicator = NO;
        _DongwangBaseTableview.showsHorizontalScrollIndicator = NO;
        _DongwangBaseTableview.separatorStyle =  UITableViewCellSelectionStyleNone;
        _DongwangBaseTableview.backgroundColor = [UIColor clearColor];
//        [UIColor colorWithHexString:@"#341E7B"];

    }
    return _DongwangBaseTableview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#341E7B"];
        //底部炫富窗口 当资料完善 就隐藏
    self.gk_navigationBar.alpha = 0;

    [self.view addSubview:self.DongwangBaseTableview];
    UIView * DongwangFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RealWidth(260))];
    _DongwangBaseTableview.tableFooterView = DongwangFooterView;
    UIImageView * dongwanBJfooterImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(12), 0, SCREEN_WIDTH-RealWidth(20), RealWidth(260))];
    dongwanBJfooterImgView.image = [UIImage imageNamed:@"dongwangbjcenter"];
    [DongwangFooterView addSubview:dongwanBJfooterImgView];
    [DongwangFooterView addSubview:self.DongwangTableView];
    [_DongwangBaseTableview addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    [_DongwangBaseTableview.superview addSubview:self.headerBgView];
    self.Header.height = self.Header.MyHeaderHeight;
    _DongwangBaseTableview.tableHeaderView = self.Header;
    [self.view addSubview:self.dongwangView];
    
    UIView * DongwangbackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RealWidth(100))];
    DongwangbackView.backgroundColor = [UIColor redColor];
    [_DongwangBaseTableview.backgroundView addSubview:DongwangbackView];
    

}
-(void)DongwangAnimatons{
    CASpringAnimation *spring  = [CASpringAnimation animationWithKeyPath:@"position.x"];
    spring.fromValue = @(_dongwangView.layer.position.x);
    spring.toValue = @(_dongwangView.layer.position.x+K(10));
    spring.repeatCount = MAXFLOAT;
    //阻尼系数
    spring.damping = 5;
    //刚度系数: (劲度系数 / 弹性系数): 系数越大,形变的产生的力越大, 运动越快
    spring.stiffness = 100;
    //质量: 影响图层运动时候的惯性, 质量越大弹簧拉伸和压缩的幅度越大 (动画的幅度,波动变大)
    spring.mass = 0;
    //初识速率: 动画视图的初识速度大小
    //速率为正时候, 速度方向与运动方向一致, 否则相仿.
    spring.initialVelocity = 1;
    // settlingDuration 结算时间,预估弹簧动画到停住的时间的估算, 根据当前动画的各个参数估算, 通常弹簧动画的估算时间使用结算时间比较准确
    spring.duration = spring.settlingDuration;
    [_dongwangView.layer addAnimation:spring forKey:@"springAnimation"];
}
-(void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id>*)change context:(void*)context{

if([keyPath isEqualToString:@"contentOffset"]){

NSValue *value = change[NSKeyValueChangeNewKey];

CGFloat chaneoffsetY = value.UIOffsetValue.vertical;
    self.headerBgView.frame = CGRectMake(0,0,SCREEN_WIDTH,-chaneoffsetY);
    
}}

-(DongwangMyHeaderView *)Header{
    if (!_Header) {
        _Header = [[DongwangMyHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(0))];
        _Header.delegate = self;
    }
    return _Header;
}
-(UITableView *)DongwangTableView{
    if (!_DongwangTableView) {
        _DongwangTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, K(0), SCREEN_WIDTH, RealWidth(250)) style:UITableViewStylePlain];
        _DongwangTableView.delegate = self;
        _DongwangTableView.dataSource = self;
        _DongwangTableView.showsVerticalScrollIndicator = NO;
        _DongwangTableView.showsHorizontalScrollIndicator = NO;
        _DongwangTableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
        _DongwangTableView.backgroundColor = [UIColor clearColor];
//        [UIColor colorWithHexString:@"#341E7B"];
        
    }
    return _DongwangTableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DongwangDataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(50);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath  *)indexPath{
    static NSString * DongwangIdentifer = @"DongwangMyCenterTableViewCell";
    DongwangMyCenterTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangIdentifer];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwangMyCenterTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangIdentifer];
    }
    if (indexPath.row == self.DongwangDataArr.count-1) {
        DongwangCell.Dongwangline.hidden =  YES;
    }else{
        DongwangCell.Dongwangline.hidden = NO;
    }
//    if (indexPath.row == 0) {
//    [DongwangCell.MyContentView acs_radiusWithRadius:RealWidth(5) corner:UIRectCornerTopLeft | UIRectCornerTopRight];
//    }else if (indexPath.row == self.DongwangDataArr.count-1){
//    [DongwangCell.MyContentView acs_radiusWithRadius:RealWidth(5) corner:UIRectCornerBottomLeft | UIRectCornerBottomRight];
//    }
    DongwangCell.NameText = self.DongwangDataArr[indexPath.row];
    return DongwangCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
//        [_animationView play];
        
        
        
        
        DongwangMyPrizeViewController * DongwangVc = [[DongwangMyPrizeViewController alloc]init];
        DongwangVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:DongwangVc animated:YES];
    }else if (indexPath.row == 1){
        DongwangPropsViewController * DongwangVc = [[DongwangPropsViewController alloc]init];
        DongwangVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:DongwangVc animated:YES];
        
    }else if (indexPath.row == 2){
        DongwangGradesViewController * DongwangVc = [[DongwangGradesViewController alloc]init];
        DongwangVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:DongwangVc animated:YES];
    }else if (indexPath.row == 3){
        DongwangFenleiViewController * FenleiVc=  [[DongwangFenleiViewController alloc]init];
        FenleiVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:FenleiVc animated:YES];
    }else if (indexPath.row == 4){
        DongwangMyChatListViewController * ListVc = [[DongwangMyChatListViewController alloc]init];
        ListVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:ListVc animated:YES];
    
    }
}
#pragma mark--back
-(void)DongwangMyHeaderVieback{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark--消息
-(void)DongwangMyHeaderViewpushToMsgVc{
    DongwangMsgViewController * dongwangMsgVc = [[DongwangMsgViewController alloc]init];
    dongwangMsgVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dongwangMsgVc animated:YES];
}
#pragma mark--
-(void)DongwangMyHeaderViewpushtoSettingVc{
    DongwangSettingViewController * SetingVc = [[DongwangSettingViewController alloc]init];
    SetingVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:SetingVc animated:YES];
}
#pragma mark--DongwangMyHeaderViewDelegate
-(void)DongwangMyHeaderViewPushInfoVc{
    DongwangMyInfoViewController * DongwangInfoVc = [[DongwangMyInfoViewController alloc]init];
    DongwangInfoVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:DongwangInfoVc animated:YES];
}
-(void)DongwangMyHeaderViewSingQiandao{
    DongwangSigninQiandaoViewController * DongwangQiandaoVc = [[DongwangSigninQiandaoViewController alloc]init];
    DongwangQiandaoVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController  pushViewController:DongwangQiandaoVc animated:YES];
}
-(void)DongwangMyHeaderViewMyCenterBtnClicksWithIndex:(NSInteger)btnIndex{
    if (btnIndex == 0) {
        if ([[NSString stringWithFormat:@"%@",[UserManager userInfo].certification] isEqualToString:@"1"]) {
            DongwangTixianViewController_V3 * donngwangyueVc = [[DongwangTixianViewController_V3 alloc]init];
            donngwangyueVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:donngwangyueVc animated:YES];
        }else{
        [self.dongwangalterView show];
        }
        }else if (btnIndex == 1){
        DongwangMyjifenViewController * DongwanngJifenVc = [[DongwangMyjifenViewController alloc]init];
        DongwanngJifenVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:DongwanngJifenVc animated:YES];
    }
}
-(void)DongwangMyHeaderViewAutorClicks{
    if ([[NSString stringWithFormat:@"%@",[UserManager userInfo].certification] isEqualToString:@"1"]) {
        //已认证
        DongwangMyInfoViewController * DongwangInfoVc = [[DongwangMyInfoViewController alloc]init];
        DongwangInfoVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:DongwangInfoVc animated:YES];
    }else{
        //未认证
        DongwangRealAuotrViewController * DongwangLaterVc = [[DongwangRealAuotrViewController alloc]init];
        DongwangLaterVc.hidesBottomBarWhenPushed = YES;
        DongwangLaterVc.autoreBlock = ^{
        };

        [self.navigationController pushViewController:DongwangLaterVc animated:YES];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    CGFloat reOffset = scrollView.contentOffset.y + (SCREEN_HEIGHT - NaviH) * 0.2;
//    CGFloat alpha = reOffset / ((SCREEN_HEIGHT - NaviH-kTabBarHeight) * 0.2);
//    if (alpha <= 1)//下拉永不显示导航栏
//    {
//    alpha = 0;
//    self.gk_navigationBar.hidden = YES;
//    self.gk_navBarAlpha = 0.0;
//    }
//    else//上划前一个导航栏的长度是渐变的
//    {
//        self.gk_navBarAlpha = 0.0;
//    self.gk_navigationBar.hidden = NO;
//    alpha -= 1;
////    self.gk_navBarAlpha = alpha;
//    }
}

#pragma mark--DongwangAutorAlterViewDelegate
-(void)DongwangAutorAlterViewSureAction{
    DongwangRealAuotrViewController * DongwangLaterVc = [[DongwangRealAuotrViewController alloc]init];
    DongwangLaterVc.hidesBottomBarWhenPushed = YES;
    DongwangLaterVc.autoreBlock = ^{
    };
    [self.navigationController pushViewController:DongwangLaterVc animated:YES];
}
-(void)dealloc{
    [_DongwangBaseTableview removeObserver:self forKeyPath:@"contentOffset" context:nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.showTimeStr = [NSString currentTimeStr];
    MJWeakSelf;
    [UserManager UserManagerRealoadinfomationSuuced:^{
    UserInfo * info =  [UserManager userInfo];
    NSInteger personDataStatus  = [info.personDataStatus integerValue];
    if (personDataStatus == 0) {
    weakSelf.dongwangView.hidden = YES;
    }else{
    weakSelf.dongwangView.hidden = NO;
    }
    weakSelf.Header.info = info;
    } fairler:^{
    UserInfo * info =  [UserManager userInfo];
    weakSelf.Header.info = info;
    }];
    [self DongwangAnimatons];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.leaveTimeStr =  [NSString currentTimeStr];
    [[DataBuried ShareManager] CLLogoninWithParmesWithShowTimeStr:self.showTimeStr LeaveTimeStr:self.leaveTimeStr ViewPageName:6];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
