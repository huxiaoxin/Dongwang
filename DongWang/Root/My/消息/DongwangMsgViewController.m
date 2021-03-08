//
//  DongwangMsgViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/10.
//

#import "DongwangMsgViewController.h"
#import "DongwangMsgTableViewCell.h"
#import "DongwangMyViewModel.h"
#import "DongwangMsgModel.h"
@interface DongwangMsgViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * DongwangMsgTableView;
@property(nonatomic,strong) NSMutableArray * DongwangMsgDataArr;
@property(nonatomic,assign) NSInteger page;
@end

@implementation DongwangMsgViewController

-(NSMutableArray *)DongwangMsgDataArr{
    if (!_DongwangMsgDataArr) {
        _DongwangMsgDataArr = [[NSMutableArray alloc]init];
    }
    return _DongwangMsgDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"我的消息";
    self.isShowBtomImgView = NO;
    self.view.backgroundColor =  [UIColor colorWithHexString:@"#804AB7"];
    [self.view addSubview:self.DongwangMsgTableView];
    // Do any additional setup after loading the view.
}
-(UITableView *)DongwangMsgTableView{
    if (!_DongwangMsgTableView) {
        _DongwangMsgTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _DongwangMsgTableView.delegate = self;
        _DongwangMsgTableView.dataSource = self;
        _DongwangMsgTableView.showsVerticalScrollIndicator = NO;
        _DongwangMsgTableView.showsHorizontalScrollIndicator = NO;
        _DongwangMsgTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _DongwangMsgTableView.backgroundColor = [UIColor clearColor];
        _DongwangMsgTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangMsgHeaderClicks)];
        [_DongwangMsgTableView.mj_header beginRefreshing];
        
        MJWeakSelf;
        _DongwangMsgTableView.mj_footer = [MJRefreshManager defaultFooter:^{
            [weakSelf DongwangMsgFooterClicks];
        }];
        
//        _DongwangMsgTableView.mj_footer = [ MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(DongwangMsgFooterClicks)];
//        _DongwangMsgTableView.mj_footer.hidden = YES;
    }
    return _DongwangMsgTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    _DongwangMsgTableView.mj_footer.hidden = !self.DongwangMsgDataArr.count;
    return self.DongwangMsgDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangIdentifer = @"DongwangMsgTableViewCell";
    DongwangMsgTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangIdentifer];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwangMsgTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangIdentifer];
    }
    DongwangCell.msgModel = self.DongwangMsgDataArr[indexPath.row];
    return DongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DongwangMsgModel * msgModel = self.DongwangMsgDataArr[indexPath.row];
    return msgModel.Cellheight;
}
-(void)DongwangMsgHeaderClicks{
    self.page = 1;
    [self DongwangMsgRequestData];
}
-(void)DongwangMsgFooterClicks{
    self.page  +=1;
    [self DongwangMsgRequestData];
}
-(void)DongwangMsgRequestData{
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithMymessage:@{@"page":[NSString stringWithFormat:@"%ld",self.page]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        NSMutableArray * dataArr = (NSMutableArray *)object;
        if (weakSelf.page == 1) {
            if (weakSelf.DongwangMsgDataArr.count > 0) {
                [weakSelf.DongwangMsgDataArr removeAllObjects];
            }
            weakSelf.DongwangMsgDataArr = dataArr;
            if (weakSelf.DongwangMsgDataArr.count == 0) {
                [self DongwangAdressLoademtyView];
            }
            [weakSelf.DongwangMsgTableView reloadData];
            [weakSelf.DongwangMsgTableView.mj_header endRefreshing];
            [weakSelf.DongwangMsgTableView.mj_footer resetNoMoreData];

        }else{
            if (dataArr.count == 0) {
                [weakSelf.DongwangMsgTableView reloadData];
                [weakSelf.DongwangMsgTableView.mj_footer endRefreshingWithNoMoreData];
                return;
            }
            
            [weakSelf.DongwangMsgDataArr addObjectsFromArray:[dataArr copy]];
            [weakSelf.DongwangMsgTableView reloadData];
            [weakSelf.DongwangMsgTableView.mj_footer endRefreshing];
        }
    } Deleaccountfairler:^(id  _Nonnull message) {
        [weakSelf.DongwangMsgTableView.mj_footer endRefreshing];
        [weakSelf.DongwangMsgTableView.mj_header endRefreshing];
    }];

}
-(void)DongwangAdressLoademtyView{
    LYEmptyView * dongwangemtyView = [LYEmptyView emptyActionViewWithImage:[UIImage imageNamed:@"holderdata"] titleStr:@"目前还没有任何消息~" detailStr:@"" btnTitleStr:@"" target:nil action:nil];
    dongwangemtyView.titleLabTextColor = [UIColor whiteColor];

    self.DongwangMsgTableView.ly_emptyView = dongwangemtyView;
    [self.DongwangMsgTableView reloadData];
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
