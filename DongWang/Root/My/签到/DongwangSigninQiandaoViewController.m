//
//  DongwangSigninQiandaoViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/13.
//

#import "DongwangSigninQiandaoViewController.h"
#import "DongwangSignQiandaoHeaderView.h"
#import "DongwangSigninQiandaoTableViewCell.h"
#import "DongwangMyViewModel.h"
#import "DongwangSigningQiandaoFooterView.h"
#import "DongwangSigninSuccedView.h"
#import "DongwangPrivetaWebViewController.h"
@interface DongwangSigninQiandaoViewController ()<UITableViewDelegate,UITableViewDataSource,DongwangSignQiandaoHeaderViewDelegate,DongwangSigninSuccedViewDelegate>
@property(nonatomic,strong) DongwangSignQiandaoHeaderView * DongwangHeader;
@property(nonatomic,strong) UIImageView * DongwanheaderBgView;
@property(nonatomic,strong) NSString * currentUrl;
@property(nonatomic,strong) DongwangSigningQiandaoFooterView * footerView;
@property(nonatomic,strong) DongwangSigninSuccedView * SuccedView;
@property(nonatomic,strong) NSDictionary * SuccedDic;
@property(nonatomic,strong) UIView * navView;
@property(nonatomic,strong) UIImageView *  bakcNavImgView;
@property(nonatomic,strong) UILabel *  NavTitle;
@property(nonatomic,strong) UIButton * backBtn;

@end

@implementation DongwangSigninQiandaoViewController
-(UIView *)navView{
    if (!_navView) {
        _navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NaviH)];
        _navView.backgroundColor = [UIColor clearColor];
        _navView.userInteractionEnabled = YES;
    }
    return _navView;
}
-(UIImageView *)bakcNavImgView{
    if (!_bakcNavImgView) {
        _bakcNavImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NaviH)];
        _bakcNavImgView.userInteractionEnabled = YES;
        _bakcNavImgView.image = [UIImage imageNamed:@"导航测试"];
        _bakcNavImgView.alpha = 0;
    }
    return _bakcNavImgView;
}
-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn addTarget:self action:@selector(ShuyunBackBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_backBtn setImage:[UIImage imageNamed:@"btn_back_white"] forState:UIControlStateNormal];
        [_backBtn sizeToFit];
        _backBtn.origin = CGPointMake(kLevelSpace(20), StatuBar_Height+K(6));
        [_backBtn setEnlargeEdgeWithTop:25 right:25 bottom:25 left:25];
    }
    return _backBtn;
}
-(UILabel *)NavTitle{
    if (!_NavTitle) {
        _NavTitle = [[UILabel alloc]init];
        _NavTitle.textAlignment = NSTextAlignmentCenter;
        _NavTitle.textColor=  [UIColor whiteColor];
        _NavTitle.font = KBlFont(font(16));
        _NavTitle.frame = CGRectMake(0, StatuBar_Height+K(7.5), SCREEN_WIDTH, K(20));
        _NavTitle.text = @"签到";

    }
    return _NavTitle;
}

-(void)ShuyunBackBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}
-(DongwangSigningQiandaoFooterView *)footerView{
    if (!_footerView) {
        _footerView = [[DongwangSigningQiandaoFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(0))];
    }
    return _footerView;
}
-(DongwangSigninSuccedView *)SuccedView{
    if (!_SuccedView) {
        _SuccedView = [[DongwangSigninSuccedView alloc]initWithFrame:[UIScreen mainScreen].bounds QiandaoWithDic:self.SuccedDic];
        _SuccedView.delegate = self;
    }
    return _SuccedView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navigationBar.hidden = YES;
    self.isShowBtomImgView = NO;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#4B029D"];
    [self.view addSubview:self.DongwangSignTableView];
    self.DongwangHeader.height = self.DongwangHeader.QianheaderHeight;
    _DongwangSignTableView.tableHeaderView = self.DongwangHeader;
    [self.DongwangSignTableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    [_DongwangSignTableView.superview addSubview:self.DongwanheaderBgView];
    [self.view addSubview:self.navView];
    [_navView addSubview:self.bakcNavImgView];
    [_navView addSubview:self.backBtn];
    [_navView addSubview:self.NavTitle];
    [self DongwangRealoadSigInfo];
    
//    [self.SuccedView show];

    
}
-(UIImageView *)DongwanheaderBgView{
    if (!_DongwanheaderBgView) {
        _DongwanheaderBgView = [UIImageView new];
        _DongwanheaderBgView.backgroundColor = [UIColor colorWithHexString:@"#3F2B9A"];
//        [UIColor colorWithPatternImage:[UIImage imageNamed:@"签到渐变背景"]];
//        [UIColor colorWithHexString:@"#FFE539"]
//        _DongwanheaderBgView.backgroundColor = [UIColor colorWithHexString:@"#FFE539"];
//        _DongwanheaderBgView.image = [UIImage imageNamed:@"签到渐变背景"];
    }
    return _DongwanheaderBgView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangIdentifer = @"DongwangSigninQiandaoTableViewCell";
    DongwangSigninQiandaoTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangIdentifer];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwangSigninQiandaoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangIdentifer];
    }
    DongwangCell.VC = self;
    DongwangCell.Qiandaourl = self.currentUrl;
    return DongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0;
}
-(DongwangSignQiandaoHeaderView *)DongwangHeader{
    if (!_DongwangHeader) {
    _DongwangHeader = [[DongwangSignQiandaoHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(0))];
        _DongwangHeader.delegate = self;
    }
    return _DongwangHeader;
}
-(UITableView *)DongwangSignTableView{
    if (!_DongwangSignTableView) {
        _DongwangSignTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _DongwangSignTableView.delegate = self;
        _DongwangSignTableView.dataSource = self;
        _DongwangSignTableView.showsVerticalScrollIndicator =  NO;
        _DongwangSignTableView.showsHorizontalScrollIndicator = NO;
        _DongwangSignTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _DongwangSignTableView.backgroundColor = [UIColor clearColor];
    }
    return _DongwangSignTableView;
}

-(void)DongwangRealoadSigInfo{
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithSign:@{}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object, NSDictionary * _Nonnull dic) {
        NSMutableArray * DataArr =  (NSMutableArray *)object;
        weakSelf.DongwangHeader.HeaderDataArr = DataArr;
        weakSelf.DongwangHeader.headerDic = dic;
        weakSelf.currentUrl =  [[dic objectForKey:@"data"] objectForKey:@"signRule"];
        weakSelf.footerView.urlText = [[dic objectForKey:@"data"] objectForKey:@"signRule"];
        weakSelf.footerView.height = self.footerView.FooterHeight;
        self->_DongwangSignTableView.tableFooterView = weakSelf.footerView;
    } Deleaccountfairler:^(id  message) {
        
    }];

}
#pragma mark--DongwangSignQiandaoHeaderViewDelegate
-(void)DongwangSignQiandaoHeaderViewDidSeltecdQiandaoActoin{
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithgoSign:@{}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        NSDictionary * SuccedDic = [object objectForKey:@"data"];
        weakSelf.SuccedDic = SuccedDic;
        [weakSelf.SuccedView show];
        [weakSelf DongwangRealoadSigInfo];
    } Deleaccountfairler:^(id  _Nonnull message) {
    }];
}
#pragma mark--DongwangSigninSuccedViewDelegate
-(void)DongwangSigninSuccedViewBtnDidSeltecdWithtype:(NSInteger)type{
    if (type == 1) {
        //去翻牌
        DongwangPrivetaWebViewController * DongwangCardsVc = [[DongwangPrivetaWebViewController alloc]init];
        DongwangCardsVc.protoclUrlText =[NSString stringWithFormat:@"%@%@",Protocl_Url,jifenpaifan];
        DongwangCardsVc.type = VCPush;
        [self.navigationController pushViewController:DongwangCardsVc animated:YES];
        
    }
}
-(void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id>*)change context:(void*)context{

if([keyPath isEqualToString:@"contentOffset"]){

NSValue *value = change[NSKeyValueChangeNewKey];
CGFloat chaneoffsetY = value.UIOffsetValue.vertical;
self.DongwanheaderBgView.frame = CGRectMake(0,0,SCREEN_WIDTH,-chaneoffsetY);
    
}}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat reOffset = scrollView.contentOffset.y + (SCREEN_HEIGHT - NaviH-SafeAreaBottom_Height) * 0.1;
    CGFloat alpha = reOffset / ((SCREEN_HEIGHT - NaviH-SafeAreaBottom_Height) * 0.1);
    if (alpha <= 1)//下拉永不显示导航栏
    {
        alpha = 0;
    }
    else//上划前一个导航栏的长度是渐变的
    {
        alpha -= 1;
    }
    _bakcNavImgView.alpha = alpha;
}
-(void)dealloc{
    [_DongwangSignTableView removeObserver:self forKeyPath:@"contentOffset"];
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
