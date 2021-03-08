//
//  DongwangFenleiViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/27.
//

#import "DongwangFenleiViewController.h"
#import "JXCategoryView.h"
#import <JXPagerView.h>
#import "PagingViewTableHeaderView.h"
#import "DongwangSubFenleiViewController.h"
#import "DongwangPersonaltaskModel.h"
#import "DongwangcategoryViewModel.h"
@interface DongwangFenleiViewController () <JXCategoryViewDelegate,JXPagerViewDelegate, JXPagerMainTableViewGestureDelegate,PagingViewTableHeaderViewDelegate>

@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) PagingViewTableHeaderView *userHeaderView;
@property (nonatomic, strong) JXPagerView *pagerView;

@property (nonatomic, strong) NSArray <NSString *> *titles;
@property(nonatomic,strong)   NSArray <NSString *> * ClassNameArr;
@property(nonatomic,strong)    UIImageView * holderImgemtyData;
@property(nonatomic,strong)  NSString * showTimeStr;
@property(nonatomic,strong)  NSString * leaveTimeStr;
@property(nonatomic,assign) BOOL isSucced;
@end

@implementation DongwangFenleiViewController
-(void)DongwangSubNewsTaskAction{
    
    if (_userHeaderView) {
        [_userHeaderView removeFromSuperview];
    }
    if (_categoryView) {
        [_categoryView removeFromSuperview];
    }
    if (_pagerView) {
        [_pagerView removeFromSuperview];
    }
    
    self.ClassNameArr = @[@"DongwangSubFenleiNewViewController"];
    self.titles = @[@"日常任务"];
    [self DongwangFenleCreatPagesView:NO];
}
#pragma mark--PagingViewTableHeaderViewDelegate
-(void)PagingViewTableHeaderViewbackActon{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.isSucced = NO;
    
    self.gk_navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#341E7B"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DongwangSubNewsTaskAction) name:@"DongwangSubNewsTaskAction" object:nil];

}
-(void)DongwangRequestListViews{
    MJWeakSelf;
    [DongwangcategoryViewModel DongwangFenleiViewModelWithgetTask:@{}.mutableCopy RequestCuurentControlers:self taskSuuced:^(id  _Nonnull object, BOOL isNewTask, NSString * _Nonnull completeProgress) {
        weakSelf.isSucced =  YES;
        if (isNewTask) {
            weakSelf.ClassNameArr = @[@"DongwangSubFenleiNewViewController"];
            weakSelf.titles = @[@"日常任务"];
            [weakSelf DongwangFenleCreatPagesView:NO];
        }else{
            weakSelf.titles = @[@"新手任务",@"日常任务"];
            weakSelf.ClassNameArr = @[@"DongwangSubFenleiViewController",@"DongwangSubFenleiNewViewController"];
            [weakSelf DongwangFenleCreatPagesView:YES];
        }
    } taskfairler:^(id  _Nonnull message) {
        weakSelf.isSucced = NO;
    }];

}
-(void)DongwangFenleCreatPagesView:(BOOL)isNew{
    //顶部头
    _userHeaderView = [[PagingViewTableHeaderView alloc] init];
    _userHeaderView.delegate = self;
    //标签栏
    _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RealWidth(40))];
    self.categoryView.contentEdgeInsetLeft =  RealWidth(0);
    self.categoryView.averageCellSpacingEnabled = YES;
    self.categoryView.cellSpacing = RealWidth(0);
    self.categoryView.backgroundColor = [UIColor clearColor];
    self.categoryView.titles = self.titles;
    self.categoryView.delegate = self;
    self.categoryView.titleColor = [UIColor whiteColor];
    self.categoryView.titleSelectedColor = [UIColor colorWithHexString:@"#FFB10E"];
    self.categoryView.titleFont = KBlFont(font(14));
    

    JXCategoryIndicatorImageView  *  indicatorImgView = [[JXCategoryIndicatorImageView alloc]init];
    indicatorImgView.indicatorImageView.image = [UIImage imageNamed:@"标签背景"];
    indicatorImgView.indicatorImageViewSize = CGSizeMake(SCREEN_WIDTH/2, RealWidth(40));
    if (isNew == NO) {
        self.categoryView.cellWidth = SCREEN_WIDTH;
        indicatorImgView.indicatorImageViewSize = CGSizeMake(SCREEN_WIDTH, RealWidth(40));
    }else{
        self.categoryView.cellWidth = SCREEN_WIDTH/2;

        indicatorImgView.indicatorImageViewSize = CGSizeMake(SCREEN_WIDTH/2, RealWidth(40));
    }

        
    UIView * categorbackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RealWidth(35))];
    categorbackView.backgroundColor = [UIColor colorWithHexString:@"#453593"];
    [self.categoryView insertSubview:categorbackView atIndex:0];
    
    
   //指示器
//    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
//    lineView.indicatorColor = [UIColor colorWithHexString:@"#FFB10E"];
//    lineView.indicatorWidth = RealWidth(72);
    self.categoryView.indicators = @[indicatorImgView];
    
    //

    //内容视图
    _pagerView = [self preferredPagingView];
    _pagerView.mainTableView.tableHeaderView.backgroundColor = [UIColor colorWithHexString:@"#402A99"];
    _pagerView.mainTableView.backgroundColor =  [UIColor colorWithHexString:@"#341E7B"];
//    _pagerView.backgroundColor = [UIColor colorWithHexString:@"#341E7B"];
    _pagerView.pinSectionHeaderVerticalOffset = NaviH;
    self.pagerView.mainTableView.gestureDelegate = self;
    [self.view addSubview:self.pagerView];
    self.categoryView.listContainer = (id<JXCategoryViewListContainer>)self.pagerView.listContainerView;
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
    self.pagerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-SafeAreaBottom_Height);
}

#pragma mark - JXPagerViewDelegate

- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView {
    return self.userHeaderView;
}

- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView {
    return JXTableHeaderViewHeight;
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
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.showTimeStr = [NSString currentTimeStr];
    if (self.isSucced) {
        return;
    }
    
    [self DongwangRequestListViews];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.leaveTimeStr =  [NSString currentTimeStr];
    [[DataBuried ShareManager] CLLogoninWithParmesWithShowTimeStr:self.showTimeStr LeaveTimeStr:self.leaveTimeStr ViewPageName:4];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
