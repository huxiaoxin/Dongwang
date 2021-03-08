//
//  DongwangAdressViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/9.
//

#import "DongwangAdressViewController.h"
#import "DongwangAdressTableViewCell.h"
#import "DongwangAddAdressViewController.h"
#import "DongwangMyViewModel.h"
#import "ShippingAddressListModel.h"
@interface DongwangAdressViewController ()<UITableViewDelegate,UITableViewDataSource,DongwangAdressTableViewCellDelegate>
@property(nonatomic,strong) UITableView * DongwangAdressTableView;
@property(nonatomic,strong) NSMutableArray * DongwangAdressDataArr;
@property(nonatomic,assign) NSInteger   page;
@property(nonatomic,assign) BOOL isloadMore;
@end

@implementation DongwangAdressViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(NSMutableArray *)DongwangAdressDataArr{
    if (!_DongwangAdressDataArr) {
        _DongwangAdressDataArr = [[NSMutableArray alloc]init];
    }
    return _DongwangAdressDataArr;
}
-(void)DongwangAdressRealod{
    [self.DongwangAdressTableView.mj_header beginRefreshing];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"我的收货地址";
    self.isShowBtomImgView = NO;
    self.isloadMore = NO;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#E5DAF0"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DongwangAdressRealod) name:@"DongwangAdressRealod" object:nil];
    
    UIButton * AddBtn = [[UIButton alloc]initWithFrame:CGRectMake(RealWidth(28), RealWidth(501)+NaviH, SCREEN_WIDTH-RealWidth(56), RealWidth(45))];
    AddBtn.adjustsImageWhenHighlighted = NO;
    [AddBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];
    [AddBtn addTarget:self action:@selector(AddBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [AddBtn setTitle:@"+ 新建收货地址" forState:UIControlStateNormal];
    AddBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [AddBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    AddBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
   [self.view addSubview:AddBtn];
    [self.view addSubview:self.DongwangAdressTableView];
    
    // Do any additional setup after loading the view.
}
-(UITableView *)DongwangAdressTableView{
    if (!_DongwangAdressTableView) {
        _DongwangAdressTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, RealWidth(501)) style:UITableViewStylePlain];
        _DongwangAdressTableView.delegate = self;
        _DongwangAdressTableView.dataSource = self;
        _DongwangAdressTableView.showsVerticalScrollIndicator = NO;
        _DongwangAdressTableView.showsHorizontalScrollIndicator = NO;
        _DongwangAdressTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _DongwangAdressTableView.backgroundColor =[UIColor clearColor];
        _DongwangAdressTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangAdressHeaderClicks)];
        [_DongwangAdressTableView.mj_header beginRefreshing];
        _DongwangAdressTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(DonngwangAdressFooterClicks)];
        _DongwangAdressTableView.mj_footer.hidden = YES;
    }
    return _DongwangAdressTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    _DongwangAdressTableView.mj_footer.hidden = !self.DongwangAdressDataArr.count;
    return self.DongwangAdressDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangIdentifer =@"DongwangAdressTableViewCell";
    DongwangAdressTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangIdentifer];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwangAdressTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangIdentifer];
    }
    DongwangCell.tag = indexPath.row;
    DongwangCell.delegate = self;
    DongwangCell.ShipingModel=self.DongwangAdressDataArr[indexPath.row];
    return DongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShippingAddressListModel * listModel = self.DongwangAdressDataArr[indexPath.row];
    return listModel.cellheight;
}
-(void)DongwangAdressHeaderClicks{
    self.isloadMore = NO;
    self.page = 1;
    [self DongwangAdresReqeust];
}
-(void)DonngwangAdressFooterClicks{
    self.isloadMore = YES;
    self.page +=1;
    [self DongwangAdresReqeust];
}
-(void)DongwangAdresReqeust{
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithAdressList:@{@"page":[NSString stringWithFormat:@"%ld",self.page]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        NSMutableArray * TempArr =(NSMutableArray *) object;
        if (weakSelf.page == 1) {
            if (weakSelf.DongwangAdressDataArr.count > 0) {
            [weakSelf.DongwangAdressDataArr removeAllObjects];
            }
            weakSelf.DongwangAdressDataArr =  TempArr;
            if (weakSelf.DongwangAdressDataArr.count == 0) {
                [weakSelf DongwangAdressLoademtyView];
            }
            [weakSelf.DongwangAdressTableView.mj_header endRefreshing];
            [weakSelf.DongwangAdressTableView.mj_footer resetNoMoreData];
            [weakSelf.DongwangAdressTableView reloadData];
            if (weakSelf.DongwangAdressDataArr.count <=5) {
            weakSelf.DongwangAdressTableView.mj_footer.hidden = YES;
            }
        }else{
            if (TempArr.count == 0) {
            [weakSelf.DongwangAdressTableView reloadData];
            [weakSelf.DongwangAdressTableView.mj_footer endRefreshingWithNoMoreData];
            }else{
            [weakSelf.DongwangAdressDataArr addObjectsFromArray:[TempArr copy]];
            [weakSelf.DongwangAdressTableView reloadData];
            [weakSelf.DongwangAdressTableView.mj_footer endRefreshing];
            }
        }
    } Deleaccountfairler:^(id  _Nonnull message) {
        [weakSelf DongwangAdressLoademtyView];
        //分页加载请求失败 page 应该减1
        [weakSelf.DongwangAdressTableView.mj_header endRefreshing];
        [weakSelf.DongwangAdressTableView.mj_footer endRefreshing];
        [weakSelf.DongwangAdressTableView reloadData];
    }];
}
-(void)dongwangemtyBtnClick{
   DongwangAddAdressViewController * dongwangAddVc = [[DongwangAddAdressViewController alloc]init];
[self.navigationController pushViewController:dongwangAddVc animated:YES];
}

-(void)DongwangAdressLoademtyView{
    LYEmptyView * dongwangemtyView = [LYEmptyView emptyActionViewWithImage:[UIImage imageNamed:@"holderdata"] titleStr:@"还没有填写收货地址哦～" detailStr:@"" btnTitleStr:@"" target:nil action:nil];
//    dongwangemtyView.titleLabTextColor = [UIColor whiteColor];
    dongwangemtyView.contentViewY = K(65);
    self.DongwangAdressTableView.ly_emptyView = dongwangemtyView;
    [self.DongwangAdressTableView reloadData];
}

-(void)AddBtnClick{
    DongwangAddAdressViewController * dongwangadVc = [[DongwangAddAdressViewController alloc]init];
    dongwangadVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dongwangadVc animated:YES];
}
#pragma mark--DongwangAdressTableViewCellDelegate
-(void)DongwangAdressTableViewCellChangeAdressWithCellIndex:(NSInteger)cellIndex{
    DongwangAddAdressViewController * dongwangAddVc = [[DongwangAddAdressViewController alloc]init];
    dongwangAddVc.shipingListModel = self.DongwangAdressDataArr[cellIndex];
    [self.navigationController pushViewController:dongwangAddVc animated:YES];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
