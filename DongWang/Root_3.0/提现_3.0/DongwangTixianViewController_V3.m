//
//  DongwangTixianViewController_V3.m
//  DongWang
//
//  Created by codehzx on 2021/1/22.
//

#import "DongwangTixianViewController_V3.h"
#import "DongwangTixianHeaderView.h"
#import "DongwangTixianFooterView_V3.h"
#import "DongwangAlipayTableViewCell.h"
#import "DongwangWechatTableViewCell.h"
#import "DongwangMingxiViewController.h"
#import "DongwangBindingZhifubaoViewController.h"
#import "DongwangMyViewModel.h"
#import "DongwangAlipaygodrawSuccedView.h"
#import "DongwangLogoinViewModel.h"
#import "DongwagNewBangdingViewController_V3.h"
@interface DongwangTixianViewController_V3 ()<DongwangTixianHeaderViewDelegate,UITableViewDelegate,UITableViewDataSource,DongwangWechatTableViewCellDelegate,DongwangAlipayTableViewCellDelegate,DongwangAlipaygodrawSuccedViewDelegate>
@property(nonatomic,strong)  UITableView * DongwangMyTableView;
@property(nonatomic,strong) DongwangTixianHeaderView * HeaderViews;
@property(nonatomic,strong) DongwangTixianFooterView_V3 * FooterViews;
@property(nonatomic,assign) NSInteger  type;  //0支付宝 1微信
@property(nonatomic,assign) NSInteger  SoureNum;
@property(nonatomic,strong) DongwangAlipaygodrawSuccedView * DongwangSuccedView;
@property(nonatomic,strong) NSDictionary * messageDic;

@end

@implementation DongwangTixianViewController_V3
-(DongwangAlipaygodrawSuccedView *)DongwangSuccedView{
    if (!_DongwangSuccedView) {
        _DongwangSuccedView = [[DongwangAlipaygodrawSuccedView alloc]initWithFrame:[UIScreen  mainScreen].bounds message:self.messageDic];
        _DongwangSuccedView.deleate = self;
    }
    return _DongwangSuccedView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"提现";
    self.type = 0;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#804AB7"];
    [self.view addSubview:self.DongwangMyTableView];
    _DongwangMyTableView.tableHeaderView = self.HeaderViews;
    self.isShowBtomImgView = NO;
    
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf DongwangConfiferData];

    });
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DongwangAdressRealod) name:@"DongwangAdressRealod" object:nil];

}
-(void)DongwangAdressRealod{
    [self DongwangConfiferData];
}
-(void)DongwangConfiferData{
    //"alipayStatus": "0",//支付宝绑定状态，0未绑定，1已绑定
    //"wxStatus": "0",//微信绑定状态，0未绑定，1已绑定
    NSInteger alipayStatus = [[UserManager userInfo].alipayStatus integerValue];
    NSInteger wxStatus =
    [[UserManager userInfo].wxStatus integerValue];
    if (self.type == 0) {
        //支付宝
        if (alipayStatus == 0) {
            _DongwangMyTableView.tableFooterView = nil;
            LYEmptyView * emtyView = [LYEmptyView emptyActionViewWithImage:[UIImage imageNamed:@"alipay_emty"] titleStr:@"您尚未绑定支付宝" detailStr:@"绑定支付宝以后才能提现到账哦〜" btnTitleStr:@"去绑定" target:self action:@selector(AlipayBandingAction)];
            emtyView.contentViewOffset = RealWidth(100);
            emtyView.titleLabTextColor = [UIColor whiteColor];
            emtyView.titleLabFont = PFS17Font;
            emtyView.detailLabTextColor = [UIColor whiteColor];
            emtyView.detailLabFont =  PFR14Font;
            emtyView.detailLabMargin = RealWidth(15);
            emtyView.actionBtnTitleColor = [UIColor whiteColor];
            emtyView.actionBtnBackGroundGradientColors = @[[UIColor colorWithHexString:@"#8B0DF7"],[UIColor colorWithHexString:@"#B708EF"]];
            emtyView.actionBtnWidth = RealWidth(318);
            emtyView.actionBtnHeight = RealWidth(45);
            emtyView.actionBtnCornerRadius = RealWidth(22);
            emtyView.actionBtnFont = PFS15Font;
            emtyView.actionBtnMargin = RealWidth(100);
            self.DongwangMyTableView.ly_emptyView = emtyView;
        }else{
        _DongwangMyTableView.tableFooterView = self.FooterViews;
        }
        
    }else{
        NSString * phoneStr = [NSString stringWithFormat:@"%@",[UserManager userInfo].phone];
        NSLog(@"---%@",phoneStr);
        if ([NSString isBlankString:phoneStr]) {
            //去绑定手机号
            _DongwangMyTableView.tableFooterView = nil;
            LYEmptyView * emtyView = [LYEmptyView emptyActionViewWithImage:[UIImage imageNamed:@""] titleStr:@"该提现方式需绑定手机号" detailStr:@"才能提现成功哦～" btnTitleStr:@"去绑定" target:self action:@selector(phoneChatBandingAction)];
            emtyView.contentViewOffset = RealWidth(100);
            emtyView.titleLabTextColor = [UIColor whiteColor];
            emtyView.titleLabFont = PFS17Font;
            emtyView.detailLabTextColor = [UIColor whiteColor];
            emtyView.detailLabFont =  PFS17Font;
            emtyView.detailLabMargin = RealWidth(15);
            emtyView.actionBtnTitleColor = [UIColor whiteColor];
            emtyView.actionBtnBackGroundGradientColors = @[[UIColor colorWithHexString:@"#8B0DF7"],[UIColor colorWithHexString:@"#B708EF"]];
            emtyView.actionBtnWidth = RealWidth(318);
            emtyView.actionBtnHeight = RealWidth(45);
            emtyView.actionBtnCornerRadius = RealWidth(22);
            emtyView.actionBtnFont = PFS15Font;
            emtyView.actionBtnMargin = RealWidth(100);
            self.DongwangMyTableView.ly_emptyView = emtyView;
        }else{
            //微信15785481848
            if (wxStatus == 0) {
                _DongwangMyTableView.tableFooterView = nil;
                LYEmptyView * emtyView = [LYEmptyView emptyActionViewWithImage:[UIImage imageNamed:@"weixin_emty"] titleStr:@"您尚未绑定微信" detailStr:@"绑定微信以后才能提现到账哦〜" btnTitleStr:@"去绑定" target:self action:@selector(weChatBandingAction)];
                emtyView.contentViewOffset = RealWidth(100);
                emtyView.titleLabTextColor = [UIColor whiteColor];
                emtyView.titleLabFont = PFS17Font;
                emtyView.detailLabTextColor = [UIColor whiteColor];
                emtyView.detailLabFont =  PFR14Font;
                emtyView.detailLabMargin = RealWidth(15);
                emtyView.actionBtnTitleColor = [UIColor whiteColor];
                emtyView.actionBtnBackGroundGradientColors = @[[UIColor colorWithHexString:@"#8B0DF7"],[UIColor colorWithHexString:@"#B708EF"]];
                emtyView.actionBtnWidth = RealWidth(318);
                emtyView.actionBtnHeight = RealWidth(45);
                emtyView.actionBtnCornerRadius = RealWidth(22);
                emtyView.actionBtnFont = PFS15Font;
                emtyView.actionBtnMargin = RealWidth(100);
                self.DongwangMyTableView.ly_emptyView = emtyView;
            }else{
            _DongwangMyTableView.tableFooterView = self.FooterViews;
            }

        }

    }
    
    [self.DongwangMyTableView reloadData];

}
#pragma mark--绑定支付宝
-(void)AlipayBandingAction{
    DongwangBindingZhifubaoViewController * bangdBVc = [[DongwangBindingZhifubaoViewController alloc]init];
    MJWeakSelf;
    bangdBVc.bindblock = ^{
    [weakSelf DongwangConfiferData];
    };
    [self.navigationController pushViewController:bangdBVc animated:YES];
}
#pragma mark--绑定微信
-(void)weChatBandingAction{
    [DongwangLogoinViewModel DongwangWechatAutor];

}
#pragma mark--绑定手机号
-(void)phoneChatBandingAction{
    DongwagNewBangdingViewController_V3 * DongwnagVc = [[DongwagNewBangdingViewController_V3 alloc]init];
    DongwnagVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:DongwnagVc animated:YES];
    
}
-(DongwangTixianHeaderView *)HeaderViews{
    if (!_HeaderViews) {
    _HeaderViews = [[DongwangTixianHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RealWidth(244))];
    _HeaderViews.delegate = self;
    }
    return _HeaderViews;
}
-(DongwangTixianFooterView_V3 *)FooterViews{
    if (!_FooterViews) {
_FooterViews = [[DongwangTixianFooterView_V3 alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RealWidth(120+10+10))];
    }
    return _FooterViews;
}
-(UITableView *)DongwangMyTableView{
    if (!_DongwangMyTableView) {
        _DongwangMyTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _DongwangMyTableView.delegate = self;
        _DongwangMyTableView.dataSource = self;
        _DongwangMyTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _DongwangMyTableView.showsVerticalScrollIndicator = NO;
        _DongwangMyTableView.showsHorizontalScrollIndicator = NO;
        _DongwangMyTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _DongwangMyTableView.backgroundColor = [UIColor clearColor];
    }
    return _DongwangMyTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger alipayStatus = [[UserManager userInfo].alipayStatus integerValue];
    NSInteger wxStatus =  [[UserManager userInfo].wxStatus integerValue];
    //"alipayStatus": "0",//支付宝绑定状态，0未绑定，1已绑定
    //"wxStatus": "0",//微信绑定状态，0未绑定，1已绑定
    if (self.type == 0) {
        return alipayStatus == 0 ? 0 : 1;
    }else{
        NSString * phoneStr = [NSString stringWithFormat:@"%@",[UserManager userInfo].phone];
        if ([NSString isBlankString:phoneStr]) {
            return 0 ;
        }else{
            return wxStatus == 0 ? 0 : 1;

        }
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.type == 0) {
        static NSString * AlipayIdentifer  = @"DongwangAlipayTableViewCell";
        DongwangAlipayTableViewCell * AlipayCell  =[tableView dequeueReusableCellWithIdentifier:AlipayIdentifer];
        if (AlipayCell == nil) {
            AlipayCell = [[DongwangAlipayTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AlipayIdentifer];
        }
        AlipayCell.delegate = self;
        AlipayCell.info = [UserManager userInfo];
        return AlipayCell;
    }else{
        static NSString * wechatIdentifer  = @"DongwangWechatTableViewCell";
        DongwangWechatTableViewCell * wechatCell = [tableView dequeueReusableCellWithIdentifier:wechatIdentifer];
        if (wechatCell == nil) {
            wechatCell = [[DongwangWechatTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:wechatIdentifer];
        }
        wechatCell.delegate = self;
        wechatCell.info = [UserManager userInfo];
        return wechatCell;
        
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return RealWidth(197+10);
}
#pragma mark--微信提现
-(void)DongwangWechatTableViewCellBtnTXAction{
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithgoWithdraw:@{@"payAccount":[NSString stringWithFormat:@"%@",[UserManager userInfo].wxOpenId],@"type":[NSString stringWithFormat:@"%ld",(long)self.type],@"realName":[UserManager userInfo].realName,@"currentBalance":[NSString stringWithFormat:@"%.2f",[[UserManager userInfo].currentBalance floatValue]]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        [weakSelf.DongwangMyTableView reloadData];
        NSDictionary * messageDic  =[object objectForKey:@"data"];
        weakSelf.messageDic = messageDic;
        [weakSelf.DongwangSuccedView show];
    } Deleaccountfairler:^(id  _Nonnull message) {
        
    }];

}
#pragma mark--支付宝提现
-(void)DongwangAlipayTableViewCellTXAction{
    
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithgoWithdraw:@{@"payAccount":[NSString stringWithFormat:@"%@",[UserManager userInfo].userPayAccount],@"type":[NSString stringWithFormat:@"%ld",(long)self.type],@"realName":[UserManager userInfo].realName,@"currentBalance":[NSString stringWithFormat:@"%.2f",[[UserManager userInfo].currentBalance floatValue]]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        [weakSelf.DongwangMyTableView reloadData];
        NSDictionary * messageDic  =[object objectForKey:@"data"];
        weakSelf.messageDic = messageDic;
        [weakSelf.DongwangSuccedView show];
    } Deleaccountfairler:^(id  _Nonnull message) {
        
    }];
}
#pragma mark--微信登录回调
- (void)chWxCodeNotification:(NSNotification *)notification {
    NSLog(@"微信登录回调DongwangTixianViewController_V3:%@",notification);
    NSDictionary *notificatDictionary = notification.userInfo;
    NSString * wxCode= [notificatDictionary objectForKey:@"wxCode"];
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithbindingWechat_hwc:@{@"code":wxCode,@"userId":[NSString stringWithFormat:@"%@",[UserManager userInfo].userid]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        [weakSelf DongwangConfiferData];
    } Deleaccountfairler:^(id  _Nonnull message) {
        
    }];
}

#pragma mark--DongwangAlipaygodrawSuccedViewDelegate
-(void)DongwangAlipaygodrawSuccedViewSured{
    _HeaderViews.info = [UserManager userInfo];
}
#pragma mark--DongwangTixianHeaderViewDelegate
-(void)DongwangTixianHeaderViewWithtixianbtnIndex:(NSInteger)btnIndex{
    self.type = btnIndex;
    [self DongwangConfiferData];
}
-(void)DongwangTixianHeaderViewWithDetailbtnClick{
    DongwangMingxiViewController * dongwangmingxiVc = [[DongwangMingxiViewController alloc]init];
    [self.navigationController pushViewController:dongwangmingxiVc animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _HeaderViews.info = [UserManager userInfo];
    
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CHWXCodeNotification object:nil];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chWxCodeNotification:) name:CHWXCodeNotification object:nil];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
