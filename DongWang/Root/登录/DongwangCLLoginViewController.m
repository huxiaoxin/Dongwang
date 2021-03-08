//
//  DongwangCLLoginViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/21.
//

#import "DongwangCLLoginViewController.h"
#import <CL_ShanYanSDK/CL_ShanYanSDK.h>
#import <WXApi.h>
#import "DongwangCodeloginNextViewController.h"
#import "DongwangPrivetaWebViewController.h"
#import "YYText.h"
#import "DongwangLogoinViewModel.h"
#import <WXApi.h>
#import <MFSIdentifier-umbrella.h>
#import "DongwangBandingViewController.h"
#import <MFSIdentifier-umbrella.h>
#import <AuthenticationServices/AuthenticationServices.h>

@interface DongwangCLLoginViewController ()<UITextFieldDelegate,TencentSessionDelegate>
{
    UITextField * _DongwangPhoneTextField;
    UIButton *  _DongwangLogoinBtn;
    TencentOAuth * _tencentOAuth;
    
}
@property(nonatomic,strong) UIButton *  wechatBtn;
@property(nonatomic,strong) UIButton * codebtn;
@property (nonatomic , strong)   YYLabel *yyLabel;
@property(nonatomic,strong)  NSString * showTimeStr;  //闪验
@property(nonatomic,strong)  NSString * leaveTimeStr; //闪验
@property(nonatomic,strong)  NSString * MainLogin_showTimeStr;  //主页面
@property(nonatomic,strong)  NSString * MainLogin_leaveTimeStr; //主页面
@end

@implementation DongwangCLLoginViewController
#pragma mark--闪验登录

-(void)CLShanyanLogoinConfigers{
    MJWeakSelf;
    CLUIConfigure * clconfigrs = [[CLUIConfigure alloc]init];
    clconfigrs.clNavigationBackBtnHidden =@(NO);
    clconfigrs.clAppPrivacyWebModalPresentationStyle =  @(UIModalPresentationPageSheet);
    clconfigrs.clAppPrivacyTextFont = KSysFont(font(13));
    //    clconfigrs.clAppPrivacyWebBackBtnImage = [UIImage imageNamed:@"btn_back_black"];
    clconfigrs.clAuthTypeUseWindow = @(YES);
    clconfigrs.manualDismiss = @(YES);
    clconfigrs.clNavBackBtnAlimentRight = @(YES);
    clconfigrs.clNavBackBtnImageInsets = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(0, K(0), K(15), K(15))];
    clconfigrs.viewController = weakSelf;
    clconfigrs.clOperatorPrivacyAtLast  = @(YES);
    clconfigrs.clBackgroundImg = [UIImage imageNamed:@"登录背景"];
    clconfigrs.customAreaView = ^(UIView * _Nonnull customAreaView) {
        
        //GRectGetMaxY(self->_yyLabel.frame)+RealWidth(68)
        if (@available(iOS 13.0, *)) {//13.0的新属性
            if ([WXApi isWXAppInstalled]) {
                //QQ  微信。苹果
                UIButton * DongwangQQBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(85), RealWidth(539)+StatuBar_Height, K(45), K(45))];
                DongwangQQBtn.adjustsImageWhenHighlighted = NO;
                [DongwangQQBtn setBackgroundImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
                [DongwangQQBtn addTarget:self action:@selector(DongwangQQBtnClick) forControlEvents:UIControlEventTouchUpInside];
                [customAreaView addSubview:DongwangQQBtn];
                
                
                UIButton * WechatBtn =[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangQQBtn.frame)+K(35), RealWidth(539)+StatuBar_Height, K(45), K(45))];
                [WechatBtn setBackgroundImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
                WechatBtn.adjustsImageWhenHighlighted = NO;
                [WechatBtn addTarget:self action:@selector(WechatBtnClick) forControlEvents:UIControlEventTouchUpInside];
                [customAreaView addSubview:WechatBtn];
                
                
                ASAuthorizationAppleIDButton *appleIDButton = [ASAuthorizationAppleIDButton buttonWithType:ASAuthorizationAppleIDButtonTypeSignIn style:ASAuthorizationAppleIDButtonStyleBlack];
                appleIDButton.frame = CGRectMake(CGRectGetMaxX(WechatBtn.frame)+K(35), RealWidth(539)+StatuBar_Height, K(45), K(45));
                [appleIDButton addTarget:self action:@selector(userAppIDLogin:) forControlEvents:UIControlEventTouchUpInside];
                appleIDButton.cornerRadius = K(22.5);
                [customAreaView addSubview:appleIDButton];
            }else{
                
                //QQ  苹果
                UIButton * DongwangQQBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(125), RealWidth(539)+StatuBar_Height, K(45), K(45))];
                DongwangQQBtn.adjustsImageWhenHighlighted = NO;
                [DongwangQQBtn setBackgroundImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
                [DongwangQQBtn addTarget:self action:@selector(DongwangQQBtnClick) forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:DongwangQQBtn];
                
                ASAuthorizationAppleIDButton *appleIDButton = [ASAuthorizationAppleIDButton buttonWithType:ASAuthorizationAppleIDButtonTypeSignIn style:ASAuthorizationAppleIDButtonStyleBlack];
                appleIDButton.frame = CGRectMake(CGRectGetMaxX(DongwangQQBtn.frame)+K(35), RealWidth(539)+StatuBar_Height, K(45), K(45));
                [appleIDButton addTarget:self action:@selector(userAppIDLogin:) forControlEvents:UIControlEventTouchUpInside];
                appleIDButton.cornerRadius = K(22.5);
                [customAreaView addSubview:appleIDButton];
            }
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(monitorSignInWithAppleStateChanged:) name:ASAuthorizationAppleIDProviderCredentialRevokedNotification object:nil];
        }else{
            //没有苹果
            if ([WXApi isWXAppInstalled]) {
                UIButton * WechatBtn =[[UIButton alloc]initWithFrame:CGRectMake(K(125), RealWidth(539)+StatuBar_Height, K(45), K(45))];
                [WechatBtn setBackgroundImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
                WechatBtn.adjustsImageWhenHighlighted = NO;
                [WechatBtn addTarget:self action:@selector(WechatBtnClick) forControlEvents:UIControlEventTouchUpInside];
                [customAreaView addSubview:WechatBtn];
                
                
                UIButton * DongwangQQBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(WechatBtn.frame)+K(35), RealWidth(539)+StatuBar_Height, K(45), K(45))];
                DongwangQQBtn.adjustsImageWhenHighlighted = NO;
                [DongwangQQBtn setBackgroundImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
                [DongwangQQBtn addTarget:self action:@selector(DongwangQQBtnClick) forControlEvents:UIControlEventTouchUpInside];
                [customAreaView addSubview:DongwangQQBtn];
                
            }else{
                
                UIButton * DongwangQQBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-K(22.5), RealWidth(539)+StatuBar_Height, K(45), K(45))];
                DongwangQQBtn.adjustsImageWhenHighlighted = NO;
                [DongwangQQBtn setBackgroundImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
                [DongwangQQBtn addTarget:self action:@selector(DongwangQQBtnClick) forControlEvents:UIControlEventTouchUpInside];
                [customAreaView addSubview:DongwangQQBtn];
                
            }
            
        }
        
        
        UILabel * DongwangTpslb = [[UILabel alloc]initWithFrame:CGRectMake(0, RealWidth(224+10), SCREEN_WIDTH, RealWidth(23))];
        DongwangTpslb.textAlignment = NSTextAlignmentCenter;
        DongwangTpslb.font = PFR17Font;
        DongwangTpslb.text = @"答题争最强 开心做懂王";
        DongwangTpslb.textColor = [UIColor colorWithHexString:@"#210600"];
        [customAreaView addSubview:DongwangTpslb];
        
        
        
        
        
        //RealWidth(424)+StatuBar_Height
        UIButton * codebtn  = [[UIButton alloc]initWithFrame:CGRectMake(0, RealWidth(408)+StatuBar_Height, SCREEN_WIDTH, kWidth(20))];
        [codebtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        codebtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        codebtn.titleLabel.font = KSysFont(13);
        [codebtn addTarget:self action:@selector(codebtnClick) forControlEvents:UIControlEventTouchUpInside];
        [codebtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [codebtn setEnlargeEdgeWithTop:15 right:15 bottom:15 left:15];
        [codebtn  setTitle:@"手机验证码登录>" forState:UIControlStateNormal];
        [customAreaView addSubview:codebtn];
        weakSelf.codebtn = codebtn;
    };
    
    
    clconfigrs.clNavigationBackBtnHidden = @(YES);
    //基础文字颜色、条款文字颜色
    clconfigrs.clAppPrivacyColor =@[[UIColor colorWithHexString:@"#999999"],[UIColor colorWithHexString:@"#047FFE"]];
    clconfigrs.clAppPrivacyFirst = @[@"《用户协议》",[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",Protocl_Url,@"dongwang_h5/document/index.html?type=user"]]];
    clconfigrs.clAppPrivacySecond = @[@"《隐私政策》",[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",Protocl_Url,@"dongwang_h5/document/index.html?type=policy"]]];
    clconfigrs.clAppPrivacyTextAlignment = [NSNumber numberWithInt:1];
    clconfigrs.clAppPrivacyPunctuationMarks = @(YES);
    clconfigrs.clAppPrivacyLineSpacing = [NSNumber numberWithInt:2];
    clconfigrs.clAppPrivacyNormalDesTextFirst = @"使用手机号码一键登录即代表您同意";
    clconfigrs.clAppPrivacyNormalDesTextLast = @"";
    //手机号
    clconfigrs.clPhoneNumberColor =  LGDBLackColor;
    clconfigrs.clPhoneNumberFont = KBlFont(20);
    clconfigrs.clPhoneNumberTextAlignment = [NSNumber numberWithInt:1];
    //slogon
    clconfigrs.clSlogaTextAlignment = [NSNumber numberWithInt:1];
    clconfigrs.clSloganTextFont =  KSysFont(13);
    clconfigrs.clSloganTextColor =  [UIColor clearColor];
    clconfigrs.clLoginBtnText = @"本机一键登录";
    clconfigrs.clLoginBtnTextColor = [UIColor whiteColor];
    //按钮背景图
    clconfigrs.clLoginBtnNormalBgImage = [UIImage imageNamed:@"登录按钮背景"];
    //高亮背景图
    clconfigrs.clLoginBtnHightLightBgImage = [UIImage imageNamed:@"登录按钮背景"];
    clconfigrs.clLoginBtnTextFont =  KBlFont(15);
    CLOrientationLayOut * clLayout = [[CLOrientationLayOut alloc]init];
    // 手机号码约束
    clLayout.clLayoutPhoneTop= @(RealWidth(293)+StatuBar_Height);
    clLayout.clLayoutPhoneLeft = @(0);
    clLayout.clLayoutPhoneWidth = @(SCREEN_WIDTH);
    clLayout.clLayoutPhoneHeight = @(RealWidth(30));
    // 按钮约束
    clLayout.clLayoutLoginBtnTop = @(RealWidth(342)+StatuBar_Height);
    clLayout.clLayoutLoginBtnLeft = @(RealWidth(29));
    clLayout.clLayoutLoginBtnWidth = @(SCREEN_WIDTH - kWidth(58));
    clLayout.clLayoutLoginBtnHeight = @(RealWidth(45));
 
    clLayout.clLayoutAppPrivacyTop = @(RealWidth(600)+kStatusBarHeight);
    clLayout.clLayoutAppPrivacyLeft = @(RealWidth(15));
    clLayout.clLayoutAppPrivacyWidth = @(SCREEN_WIDTH-K(30));
    clLayout.clLayoutAppPrivacyHeight = @(RealWidth(37));
    clconfigrs.clOrientationLayOutPortrait = clLayout;
//    [CHShowMessageHud showHUDPlainText:@"" view:self.view];
    [CLShanYanSDKManager quickAuthLoginWithConfigure:clconfigrs openLoginAuthListener:^(CLCompleteResult * _Nonnull completeResult) {
//        NSLog(@"页面出现:%@",weakSelf.showTimeStr);
        weakSelf.showTimeStr =  [NSString currentTimeStr];
        // UI操作建议手动切至主线程
        if (completeResult.error == nil) {
            [CHShowMessageHud dismissHideHUD:self.view];
        }else{
            NSString *tempMessage = [NSString stringWithFormat:@"%@", completeResult.message];
//            NSLog(@"错误信息:%@",tempMessage);
            if (tempMessage.length > 0) {
//              [CHShowMessageHud showMessageText:tempMessage];
            }
        }
    } oneKeyLoginListener:^(    CLCompleteResult * _Nonnull completeResult) {
        
        weakSelf.leaveTimeStr = [NSString currentTimeStr];
//        NSLog(@"页面消失:%@",weakSelf.leaveTimeStr);
        [[DataBuried ShareManager] CLLogoninWithParmesWithShowTimeStr:weakSelf.showTimeStr LeaveTimeStr:weakSelf.leaveTimeStr ViewPageName:0];
        if (completeResult.error) {
            //一键登录失败
            //            NSLog(@"oneKeyLoginListener:%@",completeResult.error.description);
            //提示：错误无需提示给用户，可以在用户无感知的状态下直接切换登录方式
            if (completeResult.code == 1011 ) {
                
                //用户取消登录（点返回）
                //处理建议：如无特殊需求可不做处理，仅作为交互状态回调，此时已经回到当前用户自己的页面
                //点击sdk自带的返回，无论是否设置手动销毁，授权页面都会强制关闭
                
            }else{
                //处理建议：其他错误代码表示闪验通道无法继续，可以统一走开发者自己的其他登录方式，也可以对不同的错误单独处理
                //1003    一键登录获取token失败
                //1008    未开启移动网络
                //1009    未检测到sim卡
                //其他     其他错误//
                //关闭授权页，如果授权页还未拉起，此调用不会关闭当前用户vc，即不执行任何代码
                [CLShanYanSDKManager finishAuthControllerCompletion:^{
                    //回到验证码登录
                }];
            }
        }else{
            
            
            
            //闪验SDK一键登录成功后拿到token调用后台接口（置换手机号）进行登录，登录成功后，加载动态tabbar
            NSLog(@"一键登录成功:%@",completeResult.data);
            NSString *deviceID = [MFSIdentifier deviceID];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSDictionary * dataDic = completeResult.data;
                NSString * token = [dataDic objectForKey:@"token"];
                [DongwangLogoinViewModel CLShanyanLogoinWithParmters:@{@"type":@"3",@"flashToken":token,@"phone":@"",@"device":@"1",@"deviceId":deviceID}.mutableCopy RequestCuurentControlers:self logoinSuuced:^(id  _Nonnull object) {
//                    [CHShowMessageHud showMessageText:@"登录成功"];
                    [UserManager userLoginSucced];
                    [weakSelf BaseTabarRequest];
                } logoinfairler:^{
                    [CLShanYanSDKManager hideLoading];
                }];
            });
        }
    }];
    
}
//原生返回按钮 拉取闪验SDK页面用的
-(void)backBtnClick{
    [self CLShanyanLogoinConfigers];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chWxCodeNotification:) name:CHWXCodeNotification object:nil];

    self.view.backgroundColor = [UIColor colorWithHexString:@"#F7EEFF"];
    //    self.navigationController.presentationController
    self.gk_navTitle = @"登录";
    UIView * backView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, K(30), K(30))];
    UIButton * backBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(13), K(3.5), K(23), K(23))];
    [backBtn setImage:[UIImage imageNamed:@"btn_back_white"] forState:UIControlStateNormal];
//    [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_back_white"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:backBtn];
    
    self.gk_navLeftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backView];
    [self CLShanyanLogoinConfigers];
    UIImageView * DongwangBJImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, NaviH+kHeight(36.5), SCREEN_Width, kHeight(532.31))];
    DongwangBJImgView.image = [UIImage imageNamed:@"懂王logo背景"];
    [self.view addSubview:DongwangBJImgView];
    
    UIImageView * DongwangLogoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_Width/2-K(42.5), K(59)+NaviH, K(85), K(85))];
    DongwangLogoImgView.image = [UIImage imageNamed:@"applogo"];
    [self.view addSubview:DongwangLogoImgView];
    
    UILabel * DongwangLogoTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangLogoImgView.frame)+K(19.5), SCREEN_Width, K(15))];
    DongwangLogoTitle.textAlignment =  NSTextAlignmentCenter;
    DongwangLogoTitle.text = @"答题争最强 开心做懂王";
    DongwangLogoTitle.font = KSysFont(16.5);
    DongwangLogoTitle.textColor = LGDBLackColor;
    [self.view addSubview:DongwangLogoTitle];
    
    UIView *  DongwangInputView = [[UIView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(DongwangLogoTitle.frame)+K(91.5), SCREEN_Width-K(30), K(45))];
    DongwangInputView.backgroundColor = [UIColor clearColor];
    DongwangInputView.layer.borderWidth = K(0.5);
    DongwangInputView.layer.cornerRadius = K(22.5);
    DongwangInputView.layer.masksToBounds = YES;
    DongwangInputView.layer.borderColor = [UIColor colorWithHexString:@"#979797"].CGColor;
    [self.view addSubview:DongwangInputView];
    
    UIImageView * DongwangPhoneImgView =  [[UIImageView alloc]initWithFrame:CGRectMake(K(21), K(11.5), K(15), K(22))];
    DongwangPhoneImgView.image = [UIImage imageNamed:@"手机"];
    [DongwangInputView addSubview:DongwangPhoneImgView];
    
    UITextField * DongwangPhoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangPhoneImgView.frame)+K(5), K(5), CGRectGetWidth(DongwangInputView.frame)-CGRectGetMaxX(DongwangPhoneImgView.frame)-K(5), K(35))];
    DongwangPhoneTextField.delegate = self;
    DongwangPhoneTextField.keyboardType   =  UIKeyboardTypePhonePad;
    DongwangPhoneTextField.clearButtonMode =  UITextFieldViewModeAlways;
    DongwangPhoneTextField.textColor = LGDBLackColor;
    DongwangPhoneTextField.font = KSysFont(16);
    DongwangPhoneTextField.attributedPlaceholder =  [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#999999"]}];
    [DongwangPhoneTextField addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    [DongwangInputView addSubview:DongwangPhoneTextField];
    _DongwangPhoneTextField = DongwangPhoneTextField;
    
    
    UIButton *  DongwangLogoinBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(DongwangInputView.frame)+K(31), SCREEN_WIDTH-K(30), K(45))];
    [DongwangLogoinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    DongwangLogoinBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    DongwangLogoinBtn.titleLabel.font = KBlFont(15);
    [DongwangLogoinBtn setTitle:@"获取验证码登录" forState:UIControlStateNormal];
    DongwangLogoinBtn.layer.cornerRadius = K(22.5);
    [DongwangLogoinBtn addTarget:self action:@selector(DongwangLogoinBtnClick) forControlEvents:UIControlEventTouchUpInside];
    DongwangLogoinBtn.layer.masksToBounds = YES;
    DongwangLogoinBtn.enabled = NO;
    [DongwangLogoinBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
    [self.view addSubview:DongwangLogoinBtn];
    _DongwangLogoinBtn = DongwangLogoinBtn;
    
    UILabel * DongwangmsgLb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangLogoinBtn.frame)+K(20), SCREEN_WIDTH, K(15))];
    DongwangmsgLb.textAlignment = NSTextAlignmentCenter;
    DongwangmsgLb.font = KSysFont(13);
    DongwangmsgLb.textColor = [UIColor colorWithHexString:@"#999999"];
    DongwangmsgLb.text = @"首次登录将自动注册，";
    [self.view addSubview:DongwangmsgLb];
    
    
    _yyLabel = [[YYLabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangmsgLb.frame)+kHeight(5), SCREEN_WIDTH, kHeight(15))];
    _yyLabel.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    _yyLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_yyLabel];
    [self protocolIsSelect:NO];
    
    if (@available(iOS 13.0, *)) {//13.0的新属性
        if ([WXApi isWXAppInstalled]) {
            //QQ  微信。苹果
            UIButton * DongwangQQBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(85), RealWidth(539)+StatuBar_Height, K(45), K(45))];
            DongwangQQBtn.adjustsImageWhenHighlighted = NO;
            [DongwangQQBtn setBackgroundImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
            [DongwangQQBtn addTarget:self action:@selector(DongwangQQBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:DongwangQQBtn];
            
            
            UIButton * WechatBtn =[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangQQBtn.frame)+K(35), RealWidth(539)+StatuBar_Height, K(45), K(45))];
            [WechatBtn setBackgroundImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
            WechatBtn.adjustsImageWhenHighlighted = NO;
            [WechatBtn addTarget:self action:@selector(WechatBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:WechatBtn];
            
            
            ASAuthorizationAppleIDButton *appleIDButton = [ASAuthorizationAppleIDButton buttonWithType:ASAuthorizationAppleIDButtonTypeSignIn style:ASAuthorizationAppleIDButtonStyleBlack];
            appleIDButton.frame = CGRectMake(CGRectGetMaxX(WechatBtn.frame)+K(35), RealWidth(539)+StatuBar_Height, K(45), K(45));
            [appleIDButton addTarget:self action:@selector(userAppIDLogin:) forControlEvents:UIControlEventTouchUpInside];
            appleIDButton.cornerRadius = K(22.5);
            [self.view addSubview:appleIDButton];
        }else{
            
            //QQ  苹果
            UIButton * DongwangQQBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(125), CGRectGetMaxY(_yyLabel.frame)+K(68), K(45), K(45))];
            DongwangQQBtn.adjustsImageWhenHighlighted = NO;
            [DongwangQQBtn setBackgroundImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
            [DongwangQQBtn addTarget:self action:@selector(DongwangQQBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:DongwangQQBtn];
            
            ASAuthorizationAppleIDButton *appleIDButton = [ASAuthorizationAppleIDButton buttonWithType:ASAuthorizationAppleIDButtonTypeSignIn style:ASAuthorizationAppleIDButtonStyleBlack];
            appleIDButton.frame = CGRectMake(CGRectGetMaxX(DongwangQQBtn.frame)+K(35), CGRectGetMaxY(_yyLabel.frame)+K(68), K(45), K(45));
            [appleIDButton addTarget:self action:@selector(userAppIDLogin:) forControlEvents:UIControlEventTouchUpInside];
            appleIDButton.cornerRadius = K(22.5);
            [self.view addSubview:appleIDButton];
        }
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(monitorSignInWithAppleStateChanged:) name:ASAuthorizationAppleIDProviderCredentialRevokedNotification object:nil];
    }else{
        //没有苹果
        if ([WXApi isWXAppInstalled]) {
            UIButton * WechatBtn =[[UIButton alloc]initWithFrame:CGRectMake(K(125), CGRectGetMaxY(_yyLabel.frame)+K(68), K(45), K(45))];
            [WechatBtn setBackgroundImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
            WechatBtn.adjustsImageWhenHighlighted = NO;
            [WechatBtn addTarget:self action:@selector(WechatBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:WechatBtn];
            
            
            UIButton * DongwangQQBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(WechatBtn.frame)+K(35), CGRectGetMaxY(_yyLabel.frame)+K(68), K(45), K(45))];
            DongwangQQBtn.adjustsImageWhenHighlighted = NO;
            [DongwangQQBtn setBackgroundImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
            [DongwangQQBtn addTarget:self action:@selector(DongwangQQBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:DongwangQQBtn];
            
        }else{
            
            UIButton * DongwangQQBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-K(22.5), CGRectGetMaxY(_yyLabel.frame)+K(68), K(45), K(45))];
            DongwangQQBtn.adjustsImageWhenHighlighted = NO;
            [DongwangQQBtn setBackgroundImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
            [DongwangQQBtn addTarget:self action:@selector(DongwangQQBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:DongwangQQBtn];
            
        }
        
    }
    
    
}
#pragma mark - 处理授权
- (void)userAppIDLogin:(ASAuthorizationAppleIDButton *)button  API_AVAILABLE(ios(13.0)){
    if (@available(iOS 13.0, *)) {
        // 基于用户的Apple ID授权用户，生成用户授权请求的一种机制
        ASAuthorizationAppleIDProvider *appleIdProvider = [[ASAuthorizationAppleIDProvider alloc] init];
        // 创建新的AppleID 授权请求
        ASAuthorizationAppleIDRequest *request = appleIdProvider.createRequest;
        // 在用户授权期间请求的联系信息
        request.requestedScopes = @[ASAuthorizationScopeEmail,ASAuthorizationScopeFullName];
        //需要考虑用户已经登录过，可以直接使用keychain密码来进行登录-这个很智能 (但是这个有问题)
        //        ASAuthorizationPasswordProvider *appleIDPasswordProvider = [[ASAuthorizationPasswordProvider alloc] init];
        //        ASAuthorizationPasswordRequest *passwordRequest = appleIDPasswordProvider.createRequest;
        // 由ASAuthorizationAppleIDProvider创建的授权请求 管理授权请求的控制器
        ASAuthorizationController *controller = [[ASAuthorizationController alloc] initWithAuthorizationRequests:@[request]];
        // 设置授权控制器通知授权请求的成功与失败的代理
        controller.delegate = self;
        // 设置提供 展示上下文的代理，在这个上下文中 系统可以展示授权界面给用户
        controller.presentationContextProvider = self;
        // 在控制器初始化期间启动授权流
        [controller performRequests];
    } else {
        NSLog(@"system is lower");
    }
}
#pragma mark - 授权成功的回调
- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithAuthorization:(ASAuthorization *)authorization  API_AVAILABLE(ios(13.0)) {
    //新用户登录情况下是 ASAuthorizationAppleIDCredential
    //旧用户登录情况下是 ASPasswordCredential
    if ([authorization.credential isKindOfClass:[ASAuthorizationAppleIDCredential class]]) {
        // 用户登录使用ASAuthorizationAppleIDCredential
        ASAuthorizationAppleIDCredential *credential = authorization.credential;
        NSString *fullName = credential.fullName.familyName;
        NSString * givenName = credential.fullName.givenName;
        NSString * email = [NSString isBlankString:credential.email] ? @"defalut" :credential.email;
        NSString *userID = credential.user; //用户唯一标识
        NSString * TotoalName = [NSString stringWithFormat:@"%@%@",[NSString isBlankString:fullName] ? @"defalut":fullName,[NSString isBlankString:givenName] ? @"" : givenName];
        NSString *deviceID = [MFSIdentifier deviceID];
        [[NSUserDefaults standardUserDefaults] setObject:email forKey:@"Appleemail"];
        [[NSUserDefaults standardUserDefaults] setObject:TotoalName forKey:@"Appleusername"];
        [[NSUserDefaults standardUserDefaults] setObject:userID forKey:@"userIdentifier"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        NSMutableDictionary * DongwangAppleParmters = [[NSMutableDictionary alloc]initWithDictionary:@{@"name":[NSString isBlankString:TotoalName] ? @"defalut":TotoalName,@"email":[NSString isBlankString:email] ? @"defalut":email,@"appleId":userID,@"deviceId":deviceID,@"type":@"4"}];
        MJWeakSelf;
        [DongwangLogoinViewModel CLShanyanLogoinWithParmters:DongwangAppleParmters RequestCuurentControlers:self logoinSuuced:^(id  _Nonnull object) {
            NSLog(@"苹果登录回调：%@",object);
            NSDictionary * responeDic= (NSDictionary *)object;
            NSString * wxSmsTip =  [NSString stringWithFormat:@"%@",[[responeDic objectForKey:@"data"] objectForKey:@"wxSmsTip"]];
            if ([wxSmsTip isEqualToString:@"1"]) {
                [CLShanYanSDKManager finishAuthControllerAnimated:NO Completion:^{
                    DongwangBandingViewController * dongwangBangVc =[[DongwangBandingViewController alloc]init];
                    dongwangBangVc.hidesBottomBarWhenPushed = YES;
                    dongwangBangVc.wxSmsTip = wxSmsTip;
                    dongwangBangVc.openid = userID;
                    dongwangBangVc.isappleLogoin = YES;
                    [self.navigationController pushViewController:dongwangBangVc animated:YES];
                }];
            }else{
                
                [CLShanYanSDKManager finishAuthControllerAnimated:NO Completion:^{
                    [UserManager userLoginSucced];
                    [weakSelf BaseTabarRequest];

                }];
            }
        } logoinfairler:^{
            
        }];
        
        //先拿到appID去服务器请求是否存在 存在，直接调登录接口
        //不存在 直接去绑定且登录（ email  appid  name,phone，smscode）
        //fullName=王givenName=昌健email=public@25876.comuserID=001551.a5f8c4f4cd6242af91372b67bd874eda.0828
        //        NSData *identityToken = credential.identityToken;
        //        NSData *authorizationCode = credential.authorizationCode;
        //        NSString *identityTokenStr = [[NSString alloc]initWithData:identityToken encoding:NSUTF8StringEncoding];
        //        NSString * authorizationCodeStr = [[NSString alloc]initWithData:authorizationCode encoding:NSUTF8StringEncoding];
        //保存apple返回的唯一标识符
        
    } else if ([authorization.credential isKindOfClass:[ASPasswordCredential class]]) {
        // 用户登录使用现有的密码凭证
        ASPasswordCredential *psdCredential = authorization.credential;
        // 密码凭证对象的用户标识 用户的唯一标识
        NSString *user = psdCredential.user;
        NSString *psd = psdCredential.password;
        NSLog(@"psduser -  %@   %@",psd,user);
    } else {
        NSLog(@"授权信息不符");
    }
}
#pragma mark - 授权回调失败 检查用户的APPID的登录状态
- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithError:(NSError *)error  API_AVAILABLE(ios(13.0)){
    NSLog(@"错误信息：%@", error);
    NSString *errorMsg;
    switch (error.code) {
        case ASAuthorizationErrorCanceled:
            errorMsg = @"用户取消了授权请求";
            NSLog(@"errorMsg -   %@",errorMsg);
            break;
            
        case ASAuthorizationErrorFailed:
            errorMsg = @"授权请求失败";
            NSLog(@"errorMsg -   %@",errorMsg);
            break;
        case ASAuthorizationErrorInvalidResponse:
            errorMsg = @"授权请求响应无效";
            NSLog(@"errorMsg -   %@",errorMsg);
            break;
            
        case ASAuthorizationErrorNotHandled:
            errorMsg = @"未能处理授权请求";
            NSLog(@"errorMsg -   %@",errorMsg);
            break;
            
        case ASAuthorizationErrorUnknown:
            errorMsg = @"授权请求失败未知原因";
            NSLog(@"errorMsg -   %@",errorMsg);
            break;
            
        default:
            break;
    }
}
- (void)monitorSignInWithAppleStateChanged:(NSNotification *)notification {
//    NSLog(@"state CHANGE -  %@",notification);
}
#pragma mark--QQ
-(void)DongwangQQBtnClick{
    
    NSArray *permissions = [NSArray arrayWithObjects:kOPEN_PERMISSION_GET_INFO, kOPEN_PERMISSION_GET_USER_INFO, kOPEN_PERMISSION_GET_SIMPLE_USER_INFO, nil];
    
    _tencentOAuth = [[TencentOAuth alloc]initWithAppId:@"101919220" andUniversalLink:@"https://zch64l.xinstall.top/qq_conn/101919220" andDelegate:self];
     // 这里调起登录
    [_tencentOAuth authorize:permissions inSafari:NO];
}
#pragma mark--TencentSessionDelegate
// 获取用户信息
- (void)getUserInfoResponse:(APIResponse *)response {
     //NSLog(@"userInfo： response %@",response.jsonResponse);
    if (response && response.retCode == URLREQUEST_SUCCEED) {
        // 后续操作...
        NSLog(@"透传数据:%@",_tencentOAuth.passData);
    } else {
        NSLog(@"QQ auth fail ,getUserInfoResponse:%d", response.detailRetCode);
    }
}
- (void)tencentDidLogin {
    NSLog(@"已登录");
    [_tencentOAuth getUserInfo];
    NSString *  access_token = [NSString stringWithFormat:@"%@",_tencentOAuth.accessToken];
    long  currentloneTime  = [[self getTimestampSince1970] longLongValue];
    
    NSString * servirTime = [self QQcurrentTimeStr:[_tencentOAuth getCachedExpirationDate]];
    long  servierloneTime  = [servirTime longLongValue];
    NSString * Difference  = [NSString stringWithFormat:@"%ld",(servierloneTime-currentloneTime)];
    NSString *  openid = [NSString stringWithFormat:@"%@",_tencentOAuth.openId];
    [DongwangLogoinViewModel CLShanyanLogoinWithParmters:@{@"type":@"5",@"access_token":access_token,@"openid":openid,@"expires_in":Difference}.mutableCopy RequestCuurentControlers:self logoinSuuced:^(id  _Nonnull object) {
        NSDictionary * responeDic= (NSDictionary *)object;
        NSString * wxSmsTip =  [NSString stringWithFormat:@"%@",[[responeDic objectForKey:@"data"] objectForKey:@"wxSmsTip"]];
        //未绑定
        if ([wxSmsTip isEqualToString:@"1"]) {
            [CLShanYanSDKManager finishAuthControllerAnimated:NO Completion:^{
                NSLog(@"QQ登录未绑定");
                //那么去绑定
                DongwangBandingViewController * dongwangBangVc =[[DongwangBandingViewController alloc]init];
                dongwangBangVc.hidesBottomBarWhenPushed = YES;
                dongwangBangVc.wxSmsTip = wxSmsTip;
                dongwangBangVc.openid = openid;
                dongwangBangVc.Mytype = @"5";
                dongwangBangVc.isappleLogoin = NO;
                [self.navigationController pushViewController:dongwangBangVc animated:YES];
            }];
        }else{
        [UserManager userLoginSucced];
        [self BaseTabarRequest];
        }
    } logoinfairler:^{
        
    }];
    
    [_tencentOAuth logout:self];

    
    
}
- (NSString *)currentTimeStr:(NSDate *)mydate{
    NSTimeInterval time=[mydate timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}
- (NSString *)QQcurrentTimeStr:(NSDate *)mydate{
    NSTimeInterval time=[mydate timeIntervalSince1970];// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

- (NSString *)getTimestampSince1970
{
    NSDate *datenow = [NSDate date];//现在时间
    NSTimeInterval interval = [datenow timeIntervalSince1970];//13位的*1000
    NSString *timeSp = [NSString stringWithFormat:@"%.0f",interval];
    return timeSp;
}

- (void)tencentDidNotLogin:(BOOL)cancelled {
    if (cancelled) {
        [CHShowMessageHud showMessageText:@"取消登录"];
    }else{
        [CHShowMessageHud showMessageText:@"登录失败"];
    }
}

- (void)tencentDidNotNetWork {
    NSLog(@"未联网");
}
-(void)tencentDidLogout{
    NSLog(@"退出登录");
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CHWXCodeNotification object:nil];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)protocolIsSelect:(BOOL)isSelect{
    //设置整段字符串的颜色
    NSDictionary *attributes = @{NSFontAttributeName:KSysFont(13), NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#999999"]};
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"  登录即表示同意《用户协议》与《隐私政策》" attributes:attributes];
    //设置高亮色和点击事件
    MJWeakSelf;
    [text yy_setTextHighlightRange:[[text string] rangeOfString:@"《用户协议》"] color:[UIColor colorWithHexString:@"#047FFE"] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        DongwangPrivetaWebViewController * dongwangVc=  [[DongwangPrivetaWebViewController alloc]init];
        dongwangVc.type = VCPressent;
        dongwangVc.protoclUrlText = [NSString stringWithFormat:@"%@%@",Protocl_Url,@"dongwang_h5/document/index.html?type=user"];
        UINavigationController * dongwangNav =[UINavigationController rootVC:dongwangVc translationScale:YES];
        [weakSelf presentViewController:dongwangNav animated:YES completion:nil];
        
    }];
    //设置高亮色和点击事件
    [text yy_setTextHighlightRange:[[text string] rangeOfString:@"《隐私政策》"] color:[UIColor colorWithHexString:@"#047FFE"] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        DongwangPrivetaWebViewController * dongwangVc=  [[DongwangPrivetaWebViewController alloc]init];
        dongwangVc.type = VCPressent;
        dongwangVc.protoclUrlText = [NSString stringWithFormat:@"%@%@",Protocl_Url,@"dongwang_h5/document/index.html?type=policy"];
        UINavigationController * dongwangNav =[UINavigationController rootVC:dongwangVc translationScale:YES];
        [weakSelf presentViewController:dongwangNav animated:YES completion:nil];
        
    }];
    
    _yyLabel.attributedText = text;
    //居中显示一定要放在这里，放在viewDidLoad不起作用
    _yyLabel.textAlignment = NSTextAlignmentCenter;
    
}
#pragma mark--微信登录回调
- (void)chWxCodeNotification:(NSNotification *)notification {
    NSLog(@"DongwangCLLoginViewController");
    NSDictionary *notificatDictionary = notification.userInfo;
    NSString * wxCode= [notificatDictionary objectForKey:@"wxCode"];
    NSString *deviceID = [MFSIdentifier deviceID];
//    NSLog(@"deviceId: %@ wxCode = %@", deviceID,wxCode);
    
    [DongwangLogoinViewModel CLShanyanLogoinWithParmters:@{@"code":wxCode,@"type":@"2",@"deviceId":deviceID}.mutableCopy RequestCuurentControlers:self logoinSuuced:^(id  _Nonnull object) {
        
        NSDictionary * responeDic= (NSDictionary *)object;
        NSString * wxSmsTip =  [NSString stringWithFormat:@"%@",[[responeDic objectForKey:@"data"] objectForKey:@"wxSmsTip"]];
        NSString * openid =  [NSString stringWithFormat:@"%@",[[responeDic objectForKey:@"data"] objectForKey:@"openid"]];
        //如果为1微信未绑定
        if ([wxSmsTip isEqualToString:@"1"]) {
        [CLShanYanSDKManager finishAuthControllerAnimated:NO Completion:^{
            //那么去绑定
            DongwangBandingViewController * dongwangBangVc =[[DongwangBandingViewController alloc]init];
            dongwangBangVc.hidesBottomBarWhenPushed = YES;
            dongwangBangVc.wxSmsTip = wxSmsTip;
            dongwangBangVc.openid = openid;
            dongwangBangVc.Mytype = @"2";
            [self.navigationController pushViewController:dongwangBangVc animated:YES];
            }];
        }else{
            [CLShanYanSDKManager finishAuthControllerAnimated:NO Completion:^{
                [UserManager userLoginSucced];
                [self BaseTabarRequest];
                }];

     
        }

    } logoinfairler:^{
        NSLog(@"=============");
    }];
    
}
#pragma mmark--创蓝页面的验证码登录
-(void)codebtnClick{
[self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark--获取验证码
-(void)DongwangLogoinBtnClick{
    [self.view endEditing:YES];
    if (![_DongwangPhoneTextField.text isValidPhoneNum]) {
        [CHShowMessageHud showMessageText:@"手机号各式不正确，请重新输入"];
        return;
    }
    MJWeakSelf;
    //获取验证码
    [DongwangLogoinViewModel CodeloginRequestWithParmtersw:@{@"phone":[_DongwangPhoneTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""],@"type":@"0"}.mutableCopy RequestCuurentControlers:self logoinSuuced:^(id  _Nonnull object) {
        DongwangCodeloginNextViewController *  dongwangnextVc = [[DongwangCodeloginNextViewController alloc]init];
        dongwangnextVc.phoneText =  [self->_DongwangPhoneTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        [weakSelf.navigationController pushViewController:dongwangnextVc animated:YES];
    } logoinfairler:^{
        
    }];
    
}
#pragma mark--微信登录
-(void)WechatBtnClick{
    //微信登录
    [[DataBuried ShareManager] CLLogoninWithParmesWithShowTimeStr:[NSString currentTimeStr] LeaveTimeStr:[NSString currentTimeStr] ViewPageName:10];
    
    [self sendAuthRequest];
}
#pragma mark--闪验页面的微信登录
-(void)CLwechatBtnClick{
    //微信登录
    [[DataBuried ShareManager] CLLogoninWithParmesWithShowTimeStr:[NSString currentTimeStr] LeaveTimeStr:[NSString currentTimeStr] ViewPageName:10];
    //如果要微信登录 必须先关闭创蓝的授权页面
    MJWeakSelf;
    [CLShanYanSDKManager finishAuthControllerAnimated:NO Completion:^{
        [weakSelf sendAuthRequest];
    }];
}
#pragma mark -- 微信开发平台
- (void)sendAuthRequest {
    [DongwangLogoinViewModel DongwangWechatAutor];
}

-(void)textFieldEditingChanged:(UITextField *)InputTextField{
    if (InputTextField.text.length == 11) {
        _DongwangLogoinBtn.enabled = YES;
        [_DongwangLogoinBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];
    }else{
        [_DongwangLogoinBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        
        _DongwangLogoinBtn.enabled = NO;
        [_DongwangLogoinBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
        
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField == _DongwangPhoneTextField) {
        //这里的if时候为了获取删除操作,如果没有次if会造成当达到字数限制后删除键也不能使用的后果.
        if (range.length == 1 && string.length == 0) {
            return YES;
        }
        //so easy
        else if (_DongwangPhoneTextField.text.length >= 11) {
            _DongwangPhoneTextField.text = [textField.text substringToIndex:11];
            return NO;
        }
    }
    return YES;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.MainLogin_showTimeStr = [NSString currentTimeStr];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.MainLogin_leaveTimeStr =  [NSString currentTimeStr];
    [[DataBuried ShareManager] CLLogoninWithParmesWithShowTimeStr:self.MainLogin_showTimeStr LeaveTimeStr:self.MainLogin_leaveTimeStr ViewPageName:1];
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
