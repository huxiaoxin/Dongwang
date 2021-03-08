//
//  DongwangDeleAccountViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/10.
//

#import "DongwangDeleAccountViewController.h"
#import "DongwangDeleAccountView.h"
#import "DongwangMyViewModel.h"
#import "DongwangCLLoginViewController.h"
#import "DongwangCodeLoginViewController.h"
@interface DongwangDeleAccountViewController ()<DongwangDeleAccountViewDelegate>
{
    UIButton * _AddBtn;
}
@property(nonatomic,strong) DongwangDeleAccountView * DeleView;
@end

@implementation DongwangDeleAccountViewController

-(DongwangDeleAccountView *)DeleView{
    if (!_DeleView) {
        _DeleView = [[DongwangDeleAccountView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _DeleView.delegate = self;
    }
    return _DeleView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"账户注销";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#E5DAF0"];
    self.isShowBtomImgView = NO;
    UILabel * DongwangFirstlb = [[UILabel alloc]initWithFrame:CGRectMake(K(13.5), NaviH+K(27), SCREEN_WIDTH, K(24))];
    DongwangFirstlb.textColor = [UIColor blackColor];
    DongwangFirstlb.font = KBlFont(font(24));
    DongwangFirstlb.text = @"注销须知";
    DongwangFirstlb.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:DongwangFirstlb];
    
    
    UILabel * DongwangSecondlb = [[UILabel alloc]initWithFrame:CGRectMake(K(38.5), CGRectGetMaxY(DongwangFirstlb.frame)+K(18), K(200), K(24))];
    DongwangSecondlb.textColor = [UIColor blackColor];
    DongwangSecondlb.font = KSysFont(font(17));
    DongwangSecondlb.text = @"账户注销后";
    [self.view addSubview:DongwangSecondlb];
    
    
    
    UILabel * DongwangDetaillb = [[UILabel alloc]initWithFrame:CGRectMake(K(38.5), CGRectGetMaxY(DongwangSecondlb.frame)+K(25), SCREEN_WIDTH-K(74), K(24))];
    DongwangDetaillb.textColor = [UIColor colorWithHexString:@"#999999"];
    DongwangDetaillb.numberOfLines = 0 ;
    DongwangDetaillb.font = KSysFont(font(13));
//    DongwangDetaillb.text = @"您的账号将无法登录与使用；\n您的账号信息和会员权益将永久清除且无法恢复；\n您账户余额，积分等数据将被永久清空且无法恢复。";
    [self.view addSubview:DongwangDetaillb];
    [DongwangDetaillb setText:@"您的账号将无法登录与使用；\n您的账号信息和会员权益将永久清除且无法恢复；\n您账户余额，积分等数据将被永久清空且无法恢复。" lineSpacing:K(6)];
    
    DongwangDetaillb.height = [DongwangDetaillb getSpaceLabelHeight:@"您的账号将无法登录与使用；\n您的账号信息和会员权益将永久清除且无法恢复；\n您账户余额，积分等数据将被永久清空且无法恢复。" withFont:KSysFont(font(13)) withWidth:SCREEN_WIDTH-K(74) lineSpacing:K(6)].height;
        // Do any additional setup after loading the view.
    
    
    
    CGSize DonngwangProtoclSize= [@"我已认真阅读账户注销须知" cxl_sizeWithString:KSysFont(font(12))];
    UILabel * DongwangProtocllb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-DonngwangProtoclSize.width/2+K(12.5), K(418)+NaviH, DonngwangProtoclSize.width, K(24))];
    DongwangProtocllb.textColor = [UIColor colorWithHexString:@"#333333"];
    DongwangProtocllb.font = KSysFont(font(12));
    DongwangProtocllb.text = @"我已认真阅读账户注销须知";
    DongwangProtocllb.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:DongwangProtocllb];

    UIButton * DongwangStateBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(DongwangProtocllb.frame)-K(18), K(423)+NaviH, K(12.5), K(12.5))];
    DongwangStateBtn.selected = NO;
    [DongwangStateBtn setBackgroundImage:[UIImage imageNamed:@"注销未选中"] forState:UIControlStateNormal];
    [DongwangStateBtn setBackgroundImage:[UIImage imageNamed:@"注销选中"] forState:UIControlStateSelected];
    DongwangStateBtn.adjustsImageWhenHighlighted = NO;
    [DongwangStateBtn addTarget:self action:@selector(DongwangStateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:DongwangStateBtn];
    [self DongwangStateBtnClick:DongwangStateBtn];
    
    UIButton * AddBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(28), K(15.5)+CGRectGetMaxY(DongwangProtocllb.frame), SCREEN_WIDTH-K(56), K(45))];
    [AddBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];
    AddBtn.layer.cornerRadius = K(22.5);
    AddBtn.layer.masksToBounds = YES;
    [AddBtn addTarget:self action:@selector(AddBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [AddBtn setTitle:@"确认" forState:UIControlStateNormal];
    AddBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [AddBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    AddBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:AddBtn];
    _AddBtn = AddBtn;
    [self DongwangStateBtnClick:DongwangStateBtn];

    
    
    
    
    
}
-(void)AddBtnClick{
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithDeleAccoutn:@{}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        [weakSelf.DeleView show];
    } Deleaccountfairler:^(id  _Nonnull message) {
        
    }];
}
-(void)DongwangStateBtnClick:(UIButton *)StateBtn{
    StateBtn.selected = !StateBtn.selected;
    if (StateBtn.selected) {
        NSLog(@"选中");
        _AddBtn.enabled = YES;
        [_AddBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];
    }else{
        NSLog(@"未选择");
        _AddBtn.enabled = NO;
        [_AddBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_AddBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
    }

}
#pragma mark--DongwangDeleAccountViewDelegate
-(void)DongwangDeleAccountViewDeleScuued{
    [self.DeleView removeFromSuperview];
    NSString *shanyanLogin = [NSString stringWithFormat:@"%@", [NSUserDefaults ch_customObjectForKey:CHSYTagPhoneNumberBOOL]];
    [self DongwangLogoinConfigerType:shanyanLogin];
}
-(void)DongwangLogoinConfigerType:(NSString * )type{
    if ([type isEqualToString:@"1"]) {
    //闪验登录
     DongwangCLLoginViewController * DongwangClVc = [[DongwangCLLoginViewController alloc]init];
    UINavigationController * DongwangclNav = [UINavigationController rootVC:DongwangClVc translationScale:YES];
    [AppDelegate getAppDelegate].window.rootViewController = DongwangclNav;
    }else {
    //验证码登
    DongwangCodeLoginViewController * DongwangLoginVc = [[DongwangCodeLoginViewController alloc]init];
    UINavigationController * DongwangNav = [UINavigationController rootVC:DongwangLoginVc translationScale:YES];
    [AppDelegate getAppDelegate].window.rootViewController = DongwangNav;
    }
    
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
