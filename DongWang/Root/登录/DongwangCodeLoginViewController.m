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
#import "DongwangBandingViewController.h"
#import "YYText.h"
#import "ZASTextFieldFormat.h"
#import "JITelephoneInputTextField.h"
#import "DongwangLogoinViewModel.h"
@interface DongwangCodeLoginViewController ()<UITextFieldDelegate>
{
    UITextField * _DongwangPhoneTextField;
    UIButton *  _DongwangLogoinBtn;
}
@property (nonatomic , strong)   YYLabel *yyLabel;

@end

@implementation DongwangCodeLoginViewController
-(void)backBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"登录";
    
    
    
    
    
    UIView * backView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, K(30), K(30))];
    UIButton * backBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(13), K(1), K(18), K(18))];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_return"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:backBtn];
//    self.gk_navLeftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backView];
    
    
    
    UIImageView * DongwangBJImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, NaviH+K(21), SCREEN_Width, K(532.5))];
    DongwangBJImgView.image = [UIImage imageNamed:@"懂王logo背景"];
    [self.view addSubview:DongwangBJImgView];
    
    UIImageView * DongwangLogoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_Width/2-K(42.5), K(59)+NaviH, kWidth(85), kWidth(85))];
    DongwangLogoImgView.image = [UIImage imageNamed:@"applogo"];
    [self.view addSubview:DongwangLogoImgView];
    
    UILabel * DongwangLogoTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangLogoImgView.frame)+K(19.5), SCREEN_Width, K(15))];
    DongwangLogoTitle.textAlignment =  NSTextAlignmentCenter;
    DongwangLogoTitle.text = @"做快乐的人 懂王更懂你";
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
        dongwangVc.protoclUrlText =  @"dongwang_h5/document/index.html?type=user";
        UINavigationController * dongwangNav =[UINavigationController rootVC:dongwangVc translationScale:YES];
        [weakSelf presentViewController:dongwangNav animated:YES completion:nil];

    }];
    //设置高亮色和点击事件
    [text yy_setTextHighlightRange:[[text string] rangeOfString:@"《隐私政策》"] color:[UIColor colorWithHexString:@"#047FFE"] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        DongwangPrivetaWebViewController * dongwangVc=  [[DongwangPrivetaWebViewController alloc]init];
        dongwangVc.protoclUrlText =  @"dongwang_h5/document/index.html?type=policy";
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
//    DongwangBandingViewController * dongwangBangVc =[[DongwangBandingViewController alloc]init];
//    dongwangBangVc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:dongwangBangVc animated:YES];
    
    [self sendAuthRequest];
}
#pragma mark -- 微信开发平台
- (void)sendAuthRequest {
    //构造SendAuthReq结构体
    SendAuthReq* req =[[SendAuthReq alloc ] init ];
    req.scope = @"snsapi_userinfo" ;
    req.state = @"App" ;
    //第三方向微信终端发送一个SendAuthReq消息结构
    [WXApi sendReq:req completion:^(BOOL success) {
        
    }];
}
- (void)chWxCodeNotification:(NSNotification *)notification {
    NSDictionary *notificatDictionary = notification.userInfo;
//    [self qmgjLogin:@"3" account:notificatDictionary[@"wxCode"] md:@""];
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
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CHWXCodeNotification object:nil];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //注册微信登录通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chWxCodeNotification:) name:CHWXCodeNotification object:nil];
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
