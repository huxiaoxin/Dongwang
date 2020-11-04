//
//  DongwangBangdingNextViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/22.
//

#import "DongwangBangdingNextViewController.h"
#import "RITLTimer.h"

@interface DongwangBangdingNextViewController ()
@property(nonatomic,strong) UITextField * DongwangPhoneTextField;
@property(nonatomic,strong) UIButton *  DongwangCodeBtn;
@property(nonatomic,strong) UIButton *  DongwangLogoinBtn;
@property(nonatomic,strong)  NSTimer *  timer;
@property(nonatomic,assign) NSInteger Count;
@end

@implementation DongwangBangdingNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"输入验证码";
    self.Count = 60;
    self.gk_interactivePopDisabled = YES;

    UIImageView * DongwangBJImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, K(532.5))];
    DongwangBJImgView.image = [UIImage imageNamed:@"懂王logo背景"];
    [self.view addSubview:DongwangBJImgView];
//
    UIView *  Dongwanginputline = [[UIView alloc]initWithFrame:CGRectMake(K(28.5), K(232), SCREEN_WIDTH-K(47), K(0.6))];
    Dongwanginputline.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    [self.view addSubview:Dongwanginputline];
//
    UIImageView * DongwangImgIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(28.5), CGRectGetMaxY(Dongwanginputline.frame)-K(10+22), K(22), K(22))];
    DongwangImgIconImgView.image = [UIImage imageNamed:@"mima"];
    [self.view addSubview:DongwangImgIconImgView];
//
    CGSize CodeSize = [@"重新获取(200)" cxl_sizeWithString:KSysFont(13)];
    UITextField * DongwangPhoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangImgIconImgView.frame)+K(10), CGRectGetMaxY(Dongwanginputline.frame)-K(40), CGRectGetWidth(Dongwanginputline.frame)-CGRectGetMaxX(DongwangImgIconImgView.frame)-K(20+50), K(35))];
    DongwangPhoneTextField.keyboardType   =  UIKeyboardTypePhonePad;
    DongwangPhoneTextField.clearButtonMode =  UITextFieldViewModeAlways;
    DongwangPhoneTextField.textColor = LGDBLackColor;
    DongwangPhoneTextField.font = KSysFont(16);
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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    });
    
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
    if (DongwangTextField.text.length ==4) {
        _DongwangLogoinBtn.enabled = YES;
        [_DongwangLogoinBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];

    }else{
        [_DongwangLogoinBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        _DongwangLogoinBtn.enabled = NO;
        [_DongwangLogoinBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
    }
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
