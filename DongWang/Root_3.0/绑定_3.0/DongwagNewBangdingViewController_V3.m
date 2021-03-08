//
//  DongwangBandingViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/22.
//

#import "DongwagNewBangdingViewController_V3.h"
#import "DongwangPrivetaWebViewController.h"
#import "DongwangNewBangdingNextViewController_V3.h"
#import "YYText.h"
#import "ZASTextFieldFormat.h"
#import "DongwangLogoinViewModel.h"
@interface DongwagNewBangdingViewController_V3 ()<UITextFieldDelegate>
@property(nonatomic,strong) UIButton *  DongwangLogoinBtn;
@property(nonatomic,strong) UITextField * DongwangPhoneTextField;
@property (nonatomic , strong)   YYLabel *yyLabel;

@end

@implementation DongwagNewBangdingViewController_V3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"绑定手机号";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F7EEFF"];
    UIImageView * DongwangBJImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, NaviH+K(21), SCREEN_Width, K(532.5))];
    DongwangBJImgView.image = [UIImage imageNamed:@"懂王logo背景"];
    [self.view addSubview:DongwangBJImgView];
    
    
    UIView *  Dongwanginputline = [[UIView alloc]initWithFrame:CGRectMake(K(28.5), NaviH+K(168), SCREEN_WIDTH-K(47), K(0.6))];
    Dongwanginputline.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.view addSubview:Dongwanginputline];
    
    UIImageView * DongwangImgIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(28.5), CGRectGetMaxY(Dongwanginputline.frame)-K(10+24), K(15), K(22))];
    DongwangImgIconImgView.image = [UIImage imageNamed:@"手机"];
    [self.view addSubview:DongwangImgIconImgView];

    UITextField * DongwangPhoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangImgIconImgView.frame)+K(10), CGRectGetMaxY(Dongwanginputline.frame)-K(40), CGRectGetWidth(Dongwanginputline.frame)-CGRectGetMaxX(DongwangImgIconImgView.frame)-K(0), K(35))];
    DongwangPhoneTextField.delegate = self;
    DongwangPhoneTextField.keyboardType   =  UIKeyboardTypePhonePad;
    DongwangPhoneTextField.clearButtonMode =  UITextFieldViewModeAlways;
    DongwangPhoneTextField.textColor = LGDBLackColor;
    DongwangPhoneTextField.font = KSysFont(16);
    DongwangPhoneTextField.attributedPlaceholder =  [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#999999"]}];
    [DongwangPhoneTextField addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:DongwangPhoneTextField];
    _DongwangPhoneTextField = DongwangPhoneTextField;
    
    
    UILabel *  Dongwangmsglb = [[UILabel alloc]initWithFrame:CGRectMake(K(28), CGRectGetMaxY(Dongwanginputline.frame)+K(20), SCREEN_WIDTH, K(18))];
    Dongwangmsglb.textColor = [UIColor colorWithHexString:@"#999999"];
    Dongwangmsglb.font = KSysFont(13);
    Dongwangmsglb.text = @"为了您的账号安全，请绑定手机号";
    [self.view addSubview:Dongwangmsglb];
    
    
    UIButton *  DongwangLogoinBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(Dongwangmsglb.frame)+K(34), SCREEN_WIDTH-K(30), K(45))];
    [DongwangLogoinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    DongwangLogoinBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    DongwangLogoinBtn.titleLabel.font = KBlFont(15);
    [DongwangLogoinBtn setTitle:@"获取短信验证码" forState:UIControlStateNormal];
    DongwangLogoinBtn.layer.cornerRadius = K(22.5);
    [DongwangLogoinBtn addTarget:self action:@selector(DongwangLogoinBtnClick) forControlEvents:UIControlEventTouchUpInside];
    DongwangLogoinBtn.layer.masksToBounds = YES;
    DongwangLogoinBtn.enabled = NO;
    [DongwangLogoinBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
    [self.view addSubview:DongwangLogoinBtn];
    _DongwangLogoinBtn = DongwangLogoinBtn;
    
    
    
    
    _yyLabel = [[YYLabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame)-kHeight(30), SCREEN_WIDTH, kHeight(15))];
//    [self.view addSubview:_yyLabel];
//    [self protocolIsSelect:NO];
    
    UILabel * DongwangmsgLb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMinY(_yyLabel.frame)-kHeight(20), SCREEN_WIDTH, K(15))];
    DongwangmsgLb.textAlignment = NSTextAlignmentCenter;
    DongwangmsgLb.font = KSysFont(13);
    DongwangmsgLb.textColor = [UIColor colorWithHexString:@"#999999"];
    DongwangmsgLb.text = @"首次登录将自动注册，";
//    [self.view addSubview:DongwangmsgLb];

    

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

-(void)textFieldEditingChanged:(UITextField *)DongwangTextField{
    //[DongwangTextField.text isValidPhoneNum]
    if (DongwangTextField.text.length == 11) {
        _DongwangLogoinBtn.enabled = YES;
        [_DongwangLogoinBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];
    }else{
        [_DongwangLogoinBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];

        _DongwangLogoinBtn.enabled = NO;
        [_DongwangLogoinBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
    }
}
#pragma mark--获取短信验证码
-(void)DongwangLogoinBtnClick{
    [self.view endEditing:YES];
    if (![_DongwangPhoneTextField.text isValidPhoneNum]) {
        [CHShowMessageHud showMessageText:@"手机号各式不正确，请重新输入"];
        return;
    }
    
   MJWeakSelf;
   //获取验证码
    [DongwangLogoinViewModel CodeloginRequestWithParmtersw:@{@"phone":[_DongwangPhoneTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""],@"type":@"4"}.mutableCopy RequestCuurentControlers:self logoinSuuced:^(id  _Nonnull object) {
        NSDictionary * responeDic = (NSDictionary *)object;
        NSDictionary * dataDic = [responeDic objectForKey:@"data"];
        NSString * smsCode=  [NSString stringWithFormat:@"%@",[dataDic objectForKey:@"smsCode"]];
        DongwangNewBangdingNextViewController_V3 * dongwangNetVc =[[DongwangNewBangdingNextViewController_V3 alloc]init];
        dongwangNetVc.phoneText = [self->_DongwangPhoneTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        dongwangNetVc.wxSmsTip = weakSelf.wxSmsTip;
        dongwangNetVc.openid = weakSelf.openid;
        dongwangNetVc.smsCode = smsCode;
        dongwangNetVc.Mytype = self.Mytype;
        dongwangNetVc.isapplelogoin = weakSelf.isappleLogoin;
        [weakSelf.navigationController pushViewController:dongwangNetVc animated:YES];
    } logoinfairler:^{

    }];
    
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

