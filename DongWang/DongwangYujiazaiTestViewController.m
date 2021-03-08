//
//  DongwangYujiazaiTestViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/19.
//

#import "DongwangYujiazaiTestViewController.h"

// 预伽载临界值
static CGFloat const Threshold = 0.6;

@interface DongwangYujiazaiTestViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * DongwangYuJiaTableView;
@property (nonatomic, assign) NSInteger totalNumber;
@property (nonatomic, assign) NSInteger page;

// 下拉强制刷新所有接口数据
@property (nonatomic, assign) BOOL isPull;
// 是否正在加载更多
@property (nonatomic, assign) BOOL isLoadingMore;
@end

@implementation DongwangYujiazaiTestViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.totalNumber = 20;
    self.page = 1;
    [self.view addSubview:self.DongwangYuJiaTableView];
    [AFNetworkTool GET:@"http://192.168.3.157:8069/dongwang-app/receive/address/info?id=5" HttpHeader:nil Parameters:@{@"id":@"5"}.mutableCopy Success:^(id responseObject) {
        
    } Failure:^(id failure) {
        
    }];
    

    // Do any additional setup after loading the view.
}
-(UITableView *)DongwangYuJiaTableView{
    if (!_DongwangYuJiaTableView) {
        _DongwangYuJiaTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _DongwangYuJiaTableView.delegate = self;
        _DongwangYuJiaTableView.dataSource = self;
        _DongwangYuJiaTableView.showsVerticalScrollIndicator = NO;
        _DongwangYuJiaTableView.showsHorizontalScrollIndicator = NO;
        _DongwangYuJiaTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _DongwangYuJiaTableView.backgroundColor = [UIColor clearColor];
//        _DongwangYuJiaTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangMoreHeaderClicks)];
//        [_DongwangYuJiaTableView.mj_header beginRefreshing];
    }
    return _DongwangYuJiaTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.totalNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static  NSString * DongwangIdentider = @"UITableViewCell";
    UITableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangIdentider];
    if (DongwangCell == nil) {
        DongwangCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangIdentider];
    }
    DongwangCell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return DongwangCell;
}
// 预加载方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 如果已经在加载更多，则返回
    if (self.isLoadingMore) {
        NSLog(@"打断");
        return;
    }
    // 第一次网络请求失败的情况下避免奔溃
    if (self.page <= 0) {
        return;
    }
    // 动态临界值
    CGFloat newThreshold = Threshold + (((1-Threshold)*(self.page - 1))/(CGFloat)self.page);
    // 总的偏移量
    CGFloat currentBottomOffSetY = scrollView.contentOffset.y + scrollView.frame.size.height;
    CGFloat totalContentSizeY = scrollView.contentSize.height;
    // 取得当前滑动视图的底边的偏移量
    CGFloat ratio = currentBottomOffSetY/totalContentSizeY;
    // 比较临界值大小
    if (ratio > newThreshold) {
        NSLog(@"开始请求数据");
        // 执行预加载数据。。。。
        
        [self loadMore];
    }
}
-(void)DongwangMoreHeaderClicks{
    MJWeakSelf;
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        weakSelf.page = 1;
//        weakSelf.totalNumber = 20;
//        weakSelf.isLoadingMore = NO;
//        [weakSelf.DongwangYuJiaTableView reloadData];
//        [weakSelf.DongwangYuJiaTableView.mj_header endRefreshing];
//    });
}

- (void)loadMore {
    //还在请求中 就return
    if (self.isLoadingMore) {
        return;
    }
    self.isLoadingMore = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        if (self.totalNumber == 160) {
//            self.isLoadingMore =  NO;
//            [self.DongwangYuJiaTableView reloadData];
//            [self.DongwangYuJiaTableView.mj_footer endRefreshingWithNoMoreData];
//            return;
//        }
        self.page += 1;
        self.totalNumber += 20;
        self.isLoadingMore = NO;
      
    });

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
