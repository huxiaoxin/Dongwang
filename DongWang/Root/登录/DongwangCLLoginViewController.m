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
#import "DongwangTabbarModel.h"
#import "DongwangBaseTabBarViewController.h"

#import "DongwangPrivetaWebViewController.h"
#import "DongwangBandingViewController.h"
#import "YYText.h"
#import "DongwangLogoinViewModel.h"
@interface DongwangCLLoginViewController ()<UITextFieldDelegate>
{
    UITextField * _DongwangPhoneTextField;
    UIButton *  _DongwangLogoinBtn;
}
@property(nonatomic,strong) UIButton *  wechatBtn;
@property(nonatomic,strong) UIButton * codebtn;
@property (nonatomic , strong)   YYLabel *yyLabel;

@end

@implementation DongwangCLLoginViewController
#pragma mark--闪验登录
-(void)CLShanyanLogoinConfigers{
    MJWeakSelf;
    CLUIConfigure * clconfigrs = [[CLUIConfigure alloc]init];
    clconfigrs.clNavigationBackBtnHidden =@(NO);
    clconfigrs.clAppPrivacyWebModalPresentationStyle =  @(UIModalPresentationPageSheet);
//    clconfigrs.clAppPrivacyWebBackBtnImage = [UIImage imageNamed:@"btn_back_black"];
    clconfigrs.clAuthTypeUseWindow = @(YES);
    clconfigrs.manualDismiss = @(YES);
    clconfigrs.clNavBackBtnAlimentRight = @(YES);
    clconfigrs.clNavBackBtnImageInsets = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(0, K(0), K(15), K(15))];
    clconfigrs.viewController = weakSelf;
    clconfigrs.clOperatorPrivacyAtLast  = @(YES);
    clconfigrs.clBackgroundImg = [UIImage imageNamed:ISIPHONE_X ? @"xbeijin" : @"登录背景"];
    clconfigrs.customAreaView = ^(UIView * _Nonnull customAreaView) {
        
        UIButton *  wechatBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-kWidth(22.5), kHeight(556.6), kWidth(45), kWidth(45))];
        [wechatBtn setBackgroundImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
        wechatBtn.adjustsImageWhenHighlighted =  NO;
        [wechatBtn addTarget:self action:@selector(CLwechatBtnClick) forControlEvents:UIControlEventTouchUpInside];
        wechatBtn.hidden = ![WXApi isWXAppInstalled];
        [customAreaView addSubview:wechatBtn];
        weakSelf.wechatBtn = wechatBtn;
        
        UIButton * codebtn  = [[UIButton alloc]initWithFrame:CGRectMake(0, kHeight(425), SCREEN_WIDTH, kWidth(20))];
        [codebtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        codebtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        codebtn.titleLabel.font = KSysFont(13);
        [codebtn addTarget:self action:@selector(codebtnClick) forControlEvents:UIControlEventTouchUpInside];
        [codebtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [codebtn  setTitle:@"手机验证码登录>" forState:UIControlStateNormal];
        [customAreaView addSubview:codebtn];
        weakSelf.codebtn = codebtn;
        
        
    };
    
    clconfigrs.clNavigationBackBtnHidden = @(YES);
    //基础文字颜色、条款文字颜色
    clconfigrs.clAppPrivacyColor =@[[UIColor colorWithHexString:@"#999999"],[UIColor colorWithHexString:@"#047FFE"]];
    clconfigrs.clAppPrivacyFirst = @[@"《用户协议》",[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"dongwang_h5/document/index.html?type=user",Protocl_Url]]];
    clconfigrs.clAppPrivacySecond = @[@"《隐私政策》",[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"dongwang_h5/document/index.html?type=policy",Protocl_Url]]];
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
    clconfigrs.clLoginBtnCornerRadius = [NSNumber numberWithInt:K(22.5)];
    
    
    CLOrientationLayOut * clLayout = [[CLOrientationLayOut alloc]init];
    // 手机号码约束
    clLayout.clLayoutPhoneTop= @(kHeight(310));
    clLayout.clLayoutPhoneLeft = @(0);
    clLayout.clLayoutPhoneWidth = @(SCREEN_WIDTH);
    clLayout.clLayoutPhoneHeight = @(kHeight(23));
    
    // 按钮约束
    clLayout.clLayoutLoginBtnTop =  @(kHeight(359.5));
    clLayout.clLayoutLoginBtnLeft = @(kWidth(47));
    clLayout.clLayoutLoginBtnWidth = @(SCREEN_WIDTH - kWidth(94));
    clLayout.clLayoutLoginBtnHeight = @(kWidth(44));
    
    clLayout.clLayoutAppPrivacyTop = @(kHeight(617.5));
    clLayout.clLayoutAppPrivacyLeft = @(K(15));
    clLayout.clLayoutAppPrivacyWidth = @(SCREEN_WIDTH-K(30));
    clLayout.clLayoutAppPrivacyHeight = @(K(40));
    
    
    clconfigrs.clOrientationLayOutPortrait = clLayout;
    [CHShowMessageHud showHUDPlainText:@"" view:self.view];
    [CLShanYanSDKManager quickAuthLoginWithConfigure:clconfigrs openLoginAuthListener:^(CLCompleteResult * _Nonnull completeResult) {
        // UI操作建议手动切至主线程
        if (completeResult.error == nil) {
        [CHShowMessageHud dismissHideHUD:self.view];
            
        }else{
            NSString *tempMessage = [NSString stringWithFormat:@"%@", completeResult.message];
            NSLog(@"错误信息:%@",tempMessage);
            if (tempMessage.length > 0) {
                [CHShowMessageHud showMessageText:tempMessage];
            }
        }
    } oneKeyLoginListener:^(    CLCompleteResult * _Nonnull completeResult) {
        if (completeResult.error) {
            //一键登录失败
            NSLog(@"oneKeyLoginListener:%@",completeResult.error.description);
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
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [CHShowMessageHud showHUDPlainText:@"" view:self.view];
        NSDictionary * dataDic = completeResult.data;
        NSString * token = [dataDic objectForKey:@"token"];
        [DongwangLogoinViewModel CLShanyanLogoinWithParmters:@{@"type":@"3",@"flashToken":token,@"phone":@"",@"device":@"1"}.mutableCopy RequestCuurentControlers:self logoinSuuced:^{
            [CHShowMessageHud showMessageText:@"登录成功"];
            [UserManager userLoginSucced];
            //登录成功加载tabbar
            [weakSelf tabarRequest];
          } logoinfairler:^{
            [CHShowMessageHud showMessageText:@"登录失败"];
          }];
         });
        }
    }];
    
}

-(void)tabarRequest{
    NSDictionary *postHeader = [EncryptionTool getSignatureTimestamp];
    NSString *url = [NSString stringWithFormat:@"%@/rest/home/tab", BASE_IPURL];
    kWeakSelf(self);
    [AFNetworkTool GET:url HttpHeader:postHeader Parameters:nil Success:^(id responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSLog(@"动态：%@",dic);
        if ([dic[@"err"] isEqualToString:@"00000"]) {
            NSDictionary *tempData = (NSDictionary *)dic[@"dat"];
            DongwangTabbarModel * model = [DongwangTabbarModel BaseinitWithDic:tempData];
            [weakself loadHomeTabbarWithTabbarModel:model];
        } else {
            [weakself loadHomeTabbarWithTabbarModel:nil];
        }
        [CLShanYanSDKManager finishAuthControllerCompletion:^{
            //回到验证码登录
        }];

        
    } Failure:^(NSError *error) {
        [CLShanYanSDKManager finishAuthControllerCompletion:^{
            //回到验证码登录
        }];

        [weakself loadHomeTabbarWithTabbarModel:nil];
    }];
    
}
-(void)loadHomeTabbarWithTabbarModel:(DongwangTabbarModel *)tabbarModel{
    DongwangBaseTabBarViewController * dongwangTabbarVc = [[DongwangBaseTabBarViewController alloc]init];
    if (tabbarModel) {
        dongwangTabbarVc.tabbarModel = tabbarModel;
    }else{
        dongwangTabbarVc.tabbarModel = [DongwangTabbarModel new];
    }
    [AppDelegate getAppDelegate].window.rootViewController = dongwangTabbarVc;
}




//原生返回按钮 拉取闪验SDK页面用的
-(void)backBtnClick{
    [self CLShanyanLogoinConfigers];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.navigationController.presentationController
    self.gk_navTitle = @"登录";
    UIView * backView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, K(30), K(30))];
    UIButton * backBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(13), K(3.5), K(23), K(23))];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_return"] forState:UIControlStateNormal];
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
    DongwangLogoTitle.text = @"做快乐的人 懂王更懂你";
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
    
    UIButton * WechatBtn =[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-K(22.5), CGRectGetMaxY(_yyLabel.frame)+K(68), K(45), K(45))];
    [WechatBtn setBackgroundImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
    WechatBtn.adjustsImageWhenHighlighted = NO;
    [WechatBtn addTarget:self action:@selector(WechatBtnClick) forControlEvents:UIControlEventTouchUpInside];
    WechatBtn.hidden = ![WXApi  isWXAppInstalled];
    [self.view addSubview:WechatBtn];
    
}
- (void)protocolIsSelect:(BOOL)isSelect{
    //设置整段字符串的颜色
    NSDictionary *attributes = @{NSFontAttributeName:KSysFont(13), NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#999999"]};
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"  登录即表示同意《用户协议》与《隐私政策》" attributes:attributes];
    //设置高亮色和点击事件
    MJWeakSelf;
    [text yy_setTextHighlightRange:[[text string] rangeOfString:@"《用户协议》"] color:[UIColor colorWithHexString:@"#047FFE"] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        DongwangPrivetaWebViewController * dongwangVc=  [[DongwangPrivetaWebViewController alloc]init];
        dongwangVc.protoclUrlText = @"dongwang_h5/document/index.html?type=user";
        UINavigationController * dongwangNav =[UINavigationController rootVC:dongwangVc translationScale:YES];
        [weakSelf presentViewController:dongwangNav animated:YES completion:nil];
        
    }];
    //设置高亮色和点击事件
    [text yy_setTextHighlightRange:[[text string] rangeOfString:@"《隐私政策》"] color:[UIColor colorWithHexString:@"#047FFE"] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        DongwangPrivetaWebViewController * dongwangVc=  [[DongwangPrivetaWebViewController alloc]init];
        dongwangVc.protoclUrlText = @"dongwang_h5/document/index.html?type=policy";
        UINavigationController * dongwangNav =[UINavigationController rootVC:dongwangVc translationScale:YES];
        [weakSelf presentViewController:dongwangNav animated:YES completion:nil];
        
    }];
    
    _yyLabel.attributedText = text;
    //居中显示一定要放在这里，放在viewDidLoad不起作用
    _yyLabel.textAlignment = NSTextAlignmentCenter;
    
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
    [DongwangLogoinViewModel CodeloginRequestWithParmtersw:@{@"phone":[_DongwangPhoneTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""]}.mutableCopy RequestCuurentControlers:self logoinSuuced:^{
        DongwangCodeloginNextViewController *  dongwangnextVc = [[DongwangCodeloginNextViewController alloc]init];
        dongwangnextVc.phoneText =  [_DongwangPhoneTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        [weakSelf.navigationController pushViewController:dongwangnextVc animated:YES];
    } logoinfairler:^{
    }];

}
#pragma mark--微信登录
-(void)WechatBtnClick{
    //跳转微信 如果已绑定手机号 直接登录 未绑定手机号直接去绑定手机号
    DongwangBandingViewController * dongwangBangVc =[[DongwangBandingViewController alloc]init];
    dongwangBangVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dongwangBangVc animated:YES];
    
}
#pragma mark--闪验页面的微信登录
-(void)CLwechatBtnClick{
    //如果要微信登录 必须先关闭创蓝的授权页面
    MJWeakSelf;
    [CLShanYanSDKManager finishAuthControllerAnimated:NO Completion:^{
        DongwangBandingViewController * dongwangBangVc =[[DongwangBandingViewController alloc]init];
        dongwangBangVc.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:dongwangBangVc animated:YES];
    }];
    
}
-(void)textFieldEditingChanged:(UITextField *)InputTextField{
    NSLog(@"------%@",InputTextField.text);
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
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
