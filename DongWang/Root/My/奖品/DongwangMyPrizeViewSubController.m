//
//  DongwangMyPrizeViewSubController.m
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import "DongwangMyPrizeViewSubController.h"
#import "DongwangMyPrizeTableViewCell.h"
#import "DongwangMyViewModel.h"
#import "DongwangMyPrizeModel.h"
#import "DongwangTixianViewController_V3.h"
#import "DongwangMyjifenViewController.h"
#import "DongwangPropsViewController.h"
#import "DongwangAutorAlterView.h"
#import "DongwangRealAuotrViewController.h"
#import "DongwangPrivetaWebViewController.h"
@interface DongwangMyPrizeViewSubController ()<UITableViewDelegate,UITableViewDataSource,DongwangMyPrizeTableViewCellDelegate,DongwangAutorAlterViewDelegate>
@property(nonatomic,strong) UITableView * DongwangMyPrizeTableView;
@property(nonatomic,strong) NSMutableArray * DongwangMyPrizeDataArr;
@property(nonatomic,assign) NSInteger  page;
@property(nonatomic,strong) DongwangAutorAlterView *dongwangalterView;
@end

@implementation DongwangMyPrizeViewSubController
-(NSMutableArray *)DongwangMyPrizeDataArr{
    if (!_DongwangMyPrizeDataArr) {
        _DongwangMyPrizeDataArr = [[NSMutableArray alloc]init];
    }
    return _DongwangMyPrizeDataArr;
}
-(DongwangAutorAlterView *)dongwangalterView{
    if (!_dongwangalterView) {
        _dongwangalterView = [[DongwangAutorAlterView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _dongwangalterView.delegate =self;
    }
    return _dongwangalterView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.DongwangMyPrizeTableView];
    UIView * TableHeader = [[UIView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH-0, K(19.5))];
    TableHeader.backgroundColor =  [UIColor colorWithHexString:@"#804AB7"];
    _DongwangMyPrizeTableView.tableHeaderView = TableHeader;
    _DongwangMyPrizeTableView.tableFooterView = nil;
    self.isShowBtomImgView = NO;

}
-(UITableView *)DongwangMyPrizeTableView{
    if (!_DongwangMyPrizeTableView) {
        _DongwangMyPrizeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, K(0), SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-K(40)-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _DongwangMyPrizeTableView.delegate = self;
        _DongwangMyPrizeTableView.dataSource = self;
        _DongwangMyPrizeTableView.showsVerticalScrollIndicator = NO;
        _DongwangMyPrizeTableView.showsHorizontalScrollIndicator = NO;
        _DongwangMyPrizeTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _DongwangMyPrizeTableView.backgroundColor = [UIColor clearColor];
        _DongwangMyPrizeTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangMyPrizeHeaderClick)];
        [_DongwangMyPrizeTableView.mj_header beginRefreshing];
//        _DongwangMyPrizeTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(DongwangMyPrizeFooterClicks)];
//        _DongwangMyPrizeTableView.mj_footer.hidden = YES;
        MJWeakSelf;
        _DongwangMyPrizeTableView.mj_footer = [MJRefreshManager defaultFooter:^{
        [weakSelf DongwangMyPrizeFooterClicks];
        }];

    }
    return _DongwangMyPrizeTableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    _DongwangMyPrizeTableView.mj_footer.hidden = !self.DongwangMyPrizeDataArr.count;
    return self.DongwangMyPrizeDataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangMyPrizeIdentifer = @"DongwangMyPrizeTableViewCell";
    DongwangMyPrizeTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangMyPrizeIdentifer];
    
    if (DongwangCell == nil) {
    DongwangCell = [[DongwangMyPrizeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangMyPrizeIdentifer];
    }
    DongwangCell.tag =indexPath.row;
    DongwangCell.delegate = self;
    DongwangCell.MyPrizeModel = self.DongwangMyPrizeDataArr[indexPath.row];
    return DongwangCell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(103+16);
}
#pragma mark--DongwangMyPrizeTableViewCellDelegate
-(void)DongwangMyPrizeTableViewCellDidSeltecdWithCellIndex:(NSInteger)CellIndex{
    DongwangMyPrizeModel * myModel= self.DongwangMyPrizeDataArr[CellIndex];
    if ([myModel.buttonStatus intValue] == 0) {
        //高亮
        //现金奖励跳转到提现页面；积分奖励跳转到积分页面，道具卡跳转到我的道具页面；实物奖励跳转到活动详情页面，具体按照活动需求。
        //使用类型,0代表谢谢惠顾,1代表现金2积分3卡卷4道具5实物
        if ([myModel.mode intValue] == 0) {
            
        }else if ([myModel.mode intValue] == 1){
            if ([[NSString stringWithFormat:@"%@",[UserManager userInfo].certification] isEqualToString:@"1"]) {
                DongwangTixianViewController_V3 * donngwangyueVc = [[DongwangTixianViewController_V3 alloc]init];
                donngwangyueVc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:donngwangyueVc animated:YES];
            }else{
                [self.dongwangalterView show];
            }
        }else if ([myModel.mode intValue] == 2){
            DongwangMyjifenViewController * jifenVc = [[DongwangMyjifenViewController alloc]init];
            jifenVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:jifenVc animated:YES];
        }else if ([myModel.mode intValue] == 3){
            DongwangPrivetaWebViewController * priveTecvc = [[DongwangPrivetaWebViewController alloc]init];
            priveTecvc.protoclUrlText =  myModel.url;
            [self.navigationController pushViewController:priveTecvc animated:YES];
        }else if ([myModel.mode intValue] == 4){
            DongwangPropsViewController * properVc = [[DongwangPropsViewController alloc]init];
            properVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:properVc animated:YES];
        }else if ([myModel.mode intValue] == 5){
            DongwangPrivetaWebViewController * priveTecvc = [[DongwangPrivetaWebViewController alloc]init];
            priveTecvc.protoclUrlText =  myModel.url;
            [self.navigationController pushViewController:priveTecvc animated:YES];

        }
    }
    
}
-(void)DongwangMyPrizeHeaderClick{
    self.page = 1;
    [self DongwangMyPirezeRequestData];
}
-(void)DongwangMyPrizeFooterClicks{
    self.page +=1;
    [self DongwangMyPirezeRequestData];
}
-(void)DongwangMyPirezeRequestData{
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithMyprize:@{@"status":[NSString stringWithFormat:@"%ld",(long)self.Index],@"pageNo":[NSString stringWithFormat:@"%ld",(long)self.page]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        NSMutableArray * DataArr  = (NSMutableArray *)object;
        if (weakSelf.page == 1) {
            if (weakSelf.DongwangMyPrizeDataArr.count >0) {
                [weakSelf.DongwangMyPrizeDataArr removeAllObjects];
            }
            if (DataArr.count == 0) {
                [weakSelf DongwangAdressLoademtyView];
            }
            weakSelf.DongwangMyPrizeDataArr = DataArr;
            [weakSelf.DongwangMyPrizeTableView.mj_header endRefreshing];
            [weakSelf.DongwangMyPrizeTableView.mj_footer resetNoMoreData];

            [weakSelf.DongwangMyPrizeTableView reloadData];
        }else{
            
            if (DataArr.count == 0) {
                [weakSelf.DongwangMyPrizeTableView.mj_footer endRefreshingWithNoMoreData];
                [weakSelf.DongwangMyPrizeTableView reloadData];
                
                return;
            }
            [weakSelf.DongwangMyPrizeDataArr addObjectsFromArray:[DataArr copy]];
            [weakSelf.DongwangMyPrizeTableView.mj_footer endRefreshing];
            [weakSelf.DongwangMyPrizeTableView reloadData];
        }
     [weakSelf.DongwangMyPrizeTableView.mj_header endRefreshing];
    } Deleaccountfairler:^(id  _Nonnull message) {
        [weakSelf.DongwangMyPrizeTableView.mj_header endRefreshing];
        [weakSelf.DongwangMyPrizeTableView.mj_footer endRefreshing];
    }];

}
#pragma mark--DongwangAutorAlterViewDelegate
-(void)DongwangAutorAlterViewSureAction{
    
    DongwangRealAuotrViewController * DongwangLaterVc = [[DongwangRealAuotrViewController alloc]init];
    DongwangLaterVc.hidesBottomBarWhenPushed = YES;
    DongwangLaterVc.autoreBlock = ^{
    };
    [self.navigationController pushViewController:DongwangLaterVc animated:YES];


}
-(void)DongwangAdressLoademtyView{
    LYEmptyView * dongwangemtyView = [LYEmptyView emptyActionViewWithImage:[UIImage imageNamed:@"holderdata"] titleStr:@"还没有获得奖品哦，快去答题吧~" detailStr:@"" btnTitleStr:@"" target:nil action:nil];
    dongwangemtyView.titleLabTextColor = [UIColor whiteColor];
//    dongwangemtyView.contentViewY = K(65);
    self.DongwangMyPrizeTableView.ly_emptyView = dongwangemtyView;
    [self.DongwangMyPrizeTableView reloadData];
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
