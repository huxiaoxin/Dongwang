//
//  DongwangTixianHistoryViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/11.
//

#import "DongwangTixianHistoryViewController.h"
#import "DongwangTixianHistoryTableViewCell.h"
#import "DongwangMyViewModel.h"
@interface DongwangTixianHistoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * DongwangTableView;
@property(nonatomic,strong) NSMutableArray * DongwangDataArr;
@property(nonatomic,assign) NSInteger page ;

@end

@implementation DongwangTixianHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#E5DAF0"];

    self.gk_navigationBar.hidden = YES;
    [self.view addSubview:self.DongwangTableView];
    
    //暂无数据
    // Do any additional setup after loading the view.
}
-(NSMutableArray *)DongwangDataArr{
    if (!_DongwangDataArr) {
        _DongwangDataArr = [[NSMutableArray alloc]init];
    }
    return _DongwangDataArr;
}
-(UITableView *)DongwangTableView{
    if (!_DongwangTableView) {
        _DongwangTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height-K(40)) style:UITableViewStylePlain];
        _DongwangTableView.delegate = self;
        _DongwangTableView.dataSource = self;
        _DongwangTableView.showsVerticalScrollIndicator = NO;
        _DongwangTableView.showsHorizontalScrollIndicator = NO;
        _DongwangTableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
        _DongwangTableView.backgroundColor = [UIColor clearColor];
        _DongwangTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangHeaderClicks)];
        [_DongwangTableView.mj_header beginRefreshing];
//        _DongwangTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(DongwangFooterClicks)];
//        _DongwangTableView.mj_footer.hidden= YES;
        MJWeakSelf;
        _DongwangTableView.mj_footer = [MJRefreshManager defaultFooter:^{
        [weakSelf DongwangFooterClicks];
        }];

    }
    return _DongwangTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DongwangDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangminxiIdnetifer  = @"DongwangTixianHistoryTableViewCell";
    DongwangTixianHistoryTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangminxiIdnetifer];
    if (DongwangCell == nil) {
        DongwangCell =[[DongwangTixianHistoryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangminxiIdnetifer];
    }
    DongwangCell.tixianModel = self.DongwangDataArr[indexPath.row];
    return DongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(70);
}
-(void)emtyview{
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        LYEmptyView * noemtyview = [LYEmptyView emptyViewWithImageStr:@"nodatamingxi" titleStr:@"暂时没有现金记录哦~" detailStr:nil];
//            noemtyview.titleLabTextColor = [UIColor whiteColor];

        noemtyview.contentViewY = K(100);
        weakSelf.DongwangTableView.ly_emptyView =  noemtyview;
        [weakSelf.DongwangTableView.mj_header endRefreshing];
    });
}

-(void)DongwangHeaderClicks{

    self.page = 1;
    [self DongwangRequest];
}
-(void)DongwangFooterClicks{
    self.page +=1;
    [self DongwangRequest];
}
-(void)DongwangRequest{
    
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithdrawlist:@{@"page":[NSString stringWithFormat:@"%ld",self.page],@"type":@"2",@"viewPage":@"2"}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        NSMutableArray * dataArr  = (NSMutableArray *)object;
        if (weakSelf.page == 1) {
            if (weakSelf.DongwangDataArr.count > 0) {
                [weakSelf.DongwangDataArr removeAllObjects];
            }
            if (weakSelf.DongwangDataArr.count == 0) {
                [weakSelf loademtyveiws];
            }

            weakSelf.DongwangDataArr = dataArr;
            [weakSelf.DongwangTableView reloadData];
            [weakSelf.DongwangTableView.mj_footer resetNoMoreData];
            [weakSelf.DongwangTableView.mj_header endRefreshing];
        }else{
            if (dataArr.count == 0) {
                [weakSelf.DongwangTableView reloadData];
                [weakSelf.DongwangTableView.mj_footer endRefreshingWithNoMoreData];
                return;
            }
            [weakSelf.DongwangDataArr addObjectsFromArray:[dataArr copy]];
            [weakSelf.DongwangTableView reloadData];
            [weakSelf.DongwangTableView.mj_footer endRefreshing];
            
        }
        [weakSelf.DongwangTableView.mj_header endRefreshing];
    } Deleaccountfairler:^(id  _Nonnull message) {
        [weakSelf.DongwangTableView.mj_footer endRefreshing];
        [weakSelf.DongwangTableView.mj_header endRefreshing];

    }];
    
}
-(void)loademtyveiws{
//
    LYEmptyView * emtyView= [LYEmptyView emptyViewWithImage:[UIImage imageNamed:@"holderdata"] titleStr:@"暂时没有现金记录哦~" detailStr:@""];
//    emtyView.titleLabTextColor = [UIColor whiteColor];

    self.DongwangTableView.ly_emptyView = emtyView;
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
