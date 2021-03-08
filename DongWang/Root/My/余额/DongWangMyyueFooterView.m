//
//  DongWangMyyueFooterView.m
//  DongWang
//
//  Created by codehzx on 2020/11/11.
//

#import "DongWangMyyueFooterView.h"
#import <WebKit/WebKit.h>
@interface DongWangMyyueFooterView  ()<UITextFieldDelegate>
@property(nonatomic,strong) UITextField * DongwangCodeTextField;
@end
@implementation DongWangMyyueFooterView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self =  [super initWithFrame:frame]) {
    
        self.backgroundColor = [UIColor clearColor];

        UILabel * dongwangfirstlb = [self DongwangleftlbConfiger:@"支付宝号:" lbFrame:CGRectMake(K(28), K(18), K(150), K(18.5))];
        [self addSubview:dongwangfirstlb];
        
        UIView * dongwangline = [self DongwangLines:CGRectMake(K(102), K(45), K(253), K(1))];
        [self addSubview:dongwangline];
        
        NSString * payAccount = [NSString stringWithFormat:@"%@",[UserManager userInfo].payAccount];
        UILabel * dongwangfirstrightlb = [self DongwangRightlbConfiger:[NSString numberPhoneSuitScanf:payAccount strRange:NSMakeRange(3, 4)] lbFrame:CGRectMake(K(101), K(18), K(200),   K(18.5))];
        [self addSubview:dongwangfirstrightlb];
        
        
        
        UILabel * dongwangsecondlb = [self DongwangleftlbConfiger:@"真实姓名:" lbFrame:CGRectMake(K(28), K(39.5)+CGRectGetMaxY(dongwangfirstlb.frame), K(150), K(18.5))];
        [self addSubview:dongwangsecondlb];

        UIView * dongwangsecondline = [self DongwangLines:CGRectMake(K(102), K(56.5)+CGRectGetMaxY(dongwangline.frame), K(253), K(1))];
        [self addSubview:dongwangsecondline];
        
        
        UILabel * dongwangsecondightlb = [self DongwangRightlbConfiger:[UserManager userInfo].realName lbFrame:CGRectMake(K(101), CGRectGetMaxY(dongwangsecondline.frame)-K(28), K(200),   K(18.5))];
        [self addSubview:dongwangsecondightlb];
        
        
        
        UILabel * dongwangtrhreelb = [self DongwangleftlbConfiger:@"手机号码:" lbFrame:CGRectMake(K(28), K(39.5)+CGRectGetMaxY(dongwangsecondightlb.frame), K(150), K(18.5))];
        [self addSubview:dongwangtrhreelb];
        
        UIView * dongwangthreeline = [self DongwangLines:CGRectMake(K(102), K(56.5)+CGRectGetMaxY(dongwangsecondline.frame), K(253), K(1))];
        [self addSubview:dongwangthreeline];

        NSString * phone = [NSString stringWithFormat:@"%@",[UserManager userInfo].phone];
        UILabel * dongwangthreeightlb = [self DongwangRightlbConfiger:[NSString numberPhoneSuitScanf:phone strRange:NSMakeRange(3, 4)] lbFrame:CGRectMake(K(101), CGRectGetMaxY(dongwangthreeline.frame)-K(28), K(200),   K(18.5))];
        [self addSubview:dongwangthreeightlb];
        
        
        UILabel * Dongwangrightlb = [[UILabel alloc]initWithFrame:CGRectMake(K(28.5), K(40)+CGRectGetMaxY(dongwangtrhreelb.frame), K(100), K(18.5))];
        Dongwangrightlb.text =  @"验证码：";
        Dongwangrightlb.font = KSysFont(font(13));
        Dongwangrightlb.textColor = [UIColor colorWithHexString:@"#333333"];
        [self addSubview:Dongwangrightlb];

        
        UIView * Dongwangline = [[UIView alloc]initWithFrame:CGRectMake(K(102), CGRectGetMaxY(Dongwangrightlb.frame)+K(8), SCREEN_WIDTH-K(122), K(1))];
        Dongwangline.backgroundColor = [UIColor colorWithHexString:@"#ECECEC"];
        [self addSubview:Dongwangline];
        
        
        
        

        UITextField * DongwangCodeTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(101),CGRectGetMaxY(Dongwangline.frame)-K(35), K(150), K(35))];
        DongwangCodeTextField.font = KSysFont(font(12));
        DongwangCodeTextField.attributedPlaceholder =  [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSFontAttributeName:KSysFont(font(12)),NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#999999"]}];
        DongwangCodeTextField.delegate = self;
        [DongwangCodeTextField addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];

        DongwangCodeTextField.textColor =  [UIColor colorWithHexString:@"#999999"];
        DongwangCodeTextField.clearButtonMode =  UITextFieldViewModeAlways;
        [self addSubview:DongwangCodeTextField];
        _DongwangCodeTextField = DongwangCodeTextField;
        
        UIButton *  DongwangCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(260), CGRectGetMaxY(DongwangCodeTextField.frame)-K(35), K(85.5), K(27.5))];
        DongwangCodeBtn.layer.cornerRadius = K(13.75);
        DongwangCodeBtn.layer.masksToBounds = YES;
        [DongwangCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        DongwangCodeBtn.titleLabel.font = KSysFont(font(11));
        DongwangCodeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [DongwangCodeBtn setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
        [DongwangCodeBtn addTarget:self action:@selector(DongwangCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:DongwangCodeBtn];
        _DongwangCodeBtn = DongwangCodeBtn;
        
        UIButton *  DongwangTixianBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(28.5), CGRectGetMaxY(Dongwangline.frame)+K(19), SCREEN_WIDTH-K(57), K(45))];
        [DongwangTixianBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        DongwangTixianBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        DongwangTixianBtn.titleLabel.font = KBlFont(15);
        [DongwangTixianBtn setTitle:@"立即提现" forState:UIControlStateNormal];
        DongwangTixianBtn.layer.cornerRadius = K(22.5);
        [DongwangTixianBtn addTarget:self action:@selector(DongwangTixianBtnClick) forControlEvents:UIControlEventTouchUpInside];
        DongwangTixianBtn.layer.masksToBounds = YES;
        DongwangTixianBtn.enabled = NO;
        [DongwangTixianBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
        [self addSubview:DongwangTixianBtn];
        _DongwangTixianBtn = DongwangTixianBtn;
        
        
        if ([[UserManager userInfo].withdrawLimit floatValue]<=[[UserManager userInfo].currentBalance floatValue]) {
            if (DongwangCodeTextField.text.length == 6) {
                DongwangTixianBtn.enabled = YES;
                [DongwangTixianBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];
            }else{
                DongwangTixianBtn.enabled = NO;
                [DongwangTixianBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
            }
            [DongwangCodeBtn setBackgroundColor:[UIColor colorWithHexString:@"#FFB608"]];
            DongwangCodeBtn.enabled = YES;
        }else{
            DongwangCodeBtn.enabled = NO;
            [DongwangCodeBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
            DongwangTixianBtn.enabled = NO;
            [DongwangTixianBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
        }

        
        WKWebViewConfiguration * configer = [[WKWebViewConfiguration alloc]init];
        WKWebView * webView = [[WKWebView alloc]initWithFrame:CGRectMake(K(24.5), CGRectGetMaxY(DongwangTixianBtn.frame)+K(14.5), SCREEN_WIDTH-K(49), K(100)) configuration:configer];
        webView.backgroundColor = [UIColor clearColor];
        webView.opaque =  NO;
        [self addSubview:webView];
        
        [webView loadHTMLString:[UserManager userInfo].withdrawTips baseURL:nil];
        
        self.FooterHeight= CGRectGetMaxY(DongwangTixianBtn.frame)+K(10);
        

        
    }
    return self;
}
-(UIView *)DongwangLines:(CGRect)Frame{
    UIView * dongwangline = [[UIView alloc]initWithFrame:Frame];
    dongwangline.backgroundColor = [UIColor colorWithHexString:@"#ECECEC"];
    return dongwangline;
}
-(UILabel *)DongwangleftlbConfiger:(NSString *)lbStr lbFrame:(CGRect)lbFrame{
    UILabel * Dongwanglb = [[UILabel alloc]initWithFrame:lbFrame];
    Dongwanglb.text = lbStr;
    Dongwanglb.font = KSysFont(font(13));
    Dongwanglb.textColor = [UIColor colorWithHexString:@"#333333"];
    return Dongwanglb;
}
-(UILabel *)DongwangRightlbConfiger:(NSString *)lbStr lbFrame:(CGRect)lbFrame{
    UILabel * Dongwanglb = [[UILabel alloc]initWithFrame:lbFrame];
    Dongwanglb.text = lbStr;
    Dongwanglb.font = KSysFont(font(13));
    Dongwanglb.textColor = [UIColor colorWithHexString:@"#999999"];
    return Dongwanglb;
}
#pragma mark--提现
-(void)DongwangTixianBtnClick{
    
    [self.delegate DongWangMyyueFooterViewgoWithdrawWith:_DongwangCodeTextField];
}
#pragma mark--获取验证码吗
-(void)DongwangCodeBtnClick{
    [self.delegate DongWangMyyueFooterViewgetmsgCode];
}
-(void)textFieldEditingChanged:(UITextField *)textField{
    if ([[UserManager userInfo].withdrawLimit floatValue]<=[[UserManager userInfo].currentBalance floatValue]) {
        if (textField.text.length == 6) {
            _DongwangTixianBtn.enabled = YES;
            [_DongwangTixianBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];
        }else{
            _DongwangTixianBtn.enabled = NO;
            [_DongwangTixianBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            [_DongwangTixianBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
        }
    }else{
        _DongwangTixianBtn.enabled = NO;
        [_DongwangTixianBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField == _DongwangCodeTextField) {
    //这里的if时候为了获取删除操作,如果没有次if会造成当达到字数限制后删除键也不能使用的后果.
        if (range.length == 1 && string.length == 0) {
            return YES;
        }
        //so easy
        else if (_DongwangCodeTextField.text.length >= 6) {
            _DongwangCodeTextField.text = [textField.text substringToIndex:6];
            return NO;
        }
    }
    return YES;
}

@end
