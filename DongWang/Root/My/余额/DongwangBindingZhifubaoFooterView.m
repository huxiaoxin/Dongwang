//
//  DongwangBindingZhifubaoFooterView.m
//  DongWang
//
//  Created by codehzx on 2020/11/11.
//

#import "DongwangBindingZhifubaoFooterView.h"
@interface DongwangBindingZhifubaoFooterView ()<UITextFieldDelegate>

@end
@implementation DongwangBindingZhifubaoFooterView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel * Dongwangrightlb = [[UILabel alloc]initWithFrame:CGRectMake(K(28.5), K(24), K(100), K(18.5))];
        Dongwangrightlb.text =  @"验证码：";
        Dongwangrightlb.font = KSysFont(font(13));
        Dongwangrightlb.textColor = [UIColor colorWithHexString:@"#333333"];
//        [self addSubview:Dongwangrightlb];
        
        UIView * Dongwangline = [[UIView alloc]initWithFrame:CGRectMake(K(102), K(55.5), SCREEN_WIDTH-K(122), K(1))];
        Dongwangline.backgroundColor = LGDLightGaryColor;
//        [self addSubview:Dongwangline];
        
        UITextField * DongwangCodeTextField = [[UITextField alloc]initWithFrame:CGRectMake((111.5), K(15), K(150), K(35))];
        DongwangCodeTextField.attributedPlaceholder =  [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSFontAttributeName:KSysFont(font(12)),NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#999999"]}];
        DongwangCodeTextField.delegate = self;
        [DongwangCodeTextField addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
        DongwangCodeTextField.keyboardType =  UIKeyboardTypeNumberPad;
        DongwangCodeTextField.font = KSysFont(font(12));
        DongwangCodeTextField.textColor =  [UIColor colorWithHexString:@"#999999"];
        DongwangCodeTextField.clearButtonMode =  UITextFieldViewModeAlways;
//        [self addSubview:DongwangCodeTextField];
//        _DongwangCodeTextField = DongwangCodeTextField;
        
        
        UIButton *  DongwangCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(260), K(20), K(85.5), K(27.5))];
        DongwangCodeBtn.layer.cornerRadius = K(13.75);
        DongwangCodeBtn.layer.masksToBounds = YES;
        [DongwangCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        DongwangCodeBtn.titleLabel.font = KSysFont(font(11));
        DongwangCodeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [DongwangCodeBtn setBackgroundColor:[UIColor colorWithHexString:@"#8767E9"]];
        [DongwangCodeBtn setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
        [DongwangCodeBtn addTarget:self action:@selector(DongwangCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:DongwangCodeBtn];
//        _DongwangCodeBtn = DongwangCodeBtn;
        
        UIButton *  DongwangTixianBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(28.5), CGRectGetMaxY(Dongwangline.frame)+K(154), SCREEN_WIDTH-K(57), K(45))];
        [DongwangTixianBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [DongwangTixianBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];
        DongwangTixianBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        DongwangTixianBtn.titleLabel.font = KBlFont(15);
        [DongwangTixianBtn setTitle:@"立即绑定" forState:UIControlStateNormal];
        DongwangTixianBtn.layer.cornerRadius = K(22.5);
        [DongwangTixianBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
        [DongwangTixianBtn addTarget:self action:@selector(DongwangTixianBtnClick) forControlEvents:UIControlEventTouchUpInside];
        DongwangTixianBtn.layer.masksToBounds = YES;
        DongwangTixianBtn.enabled = NO;
        [self addSubview:DongwangTixianBtn];
        _DongwangTixianBtn = DongwangTixianBtn;
    }
    return self;
}
-(void)textFieldEditingChanged:(UITextField *)textField{
    [self.delegate DongwangBindingZhifubaoFooterViewTextFieldexdingWithText:textField.text];
}
#pragma mark--获取yanzm
-(void)DongwangCodeBtnClick{
[self.delegate DongwangBindingZhifubaoFooterViewgetmsgCode];
}
#pragma mark--立即绑定
-(void)DongwangTixianBtnClick{
    [self.delegate DongwangBindingZhifubaoFooterViewBingdingZhifubao];
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
