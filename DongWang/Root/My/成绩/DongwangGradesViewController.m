//
//  DongwangGradesViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import "DongwangGradesViewController.h"
#import <ZKCycleScrollView-umbrella.h>
#import "DongwangGardesCollectionViewCell.h"
@interface DongwangGradesViewController ()<ZKCycleScrollViewDelegate, ZKCycleScrollViewDataSource>
@property(nonatomic,strong) ZKCycleScrollView * dongwangScrollView;
@end

@implementation DongwangGradesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"我的成绩";
    self.view.backgroundColor = LGDLightGaryColor;
    [self.view addSubview:self.dongwangScrollView];
    // Do any additional setup after loading the view.
}
-(ZKCycleScrollView *)dongwangScrollView{
    if (!_dongwangScrollView) {
        _dongwangScrollView = [[ZKCycleScrollView alloc]initWithFrame:CGRectMake(0, NaviH+K(0), SCREEN_WIDTH, K(367+120))];
        _dongwangScrollView.itemSize = CGSizeMake(SCREEN_WIDTH-K(100), K(367));
        _dongwangScrollView.itemZoomScale = 0.9;
        _dongwangScrollView.itemSpacing = 10; // 设置 cell 间距
        _dongwangScrollView.backgroundColor = [UIColor clearColor];
        _dongwangScrollView.delegate = self;
        _dongwangScrollView.dataSource = self;
        _dongwangScrollView.hidesPageControl = YES;
        _dongwangScrollView.autoScroll = NO;
        [_dongwangScrollView registerCellClass:[DongwangGardesCollectionViewCell class] forCellWithReuseIdentifier:@"DongwangGardesCollectionViewCell"];
    }
    return _dongwangScrollView;
}
- (NSInteger)numberOfItemsInCycleScrollView:(ZKCycleScrollView *)cycleScrollView {
    return 10;
}
- (__kindof ZKCycleScrollViewCell *)cycleScrollView:(ZKCycleScrollView *)cycleScrollView cellForItemAtIndex:(NSInteger)index {
    DongwangGardesCollectionViewCell * DongwangCell = [cycleScrollView dequeueReusableCellWithReuseIdentifier:@"DongwangGardesCollectionViewCell" forIndex:index];
    
    return DongwangCell;
}
#pragma mark -- ZKCycleScrollView Delegate
- (void)cycleScrollView:(ZKCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
}
- (void)cycleScrollViewDidScroll:(ZKCycleScrollView *)cycleScrollView progress:(CGFloat)progress {
    if (cycleScrollView != _dongwangScrollView) return;
//     _pageControl.progress = progress;
    NSLog(@"progress = %f", progress);
}

- (void)cycleScrollView:(ZKCycleScrollView *)cycleScrollView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    if (cycleScrollView != _dongwangScrollView) return;
    NSLog(@"from %zd to %zd", fromIndex, toIndex);
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
