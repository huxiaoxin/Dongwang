//
//  DongwangCirleCenterViewController.m
//  DongWang
//
//  Created by sycm on 2021/3/9.
//

#import "DongwangCirleCenterViewController.h"
#import "DongwangCireSubCenterViewController.h"
#import "DongwangCirelCenterHeader.h"
#import "JXCategoryView.h"
#import <JXPagerView.h>

@interface DongwangCirleCenterViewController ()<JXCategoryViewDelegate,JXPagerViewDelegate, JXPagerMainTableViewGestureDelegate>
@property (nonatomic, strong) JXCategoryTitleView * categoryView;
@property (nonatomic, strong) JXPagerView *pagerView;
@property (nonatomic, strong) NSArray <NSString *> *titles;
@property(nonatomic,strong)   NSArray <NSString *> * ClassNameArr;
@property(nonatomic,strong) DongwangCirelCenterHeader * userHeaderView;
@property(nonatomic,strong) UIView * DongwangNavView;
@end

@implementation DongwangCirleCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navBarAlpha = 0;
    [self DongwangLoadListViews];
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
    self.pagerView.frame = CGRectMake(RealWidth(0),0, SCREEN_WIDTH-RealWidth(0), SCREEN_HEIGHT-SafeAreaBottom_Height);
}

#pragma mark - JXPagerViewDelegate

- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView {
    return self.userHeaderView;
}

- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView {
    return RealWidth(159)+StatuBar_Height+RealWidth(15)+RealWidth(75)+RealWidth(20);
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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.titles = @[@"最新",@"最热"];
        weakSelf.ClassNameArr = @[@"DongwangCireSubCenterViewController",@"DongwangCireSubCenterViewController"];
        [weakSelf DongwangFenleCreatPagesView];
    });
}
-(void)DongwangFenleCreatPagesView{
    _userHeaderView = [[DongwangCirelCenterHeader alloc] init];
    _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(RealWidth(0), 0, SCREEN_WIDTH-RealWidth(0), RealWidth(40))];
    self.categoryView.contentEdgeInsetLeft = K(27.5);
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
    
    




    JXCategoryIndicatorImageView  *  indicatorImgView = [[JXCategoryIndicatorImageView alloc]init];
    indicatorImgView.indicatorImageView.image = [UIImage imageNamed:@"homeindcot_sel"];
    indicatorImgView.indicatorImageViewSize = CGSizeMake(RealWidth(80), RealWidth(40));
    self.categoryView.indicators = @[indicatorImgView];
    
    
    
    //内容视图
    _pagerView = [self preferredPagingView];
    //区头背景色
    _pagerView.mainTableView.showsHorizontalScrollIndicator = NO;
    _pagerView.mainTableView.showsVerticalScrollIndicator = NO;
    _pagerView.mainTableView.backgroundColor =  [UIColor colorWithHexString:@"#410093"];
//    [UIColor colorWithHexString:@"#410093"];
    _pagerView.mainTableView.tableHeaderView.backgroundColor = [UIColor colorWithHexString:@"#410093"];
    _pagerView.pinSectionHeaderVerticalOffset =  StatuBar_Height;
    self.pagerView.mainTableView.gestureDelegate = self;
    [self.view addSubview:self.pagerView];
    
    self.categoryView.listContainer = (id<JXCategoryViewListContainer>)self.pagerView.listContainerView;
}


@end
