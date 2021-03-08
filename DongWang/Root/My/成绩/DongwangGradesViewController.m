//
//  DongwangGradesViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import "DongwangGradesViewController.h"
#import <ZKCycleScrollView-umbrella.h>
#import "DongwangGardesCollectionViewCell.h"
#import "DongwangGradesDetailViewController.h"
#import "DongwangMyViewModel.h"
#import "DongwangGradesModel.h"
@interface DongwangGradesViewController ()<ZKCycleScrollViewDelegate, ZKCycleScrollViewDataSource,DongwangGardesCollectionViewCellDelegate>
@property(nonatomic,strong) ZKCycleScrollView * dongwangScrollView;
@property(nonatomic,strong) NSMutableArray * DongwangDataArr;
@property(nonatomic,strong) UITableView * DongwangemtyTableView;
@end

@implementation DongwangGradesViewController
-(NSMutableArray *)DongwangDataArr{
    if (!_DongwangDataArr) {
        _DongwangDataArr = [[NSMutableArray alloc]init];
    }
    return _DongwangDataArr;
}
-(UITableView *)DongwangemtyTableView{
    if (!_DongwangemtyTableView) {
        _DongwangemtyTableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _DongwangemtyTableView.showsVerticalScrollIndicator = NO;
        _DongwangemtyTableView.showsHorizontalScrollIndicator = NO;
        _DongwangemtyTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _DongwangemtyTableView.backgroundColor = [UIColor clearColor];
    }
    return _DongwangemtyTableView;
}
-(void)DongwangAdressLoademtyView{
    LYEmptyView * dongwangemtyView = [LYEmptyView emptyActionViewWithImage:[UIImage imageNamed:@"holderdata"] titleStr:@"还没有答过题呢，去答题看看~" detailStr:@"" btnTitleStr:@"" target:nil action:nil];
    dongwangemtyView.titleLabTextColor = [UIColor whiteColor];
//    dongwangemtyView.contentViewY = K(65);
    self.DongwangemtyTableView.ly_emptyView = dongwangemtyView;
    [self.DongwangemtyTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"成绩单";
    self.isShowBtomImgView = NO;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#804AB7"];
    [self.view addSubview:self.DongwangemtyTableView];
    UIView * DongwangBackView=  [[UIView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH)];
    DongwangBackView.backgroundColor   = [UIColor colorWithHexString:@"#410093" Alpha:0.9];
    DongwangBackView.hidden = YES;
    [self.view addSubview:DongwangBackView];
    [self.view addSubview:self.dongwangScrollView];

    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithMychenji:@{@"page":@"1"}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        weakSelf.DongwangDataArr   = (NSMutableArray *)object;
        if (weakSelf.DongwangDataArr.count == 0) {
        [weakSelf DongwangAdressLoademtyView];
            self->_DongwangemtyTableView.hidden = NO;
            DongwangBackView.hidden = YES;
        }else{
            DongwangBackView.hidden  =  NO;
            self->_DongwangemtyTableView.hidden = YES;
        }
        [weakSelf.dongwangScrollView reloadData];
    } Deleaccountfairler:^(id  _Nonnull message) {
        
    }];
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
    return self.DongwangDataArr.count;
}
- (__kindof ZKCycleScrollViewCell *)cycleScrollView:(ZKCycleScrollView *)cycleScrollView cellForItemAtIndex:(NSInteger)index {
    DongwangGardesCollectionViewCell * DongwangCell = [cycleScrollView dequeueReusableCellWithReuseIdentifier:@"DongwangGardesCollectionViewCell" forIndex:index];
    DongwangCell.tag = index;
    DongwangCell.delegate = self;
    DongwangCell.gardModel= self.DongwangDataArr[index];
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
#pragma mark--DongwangGardesCollectionViewCellDelegate
-(void)DongwangGardesCollectionViewCellDidSeltecd:(NSInteger)index{
    DongwangGradesModel * gardesModel = self.DongwangDataArr[index];
    DongwangGradesDetailViewController * DongwangDetailVc = [[DongwangGradesDetailViewController alloc]init];
    DongwangDetailVc.gardesModel = gardesModel;
    [self.navigationController pushViewController:DongwangDetailVc animated:YES];
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
