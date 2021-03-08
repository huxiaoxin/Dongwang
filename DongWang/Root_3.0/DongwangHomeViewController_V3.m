//
//  DongwangHomeViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/20.
//

#import "DongwangHomeViewController_V3.h"
#import "DongwangChildHomeViewController.h"
#import <SPPageMenu/SPPageMenu.h>
#import "DongwangHomeAllTypeView.h"
#import "DongwangHomeViewModel.h"
#import "DongwangHomeTagModel.h"
#import "DongwangHommetuijianViewController.h"
#import "DongwangHomeTuijianViewController_V3.h"
#import "DongFangMyCenterViewController.h"
#import "DongwangHomeTuijianViewControllerChild_V3.h"
@interface DongwangHomeViewController_V3 ()<SPPageMenuDelegate,UIScrollViewDelegate,DongwangHomeAllTypeViewDelegate>
@property(nonatomic,strong) UIView * HomeRightView;
@property(nonatomic,strong) SPPageMenu * Menu;
@property(nonatomic,strong) UIScrollView * BJScroloView;
@property(nonatomic,strong) NSMutableArray * SanXiaMyWorkerClaaArr;
@property(nonatomic,strong) NSMutableArray * SanXiaMyWorkerTagArr; //标签文本
@property(nonatomic,strong) NSMutableArray * DongwangTagModelArr; //标签model
@property(nonatomic,strong) DongwangHomeAllTypeView  *  TypeView;
@property(nonatomic,assign) NSInteger  tagSeltecdIndex;
@property(nonatomic,assign) UIButton * DongwangRightBtn;
@property(nonatomic,strong) UIImageView * TempImgView;
@property(nonatomic,strong) UIImageView * userImgViews;
@end

@implementation DongwangHomeViewController_V3

-(DongwangHomeAllTypeView *)TypeView{
    if (!_TypeView) {
    _TypeView = [[DongwangHomeAllTypeView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_HEIGHT-NaviH) TypeData:self.DongwangTagModelArr];
        _TypeView.delegate = self;
    }
    return _TypeView;
}
-(UIImageView *)TempImgView{
    if (!_TempImgView) {
        _TempImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, StatuBar_Height, SCREEN_WIDTH, SCREEN_HEIGHT-StatuBar_Height)];
        _TempImgView.image = [UIImage imageNamed:@"分类占位图"];
        _TempImgView.userInteractionEnabled = YES;
        _TempImgView.hidden = YES;
        UITapGestureRecognizer * Taps = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tempimgTapClicks)];
        [_TempImgView addGestureRecognizer:Taps];
    }
    return _TempImgView;
}
-(NSMutableArray *)DongwangTagModelArr{
    if (!_DongwangTagModelArr) {
        _DongwangTagModelArr = [NSMutableArray array];
    }
    return _DongwangTagModelArr;
}
-(NSMutableArray *)SanXiaMyWorkerClaaArr{
    if (!_SanXiaMyWorkerClaaArr) {
        _SanXiaMyWorkerClaaArr = [NSMutableArray array];
    }
    return _SanXiaMyWorkerClaaArr;
}
-(NSMutableArray *)SanXiaMyWorkerTagArr{
    if (!_SanXiaMyWorkerTagArr) {
        _SanXiaMyWorkerTagArr = [NSMutableArray array];
    }
    return _SanXiaMyWorkerTagArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tagSeltecdIndex = 0;
    [[AppDelegate getAppDelegate].window addSubview:self.TempImgView];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#EDEDED"];

}
#pragma mark--个人中心
-(void)DongwanguserImgTapClicks{
    
    DongFangMyCenterViewController * MyCenterVc = [[DongFangMyCenterViewController alloc]init];
    MyCenterVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:MyCenterVc animated:YES];
    
    
}
-(void)DongwangCreatMenuView{
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.HomeRightView];
    UIView * LeftViews = [[UIView alloc]initWithFrame:CGRectMake(0, 0, RealWidth(50), RealWidth(40))];
    
    
    UIImageView * userImgViews = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(15), RealWidth(5), RealWidth(30), RealWidth(30))];
    userImgViews.layer.cornerRadius = RealWidth(15);
    userImgViews.layer.masksToBounds = YES;
    userImgViews.layer.borderColor = [UIColor whiteColor].CGColor;
    userImgViews.layer.borderWidth = RealWidth(1);
    UserInfo * info = [UserManager userInfo];
    NSString  * headeID = [NSString stringWithFormat:@"%@",info.headId];
    userImgViews.image = [UIImage imageNamed:[NSString stringWithFormat:@"头像%@",headeID.length == 0 ? @"0" :headeID]];
    _userImgViews = userImgViews;
    UITapGestureRecognizer * DongwangTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwanguserImgTapClicks)];
    [userImgViews addGestureRecognizer:DongwangTap];
   
    [LeftViews addSubview:userImgViews];
    userImgViews.userInteractionEnabled = YES;
    LeftViews.backgroundColor = [UIColor clearColor];
    self.gk_navLeftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:LeftViews];
    self.gk_navTitleView = self.Menu;
    [self.view addSubview:self.BJScroloView];
    [self.Menu setItems:self.SanXiaMyWorkerTagArr selectedItemIndex:self.tagSeltecdIndex];
    for (int i = 0; i < self.SanXiaMyWorkerTagArr.count; i++) {
        if (i == 0) {
            DongwangHomeTuijianViewController_V3 * tuijianVc = [[DongwangHomeTuijianViewController_V3 alloc]init];
            [self addChildViewController:tuijianVc];
            [self.SanXiaMyWorkerClaaArr addObject:tuijianVc];
        }else{
//            DongwangHomeTuijianViewControllerChild_V3 *baseVc = [[DongwangHomeTuijianViewControllerChild_V3 alloc]init];;
////            baseVc.pageIndex =  i;
////            baseVc.TagModel = self.DongwangTagModelArr[i];
//            [self addChildViewController:baseVc];
//            [self.SanXiaMyWorkerClaaArr addObject:baseVc];
            
            DongwangChildHomeViewController *baseVc = [[DongwangChildHomeViewController alloc]init];;
            baseVc.pageIndex =  i;
            baseVc.TagModel = self.DongwangTagModelArr[i];
            [self addChildViewController:baseVc];
            [self.SanXiaMyWorkerClaaArr addObject:baseVc];
        }
    }
    if (self.Menu.selectedItemIndex < self.SanXiaMyWorkerTagArr.count) {
        DongwangChildHomeViewController *baseVc = self.SanXiaMyWorkerClaaArr[self.Menu.selectedItemIndex];
        [self.BJScroloView addSubview:baseVc.view];
        baseVc.view.frame = CGRectMake(SCREEN_Width*self.Menu.selectedItemIndex, 0, SCREEN_Width, SCREEN_HEIGHT-NaviH-kTabBarHeight);
        self.BJScroloView .contentOffset = CGPointMake(SCREEN_Width*self.Menu.selectedItemIndex, 0);
        self.BJScroloView .contentSize = CGSizeMake(self.SanXiaMyWorkerTagArr.count*SCREEN_Width, 0);
    }

}
-(UIScrollView *)BJScroloView{
    if (!_BJScroloView) {
        _BJScroloView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-kTabBarHeight)];
        _BJScroloView.backgroundColor  = [UIColor colorWithHexString:@"#410093"];
//        [UIColor colorWithHexString:@"#EDEDED"];
        _BJScroloView.delegate = self;
        _BJScroloView.pagingEnabled = YES;
        _BJScroloView.showsHorizontalScrollIndicator = NO;
        _BJScroloView.showsVerticalScrollIndicator = NO;
    }
    return _BJScroloView;;
}
-(SPPageMenu *)Menu{
    if (!_Menu) {
        _Menu =  [[SPPageMenu alloc]initWithFrame:CGRectMake(0, kStatusBarHeight+K(0), SCREEN_WIDTH-K(30), navigationHeight-RealWidth(16)) trackerStyle:SPPageMenuTrackerStyleLineAttachment];
        _Menu.backgroundColor = [UIColor clearColor];
        _Menu.selectedItemTitleColor = [UIColor whiteColor];
        _Menu.unSelectedItemTitleColor = [UIColor whiteColor];
        _Menu.selectedItemTitleFont = KBlFont(font(17));
        _Menu.unSelectedItemTitleFont = KSysFont(font(13));
        _Menu.tracker.backgroundColor = [UIColor whiteColor];
        [_Menu setItems:self.SanXiaMyWorkerTagArr selectedItemIndex:self.tagSeltecdIndex];
        _Menu.trackerWidth = K(15);
        [_Menu setTrackerHeight:K(1) cornerRadius:0];
        _Menu.delegate = self;
        _Menu.bridgeScrollView = self.BJScroloView;
        _Menu.dividingLineHeight = K(0);
        _Menu.contentInset =  UIEdgeInsetsMake(K(0), -K(8), K(0), K(0));
    }
    return _Menu;
}
-(UIView *)HomeRightView{
    if (!_HomeRightView) {
        _HomeRightView = [[UIView alloc]initWithFrame:CGRectMake(0, kStatusBarHeight+K(0), RealWidth(40), navigationHeight-RealWidth(16))];
        UIButton * DongwangRightBtn = [[UIButton alloc]initWithFrame:CGRectMake(RealWidth(4), (navigationHeight-RealWidth(16))/2-RealWidth(10), RealWidth(20), RealWidth(20))];
        [DongwangRightBtn setEnlargeEdgeWithTop:RealWidth(15) right:RealWidth(5) bottom:RealWidth(14) left:RealWidth(15)];
        [DongwangRightBtn addTarget:self action:@selector(DongwangRightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [DongwangRightBtn setBackgroundImage:[UIImage imageNamed:@"更多-close"] forState:UIControlStateNormal];
        [DongwangRightBtn setBackgroundImage:[UIImage imageNamed:@"更多-close"] forState:UIControlStateSelected];
        [_HomeRightView addSubview:DongwangRightBtn];
        _DongwangRightBtn = DongwangRightBtn;
        
    }
    return _HomeRightView;
}
#pragma mark - SPPageMenu的代理方法
- (void)pageMenu:(SPPageMenu *)pageMenu itemSelectedAtIndex:(NSInteger)index {

    
}
- (void)pageMenu:(SPPageMenu *)pageMenu itemSelectedFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    [self DongwangTagSeltecdStateWithIndex:toIndex];
    if (_DongwangRightBtn.selected  == YES) {
    [self DongwangRightBtnClick:_DongwangRightBtn];
    }
    if (!self.BJScroloView.isDragging) {
        if (labs(toIndex - fromIndex) >= 2) {
            [self.BJScroloView setContentOffset:CGPointMake(SCREEN_Width * toIndex, 0) animated:NO];
        } else {
            [self.BJScroloView setContentOffset:CGPointMake(SCREEN_Width * toIndex, 0) animated:YES];
        }
    }
    if (self.SanXiaMyWorkerClaaArr.count <= toIndex) {return;}
    UIViewController *targetViewController = self.SanXiaMyWorkerClaaArr[toIndex];
    if ([targetViewController isViewLoaded]) return;
    targetViewController.view.frame = CGRectMake(SCREEN_Width * toIndex, 0, SCREEN_Width, SCREEN_Height-NaviH-kTabBarHeight);
    [_BJScroloView addSubview:targetViewController.view];
    
    
}
-(void)DongwangTagSeltecdStateWithIndex:(NSInteger)index{
    for (DongwangHomeTagModel * tagModel in self.DongwangTagModelArr) {
        tagModel.isSeltecd = NO;
    }
    self.tagSeltecdIndex = index;
    DongwangHomeTagModel * tagModel = self.DongwangTagModelArr[index];
    tagModel.isSeltecd = YES;
    
}
-(void)DongwangRightBtnClick:(UIButton *)RightBtn{
    RightBtn.selected = !RightBtn.selected;
//    if (RightBtn.selected) {
//        [self.TypeView Show];
//    }else{
//        [self.TypeView hiden];
//        self.TypeView = nil;
//    }
    if (RightBtn.selected) {
        _TempImgView.hidden = NO;
    }else{
        _TempImgView.hidden = YES;
    }
    
}
-(void)tempimgTapClicks{
    [self DongwangRightBtnClick:self.DongwangRightBtn];
}
#pragma mark--DongwangHomeAllTypeViewDelegate
-(void)DongwangHomeAllTypeViewTagDidSeltecdWithIndex:(NSInteger)index{
    self.tagSeltecdIndex = index;
    [self DongwangRightBtnClick:self.DongwangRightBtn];
    [self.Menu setItems:self.SanXiaMyWorkerTagArr selectedItemIndex:self.tagSeltecdIndex];
}
-(void)DongwangHomeAllTypeViewViewTapAction{
    self.DongwangRightBtn.selected = YES;
    [self DongwangRightBtnClick:self.DongwangRightBtn];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UserInfo * info = [UserManager userInfo];
    NSString  * headeID = [NSString stringWithFormat:@"%@",info.headId];
    _userImgViews.image = [UIImage imageNamed:[NSString stringWithFormat:@"头像%@",headeID.length == 0 ? @"0" :headeID]];
    self.showTimeStr = [NSString currentTimeStr];
    MJWeakSelf;
    [DongwangHomeViewModel DongwangHomeTagList:@{}.mutableCopy RequestCuurentControlers:self taskSuuced:^(NSMutableArray * _Nonnull modelAarr, NSMutableArray * _Nonnull TagArr) {
        if (weakSelf.DongwangTagModelArr.count > 1) {
            return;
        }
        
        if (weakSelf.SanXiaMyWorkerTagArr.count > 0) {
            [weakSelf.SanXiaMyWorkerTagArr removeAllObjects];
        }
        if (weakSelf.DongwangTagModelArr.count > 0) {
            [weakSelf.DongwangTagModelArr removeAllObjects];
        }
        
        weakSelf.SanXiaMyWorkerTagArr = TagArr;
        weakSelf.DongwangTagModelArr = modelAarr;
        [weakSelf DongwangCreatMenuView];
    } taskfairler:^(id  _Nonnull message) {
        
    }];

    

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.leaveTimeStr =  [NSString currentTimeStr];
    [[DataBuried ShareManager] CLLogoninWithParmesWithShowTimeStr:self.showTimeStr LeaveTimeStr:self.leaveTimeStr ViewPageName:3];
}
-(void)DongwangLoadSubViews{
   
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

