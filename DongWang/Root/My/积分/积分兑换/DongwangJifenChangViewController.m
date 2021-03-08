//
//  DongwangJifenChangViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/18.
//

#import "DongwangJifenChangViewController.h"
#import "DongwangJifenChangeCollectionViewCell.h"
#import "DongwangJifeChangeCollectionReusableView.h"
#import "DongwangDuihuanHistoryViewController.h"
#import "DongwangPrivetaWebViewController.h"
#import "DongwangDuihuanView.h"
#import "DongwangDuihuanAlterView.h"
#import "DongwangMyVipView.h"
#import "DongwangDuihuanSuccedView.h"
#import "DongwangPropsViewController.h"
#import "DongwangDuihuanFailerView.h"
#import "DongwangFenleiViewController.h"
@interface DongwangJifenChangViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,DongwangDuihuanViewDelegate,DongwangDuihuanAlterViewDelegate,DongwangDuihuanSuccedViewDelegate,DongwangDuihuanFailerViewDelegate>
@property(nonatomic,strong) UIScrollView * DongwangContententScrollView;
@property(nonatomic,strong) UICollectionView * DongwangCollectionView;
@property(nonatomic,strong) NSMutableArray * DongwangDataArr;
@property(nonatomic,strong) UIImageView * DongwangBannarImgView;
@property(nonatomic,strong) UIButton * DongwangDuihuanBtn;
@property(nonatomic,strong) DongwangDuihuanView * duihuanView;
@property(nonatomic,strong) DongwangDuihuanAlterView * duihuanalterView;
@property(nonatomic,strong) NSString * infoMsgStr;
@property(nonatomic,strong) NSString * failerinfoMsgStr;
@property(nonatomic,strong) NSString * SuccedinfoMsgStr;
@property(nonatomic,strong) NSString * ViewType;
@property(nonatomic,strong) DongwangDuihuanSuccedView * succedView;
@property(nonatomic,strong) DongwangDuihuanFailerView * failerView;
@end

@implementation DongwangJifenChangViewController
-(NSMutableArray *)DongwangDataArr{
    if (!_DongwangDataArr) {
        _DongwangDataArr = [[NSMutableArray alloc]init];
    }
    return _DongwangDataArr;
}
-(DongwangDuihuanView *)duihuanView{
    if (!_duihuanView) {
        _duihuanView = [[DongwangDuihuanView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(_DongwangBannarImgView.frame)+K(20), SCREEN_WIDTH-K(15), K(208+15))];
        _duihuanView.delegate = self;
       
    }
    return _duihuanView;
}
-(DongwangDuihuanFailerView *)failerView{
    if (!_failerView) {
        _failerView = [[DongwangDuihuanFailerView alloc]initWithFrame:[UIScreen mainScreen].bounds withinfoMsg:self.failerinfoMsgStr];
        _failerView.delegate = self;
    }
    return _failerView;
}
-(DongwangDuihuanSuccedView *)succedView{
    if (!_succedView) {
        _succedView = [[DongwangDuihuanSuccedView alloc]initWithFrame:[UIScreen mainScreen].bounds withinfoMsg:self.SuccedinfoMsgStr];
        _succedView.delegate = self;
    }
    return _succedView;
}
-(UIImageView *)DongwangBannarImgView{
    if (!_DongwangBannarImgView) {        
        _DongwangBannarImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(206))];
        _DongwangBannarImgView.image = [UIImage imageNamed:@"积分兑换规则"];
        _DongwangBannarImgView.userInteractionEnabled = YES;
        UIImageView * DongwangRulesImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-K(73), K(18), K(73), K(45))];
        DongwangRulesImgView.userInteractionEnabled = YES;
        DongwangRulesImgView.image = [UIImage imageNamed:@"规则背景"];
        [_DongwangBannarImgView addSubview:DongwangRulesImgView];
        
        
//        UILabel * DongwangRuleslb = [[UILabel alloc]initWithFrame:CGRectMake(0, K(3), K(62), K(14))];
//        DongwangRuleslb.text = @"规则";
//        DongwangRuleslb.textColor = [UIColor whiteColor];
//        DongwangRuleslb.textAlignment = NSTextAlignmentCenter;
//        DongwangRuleslb.font = KSysFont(font(11));
//        [DongwangRulesImgView addSubview:DongwangRuleslb];
        UITapGestureRecognizer * DongwangRuleImgTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangRulesImgTapClicks)];
        [DongwangRulesImgView addGestureRecognizer:DongwangRuleImgTap];
    }
    return _DongwangBannarImgView;
}

-(DongwangDuihuanAlterView *)duihuanalterView{
    if (!_duihuanalterView) {
        _duihuanalterView = [[DongwangDuihuanAlterView alloc]initWithFrame:[UIScreen mainScreen].bounds withinfoMsg:self.infoMsgStr ViewType:self.ViewType];
        _duihuanalterView.delegate = self;
    }
    return _duihuanalterView;
}
#pragma mark--DongwangDuihuanViewDelegate
-(void)DongwangDuihuanViewBtnDidSeltecdWithBtnIndex:(NSInteger)btnTag{
    if (btnTag == 0) {
        self.infoMsgStr = @"兑换免答卡X1\n需要20积分";
        self.ViewType = @"0";
    }else if (btnTag == 1){
        self.infoMsgStr = @"兑换加时卡X1\n需要20积分";
        self.ViewType = @"1";
    }
    [self.duihuanalterView show];
}

#pragma mark--DongwangDuihuanAlterViewDelegate
-(void)DongwangDuihuanAlterViewBtnAcctionWithBtnIndex:(NSInteger)btnIndex AlterType:(NSString *)type{
    [_duihuanalterView  removeFromSuperview];
    _duihuanalterView = nil;
    if (btnIndex == 1) {
        //去兑换
    MJWeakSelf;
     [DongwangMyVipView DongwangMyViewModelWithuserexchangeProp:@{@"exchangeCard":type}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
         if ([type isEqualToString:@"0"]) {
             weakSelf.SuccedinfoMsgStr = @"兑换成功\n获得免答卡1张";
         }else if ([type isEqualToString:@"1"]){
             weakSelf.SuccedinfoMsgStr = @"兑换成功\n获得加时卡1张";
         }
         [weakSelf.succedView show];
         if (weakSelf.SuccedBlock) {
             weakSelf.SuccedBlock();
         }
    } Deleaccountfairler:^(id  _Nonnull message) {
        weakSelf.failerinfoMsgStr = message;
        [weakSelf.failerView show];
    }];
    }
    
}
#pragma mark--DongwangDuihuanSuccedViewDelegate
-(void)DongwangDuihuanSuccedViewDidSeltecdWithBtnIndex:(NSInteger)btnindex{
    [_succedView removeFromSuperview];
    _succedView = nil;
    if (btnindex == 0) {
    }else if (btnindex == 1){
    DongwangPropsViewController * proVc = [[DongwangPropsViewController alloc]init];
    [self.navigationController pushViewController:proVc animated:YES];
    }
}
#pragma mark--DongwangDuihuanFailerViewDelegate
-(void)DongwangDuihuanFailerViewgosoureActionWithIndex:(NSInteger)index{
    [_failerView removeFromSuperview];
    _failerView = nil;
    if (index == 1) {
//        self.tabBarController.selectedIndex = 1;
//        [self.navigationController popToRootViewControllerAnimated:NO];
        DongwangFenleiViewController * FenleiVc=  [[DongwangFenleiViewController alloc]init];
        FenleiVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:FenleiVc animated:YES];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"积分兑换";
    self.isShowBtomImgView = NO;
    self.view.backgroundColor =  LGDMianColor;
    UIButton * dongwangDetaibtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dongwangDetaibtn.titleLabel.font = KSysFont(font(15));
    [dongwangDetaibtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [dongwangDetaibtn addTarget:self action:@selector(dongwangDetaibtnClick) forControlEvents:UIControlEventTouchUpInside];
    [dongwangDetaibtn setTitle:@"兑换记录" forState:UIControlStateNormal];
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:dongwangDetaibtn];
    self.gk_navItemRightSpace = K(15);
    

    [self.view addSubview:self.DongwangContententScrollView];
    [_DongwangContententScrollView addSubview:self.DongwangBannarImgView];
//    [_DongwangContententScrollView addSubview:self.DongwangCollectionView];
    [_DongwangContententScrollView addSubview:self.duihuanView];
    
    [_DongwangCollectionView registerClass:[DongwangJifenChangeCollectionViewCell class] forCellWithReuseIdentifier:@"DongwangJifenChangeCollectionViewCell"];
    [_DongwangCollectionView registerClass:[DongwangJifeChangeCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DongwangJifeChangeCollectionReusableView"];
    [_DongwangCollectionView reloadData];
    _DongwangCollectionView.height = _DongwangCollectionView.collectionViewLayout.collectionViewContentSize.height;
    _DongwangContententScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, CGRectGetHeight(_DongwangBannarImgView.frame)+K(20)+_DongwangCollectionView.height);
    
    
    
    
    
    
    
    

    [self.view addSubview:self.DongwangDuihuanBtn];
    
}
-(UIButton *)DongwangDuihuanBtn{
    if (!_DongwangDuihuanBtn) {
        _DongwangDuihuanBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(71.5), CGRectGetMaxY(_DongwangContententScrollView.frame)+K(20), SCREEN_WIDTH-K(143), K(39))];
        [_DongwangDuihuanBtn setBackgroundImage:[UIImage imageNamed:@"立即签到"] forState:UIControlStateNormal];
        [_DongwangDuihuanBtn addTarget:self action:@selector(DongwangDuihuanBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _DongwangDuihuanBtn.adjustsImageWhenHighlighted = NO;
        [_DongwangDuihuanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_DongwangDuihuanBtn setTitle:@"赚更多积分" forState:UIControlStateNormal];
        _DongwangDuihuanBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _DongwangDuihuanBtn.titleLabel.font = KBlFont(font(15));
    }
    return _DongwangDuihuanBtn;
}
-(UIScrollView *)DongwangContententScrollView{
    if (!_DongwangContententScrollView) {
        _DongwangContententScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height-K(83))];
        _DongwangContententScrollView.backgroundColor = [UIColor clearColor];
        _DongwangContententScrollView.showsVerticalScrollIndicator = NO;
        _DongwangContententScrollView.showsHorizontalScrollIndicator = NO;
        _DongwangContententScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _DongwangContententScrollView;
}
//组头高度
-(CGSize )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

return CGSizeMake(SCREEN_WIDTH, K(45));
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
    DongwangJifeChangeCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DongwangJifeChangeCollectionReusableView" forIndexPath:indexPath];
return header;
} else {
return nil;
}

}
-(UICollectionView *)DongwangCollectionView{
    if (!_DongwangCollectionView) {
        UICollectionViewFlowLayout * dongwangLayout = [[UICollectionViewFlowLayout alloc]init];
        dongwangLayout.itemSize = CGSizeMake(K(77), K(126+14+21));
        dongwangLayout.sectionInset =  UIEdgeInsetsMake(K(10), K(18), K(10), K(18));
//        dongwangLayout.minimumInteritemSpacing = K(20);
        dongwangLayout.minimumLineSpacing =  K(10);
        _DongwangCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(_DongwangBannarImgView.frame)+K(20), SCREEN_WIDTH-K(30), SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height-K(83)-CGRectGetHeight(_DongwangBannarImgView.frame)) collectionViewLayout:dongwangLayout];
        _DongwangCollectionView.layer.cornerRadius = K(10);
        _DongwangCollectionView.layer.masksToBounds = YES;
        _DongwangCollectionView.scrollEnabled =  NO;
        _DongwangCollectionView.delegate = self;
        _DongwangCollectionView.dataSource = self;
        _DongwangCollectionView.showsVerticalScrollIndicator = NO;
        _DongwangCollectionView.showsHorizontalScrollIndicator = NO;
        _DongwangCollectionView.backgroundColor = [UIColor whiteColor];
    
    }
    return _DongwangCollectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangJifenChangeCollectionViewCell * DongwangCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DongwangJifenChangeCollectionViewCell" forIndexPath:indexPath];
    return DongwangCell;
}
#pragma mark--兑换记录
-(void)dongwangDetaibtnClick{
    DongwangDuihuanHistoryViewController * DongwangHistoryVc =  [[DongwangDuihuanHistoryViewController alloc]init];
    [self.navigationController pushViewController:DongwangHistoryVc animated:YES];
}
#pragma mark--积分更多
-(void)DongwangDuihuanBtnClick{
//    self.tabBarController.selectedIndex = 1;
//    [self.navigationController popToRootViewControllerAnimated:NO];
    
    DongwangFenleiViewController * FenleiVc=  [[DongwangFenleiViewController alloc]init];
    FenleiVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:FenleiVc animated:YES];
}
#pragma mark--规则
-(void)DongwangRulesImgTapClicks{
    DongwangPrivetaWebViewController * priveteVc = [[DongwangPrivetaWebViewController alloc]init];
    priveteVc.type = VCPush;
    priveteVc.protoclUrlText = [NSString stringWithFormat:@"%@%@",Protocl_Url,MyintegralExchange];
    [self.navigationController pushViewController:priveteVc animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [UserManager UserManagerRealoadinfomationSuuced:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Updateuserintgers" object:nil];
    } fairler:^{
        
    }];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
