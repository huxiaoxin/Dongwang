//
//  DongwangCodeLoginViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/21.
//

#import "DongwangCodeLoginViewController.h"
#import "DongwangPrivetaWebViewController.h"
#import <WXApi.h>
#import "DongwangCodeloginNextViewController.h"
#import "YYText.h"
#import "ZASTextFieldFormat.h"
#import "JITelephoneInputTextField.h"
#import "DongwangLogoinViewModel.h"
#import <MFSIdentifier-umbrella.h>
#import "DongwangBandingViewController.h"
#import <AuthenticationServices/AuthenticationServices.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
@interface DongwangCodeLoginViewController ()<UITextFieldDelegate,ASAuthorizationControllerDelegate,ASAuthorizationControllerPresentationContextProviding,TencentSessionDelegate,QQApiInterfaceDelegate>
{
    UITextField * _DongwangPhoneTextField;
    UIButton *  _DongwangLogoinBtn;
    TencentOAuth * _tencentOAuth;
}

@property (nonatomic , strong)   YYLabel *yyLabel;
@property (nonatomic , strong) UITextField * DongwangPhoneTextField;
@property(nonatomic,strong)  NSString * MainLogin_showTimeStr;  //主页面
@property(nonatomic,strong)  NSString * MainLogin_leaveTimeStr; //主页面
@end

@implementation DongwangCodeLoginViewController
-(void)backBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"登录";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F7EEFF"];
    UIImageView * DongwangBJImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, NaviH+K(21), SCREEN_Width, K(532.5))];
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
    // Do any additional setup after loading the view.
    
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
    
    UITextField * DongwangPhoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangPhoneImgView.frame)+K(7), K(5), CGRectGetWidth(DongwangInputView.frame)-CGRectGetMaxX(DongwangPhoneImgView.frame)-K(7), K(35))];
    DongwangPhoneTextField.keyboardType =  UIKeyboardTypePhonePad;
    DongwangPhoneTextField.delegate = self;
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
    [self.view addSubview:_yyLabel];
    [self protocolIsSelect:NO];
    
    if (@available(iOS 13.0, *)) {//13.0的新属性
        if ([WXApi isWXAppInstalled]) {
            //QQ  微信。苹果
            UIButton * DongwangQQBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(85), CGRectGetMaxY(_yyLabel.frame)+K(68), K(45), K(45))];
            DongwangQQBtn.adjustsImageWhenHighlighted = NO;
            [DongwangQQBtn setBackgroundImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
            [DongwangQQBtn addTarget:self action:@selector(DongwangQQBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:DongwangQQBtn];
            
            
            UIButton * WechatBtn =[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangQQBtn.frame)+K(35), CGRectGetMaxY(_yyLabel.frame)+K(68), K(45), K(45))];
            [WechatBtn setBackgroundImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
            WechatBtn.adjustsImageWhenHighlighted = NO;
            [WechatBtn addTarget:self action:@selector(WechatBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:WechatBtn];
            
            
            ASAuthorizationAppleIDButton *appleIDButton = [ASAuthorizationAppleIDButton buttonWithType:ASAuthorizationAppleIDButtonTypeSignIn style:ASAuthorizationAppleIDButtonStyleBlack];
            appleIDButton.frame = CGRectMake(CGRectGetMaxX(WechatBtn.frame)+K(35), CGRectGetMaxY(_yyLabel.frame)+K(68), K(45), K(45));
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
- (void)monitorSignInWithAppleStateChanged:(NSNotification *)notification {
    NSLog(@"state CHANGE -  %@",notification);
}

- (void)dealloc {
    if (@available(iOS 13.0, *)) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:ASAuthorizationAppleIDProviderCredentialRevokedNotification object:nil];
    } else {
        // Fallback on earlier versions
    }
}
#pragma mark--QQ
-(void)DongwangQQBtnClick{

    NSArray *permissions = [NSArray arrayWithObjects:kOPEN_PERMISSION_GET_INFO, kOPEN_PERMISSION_GET_USER_INFO, kOPEN_PERMISSION_GET_SIMPLE_USER_INFO, nil];
    _tencentOAuth = [[TencentOAuth alloc]initWithAppId:@"101919220" andUniversalLink:@"https://zch64l.xinstall.top/qq_conn/101919220" andDelegate:self];
     // 这里调起登录
    [_tencentOAuth authorize:permissions inSafari:NO];
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
        [DongwangLogoinViewModel CLShanyanLogoinWithParmters:DongwangAppleParmters RequestCuurentControlers:self logoinSuuced:^(id  _Nonnull object) {
            NSLog(@"苹果登录回调：%@",object);
            NSDictionary * responeDic= (NSDictionary *)object;
            NSString * wxSmsTip =  [NSString stringWithFormat:@"%@",[[responeDic objectForKey:@"data"] objectForKey:@"wxSmsTip"]];
            if ([wxSmsTip isEqualToString:@"1"]) {
                DongwangBandingViewController * dongwangBangVc =[[DongwangBandingViewController alloc]init];
                dongwangBangVc.hidesBottomBarWhenPushed = YES;
                dongwangBangVc.wxSmsTip = wxSmsTip;
                dongwangBangVc.openid = userID;
                dongwangBangVc.isappleLogoin = YES;
                [self.navigationController pushViewController:dongwangBangVc animated:YES];
            }else{
              [UserManager userLoginSucced];
               [self BaseTabarRequest];
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

- (void)protocolIsSelect:(BOOL)isSelect{
    //设置整段字符串的颜色
    NSDictionary *attributes = @{NSFontAttributeName:KSysFont(13), NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#999999"]};
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"  登录即表示同意《用户协议》与《隐私政策》" attributes:attributes];
    //设置高亮色和点击事件
    MJWeakSelf;
    [text yy_setTextHighlightRange:[[text string] rangeOfString:@"《用户协议》"] color:[UIColor colorWithHexString:@"#047FFE"] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        DongwangPrivetaWebViewController * dongwangVc=  [[DongwangPrivetaWebViewController alloc]init];
        dongwangVc.type = VCPressent;
        dongwangVc.protoclUrlText =  [NSString stringWithFormat:@"%@%@",Protocl_Url,@"dongwang_h5/document/index.html?type=user"];
        UINavigationController * dongwangNav =[UINavigationController rootVC:dongwangVc translationScale:YES];
        [weakSelf presentViewController:dongwangNav animated:YES completion:nil];

    }];
    //设置高亮色和点击事件
    [text yy_setTextHighlightRange:[[text string] rangeOfString:@"《隐私政策》"] color:[UIColor colorWithHexString:@"#047FFE"] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        DongwangPrivetaWebViewController * dongwangVc=  [[DongwangPrivetaWebViewController alloc]init];
        dongwangVc.type = VCPressent;
        dongwangVc.protoclUrlText =  [NSString stringWithFormat:@"%@%@",Protocl_Url,@"dongwang_h5/document/index.html?type=policy"];
        UINavigationController * dongwangNav =[UINavigationController rootVC:dongwangVc translationScale:YES];
        [weakSelf presentViewController:dongwangNav animated:YES completion:nil];

    }];
    
    _yyLabel.attributedText = text;
    //居中显示一定要放在这里，放在viewDidLoad不起作用
    _yyLabel.textAlignment = NSTextAlignmentCenter;

}
#pragma mark--验证码登录
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
        dongwangnextVc.phoneText =  [weakSelf.DongwangPhoneTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        [weakSelf.navigationController pushViewController:dongwangnextVc animated:YES];
    } logoinfairler:^{
        
    }];
    
    
}
#pragma mark--微信登录回调
- (void)chWxCodeNotification:(NSNotification *)notification {
    NSLog(@"DongwangCodeLoginViewController");
    NSLog(@"微信登录回调:%@",notification.userInfo);
    NSDictionary *notificatDictionary = notification.userInfo;
    NSString * wxCode= [notificatDictionary objectForKey:@"wxCode"];
    NSString *deviceID = [MFSIdentifier deviceID];
    NSLog(@"deviceId: %@", deviceID);
    [DongwangLogoinViewModel CLShanyanLogoinWithParmters:@{@"code":wxCode,@"type":@"2",@"deviceId":deviceID}.mutableCopy RequestCuurentControlers:self logoinSuuced:^(id  _Nonnull object) {
        NSDictionary * responeDic= (NSDictionary *)object;
    NSLog(@"返回:%@",responeDic);
    NSString * wxSmsTip =  [NSString stringWithFormat:@"%@",[[responeDic objectForKey:@"data"] objectForKey:@"wxSmsTip"]];
    NSString * openid =  [NSString stringWithFormat:@"%@",[[responeDic objectForKey:@"data"] objectForKey:@"openid"]];
        //如果为1微信未绑定
        if ([wxSmsTip isEqualToString:@"1"]) {
            //那么去绑定
            DongwangBandingViewController * dongwangBangVc =[[DongwangBandingViewController alloc]init];
            dongwangBangVc.hidesBottomBarWhenPushed = YES;
            dongwangBangVc.wxSmsTip = wxSmsTip;
            dongwangBangVc.openid = openid;
            dongwangBangVc.Mytype = @"2";
            dongwangBangVc.isappleLogoin = NO;
            [self.navigationController pushViewController:dongwangBangVc animated:YES];
        }else{
            [UserManager userLoginSucced];
            [self BaseTabarRequest];
        }
    } logoinfairler:^{

    }];

}
#pragma mark--微信登录
-(void)WechatBtnClick{
    [DongwangLogoinViewModel DongwangWechatAutor];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CHWXCodeNotification object:nil];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chWxCodeNotification:) name:CHWXCodeNotification object:nil];
}
-(void)textFieldEditingChanged:(UITextField *)InputTextField{
    //[InputTextField.text isValidPhoneNum]
    if (_DongwangPhoneTextField.text.length == 11) {
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
#pragma mark--TencentSessionDelegate
// 获取用户信息
- (void)getUserInfoResponse:(APIResponse *)response {

     //NSLog(@"userInfo： response %@",response.jsonResponse);
    if (response && response.retCode == URLREQUEST_SUCCEED) {
        // 后续操作...
        NSLog(@"透传数据:%@",_tencentOAuth.expirationDate);
        [_tencentOAuth logout:self];
    } else {
        NSLog(@"QQ auth fail ,getUserInfoResponse:%d", response.detailRetCode);
    }
}
- (void)tencentDidLogin {
    NSLog(@"已登录");
    [_tencentOAuth getUserInfo];
    //NSDictionary * resepaqssDataDic = _tencentOAuth.passData;
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
            NSLog(@"QQ登录未绑定");
            //那么去绑定
            DongwangBandingViewController * dongwangBangVc =[[DongwangBandingViewController alloc]init];
            dongwangBangVc.hidesBottomBarWhenPushed = YES;
            dongwangBangVc.wxSmsTip = wxSmsTip;
            dongwangBangVc.openid = openid;
            dongwangBangVc.Mytype = @"5";
            dongwangBangVc.isappleLogoin = NO;
            [self.navigationController pushViewController:dongwangBangVc animated:YES];
        }else{
        [UserManager userLoginSucced];
        [self BaseTabarRequest];
        }
    } logoinfairler:^{

    }];


    
    
}
- (NSString *)QQcurrentTimeStr:(NSDate *)mydate{
    NSTimeInterval time=[mydate timeIntervalSince1970];// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

- (NSString *)currentTimeStr:(NSDate *)mydate{
    NSTimeInterval time=[mydate timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
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
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.MainLogin_showTimeStr = [NSString currentTimeStr];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.MainLogin_leaveTimeStr =  [NSString currentTimeStr];
    [[DataBuried ShareManager] CLLogoninWithParmesWithShowTimeStr:self.MainLogin_showTimeStr LeaveTimeStr:self.MainLogin_leaveTimeStr ViewPageName:1];
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
