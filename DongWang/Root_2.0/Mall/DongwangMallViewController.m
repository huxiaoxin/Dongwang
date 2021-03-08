//
//  DongwangMallViewController.m
//  DongWang
//
//  Created by codehzx on 2021/1/6.
//

#import "DongwangMallViewController.h"
#import "JXCategoryView.h"
#import <JXPagerView.h>
#import "PagingViewTableHeaderView.h"
#import "DongwangMallSectionheaderView.h"
#import "DongwangHomeViewModel.h"
#import "DongwangMofangModel.h"
#import "DongwangHomeBannarModel.h"
#import "DongwangMsgViewController.h"
@interface DongwangMallViewController ()<JXCategoryViewDelegate,JXPagerViewDelegate, JXPagerMainTableViewGestureDelegate,DongwangMallSectionheaderViewDelegate>
@property (nonatomic, strong) JXCategoryTitleView * categoryView;
@property (nonatomic, strong) DongwangMallSectionheaderView *userHeaderView;
@property (nonatomic, strong) JXPagerView *pagerView;
@property(nonatomic,assign) BOOL isSucced;
@property (nonatomic, strong) NSArray <NSString *> *titles;
@property(nonatomic,strong)   NSArray <NSString *> * ClassNameArr;
@property(nonatomic,assign)   CGFloat SectionHeaderHeight;
@property(nonatomic,strong) NSMutableArray *  mofangDataArr;
@property(nonatomic,strong) NSMutableArray * ImgArr;
@property(nonatomic,strong) NSMutableArray * BanarModelArr;
@property(nonatomic,strong) NSMutableArray * msgArr;
@property(nonatomic,strong) NSArray * tempchunModelArr;
@end

@implementation DongwangMallViewController
-(NSMutableArray *)msgArr{
    if (!_msgArr) {
        _msgArr = [NSMutableArray array];
    }
    return _msgArr;
}
-(NSMutableArray *)BanarModelArr{
    if (!_BanarModelArr) {
        _BanarModelArr = [NSMutableArray array];
    }
    return _BanarModelArr;
}
-(NSMutableArray *)mofangDataArr{
    if (!_mofangDataArr) {
        _mofangDataArr = [NSMutableArray array];
    }
    return _mofangDataArr;
}
-(NSMutableArray *)ImgArr{
    if (!_ImgArr) {
        _ImgArr = [NSMutableArray array];
    }
    return _ImgArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * dongangblackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, StatuBar_Height)];
    dongangblackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:dongangblackView];
    
    self.gk_navigationBar.hidden = YES;
    self.view.backgroundColor =  [UIColor colorWithHexString:@"#410093"];
    self.isSucced = NO;
}
-(void)DongwangFenleCreatPagesView{
    _userHeaderView = [[DongwangMallSectionheaderView alloc] init];
    _userHeaderView.delegate = self;
    CGFloat offerX;
    if (ISIPHONE_6) {
        offerX = RealWidth(24);
    }else if (ISIPHONE_6P){
        offerX = RealWidth(25);
    }else if (ISIPHONE_11){
        offerX = RealWidth(25);
    }else if (ISIPHONE_11Pro){
        offerX = RealWidth(24);
    }    
    _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(RealWidth(0), 0, SCREEN_WIDTH-RealWidth(21), RealWidth(40))];
    self.categoryView.contentEdgeInsetLeft = offerX;
    self.categoryView.averageCellSpacingEnabled = NO;
    self.categoryView.cellSpacing = RealWidth(60);
    self.categoryView.titles = self.titles;
    self.categoryView.delegate = self;
    
    self.categoryView.backgroundColor =  [UIColor clearColor];
    self.categoryView.titleColor = [UIColor whiteColor];
    self.categoryView.titleSelectedColor = [UIColor colorWithHexString:@"#FEDA00"];
    self.categoryView.titleFont =  PFR16Font;
    self.categoryView.titleColorGradientEnabled = YES;
    self.categoryView.collectionView.showsHorizontalScrollIndicator = NO;
    self.categoryView.collectionView.showsVerticalScrollIndicator = NO;
    
    
    UIButton * allBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.categoryView.frame)-RealWidth(35), 0, RealWidth(40), RealWidth(40))];
    [allBtn setTitle:@"全部" forState:UIControlStateNormal];
    allBtn.titleLabel.font =  PFR13Font;
    [allBtn addTarget:self action:@selector(allBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [allBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [allBtn setImage:[UIImage imageNamed:@"rightbtnicon"] forState:UIControlStateNormal];
    [allBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -
                                                allBtn.imageView.frame.size.width, 0, allBtn.imageView.frame.size.width)];
    [allBtn setImageEdgeInsets:UIEdgeInsetsMake(0, allBtn.titleLabel.bounds.size.width, 0, - allBtn.titleLabel.bounds.size.width)];
    //[self.categoryView addSubview:allBtn];




    JXCategoryIndicatorImageView  *  indicatorImgView = [[JXCategoryIndicatorImageView alloc]init];
    indicatorImgView.indicatorImageView.image = [UIImage imageNamed:@"homeindcot_sel"];
    indicatorImgView.indicatorImageViewSize = CGSizeMake(RealWidth(60), RealWidth(40));
    self.categoryView.indicators = @[indicatorImgView];
    
    
    
    //内容视图
    _pagerView = [self preferredPagingView];
    //区头背景色
    _pagerView.mainTableView.showsHorizontalScrollIndicator = NO;
    _pagerView.mainTableView.showsVerticalScrollIndicator = NO;
    _pagerView.mainTableView.backgroundColor =  [UIColor colorWithHexString:@"#410093"];
//    [UIColor colorWithHexString:@"#410093"];
    _pagerView.mainTableView.tableHeaderView.backgroundColor = [UIColor colorWithHexString:@"#410093"];
//    [UIColor colorWithHexString:@"#410093"];
    self.pagerView.pinSectionHeaderVerticalOffset = kIs_iPhoneX ? StatuBar_Height : 0;
    self.pagerView.mainTableView.gestureDelegate = self;
    [self.view addSubview:self.pagerView];
    
    self.categoryView.listContainer = (id<JXCategoryViewListContainer>)self.pagerView.listContainerView;
    MJWeakSelf;
    self.pagerView.mainTableView.mj_header = [MJRefreshManager defaultHeader:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"DongwangDidVcRefresh" object:nil];
    [weakSelf DongwangLoadRequest];
    }];
    [self.pagerView.mainTableView.mj_header beginRefreshing];
    self.userHeaderView.HeaderHeight = ^(CGFloat Headerheight) {
    weakSelf.SectionHeaderHeight = Headerheight;
    [weakSelf.pagerView resizeTableHeaderViewHeightWithAnimatable:NO duration:0 curve:0];
    };
    

}
-(void)DongwangLoadRequest{
    //魔方
    MJWeakSelf;
    [DongwangHomeViewModel DongwangHomeIcon:@{}.mutableCopy RequestCuurentControlers:self taskSuuced:^(NSMutableArray * _Nonnull modelAarr, NSMutableArray * _Nonnull chunModelArr) {
    NSArray *  tempArr = chunModelArr;
   if (weakSelf.tempchunModelArr.count == tempArr.count) {
       [weakSelf.pagerView.mainTableView.mj_header endRefreshing];
       return;
    }
    weakSelf.tempchunModelArr = tempArr;
    weakSelf.userHeaderView.mofangDataArr = modelAarr;
    if (weakSelf.mofangDataArr.count > 0) {
    [weakSelf.mofangDataArr removeAllObjects];
    }
    weakSelf.mofangDataArr = modelAarr;
    weakSelf.isSucced = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    weakSelf.userHeaderView.mofangDataArr = modelAarr;
    });
    [weakSelf.pagerView.mainTableView.mj_header endRefreshing];
    } taskfairler:^(id  _Nonnull message) {
    weakSelf.isSucced = NO;
    [weakSelf.pagerView.mainTableView.mj_header endRefreshing];
    }];
    //banner
    [DongwangHomeViewModel DongwangHomeBannar:@{}.mutableCopy RequestCuurentControlers:self taskSuuced:^(NSMutableArray * _Nonnull modelAarr, NSMutableArray * _Nonnull ImgsUrl) {
        weakSelf.ImgArr =  [ImgsUrl copy];
        if (weakSelf.BanarModelArr.count > 0) {
            [weakSelf.BanarModelArr removeAllObjects];
        }
        weakSelf.userHeaderView.ImgArr = ImgsUrl;
        weakSelf.BanarModelArr = modelAarr;
    } taskfairler:^(id  _Nonnull message) {
        
    }];

    //消息滚动
    [DongwangHomeViewModel DongwangHomeBroadcastlist:@{}.mutableCopy RequestCuurentControlers:self taskSuuced:^(NSMutableArray * _Nonnull modelAarr) {
        if (weakSelf.msgArr.count > 0) {
            return;
        }
        weakSelf.msgArr = modelAarr;
        weakSelf.userHeaderView.MsgArr = modelAarr;
    } taskfairler:^(id  _Nonnull message) {
        
    }];
    
}
- (JXPagerView *)preferredPagingView {
    return [[JXPagerView alloc] initWithDelegate:self];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = (self.categoryView.selectedIndex == 1);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.pagerView.frame = CGRectMake(RealWidth(0), kIs_iPhoneX ? 22 : StatuBar_Height, SCREEN_WIDTH-RealWidth(0), SCREEN_HEIGHT-kTabBarHeight- (kIs_iPhoneX ? StatuBar_Height : 0 ));
}

#pragma mark - JXPagerViewDelegate

- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView {
    return self.userHeaderView;
}

- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView {
    return self.SectionHeaderHeight;
}

- (NSUInteger)heightForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return RealWidth(40);
}

- (UIView *)viewForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return self.categoryView;
}

- (NSInteger)numberOfListsInPagerView:(JXPagerView *)pagerView {
    //和categoryView的item数量一致
    return self.categoryView.titles.count;
}

- (id<JXPagerViewListViewDelegate>)pagerView:(JXPagerView *)pagerView initListAtIndex:(NSInteger)index {
    
    DongwangBaseViewController * list = [NSClassFromString(self.ClassNameArr[index]) new];
    list.indictorIndex = index;
    return list;
}
#pragma mark - JXCategoryViewDelegate
//为什么会把选中代理分为三个，因为有时候只关心点击选中的，有时候只关心滚动选中的，有时候只关心选中。所以具体情况，使用对应方法。
/**
 点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，不关心具体是点击还是滚动选中的。

 @param categoryView categoryView对象
 @param index 选中的index
 */

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 1);
}
//按钮点击
- (void)categoryView:(JXCategoryBaseView *)categoryView didClickSelectedItemAtIndex:(NSInteger)index{

}
- (void)categoryView:(JXCategoryBaseView *)categoryView scrollingFromLeftIndex:(NSInteger)leftIndex toRightIndex:(NSInteger)rightIndex ratio:(CGFloat)ratio{
    
}
- (BOOL)mainTableViewGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

-(void)DongwangLoadListViews{
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.45 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.titles = @[@"推荐",@"最新",@"热门"];
        weakSelf.ClassNameArr = @[@"DongwangMMallSubListViewController",@"DongwangMMallSubListViewController",@"DongwangMMallSubListViewController"];
        [weakSelf DongwangFenleCreatPagesView];
    });
}

#pragma mark--全部题组
-(void)allBtnClick{
    
}

#pragma mark--DongwangMallSectionheaderViewDelegate
-(void)DongwangMallSectionheaderViewDidSeltecdWithIndexPath:(NSIndexPath *)indexPath{
    
    DongwangMofangModel * dongmodle = self.mofangDataArr[indexPath.section];
    MagicList  * listobject  = dongmodle.magicList[indexPath.row];
    if ([listobject.action integerValue] == 0) {
    [[NSNotificationCenter defaultCenter] postNotificationName:AppTabbarActitytapNotiCation object:nil userInfo:@{@"action":[NSString stringWithFormat:@"%@",listobject.action],@"type":[NSString stringWithFormat:@"%@",listobject.type],@"url":[NSString stringWithFormat:@"%@",listobject.url]}];
    }
}
-(void)DongwangMallSectionheaderViewDidSeltecdBannarWithIndex:(NSInteger)index{
    DongwangHomeBannarModel * bannarModel = self.BanarModelArr[index];
    if ([bannarModel.action integerValue] == 0) {
    [[NSNotificationCenter defaultCenter] postNotificationName:AppTabbarActitytapNotiCation object:nil userInfo:@{@"action":[NSString stringWithFormat:@"%@",bannarModel.action],@"type":[NSString stringWithFormat:@"%@",bannarModel.type],@"url":[NSString stringWithFormat:@"%@",bannarModel.url]}];
    }

}
-(void)DongwangMallSectionheaderViewMsgAction{
    DongwangMsgViewController * msgVc = [[DongwangMsgViewController alloc]init];
    msgVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:msgVc animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isSucced) {
        return;
    }
    [self DongwangLoadListViews];
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
