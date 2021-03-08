//
//  DongwangMyjifenViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/11.
//

#import "DongwangMyjifenViewController.h"
#import "DongwangMyJifenHeaderView.h"
#import "DongwangMingxiViewController.h"
#import "DongwangJifenDetailViewController.h"
#import "TreeView.h"
#import "DongwangMyJifenTableViewCell.h"
#import "DongwangJifenChangViewController.h"
#import "DongwangPrivetaWebViewController.h"
#import "DongwangMyMallView.h"
#import "DongwangMyVipView.h"

#import "DongwangJifenMallView.h"
#import "DongwangJifenVipView.h"
@interface DongwangMyjifenViewController ()<UITableViewDelegate,UITableViewDataSource,DongwangMyJifenTableViewCellDelegate,DongwangJifenMallViewDelegate,DongwangJifenVipViewDelegate>
@property(nonatomic,strong) UITableView * DongwangMyJifenTableView;
@property(nonatomic,strong) DongwangMyJifenHeaderView * DongwangHeader;
@property(nonatomic,strong) UIImageView * DongwanheaderBgView;
@property(nonatomic,strong) TreeView * treeView;
@property(nonatomic,strong) DongwangMyMallView  * mallView;

@property(nonatomic,strong) DongwangJifenMallView * jifenMallView;
@property(nonatomic,strong) DongwangJifenVipView  * jifenVipView;
@end

@implementation DongwangMyjifenViewController
-(DongwangMyMallView *)mallView{
    if (!_mallView) {
        _mallView = [[DongwangMyMallView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _mallView;
}
-(DongwangJifenVipView *)jifenVipView{
    if (!_jifenVipView) {
        _jifenVipView =  [[DongwangJifenVipView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _jifenVipView.delegate = self;
    }
    return _jifenVipView;
}
-(DongwangJifenMallView *)jifenMallView{
    if (!_jifenMallView) {
    _jifenMallView = [[DongwangJifenMallView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _jifenMallView.delegate  =self;
    }
    return _jifenMallView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"积分";
    self.gk_navBarAlpha = 0;
    self.isShowBtomImgView = NO;
    self.view.backgroundColor = LGDMianColor;
    [self.view addSubview:self.DongwangMyJifenTableView];
    self.DongwangHeader.height = self.DongwangHeader.JifenHeaderHeight;
    _DongwangMyJifenTableView.tableHeaderView = self.DongwangHeader;
    [self.DongwangMyJifenTableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    [_DongwangMyJifenTableView.superview addSubview:self.DongwanheaderBgView];    
    UIButton * dongwangDetaibtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dongwangDetaibtn.titleLabel.font = KSysFont(font(12));
    [dongwangDetaibtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [dongwangDetaibtn addTarget:self action:@selector(dongwangDetaibtnClick) forControlEvents:UIControlEventTouchUpInside];
    [dongwangDetaibtn setTitle:@"积分明细" forState:UIControlStateNormal];
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:dongwangDetaibtn];
    self.gk_navItemRightSpace = K(15);
    
    MJWeakSelf;
    [DongwangMyVipView DongwangMyViewModelWithActiveRewardList:@{}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        NSMutableArray * TreeArr  = (NSMutableArray *)object;
        weakSelf.DongwangHeader.treeModelArr = TreeArr;
    } Deleaccountfairler:^(id  _Nonnull message) {
        
    }];
}

#pragma mark--积分明细
-(void)dongwangDetaibtnClick{
    DongwangJifenDetailViewController * dongwangmingxiVc = [[DongwangJifenDetailViewController alloc]init];
    [self.navigationController pushViewController:dongwangmingxiVc animated:YES];
}
-(UIImageView *)DongwanheaderBgView{
    if (!_DongwanheaderBgView) {
        _DongwanheaderBgView = [UIImageView new];
        _DongwanheaderBgView.backgroundColor = [UIColor colorWithHexString:@"#3F2B9A"];
//        _DongwanheaderBgView.image = [UIImage imageNamed:@"签到渐变背景"];
    }
    return _DongwanheaderBgView;
}
-(DongwangMyJifenHeaderView *)DongwangHeader{
    if (!_DongwangHeader) {
        MJWeakSelf;
        _DongwangHeader = [[DongwangMyJifenHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0) withCurrentVc:weakSelf];
    }
    return _DongwangHeader;
}
-(UITableView *)DongwangMyJifenTableView{
    if (!_DongwangMyJifenTableView) {
        _DongwangMyJifenTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _DongwangMyJifenTableView.backgroundColor = [UIColor clearColor];
        _DongwangMyJifenTableView.showsVerticalScrollIndicator = NO;
        _DongwangMyJifenTableView.showsHorizontalScrollIndicator = NO;
        _DongwangMyJifenTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _DongwangMyJifenTableView.delegate = self;
        _DongwangMyJifenTableView.dataSource = self;
        
        
    }
    return _DongwangMyJifenTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangIdentifer = @"DongwangMyJifenTableViewCell";
    DongwangMyJifenTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangIdentifer];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwangMyJifenTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangIdentifer];
    }
    DongwangCell.delegate = self;
    return DongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(162+15);
}
#pragma mark--DongwangMyJifenTableViewCellDelegate
-(void)DongwangMyJifenTableViewCellImgTapClickWithIndex:(NSInteger)index{
    if (index == 0) {
        DongwangPrivetaWebViewController * DongwangCardsVc = [[DongwangPrivetaWebViewController alloc]init];
        DongwangCardsVc.protoclUrlText =[NSString stringWithFormat:@"%@%@",Protocl_Url,jifenpaifan];
        DongwangCardsVc.type = VCPush;
        [self.navigationController pushViewController:DongwangCardsVc animated:YES];
    }else if (index == 1){
        MJWeakSelf;
        DongwangJifenChangViewController  * DongwangJifenVc = [[DongwangJifenChangViewController alloc]init];
        DongwangJifenVc.SuccedBlock = ^{
            [weakSelf.DongwangHeader.DongwangTreeView realoduserInteagers];
        };
        [self.navigationController pushViewController:DongwangJifenVc animated:YES];
    }else if (index == 2){
        [self.jifenMallView show];
    }else if (index == 3){
        [self.jifenVipView show];
    }
}
-(void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id>*)change context:(void*)context{

if([keyPath isEqualToString:@"contentOffset"]){

NSValue *value = change[NSKeyValueChangeNewKey];

CGFloat chaneoffsetY = value.UIOffsetValue.vertical;
    self.DongwanheaderBgView.frame = CGRectMake(0,0,SCREEN_WIDTH,-chaneoffsetY);
}}
#pragma mark--DongwangJifenMallViewDelegate
-(void)DongwangJifenMallViewRemove{
    [_mallView removeFromSuperview];
    _mallView = nil;
}
#pragma mark--DongwangJifenVipViewDelegate
-(void)DongwangJifenVipViewRemoveFromeActions{
    [_jifenVipView removeFromSuperview];
    _jifenVipView = nil;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat reOffset = scrollView.contentOffset.y + (SCREEN_HEIGHT - 64) * 0.2;
    CGFloat alpha = reOffset / ((SCREEN_HEIGHT - NaviH) * 0.2);
    if (alpha <= 1)//下拉永不显示导航栏
    {
        alpha = 0;
        self.gk_navTitle = @"积分";
    }
    else//上划前一个导航栏的长度是渐变的
    {
        self.gk_navTitle = @"积分";
        alpha -= 1;
    }
    self.gk_navBarAlpha = alpha;
}
-(void)dealloc{
    [_DongwangMyJifenTableView removeObserver:self forKeyPath:@"contentOffset"];
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
