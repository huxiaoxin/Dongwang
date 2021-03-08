//
//  DongwangJifenDetailViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/17.
//

#import "DongwangJifenDetailViewController.h"
#import "DongwangJifenTableViewCell.h"
#import "DongwangMyVipView.h"
#import "DongwangFenleiViewController.h"
@interface DongwangJifenDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * DongwangJifenTableView;
@property(nonatomic,strong) NSMutableArray * DongwangJifenDataArr;
@property(nonatomic,assign) NSInteger page;
@end

@implementation DongwangJifenDetailViewController
-(NSMutableArray *)DongwangJifenDataArr{
    if (!_DongwangJifenDataArr) {
        _DongwangJifenDataArr  = [[NSMutableArray alloc]init];
    }
    return _DongwangJifenDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"积分明细";
    self.isShowBtomImgView = NO;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#804AB7"];

    UIImageView * dongwanBjimgViews = [[UIImageView  alloc]initWithFrame:CGRectMake(RealWidth(15), NaviH+RealWidth(15), SCREEN_WIDTH-RealWidth(20), SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height-RealWidth(15))];
    dongwanBjimgViews.image = [UIImage imageNamed:@"jifenback"];
    [self.view addSubview:dongwanBjimgViews];
    [self.view addSubview:self.DongwangJifenTableView];
    
    
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    self.DongwangJifenTableView.mj_footer.hidden = !self.DongwangJifenDataArr.count;
    return self.DongwangJifenDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangJifenIdentfer = @"DongwangJifenTableViewCell";
    DongwangJifenTableViewCell * DonwgangJifenCell  = [tableView dequeueReusableCellWithIdentifier:DongwangJifenIdentfer];
    if (DonwgangJifenCell == nil) {
        DonwgangJifenCell = [[DongwangJifenTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangJifenIdentfer];
    }
    DonwgangJifenCell.detailMode = self.DongwangJifenDataArr[indexPath.row];
    return DonwgangJifenCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(52);
}
-(UITableView *)DongwangJifenTableView{
    if (!_DongwangJifenTableView) {
        _DongwangJifenTableView = [[UITableView alloc]initWithFrame:CGRectMake(K(14), K(13)+NaviH, SCREEN_WIDTH-K(28), SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height-K(42)) style:UITableViewStylePlain];
        _DongwangJifenTableView.delegate = self;
        _DongwangJifenTableView.dataSource = self;
        _DongwangJifenTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _DongwangJifenTableView.backgroundColor = [UIColor clearColor];
//        _DongwangJifenTableView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF" Alpha:0.8];
        _DongwangJifenTableView.showsVerticalScrollIndicator = NO;
        _DongwangJifenTableView.showsHorizontalScrollIndicator = NO;
        _DongwangJifenTableView.layer.cornerRadius = K(8);
//        _DongwangJifenTableView.layer.masksToBounds = YES;
        _DongwangJifenTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangJifenHeaderClicks)];
        [_DongwangJifenTableView.mj_header  beginRefreshing];
        
//        _DongwangJifenTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(DongwangFooterClicks)];
//        _DongwangJifenTableView.mj_footer.hidden = YES;
        MJWeakSelf;
        _DongwangJifenTableView.mj_footer = [MJRefreshManager defaultFooter:^{
        [weakSelf DongwangFooterClicks];
        }];
    }
    return _DongwangJifenTableView;
}
-(void)DongwangFooterClicks{
    self.page +=1;
    [self DongwangRequestData];
}
-(void)DongwangJifenHeaderClicks{
    self.page = 1;
    [self DongwangRequestData];
}
-(void)DongwangRequestData{
    MJWeakSelf;
    [DongwangMyVipView DongwangMyViewModelWithMyRewardList:@{@"page":[NSString stringWithFormat:@"%ld",(long)self.page]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        NSMutableArray * dataArr =(NSMutableArray *) object;
        if (weakSelf.page == 1) {
            if (weakSelf.DongwangJifenDataArr.count > 0) {
                [weakSelf.DongwangJifenDataArr removeAllObjects];
            }
            weakSelf.DongwangJifenDataArr = dataArr;
            if (weakSelf.DongwangJifenDataArr.count ==  0) {
                [weakSelf DongwangAdressLoademtyView];
            }
            [weakSelf.DongwangJifenTableView reloadData];
            [weakSelf.DongwangJifenTableView.mj_footer resetNoMoreData];
            [weakSelf.DongwangJifenTableView.mj_header endRefreshing];
        }else{
            if (dataArr.count == 0) {
            [weakSelf.DongwangJifenTableView reloadData];
            [weakSelf.DongwangJifenTableView.mj_footer endRefreshingWithNoMoreData];
                return;
            }
            [weakSelf.DongwangJifenDataArr addObjectsFromArray:[dataArr copy]];
            [weakSelf.DongwangJifenTableView reloadData];
            [weakSelf.DongwangJifenTableView.mj_footer endRefreshing];
        }
    } Deleaccountfairler:^(id  _Nonnull message) {
    [weakSelf.DongwangJifenTableView.mj_footer endRefreshing];
    }];
}
-(void)DongwangAdressLoademtyView{
    LYEmptyView * dongwangemtyView = [LYEmptyView emptyActionViewWithImage:[UIImage imageNamed:@"holderdata"] titleStr:@"还没有积分，快去做任务赚取积分吧～" detailStr:@"" btnTitleStr:@"做任务，赚积分" target:self action:@selector(DongwangActiongoJifen)];
    dongwangemtyView.contentViewOffset = -K(80);
    dongwangemtyView.actionBtnWidth = K(232);
    dongwangemtyView.actionBtnMargin = 60;
    dongwangemtyView.actionBtnHeight = RealWidth(40);
    dongwangemtyView.actionBtnFont = KBlFont(font(15));
    dongwangemtyView.actionBtnTitleColor =  [UIColor whiteColor];
    dongwangemtyView.actionBtnBackGroundColor = [UIColor colorWithHexString:@"C330B9"];
//    dongwangemtyView.titleLabTextColor = [UIColor whiteColor];

    dongwangemtyView.actionBtnCornerRadius = RealWidth(20);
    self.DongwangJifenTableView.ly_emptyView = dongwangemtyView;
    [self.DongwangJifenTableView reloadData];
}
-(void)DongwangActiongoJifen{
    DongwangFenleiViewController * catVc = [[DongwangFenleiViewController alloc]init];
    
    [self.navigationController pushViewController:catVc animated:YES];
    
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
