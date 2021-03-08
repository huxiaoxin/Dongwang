//
//  DongwangadviceViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/10.
//

#import "DongwangadviceViewController.h"
#import <UITextView+ZWPlaceHolder.h>
#import "DongwangMyViewModel.h"
@interface DongwangadviceViewController ()<UITextFieldDelegate>
{
    UITextField * _DongwangPhoneTextField;
    UITextView * _DongwangTextView;
    UIButton * _AddBtn;
}
@end

@implementation DongwangadviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"意见反馈";
    self.view.backgroundColor  = [UIColor colorWithHexString:@"#804AB7"];
    self.isShowBtomImgView = NO;
    UILabel * DongwangFirstlb = [[UILabel alloc]initWithFrame:CGRectMake(K(13.5), NaviH+K(31), K(200), K(24))];
    DongwangFirstlb.textColor = [UIColor whiteColor];
    DongwangFirstlb.font = KBlFont(font(17));
    DongwangFirstlb.text = @"反馈内容";
    [self.view addSubview:DongwangFirstlb];
    
    
    UIImageView * DongwangContentTextView =  [[UIImageView alloc]initWithFrame:CGRectMake(K(15.5), CGRectGetMaxY(DongwangFirstlb.frame)+K(12), SCREEN_WIDTH-K(31), K(168))];
    DongwangContentTextView.image = [UIImage imageNamed:@"意见反馈背景"];
    DongwangContentTextView.userInteractionEnabled = YES;
    [self.view addSubview:DongwangContentTextView];
    
    UITextView * DongwangTextView = [[UITextView alloc]initWithFrame:CGRectMake(K(5), K(5), CGRectGetWidth(DongwangContentTextView.frame)-K(10), CGRectGetHeight(DongwangContentTextView.frame)-K(10))];
    DongwangTextView.backgroundColor = [UIColor clearColor];
    DongwangTextView.font = KSysFont(font(12));
    DongwangTextView.zw_placeHolderColor = [UIColor colorWithHexString:@"#999999"];
    DongwangTextView.placeholder = @"如果您在使用的过程中遇到任何问题，请在此处向我们提交，期待您的宝贵意见。";
    DongwangTextView.textColor = [UIColor blackColor];
    [DongwangContentTextView addSubview:DongwangTextView];
    _DongwangTextView = DongwangTextView;
    
    
    UILabel * DongwangSecondlb = [[UILabel alloc]initWithFrame:CGRectMake(K(13.5), CGRectGetMaxY(DongwangContentTextView.frame)+K(36), K(200), K(24))];
    DongwangSecondlb.textColor = [UIColor whiteColor];
    DongwangSecondlb.font = KBlFont(font(17));
    DongwangSecondlb.text = @"联系方式";
    [self.view addSubview:DongwangSecondlb];
    
    
    UIImageView * DongwangPhoneTextView =  [[UIImageView alloc]initWithFrame:CGRectMake(K(15.5), CGRectGetMaxY(DongwangSecondlb.frame)+K(12.5), SCREEN_WIDTH-K(31), K(48))];
    DongwangPhoneTextView.image = [UIImage imageNamed:@"意见反馈联系方式"];
    DongwangPhoneTextView.userInteractionEnabled = YES;
    [self.view addSubview:DongwangPhoneTextView];
    
    
    UITextField * DongwangPhoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(8), 0, CGRectGetWidth(DongwangPhoneTextView.frame)-K(16), CGRectGetHeight(DongwangPhoneTextView.frame))];
    DongwangPhoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    DongwangPhoneTextField.font = KSysFont(font(12));
    DongwangPhoneTextField.clearButtonMode =  UITextFieldViewModeAlways;
    DongwangPhoneTextField.attributedPlaceholder =  [[NSAttributedString alloc] initWithString:@"为方便及时与您取得联系，请留下您的手机号。" attributes:@{NSFontAttributeName:KSysFont(font(12)),NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#999999"]}];
    DongwangPhoneTextField.textColor = [UIColor blackColor];
    DongwangPhoneTextField.delegate = self;
    [DongwangPhoneTextView addSubview:DongwangPhoneTextField];
    [DongwangPhoneTextField addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];

    _DongwangPhoneTextField = DongwangPhoneTextField;
    
    
    UIButton * AddBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(28), CGRectGetMaxY(DongwangPhoneTextView.frame)+K(55), SCREEN_WIDTH-K(56), K(45))];
    AddBtn.layer.cornerRadius = K(22.5);
    AddBtn.layer.masksToBounds = YES;
    [AddBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
    [AddBtn addTarget:self action:@selector(AddBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [AddBtn setTitle:@"确认提交" forState:UIControlStateNormal];
    AddBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [AddBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    AddBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:AddBtn];
    _AddBtn = AddBtn;
    
    
    // Do any additional setup after loading the view.
}
-(void)textFieldEditingChanged:(UITextField *)InputTextField{
    NSLog(@"1212");
    if (_DongwangTextView.text > 0 && InputTextField.text > 0) {
        [_AddBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];
    }else{
        [_AddBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
        [_AddBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];

    }
    
}
-(void)AddBtnClick{
    [self.view endEditing:YES];
    if (_DongwangTextView.text.length == 0) {
        [CHShowMessageHud showMessageText:@"请输入内容"];
        return;
    }
    
    if (_DongwangPhoneTextField.text.length == 0) {
        [CHShowMessageHud showMessageText:@"请输入联系手机号"];
        return;
    }
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithMyfeedBack:@{@"content":[_DongwangTextView.text stringByReplacingOccurrencesOfString:@" " withString:@""],@"contactWay":[_DongwangPhoneTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
    [weakSelf.navigationController popViewControllerAnimated:YES];
    } Deleaccountfairler:^(id  _Nonnull message) {
        
    }];
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
