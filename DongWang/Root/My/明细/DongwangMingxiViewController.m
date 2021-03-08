//
//  DongwangMyPrizeViewController.m
//
//
//  Created by codehzx on 2020/10/31.
//

#import "DongwangMingxiViewController.h"
#import <SPPageMenu-umbrella.h>
#import "DongwangShourumingxiViewController.h"
#import "DongwangTixianHistoryViewController.h"
#define scrollViewHeight (SCREEN_Height-SafeAreaBottom_Height-K(40))
@interface DongwangMingxiViewController ()<SPPageMenuDelegate,UIScrollViewDelegate>
@property(nonatomic,strong) UIView  * SanXiaMyWorkerTopView;
@property(nonatomic,strong) NSMutableArray * SanXiaMyWorkerClaaArr;
@property(nonatomic,strong) NSMutableArray * SanXiaMyWorkerTagArr;
@property(nonatomic,strong) SPPageMenu * SanXiaMyWorkerMenu;
@property (nonatomic, strong) UIScrollView * SanXiaMyWorkerScrollView;
@property (nonatomic, strong) NSMutableArray *SanXiaMyWorkerClaaArrs;

@end

@implementation DongwangMingxiViewController
-(UIView *)SanXiaMyWorkerTopView{
    if (!_SanXiaMyWorkerTopView) {
        
        _SanXiaMyWorkerTopView =  [[UIView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, K(40))];
    }
    return _SanXiaMyWorkerTopView;
}
-(NSMutableArray *)SanXiaMyWorkerTagArr{
    if (!_SanXiaMyWorkerTagArr) {
        _SanXiaMyWorkerTagArr = [[NSMutableArray alloc]initWithArray:@[@"收入明细",@"提现记录"]];
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
        _SanXiaMyWorkerMenu.backgroundColor = [UIColor colorWithHexString:@"#E5DAF0"];
        _SanXiaMyWorkerMenu.permutationWay = SPPageMenuPermutationWayNotScrollEqualWidths;
        _SanXiaMyWorkerMenu.selectedItemTitleColor = [UIColor colorWithHexString:@"#333333"];
        _SanXiaMyWorkerMenu.unSelectedItemTitleColor = [UIColor colorWithHexString:@"#333333"];
        _SanXiaMyWorkerMenu.selectedItemTitleFont = PFS13Font;
        _SanXiaMyWorkerMenu.unSelectedItemTitleFont = PFR13Font;
        _SanXiaMyWorkerMenu.tracker.backgroundColor = [UIColor colorWithHexString:@"#6612FF"];
        [_SanXiaMyWorkerMenu setItems:self.SanXiaMyWorkerTagArr selectedItemIndex:0];
        _SanXiaMyWorkerMenu.trackerWidth = kWidth(61.5);
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
    self.gk_navTitle = @"现金明细";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.SanXiaMyWorkerTopView];
    [self.SanXiaMyWorkerTopView addSubview:self.SanXiaMyWorkerMenu];
    UIView * Dongwangline = [[UIView alloc]initWithFrame:CGRectMake(0, K(39), SCREEN_WIDTH, K(1))];
    Dongwangline.backgroundColor =  [UIColor whiteColor];
    [_SanXiaMyWorkerMenu addSubview:Dongwangline];
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
        _SanXiaMyWorkerScrollView.backgroundColor =  [UIColor whiteColor];
        _SanXiaMyWorkerScrollView.pagingEnabled = YES;
        _SanXiaMyWorkerScrollView.showsHorizontalScrollIndicator = NO;
        _SanXiaMyWorkerScrollView.showsVerticalScrollIndicator = NO;
    }
    return  _SanXiaMyWorkerScrollView;
}
-(void)SanXiaMyWorkerLoadClass{
    NSArray * ClassArr = @[@"DongwangShourumingxiViewController",@"DongwangTixianHistoryViewController"];
    for (int i = 0; i < self.SanXiaMyWorkerTagArr.count; i++) {
        DongwangBaseViewController *baseVc = [NSClassFromString(ClassArr[i]) new];
        [self addChildViewController:baseVc];
        [self.SanXiaMyWorkerClaaArrs addObject:baseVc];
    }
    
    if (self.SanXiaMyWorkerMenu.selectedItemIndex < self.SanXiaMyWorkerTagArr.count) {
        DongwangBaseViewController *baseVc = self.SanXiaMyWorkerClaaArrs[self.SanXiaMyWorkerMenu.selectedItemIndex];
        [self.SanXiaMyWorkerScrollView addSubview:baseVc.view];
        baseVc.view.frame = CGRectMake(SCREEN_Width*self.SanXiaMyWorkerMenu.selectedItemIndex, 0, SCREEN_Width, scrollViewHeight-NaviH);
        self.SanXiaMyWorkerScrollView .contentOffset = CGPointMake(SCREEN_Width*self.SanXiaMyWorkerMenu.selectedItemIndex, 0);
        self.SanXiaMyWorkerScrollView .contentSize = CGSizeMake(self.SanXiaMyWorkerTagArr.count*SCREEN_Width, 0);
    }
}


@end


