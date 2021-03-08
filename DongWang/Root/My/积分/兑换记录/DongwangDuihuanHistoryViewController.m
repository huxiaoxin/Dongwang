//
//  DongwangDuihuanHistoryViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/18.
//

#import "DongwangDuihuanHistoryViewController.h"
#import "DongwangDuihuanHistoryTableViewCell.h"
#import "DongwangMyVipView.h"
@interface DongwangDuihuanHistoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * DongwangDuihuanTableView;
@property(nonatomic,strong) NSMutableArray * DongwangDuihuanDataArr;
@property(nonatomic,assign) NSInteger page;
@end

@implementation DongwangDuihuanHistoryViewController

-(NSMutableArray *)DongwangDuihuanDataArr{
    if (!_DongwangDuihuanDataArr) {
        _DongwangDuihuanDataArr = [[NSMutableArray alloc]init];
    }
    return _DongwangDuihuanDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"兑换记录";
    self.isShowBtomImgView = NO;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#804AB7"];
    UIImageView * dongwanBjimgViews = [[UIImageView  alloc]initWithFrame:CGRectMake(K(15+5), NaviH+K(14), SCREEN_WIDTH-K(30), SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height-K(44.5))];
    dongwanBjimgViews.image = [UIImage imageNamed:@"jifenback"];
    [self.view addSubview:dongwanBjimgViews];

    [self.view addSubview:self.DongwangDuihuanTableView];
    
}
-(UITableView *)DongwangDuihuanTableView{
    if (!_DongwangDuihuanTableView) {
        _DongwangDuihuanTableView = [[UITableView alloc]initWithFrame:CGRectMake(K(15), NaviH+K(14), SCREEN_WIDTH-K(30), SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height-K(44.5)) style:UITableViewStylePlain];
        _DongwangDuihuanTableView.delegate = self;
        _DongwangDuihuanTableView.dataSource = self;
        _DongwangDuihuanTableView.layer.cornerRadius = K(10);
//        _DongwangDuihuanTableView.layer.masksToBounds = YES;
        _DongwangDuihuanTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _DongwangDuihuanTableView.showsVerticalScrollIndicator  = NO;
        _DongwangDuihuanTableView.showsHorizontalScrollIndicator = NO;
        _DongwangDuihuanTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _DongwangDuihuanTableView.backgroundColor = [UIColor clearColor];
        _DongwangDuihuanTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangDuihuanHeaderClicks)];
        [_DongwangDuihuanTableView.mj_header beginRefreshing];
        MJWeakSelf;
        _DongwangDuihuanTableView.mj_footer = [MJRefreshManager defaultFooter:^{
        [weakSelf DongwangDuihuanFooterClicks];
        }];

        
    }
    return _DongwangDuihuanTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    _DongwangDuihuanTableView.mj_footer.hidden = !self.DongwangDuihuanDataArr.count;
    return self.DongwangDuihuanDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangDuihuanIdentifer = @"DongwangDuihuanHistoryTableViewCell";
    DongwangDuihuanHistoryTableViewCell * DonwgangCell = [tableView dequeueReusableCellWithIdentifier:DongwangDuihuanIdentifer];
    if (DonwgangCell == nil) {
        DonwgangCell = [[DongwangDuihuanHistoryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangDuihuanIdentifer];
    }
    DonwgangCell.duihuanModel = self.DongwangDuihuanDataArr[indexPath.row];
    return DonwgangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(56);
}
-(void)DongwangDuihuanHeaderClicks{
    self.page = 1;
    [self DongwangDuihuanRequestData];
}
-(void)DongwangDuihuanFooterClicks{
    self.page +=1;
    [self DongwangDuihuanRequestData];
}
-(void)DongwangDuihuanRequestData{
    MJWeakSelf;
    [DongwangMyVipView DongwangMyViewModelWithgetExchangeCardList:@{@"page":[NSString stringWithFormat:@"%ld",(long)self.page]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        NSMutableArray * DataArr =(NSMutableArray *) object;
        if (weakSelf.page == 1) {
            if (weakSelf.DongwangDuihuanDataArr.count > 0) {
                [weakSelf.DongwangDuihuanDataArr removeAllObjects];
            }
            weakSelf.DongwangDuihuanDataArr = DataArr;
            if (weakSelf.DongwangDuihuanDataArr.count == 0) {
                [weakSelf DongwangAdressLoademtyView];
            }
            [weakSelf.DongwangDuihuanTableView reloadData];
            [weakSelf.DongwangDuihuanTableView.mj_footer resetNoMoreData];
            [weakSelf.DongwangDuihuanTableView.mj_header endRefreshing];
            
        }else{
            
            if (DataArr.count == 0) {
                [weakSelf.DongwangDuihuanTableView reloadData];
                [weakSelf.DongwangDuihuanTableView.mj_footer endRefreshingWithNoMoreData];
                return;
            }
            [weakSelf.DongwangDuihuanDataArr addObjectsFromArray:[DataArr copy]];
            [weakSelf.DongwangDuihuanTableView reloadData];
            [weakSelf.DongwangDuihuanTableView.mj_footer endRefreshing];
            
        }
        
    } Deleaccountfairler:^(id  _Nonnull message) {
        
    }];
}
-(void)DongwangAdressLoademtyView{
    LYEmptyView * dongwangemtyView = [LYEmptyView emptyActionViewWithImage:[UIImage imageNamed:@"holderdata"] titleStr:@"还没有兑换记录哦~" detailStr:@"" btnTitleStr:@"" target:nil action:nil];
//    dongwangemtyView.titleLabTextColor = [UIColor whiteColor];

    self.DongwangDuihuanTableView.ly_emptyView = dongwangemtyView;
    [self.DongwangDuihuanTableView reloadData];
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
