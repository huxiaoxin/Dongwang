//
//  DongwangMyyueViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/11.
//

#import "DongwangMyyueViewController.h"
#import "DongwangMyyueHeaderView.h"
#import "DongwangMyyueTableViewCell.h"
#import "DongWangMyyueFooterView.h"
#import "DongwangBindingZhifubaoViewController.h"
#import "DongwangMingxiViewController.h"
#import "DongwangLogoinViewModel.h"
#import "RITLTimer.h"
#import "DongwangMyViewModel.h"
#import "DongwangAlipaygodrawSuccedView.h"
@interface DongwangMyyueViewController ()<UITableViewDelegate,UITableViewDataSource,DongWangMyyueFooterViewDelegate,DongwangAlipaygodrawSuccedViewDelegate>
@property(nonatomic,strong) DongwangMyyueHeaderView * DongwanHeader;
@property(nonatomic,strong) UITableView * DongwangMyTableView;
@property(nonatomic,strong) NSMutableArray * DongwangDataArr;
@property(nonatomic,strong) DongWangMyyueFooterView * DongwangFooterView;
@property(nonatomic,strong)  NSTimer *  timer;
@property(nonatomic,assign) NSInteger Count;
@property(nonatomic,strong) DongwangAlipaygodrawSuccedView * DongwangSuccedView;
@property(nonatomic,strong) NSDictionary * messageDic;

@property(nonatomic,strong)  NSString * showTimeStr;
@property(nonatomic,strong)  NSString * leaveTimeStr;

@end

@implementation DongwangMyyueViewController

-(NSMutableArray *)DongwangDataArr{
    if (!_DongwangDataArr) {
        _DongwangDataArr = [[NSMutableArray alloc]initWithArray:@[@"支付宝号",@"真实姓名",@"手机号码"]];
    }
    return _DongwangDataArr;
}
-(DongwangMyyueHeaderView *)DongwanHeader{
    if (!_DongwanHeader) {
        _DongwanHeader = [[DongwangMyyueHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(112+81))];
    }
    return _DongwanHeader;
}
-(DongwangAlipaygodrawSuccedView *)DongwangSuccedView{
    if (!_DongwangSuccedView) {
        _DongwangSuccedView = [[DongwangAlipaygodrawSuccedView alloc]initWithFrame:[UIScreen  mainScreen].bounds message:self.messageDic];
        _DongwangSuccedView.deleate = self;
    }
    return _DongwangSuccedView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle =  @"提现";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#E5DAF0"];
    self.isShowBtomImgView = NO;
    self.Count = 60;
    UIButton * DongwangRightbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, K(10), K(60), K(30))];
    [DongwangRightbtn addTarget:self action:@selector(DongwangRightbtnClick) forControlEvents:UIControlEventTouchUpInside];
    [DongwangRightbtn setTitle:@"现金明细" forState:UIControlStateNormal];
    [DongwangRightbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    DongwangRightbtn.titleLabel.font = KSysFont(font(14));
    
    UIView * DongwangRightbarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(60), K(50))];
    [DongwangRightbarView addSubview:DongwangRightbtn];
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:DongwangRightbarView];

    self.gk_navItemRightSpace = K(10);
    [self.view addSubview:self.DongwangMyTableView];
    _DongwangMyTableView.tableHeaderView = self.DongwanHeader;
    NSInteger  alipayStatus = [[UserManager userInfo].alipayStatus integerValue];
    if (alipayStatus == 1) {
        self.DongwangFooterView.height = self.DongwangFooterView.FooterHeight;
        _DongwangMyTableView.tableFooterView = self.DongwangFooterView;
    }else{
        LYEmptyView  * ltemtyview = [LYEmptyView emptyActionViewWithImage:[UIImage imageNamed:@"zhifubao-3"] titleStr:@"您尚未绑定支付宝" detailStr:@"绑定支付宝以后才能提现到账哦〜" btnTitleStr:@"去绑定" target:self action:@selector(DongwangBindingZhifubao)];
        ltemtyview.contentViewY = K(235);
        ltemtyview.titleLabFont = KBlFont(font(17));
        ltemtyview.titleLabTextColor = LGDBLackColor;
        ltemtyview.detailLabFont = KSysFont(font(14));
        ltemtyview.detailLabTextColor = [UIColor colorWithHexString:@"#999999"];
        ltemtyview.actionBtnHeight = K(45);
        ltemtyview.actionBtnWidth = K(318);
        ltemtyview.actionBtnMargin = K(76);
        ltemtyview.actionBtnTitleColor = [UIColor whiteColor];
        ltemtyview.actionBtnFont=  KBlFont(font(15));
        ltemtyview.actionBtnBackGroundColor = LGDMianColor;
        ltemtyview.actionBtnCornerRadius = K(22.5);
        ltemtyview.actionBtnBackGroundGradientColors = @[[UIColor colorWithHexString:@"#FF00E1"],[UIColor colorWithHexString:@"#6612FF"]];
        _DongwangMyTableView.ly_emptyView = ltemtyview;
        [_DongwangMyTableView reloadData];
    }
    
   
    
}
#pragma mark--现金明细
-(void)DongwangRightbtnClick{
    DongwangMingxiViewController * dongwangmingxiVc = [[DongwangMingxiViewController alloc]init];
    [self.navigationController pushViewController:dongwangmingxiVc animated:YES];
}
#pragma mark--绑定支付宝
-(void)DongwangBindingZhifubao{
    MJWeakSelf;
    DongwangBindingZhifubaoViewController * DongwangZhifubaoVc = [[DongwangBindingZhifubaoViewController alloc]init];
    DongwangZhifubaoVc.bindblock = ^{
    weakSelf.DongwangFooterView.height = weakSelf.DongwangFooterView.FooterHeight;
    weakSelf.DongwangMyTableView.tableFooterView = self.DongwangFooterView;
    [weakSelf.DongwangMyTableView ly_hideEmptyView];
    };
    DongwangZhifubaoVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:DongwangZhifubaoVc animated:YES];
}
-(DongWangMyyueFooterView *)DongwangFooterView{
    if (!_DongwangFooterView) {
        _DongwangFooterView = [[DongWangMyyueFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(150))];
        _DongwangFooterView.delegate= self;
    }
    return _DongwangFooterView;
}
-(UITableView *)DongwangMyTableView{
    if (!_DongwangMyTableView) {
        _DongwangMyTableView =  [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _DongwangMyTableView.delegate = self;
        _DongwangMyTableView.dataSource = self;
        _DongwangMyTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _DongwangMyTableView.backgroundColor = [UIColor clearColor];
    }
    return _DongwangMyTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangMyyueIdentifer = @"DongwangMyyueTableViewCell";
    DongwangMyyueTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangMyyueIdentifer];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwangMyyueTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangMyyueIdentifer];
    }
    DongwangCell.leftText = self.DongwangDataArr[indexPath.row];
    return DongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(56.5);
}
#pragma mark--DongWangMyyueFooterViewDelegate
-(void)DongWangMyyueFooterViewgetmsgCode{
    MJWeakSelf;
    [DongwangLogoinViewModel CodeloginRequestWithParmtersw:@{@"phone":[NSString stringWithFormat:@"%@",[UserManager userInfo].phone],@"type":@"3"}.mutableCopy RequestCuurentControlers:self logoinSuuced:^(id  _Nonnull object) {
        [weakSelf DongwangSendSuccedCodeRequest];
    } logoinfairler:^{
        
    }];
}
-(void)DongwangSendSuccedCodeRequest{
    MJWeakSelf;
    [self.view endEditing:YES];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.timer = [RITLTimer scheduledTimerWithTimeInterval:1 userInfo:nil repeats:YES BlockHandle:^(id  _Nonnull info) {
            weakSelf.Count --;
            if (weakSelf.Count == 0) {
                [weakSelf.timer invalidate];
                weakSelf.timer = nil;
                weakSelf.Count = 60;
                weakSelf.DongwangFooterView.DongwangCodeBtn.enabled = YES;
                [weakSelf.DongwangFooterView.DongwangCodeBtn setTitle:@"重新获取" forState:UIControlStateNormal];
                [weakSelf.DongwangFooterView.DongwangCodeBtn setBackgroundColor:[UIColor colorWithHexString:@"#FFB608"]];
            }else{
                [weakSelf.DongwangFooterView.DongwangCodeBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
                weakSelf.DongwangFooterView.DongwangCodeBtn.enabled = NO;
                [weakSelf.DongwangFooterView.DongwangCodeBtn setTitle:[NSString stringWithFormat:@"重新获取(%lds)",weakSelf.Count] forState:UIControlStateNormal];
            }
        }];
        
    });
    
}
#pragma mark--立即提现
-(void)DongWangMyyueFooterViewgoWithdrawWith:(UITextField *)codeTextField{
    
    //立即提现
    [[DataBuried ShareManager] CLLogoninWithParmesWithShowTimeStr:[NSString currentTimeStr] LeaveTimeStr:[NSString currentTimeStr] ViewPageName:13];

    [self.view endEditing:YES];
    NSString *payAccount = [NSString stringWithFormat:@"%@",[UserManager userInfo].payAccount];
    NSString * phone  =[NSString stringWithFormat:@"%@",[UserManager userInfo].phone];
    NSString * currentBalance = [NSString stringWithFormat:@"%@",[UserManager userInfo].currentBalance];
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithgoWithdraw:@{@"payAccount":payAccount,@"realName":[UserManager userInfo].realName,@"phone":phone,@"smsCode":codeTextField.text,@"currentBalance":currentBalance}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        weakSelf.DongwangFooterView.DongwangTixianBtn.enabled = NO;
        [weakSelf.DongwangFooterView.DongwangTixianBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [weakSelf.DongwangFooterView.DongwangTixianBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];

        codeTextField.text =nil;
        NSDictionary * messageDic  =[object objectForKey:@"data"];
        weakSelf.messageDic = messageDic;
        [weakSelf.DongwangSuccedView show];
    } Deleaccountfairler:^(id  _Nonnull message) {
        
    }];
}
-(void)DongwangAlipaygodrawSuccedViewSured{
    self.DongwanHeader.info = [UserManager userInfo];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.showTimeStr = [NSString currentTimeStr];

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.leaveTimeStr =  [NSString currentTimeStr];
//    NSInteger  alipayStatus = [[UserManager userInfo].alipayStatus integerValue];
//    if (alipayStatus == 0) {
//    }else{
//        NSLog(@"提现主页面");
        
        [[DataBuried ShareManager] CLLogoninWithParmesWithShowTimeStr:self.showTimeStr LeaveTimeStr:self.leaveTimeStr ViewPageName:8];

//    }
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
