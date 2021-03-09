//
//  DongwangMyChatListViewController.m
//  DongWang
//
//  Created by codehzx on 2021/1/15.
//

#import "DongwangMyChatListViewController.h"
#import "JXCategoryView.h"
#import <JXPagerView.h>
#import "DongwangMyChatHeaderView.h"
#import "DongwangChatListSubViewController.h"
#import "DongwangMyChatNavView.h"
#import "DongwangSendChatViewController.h"
#import "DongwangMyChatDetailViewController.h"
#import "DongwangSendHuatiViewController.h"
#import "DongwangMyCirleViewController.h"
#import "DongwangCreatCirleViewController.h"
#import "DongwangCirleCenterViewController.h"
@interface DongwangMyChatListViewController ()<JXCategoryViewDelegate,JXPagerViewDelegate, JXPagerMainTableViewGestureDelegate,DongwangMyChatNavViewDelegate,DongwangMyChatHeaderViewDelegate>
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) JXPagerView *pagerView;
@property(nonatomic,strong)  DongwangMyChatHeaderView * userHeaderView;
@property (nonatomic, strong) NSArray <NSString *> *titles;
@property(nonatomic,strong)   NSArray <NSString *> * ClassNameArr;
@property(nonatomic,strong) DongwangMyChatNavView * chatNavView;
@property(nonatomic,assign) CGFloat halfHeight;
@property(nonatomic,strong) UIButton * DongwangSeachBtn;
@property(nonatomic,assign) CGFloat headrHeight;

@end

@implementation DongwangMyChatListViewController
-(NSArray<NSString *> *)titles{
    if (!_titles) {
        _titles =  @[@"关注",@"推荐",@"最新",@"精华"];
    }
    return _titles;
}
-(UIButton *)DongwangSeachBtn{
    if (!_DongwangSeachBtn) {
        _DongwangSeachBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-RealWidth(40), RealWidth(13), RealWidth(15), RealWidth(15))];
        [_DongwangSeachBtn  setEnlargeEdgeWithTop:10 right:10 bottom:10 left:10];
        [_DongwangSeachBtn setBackgroundImage:[UIImage imageNamed:@"sousuo"] forState:UIControlStateNormal];
        _DongwangSeachBtn.adjustsImageWhenHighlighted = NO;
        [_DongwangSeachBtn addTarget:self action:@selector(DongwangSeachBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _DongwangSeachBtn.alpha = 0;
    }
    return _DongwangSeachBtn;
}
- (void)pagerView:(JXPagerView *)pagerView mainTableViewDidScroll:(UIScrollView *)scrollView{
    CGFloat maxAlphoOffer = RealWidth(60)+NaviH;
    CGFloat offset =  scrollView.contentOffset.y;

    if (offset <= 0) {
        self.chatNavView.alpha = 1;
        self.userHeaderView.quanziTopImgView.alpha = 1;
        self.DongwangSeachBtn.alpha = 0;
    }else{
        CGFloat alphaTotoal = 1-offset/maxAlphoOffer;
        
        self.DongwangSeachBtn.alpha = 1;
        
        self.userHeaderView.quanziTopImgView.alpha = alphaTotoal <=0.1 ? 0 : alphaTotoal;
        self.chatNavView.alpha = alphaTotoal <=0.1 ? 0 : alphaTotoal;
    }
}
-(NSArray<NSString *> *)ClassNameArr{
    if (!_ClassNameArr) {
        _ClassNameArr = @[@"DongwangChatListSubViewController",@"DongwangChatListSubViewController",@"DongwangChatListSubViewController",@"DongwangChatListSubViewController"];
    }
    return _ClassNameArr;
}
-(DongwangMyChatNavView *)chatNavView{
    if (!_chatNavView) {
        _chatNavView = [[DongwangMyChatNavView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NaviH)];
        _chatNavView.Delegate = self;
    }
    return _chatNavView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.halfHeight = 90;
    self.headrHeight = NaviH+RealWidth(110);
    self.view.backgroundColor = [UIColor clearColor];
    self.gk_navigationBar.hidden = YES;
    #pragma mark--创建内容
    [self DongwangCreateSubView];
    [self.view addSubview:self.chatNavView];
}
-(void)DongwangCreateSubView{
    //顶部头
    _userHeaderView = [[DongwangMyChatHeaderView alloc] init];
    _userHeaderView.delegate = self;
    _userHeaderView.backgroundColor = [UIColor colorWithHexString:@"#410093"];
    //标签栏
    _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RealWidth(40))];
    self.categoryView.contentEdgeInsetLeft =  RealWidth(40);
    self.categoryView.averageCellSpacingEnabled = NO;
    self.categoryView.cellSpacing = RealWidth(40);
    self.categoryView.backgroundColor = [UIColor colorWithHexString:@"#410093"];
    self.categoryView.titles = self.titles;
    self.categoryView.delegate = self;
    self.categoryView.titleColor = [UIColor whiteColor];
    self.categoryView.titleSelectedColor = [UIColor colorWithHexString:@"FEDA00"];
    self.categoryView.titleSelectedFont = PFR16Font;
    self.categoryView.titleFont = PFR14Font;
    self.categoryView.defaultSelectedIndex = 1;
    [self.categoryView addSubview:self.DongwangSeachBtn];
    
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.lineStyle =  JXCategoryIndicatorLineStyle_LengthenOffset;
        lineView.indicatorColor = [UIColor colorWithHexString:@"#FEDA00"];
        lineView.indicatorWidth = RealWidth(17);
    self.categoryView.indicators = @[lineView];
    //内容视图
    _pagerView = [self preferredPagingView];
    _pagerView.mainTableView.tableHeaderView.backgroundColor = [UIColor yellowColor];
    _pagerView.mainTableView.backgroundColor =  [UIColor colorWithHexString:@"#410093"];
    _pagerView.mainTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _pagerView.pinSectionHeaderVerticalOffset = StatuBar_Height;
    _pagerView.mainTableView.layer.borderColor =[UIColor colorWithHexString:@"#40CAFF"].CGColor;
    [self.view addSubview:self.pagerView];
    self.pagerView.defaultSelectedIndex = 1;
    self.categoryView.listContainer = (id<JXCategoryViewListContainer>)self.pagerView.listContainerView;
    
}
-(JXPagerView *)preferredPagingView {
   return [[JXPagerView alloc] initWithDelegate:self];
}
- (void)viewDidAppear:(BOOL)animated {
   [super viewDidAppear:animated];
   self.navigationController.interactivePopGestureRecognizer.enabled = (self.categoryView.selectedIndex == 1);
}

- (void)viewDidLayoutSubviews {
   [super viewDidLayoutSubviews];
   self.pagerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-kTabBarHeight);
}
#pragma mark--搜索
-(void)DongwangSeachBtnClick{
    
}
#pragma mark - JXPagerViewDelegate

- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView {
   return self.userHeaderView;
}

- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView {
    return self.headrHeight;
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
#pragma mark--DongwangMyChatNavViewDelegate
-(void)DongwangMyChatNavViewDelegateSendChatAction{
    
    DongwangSendHuatiViewController * huaTiVc = [[DongwangSendHuatiViewController alloc]init];
    huaTiVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:huaTiVc animated:YES];
    
//    DongwangSendChatViewController * SendVc= [[DongwangSendChatViewController alloc]init];
//    SendVc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:SendVc animated:YES];
}
#pragma mark--DongwangMyChatHeaderViewDelegate
-(void)DongwangMyChatHeaderViewDidSeltecdWithIndex:(NSInteger)CellIndex{
    if (CellIndex == 0) {
        DongwangMyCirleViewController * MycirleVc = [[DongwangMyCirleViewController alloc]init];
        MycirleVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:MycirleVc animated:YES];
    }else if (CellIndex == 1){
        //
        DongwangCreatCirleViewController *creatialVc =[[DongwangCreatCirleViewController alloc]init];
        creatialVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:creatialVc animated:YES];
        
    }else{
        DongwangCirleCenterViewController * cirleCenterVc = [[DongwangCirleCenterViewController alloc]init];
        cirleCenterVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:cirleCenterVc animated:YES];
    }
   
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
