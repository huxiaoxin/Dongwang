//
//  DongwangBangdingNextViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/22.
//

#import "DongwangNewBangdingNextViewController_V3.h"
#import "RITLTimer.h"
#import "DongwangLogoinViewModel.h"
#import <MFSIdentifier-umbrella.h>
#import "DongwangMyInfoViewController.h"
@interface DongwangNewBangdingNextViewController_V3 ()<UITextFieldDelegate>
@property(nonatomic,strong) UITextField * DongwangPhoneTextField;
@property(nonatomic,strong) UIButton *  DongwangCodeBtn;
@property(nonatomic,strong) UIButton *  DongwangLogoinBtn;
@property(nonatomic,strong)  NSTimer *  timer;
@property(nonatomic,assign) NSInteger Count;
@end

@implementation DongwangNewBangdingNextViewController_V3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"输入验证码";
    self.Count = 60;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F7EEFF"];

    self.gk_interactivePopDisabled = YES;
    UIImageView * DongwangBJImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, K(532.5))];
    DongwangBJImgView.image = [UIImage imageNamed:@"懂王logo背景"];
    [self.view addSubview:DongwangBJImgView];
    UIView *  Dongwanginputline = [[UIView alloc]initWithFrame:CGRectMake(K(28.5), K(232), SCREEN_WIDTH-K(47), K(0.6))];
    Dongwanginputline.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.view addSubview:Dongwanginputline];
    UIImageView * DongwangImgIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(28.5), CGRectGetMaxY(Dongwanginputline.frame)-K(10+22), K(22), K(22))];
    DongwangImgIconImgView.image = [UIImage imageNamed:@"mima"];
    [self.view addSubview:DongwangImgIconImgView];
    CGSize CodeSize = [@"重新获取(200)" cxl_sizeWithString:KSysFont(13)];
    UITextField * DongwangPhoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangImgIconImgView.frame)+K(10), CGRectGetMaxY(Dongwanginputline.frame)-K(40), CGRectGetWidth(Dongwanginputline.frame)-CGRectGetMaxX(DongwangImgIconImgView.frame)-K(20+50), K(35))];
    DongwangPhoneTextField.keyboardType   =  UIKeyboardTypePhonePad;
    DongwangPhoneTextField.clearButtonMode =  UITextFieldViewModeAlways;
    DongwangPhoneTextField.textColor = LGDBLackColor;
    DongwangPhoneTextField.font = KSysFont(16);
    DongwangPhoneTextField.delegate = self;
    DongwangPhoneTextField.attributedPlaceholder =  [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#999999"]}];
    [DongwangPhoneTextField addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:DongwangPhoneTextField];
    _DongwangPhoneTextField = DongwangPhoneTextField;
    
    
    UIButton *  DongwangCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-CodeSize.width-K(28.5), CGRectGetMaxY(Dongwanginputline.frame)-K(30), CodeSize.width, K(20))];
    [DongwangCodeBtn setTitle:@"重新获取(60s)" forState:UIControlStateNormal];
    DongwangCodeBtn.titleLabel.font = KSysFont(13);
    [DongwangCodeBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    [DongwangCodeBtn addTarget:self action:@selector(DongwangCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:DongwangCodeBtn];
    _DongwangCodeBtn = DongwangCodeBtn;

    MJWeakSelf;
    dispatch_async(dispatch_get_main_queue(), ^{
        self.timer = [RITLTimer scheduledTimerWithTimeInterval:1 userInfo:nil repeats:YES BlockHandle:^(id  _Nonnull info) {
        weakSelf.Count --;
        if (weakSelf.Count == 0) {
            [weakSelf.timer invalidate];
            weakSelf.timer = nil;
            weakSelf.Count = 60;
            weakSelf.DongwangCodeBtn.enabled = YES;
            [weakSelf.DongwangCodeBtn setTitle:@"重新获取" forState:UIControlStateNormal];
        }else{
        weakSelf.DongwangCodeBtn.enabled = NO;
        [weakSelf.DongwangCodeBtn setTitle:[NSString stringWithFormat:@"重新获取(%lds)",weakSelf.Count] forState:UIControlStateNormal];
        }
    }];
        
    });
    UILabel *  Dongwangmsglb = [[UILabel alloc]initWithFrame:CGRectMake(K(28), CGRectGetMaxY(Dongwanginputline.frame)+K(10), SCREEN_WIDTH, K(18))];
    Dongwangmsglb.textColor = [UIColor colorWithHexString:@"#999999"];
    Dongwangmsglb.font = KSysFont(13);
    Dongwangmsglb.text = [NSString stringWithFormat:@"短信验证码已发送至%@",[NSString numberPhoneSuitScanf:self.phoneText strRange:NSMakeRange(3, 4)]];
    [self.view addSubview:Dongwangmsglb];


    UIButton *  DongwangLogoinBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(Dongwangmsglb.frame)+K(34), SCREEN_WIDTH-K(30), K(45))];
    [DongwangLogoinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    DongwangLogoinBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    DongwangLogoinBtn.titleLabel.font = KBlFont(15);
    [DongwangLogoinBtn setTitle:@"绑定手机号" forState:UIControlStateNormal];
    DongwangLogoinBtn.layer.cornerRadius = K(22.5);
    [DongwangLogoinBtn addTarget:self action:@selector(DongwangLogoinBtnClick) forControlEvents:UIControlEventTouchUpInside];
    DongwangLogoinBtn.layer.masksToBounds = YES;
    DongwangLogoinBtn.enabled = NO;
    [DongwangLogoinBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
    [self.view addSubview:DongwangLogoinBtn];
    _DongwangLogoinBtn = DongwangLogoinBtn;
    

}
#pragma mar--登录
-(void)DongwangLogoinBtnClick{
    if (_DongwangPhoneTextField.text.length != 6) {
    [CHShowMessageHud showMessageText:@"请输入验证码"];
    return;
    }
    [self.view endEditing:YES];
    
    MJWeakSelf;
    [DongwangLogoinViewModel CodeloginRequestWithParmterswBandinghwc:@{@"phone":self.phoneText,@"smsCode":self.smsCode,@"userId":[NSString stringWithFormat:@"%@",[UserManager userInfo].userid]}.mutableCopy RequestCuurentControlers:self logoinSuuced:^(id  _Nonnull object) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"DongwangAdressRealod" object:nil];
//        //pop到指定页面
//        for (UIViewController *controller in weakSelf.navigationController.viewControllers) {
//            if ([controller isKindOfClass:[DongwangMyInfoViewController class]]) {
//                UIViewController *A =(UIViewController *)controller;
//                [weakSelf.navigationController popToViewController:A animated:YES];
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"DongwangAdressRealod" object:nil];
//
//            }
//        }
        //复制就能用
        int index = (int)[[weakSelf.navigationController viewControllers]indexOfObject:weakSelf];
        [weakSelf.navigationController popToViewController:[weakSelf.navigationController.viewControllers objectAtIndex:(index -2)] animated:YES];
    } logoinfairler:^{
        
    }];
    
//    NSString *deviceID = [MFSIdentifier deviceID];
//    NSLog(@"deviceId: %@", deviceID);
//    NSMutableDictionary  * dongwanparmter = [NSMutableDictionary dictionary];
//    if (self.isapplelogoin) {
//        NSString * appleId = [[NSUserDefaults standardUserDefaults] objectForKey:@"userIdentifier"];
//        NSString * appleemail = [[NSUserDefaults standardUserDefaults] objectForKey:@"Appleemail"];
//        NSString * applename = [[NSUserDefaults standardUserDefaults] objectForKey:@"Appleusername"];
//        [dongwanparmter setObject:appleId forKey:@"appleId"];
//        [dongwanparmter setObject:appleemail forKey:@"email"];
//        [dongwanparmter setObject:applename forKey:@"name"];
//        [dongwanparmter setObject:@"4" forKey:@"type"];
//        [dongwanparmter setObject:_DongwangPhoneTextField.text forKey:@"smsCode"];
//        [dongwanparmter setObject:self.phoneText forKey:@"phone"];
//        [dongwanparmter setObject:@"1" forKey:@"wxSmsTip"];
//        [dongwanparmter setObject:deviceID forKey:@"deviceId"];
//    }else{
//        //type = 2 微信登录
//        //type = 5 QQ登录
//        [dongwanparmter setObject:self.Mytype forKey:@"type"];
//        [dongwanparmter setObject:_DongwangPhoneTextField.text forKey:@"smsCode"];
//        [dongwanparmter setObject:self.phoneText forKey:@"phone"];
//        [dongwanparmter setObject:@"1" forKey:@"wxSmsTip"];
//        [dongwanparmter setObject:deviceID forKey:@"deviceId"];
//    }
//    MJWeakSelf;
//    [DongwangLogoinViewModel CLShanyanLogoinWithParmters:dongwanparmter.mutableCopy RequestCuurentControlers:self logoinSuuced:^(id  _Nonnull object) {
//        [UserManager userLoginSucced];
//        [weakSelf BaseTabarRequest];
//    } logoinfairler:^{
//
//    }];

}

#pragma mark--获取验证码
-(void)DongwangCodeBtnClick{
    MJWeakSelf;
    
    [DongwangLogoinViewModel CodeloginRequestWithParmtersw:@{@"phone":self.phoneText,@"type":@"2"}.mutableCopy RequestCuurentControlers:self logoinSuuced:^(id  _Nonnull object) {
        weakSelf.Count --;
        if (weakSelf.Count == 0) {
            [weakSelf.timer invalidate];
            weakSelf.timer = nil;
            weakSelf.Count = 60;
            weakSelf.DongwangCodeBtn.enabled = YES;
            [weakSelf.DongwangCodeBtn setTitle:@"重新获取" forState:UIControlStateNormal];
        }else{
            weakSelf.DongwangCodeBtn.enabled = NO;
            [weakSelf.DongwangCodeBtn setTitle:[NSString stringWithFormat:@"重新获取(%lds)",weakSelf.Count] forState:UIControlStateNormal];
        }
    } logoinfairler:^{
    }];

}

-(void)textFieldEditingChanged:(UITextField *)DongwangTextField{
    if (DongwangTextField.text.length ==6) {
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
        else if (_DongwangPhoneTextField.text.length >= 6) {
            _DongwangPhoneTextField.text = [textField.text substringToIndex:6];
            return NO;
        }
    }
    return YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    [self.view endEditing:YES];
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

