//
//  DongwangMyPrizeViewController.m
//
//
//  Created by codehzx on 2020/10/31.
//

#import "DongwangMyPrizeViewController.h"
#import <SPPageMenu-umbrella.h>
#import "DongwangMyPrizeViewSubController.h"
#define scrollViewHeight (SCREEN_Height-SafeAreaBottom_Height-K(40))
@interface DongwangMyPrizeViewController ()<SPPageMenuDelegate,UIScrollViewDelegate>
@property(nonatomic,strong) UIView  * SanXiaMyWorkerTopView;
@property(nonatomic,strong) NSMutableArray * SanXiaMyWorkerClaaArr;
@property(nonatomic,strong) NSMutableArray * SanXiaMyWorkerTagArr;
@property(nonatomic,strong) SPPageMenu * SanXiaMyWorkerMenu;
@property (nonatomic, strong) UIScrollView * SanXiaMyWorkerScrollView;
@property (nonatomic, strong) NSMutableArray *SanXiaMyWorkerClaaArrs;

@end

@implementation DongwangMyPrizeViewController
-(UIView *)SanXiaMyWorkerTopView{
    if (!_SanXiaMyWorkerTopView) {
        
        _SanXiaMyWorkerTopView =  [[UIView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, K(40))];
    }
    return _SanXiaMyWorkerTopView;
}
-(NSMutableArray *)SanXiaMyWorkerTagArr{
    if (!_SanXiaMyWorkerTagArr) {
        _SanXiaMyWorkerTagArr = [[NSMutableArray alloc]initWithArray:@[@"全部",@"未使用",@"已使用",@"已过期"]];
    }
    return _SanXiaMyWorkerTagArr;
}
-(NSMutableArray *)SanXiaMyWorkerClaaArrs{
    if (!_SanXiaMyWorkerClaaArrs) {
        _SanXiaMyWorkerClaaArrs = [[NSMutableArray alloc]init];
    }
    return _SanXiaMyWorkerClaaArrs;
}

-(SPPageMenu *)SanXiaMyWorkerMenu{
    if (!_SanXiaMyWorkerMenu) {
        _SanXiaMyWorkerMenu = [[SPPageMenu alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(40)) trackerStyle:SPPageMenuTrackerStyleLineAttachment];
        _SanXiaMyWorkerMenu.backgroundColor = [UIColor whiteColor];
        _SanXiaMyWorkerMenu.permutationWay = SPPageMenuPermutationWayNotScrollEqualWidths;
        _SanXiaMyWorkerMenu.selectedItemTitleColor = [UIColor colorWithHexString:@"#8767E9"];
        _SanXiaMyWorkerMenu.unSelectedItemTitleColor = [UIColor colorWithHexString:@"#333333"];
        _SanXiaMyWorkerMenu.selectedItemTitleFont = [UIFont systemFontOfSize:font(13)];
        _SanXiaMyWorkerMenu.unSelectedItemTitleFont = [UIFont systemFontOfSize:font(13)];
        _SanXiaMyWorkerMenu.tracker.backgroundColor = [UIColor colorWithHexString:@"#FFB609"];
        [_SanXiaMyWorkerMenu setItems:self.SanXiaMyWorkerTagArr selectedItemIndex:0];
        _SanXiaMyWorkerMenu.trackerWidth = kWidth(61.5);
        _SanXiaMyWorkerMenu.tracker.backgroundColor = [UIColor colorWithHexString:@"#8767E9"];
        _SanXiaMyWorkerMenu.delegate = self;
        _SanXiaMyWorkerMenu.bridgeScrollView = self.SanXiaMyWorkerScrollView;
        _SanXiaMyWorkerMenu.dividingLineHeight =0;
        _SanXiaMyWorkerMenu.contentInset =  UIEdgeInsetsMake(0, K(10), 0, K(10));
    }
    return _SanXiaMyWorkerMenu;
}

-(NSMutableArray *)SanXiaMyWorkerClaaArr{
    if (!_SanXiaMyWorkerClaaArr) {
        _SanXiaMyWorkerClaaArr = [[NSMutableArray alloc]init];
    }
    return _SanXiaMyWorkerClaaArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"我的奖品";
    self.isShowBtomImgView = NO;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#804AB7"];
    [self.view addSubview:self.SanXiaMyWorkerTopView];
    [self.SanXiaMyWorkerTopView addSubview:self.SanXiaMyWorkerMenu];
    [self.view addSubview:self.SanXiaMyWorkerScrollView];
    [self.SanXiaMyWorkerMenu setItems:self.SanXiaMyWorkerTagArr selectedItemIndex:0];
    [self SanXiaMyWorkerLoadClass];

}
#pragma mark - SPPageMenu的代理方法
- (void)pageMenu:(SPPageMenu *)pageMenu itemSelectedAtIndex:(NSInteger)index {
}
- (void)pageMenu:(SPPageMenu *)pageMenu itemSelectedFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    if (!self.SanXiaMyWorkerScrollView.isDragging) {
        if (labs(toIndex - fromIndex) >= 2) {
            [self.SanXiaMyWorkerScrollView setContentOffset:CGPointMake(SCREEN_Width * toIndex, 0) animated:NO];
        } else {
            [self.SanXiaMyWorkerScrollView setContentOffset:CGPointMake(SCREEN_Width * toIndex, 0) animated:YES];
        }
    }
    if (self.SanXiaMyWorkerClaaArrs.count <= toIndex) {return;}
    UIViewController *targetViewController = self.SanXiaMyWorkerClaaArrs[toIndex];
    if ([targetViewController isViewLoaded]) return;
    targetViewController.view.frame = CGRectMake(SCREEN_Width * toIndex, 0, SCREEN_Width, scrollViewHeight-NaviH-K(0));
    [_SanXiaMyWorkerScrollView addSubview:targetViewController.view];
}
- (UIScrollView *)SanXiaMyWorkerScrollView {
    if (!_SanXiaMyWorkerScrollView) {
        _SanXiaMyWorkerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, NaviH+K(40), SCREEN_Width, scrollViewHeight-NaviH-K(0))];
        _SanXiaMyWorkerScrollView.delegate = self;
        _SanXiaMyWorkerScrollView.backgroundColor =  [UIColor clearColor];
        _SanXiaMyWorkerScrollView.pagingEnabled = YES;
        _SanXiaMyWorkerScrollView.showsHorizontalScrollIndicator = NO;
        _SanXiaMyWorkerScrollView.showsVerticalScrollIndicator = NO;
    }
    return  _SanXiaMyWorkerScrollView;
}
-(void)SanXiaMyWorkerLoadClass{
    for (int i = 0; i < self.SanXiaMyWorkerTagArr.count; i++) {
        DongwangMyPrizeViewSubController *baseVc = [[DongwangMyPrizeViewSubController alloc]init];
        baseVc.Index = i;
        [self addChildViewController:baseVc];
        [self.SanXiaMyWorkerClaaArrs addObject:baseVc];
    }
    
    if (self.SanXiaMyWorkerMenu.selectedItemIndex < self.SanXiaMyWorkerTagArr.count) {
        DongwangMyPrizeViewSubController *baseVc = self.SanXiaMyWorkerClaaArrs[self.SanXiaMyWorkerMenu.selectedItemIndex];
        [self.SanXiaMyWorkerScrollView addSubview:baseVc.view];
        baseVc.view.frame = CGRectMake(SCREEN_Width*self.SanXiaMyWorkerMenu.selectedItemIndex, 0, SCREEN_Width, scrollViewHeight-NaviH);
        self.SanXiaMyWorkerScrollView .contentOffset = CGPointMake(SCREEN_Width*self.SanXiaMyWorkerMenu.selectedItemIndex, 0);
        self.SanXiaMyWorkerScrollView .contentSize = CGSizeMake(self.SanXiaMyWorkerTagArr.count*SCREEN_Width, 0);
    }
}


@end

