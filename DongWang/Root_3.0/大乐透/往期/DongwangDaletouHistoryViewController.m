//
//  DongwangDaletouHistoryViewController.m
//  DongWang
//
//  Created by codehzx on 2021/1/27.
//

#import "DongwangDaletouHistoryViewController.h"
#import "DongwangDaletouHistoryTableViewCell.h"
#import "DongwangDaletouViewModel.h"
#import "DongwangDaletouHistoryDetailViewController.h"
@interface DongwangDaletouHistoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * DongwangHistoryTableView;
@property(nonatomic,strong) NSMutableArray * dongwangDataArr;
@property(nonatomic,assign) NSInteger  currentPage;
@end

@implementation DongwangDaletouHistoryViewController
-(NSMutableArray *)dongwangDataArr{
    if (!_dongwangDataArr) {
        _dongwangDataArr = [NSMutableArray array];
    }
    return _dongwangDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"往期活动";
    self.isShowBtomImgView = NO;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#804AB7"];
    [self.view addSubview:self.DongwangHistoryTableView];
    // Do any additional setup after loading the view.
}
-(UITableView *)DongwangHistoryTableView{
    if (!_DongwangHistoryTableView) {
        _DongwangHistoryTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _DongwangHistoryTableView.delegate = self;
        _DongwangHistoryTableView.dataSource = self;
        _DongwangHistoryTableView.showsVerticalScrollIndicator = NO;
        _DongwangHistoryTableView.showsHorizontalScrollIndicator = NO;
        _DongwangHistoryTableView.separatorStyle  = UITableViewCellSelectionStyleNone;
        _DongwangHistoryTableView.backgroundColor = [UIColor clearColor];
        _DongwangHistoryTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangHistoryHeaderActions)];
        [_DongwangHistoryTableView.mj_header beginRefreshing];
        MJWeakSelf;
        _DongwangHistoryTableView.mj_footer = [MJRefreshManager defaultFooter:^{
            [weakSelf DongwangHisrotyFooterClicks];
        }];
    }
    return _DongwangHistoryTableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * daletouIdentfer  =  @"DongwangDaletouHistoryTableViewCell";
    DongwangDaletouHistoryTableViewCell * historCell = [tableView dequeueReusableCellWithIdentifier:daletouIdentfer];
    if (historCell == nil) {
        historCell  =[[DongwangDaletouHistoryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:daletouIdentfer];
    }
    historCell.historyModel = self.dongwangDataArr[indexPath.row];
    return historCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dongwangDataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DongwangDaletouHistoryModel * histModel = self.dongwangDataArr[indexPath.row];
    return histModel.CellHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DongwangDaletouHistoryDetailViewController * detailVc = [[DongwangDaletouHistoryDetailViewController alloc]init];
    detailVc.hidesBottomBarWhenPushed = YES;
    detailVc.detailModel = self.dongwangDataArr[indexPath.row];
    [self.navigationController pushViewController:detailVc animated:YES];
    
}
-(void)DongwangHistoryHeaderActions{
    self.currentPage = 1;
    [self DongwangLoadData];
}
-(void)DongwangHisrotyFooterClicks{
    self.currentPage+=1;
    [self DongwangLoadData];
}
-(void)DongwangLoadData{
    MJWeakSelf;
    [DongwangDaletouViewModel DongwangDaletouRequestgetpastActivity:@{@"pageNo":[NSString stringWithFormat:@"%ld",self.currentPage],@"pageSize":@"10"}.mutableCopy RequestCuurentControlers:self requestSucced:^(id  _Nonnull resultobject) {
        NSMutableArray * dataArr = (NSMutableArray *)resultobject;
        if (weakSelf.currentPage == 1) {
            if (weakSelf.dongwangDataArr.count > 0) {
                [weakSelf.dongwangDataArr removeAllObjects];
            }
            [weakSelf.DongwangHistoryTableView.mj_footer resetNoMoreData];
            weakSelf.dongwangDataArr =   dataArr;
            [weakSelf.DongwangHistoryTableView reloadData];
            [weakSelf.DongwangHistoryTableView.mj_header endRefreshing];
            
        }else{
            [weakSelf.dongwangDataArr addObjectsFromArray:[dataArr copy]];
            [weakSelf.DongwangHistoryTableView reloadData];
            if (dataArr.count == 0) {
                [weakSelf.DongwangHistoryTableView.mj_footer endRefreshingWithNoMoreData];
            }else{
                [weakSelf.DongwangHistoryTableView.mj_footer endRefreshing];

            }
        }
    } requestfairler:^{
        
    }];

}
@end
