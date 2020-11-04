//
//  DongwangCodeloginNextViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/22.
//

#import "DongwangCodeloginNextViewController.h"
#import "RITLTimer.h"
#import "DongwangTabbarModel.h"
#import "DongwangBaseTabBarViewController.h"
#import "DongwangLogoinViewModel.h"
@interface DongwangCodeloginNextViewController ()<UITextFieldDelegate>
@property(nonatomic,strong) UIButton *  DongwangCodeBtn;
@property(nonatomic,strong) UITextField * DongwangPhoneTextField;
@property(nonatomic,strong) UIButton *  DongwangLogoinBtn;
@property(nonatomic,strong)  NSTimer *  timer;
@property(nonatomic,assign) NSInteger Count;

@end

@implementation DongwangCodeloginNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"输入验证码";
    self.Count = 60;
//    self.gk_interactivePopDisabled = YES;
    UIImageView * DongwangBJImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, NaviH+K(21), SCREEN_Width, K(532.5))];
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
    
    
    UIView *  Dongwanginputline = [[UIView alloc]initWithFrame:CGRectMake(K(28.5), CGRectGetMaxY(DongwangLogoTitle.frame)+K(91.5), SCREEN_WIDTH-K(47), K(0.6))];
    Dongwanginputline.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.view addSubview:Dongwanginputline];
    
    UIImageView * DongwangImgIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(28.5), CGRectGetMaxY(Dongwanginputline.frame)-K(10+22), K(22), K(22))];
    DongwangImgIconImgView.image = [UIImage imageNamed:@"mima"];
    DongwangImgIconImgView.backgroundColor = LGDMianColor;
    [self.view addSubview:DongwangImgIconImgView];
    
    CGSize CodeSize = [@"重新获取(200)" cxl_sizeWithString:KSysFont(13)];
    UITextField * DongwangPhoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangImgIconImgView.frame)+K(10), CGRectGetMaxY(Dongwanginputline.frame)-K(37), CGRectGetWidth(Dongwanginputline.frame)-CGRectGetMaxX(DongwangImgIconImgView.frame)-K(20+50), K(35))];
    DongwangPhoneTextField.delegate = self;
    DongwangPhoneTextField.keyboardType   =  UIKeyboardTypePhonePad;
    DongwangPhoneTextField.clearButtonMode =  UITextFieldViewModeAlways;
    DongwangPhoneTextField.textColor = LGDBLackColor;
    DongwangPhoneTextField.font = KSysFont(16);
    DongwangPhoneTextField.attributedPlaceholder =  [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#999999"]}];
    [DongwangPhoneTextField addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:DongwangPhoneTextField];
    _DongwangPhoneTextField = DongwangPhoneTextField;
    
    UIButton *  DongwangCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-CodeSize.width-kWidth(25), CGRectGetMaxY(Dongwanginputline.frame)-K(30), CodeSize.width, K(20))];
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
    [DongwangLogoinBtn setTitle:@"登录" forState:UIControlStateNormal];
    DongwangLogoinBtn.layer.cornerRadius = K(22.5);
    [DongwangLogoinBtn addTarget:self action:@selector(DongwangLogoinBtnClick) forControlEvents:UIControlEventTouchUpInside];
    DongwangLogoinBtn.layer.masksToBounds = YES;
    DongwangLogoinBtn.enabled = NO;
    [DongwangLogoinBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
    [self.view addSubview:DongwangLogoinBtn];
    _DongwangLogoinBtn = DongwangLogoinBtn;
    
    // Do any additional setup after loading the view.
}
#pragma mar--登录
-(void)DongwangLogoinBtnClick{
    [self.view endEditing:YES];
    //登录成功 加载请求动态加载tabbar
    kWeakSelf(self);
    [DongwangLogoinViewModel CLShanyanLogoinWithParmters:@{@"type":@"1",@"flashToken":@"",@"device":@"1",@"smsCode":[_DongwangPhoneTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""],@"phone":self.phoneText}.mutableCopy RequestCuurentControlers:self logoinSuuced:^{
        [UserManager userLoginSucced];
        [weakself tabarRequest];
    } logoinfairler:^{
    }];
}
-(void)tabarRequest{
    NSDictionary *postHeader = [EncryptionTool getSignatureTimestamp];
    NSString *url = [NSString stringWithFormat:@"%@/rest/home/tab", BASE_IPURL];
    kWeakSelf(self);
    [CHShowMessageHud showHUDPlainText:@"" view:self.view];
    [AFNetworkTool GET:url HttpHeader:postHeader Parameters:nil Success:^(id responseObject) {
        [CHShowMessageHud dismissHideHUD:self.view];
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSLog(@"动态：%@",dic);
        if ([dic[@"err"] isEqualToString:@"00000"]) {
            NSDictionary *tempData = (NSDictionary *)dic[@"dat"];
            DongwangTabbarModel * model = [DongwangTabbarModel BaseinitWithDic:tempData];
            [weakself loadHomeTabbarWithTabbarModel:model];
        } else {
            [weakself loadHomeTabbarWithTabbarModel:nil];
        }
    } Failure:^(NSError *error) {
        [CHShowMessageHud dismissHideHUD:self.view];
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

#pragma mark--获取验证码
-(void)DongwangCodeBtnClick{
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
}
-(void)textFieldEditingChanged:(UITextField *)DongwangTextField{
    if (_DongwangPhoneTextField.text.length ==6) {
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
//    if (self.timer) {
//        [self.timer invalidate];
//        self.timer = nil;
//    }
//    [self.view endEditing:YES];
}
-(void)dealloc{
    NSLog(@"--%s",__func__);
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
