//
//  DongwangRealAuotrViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/10.
//

#import "DongwangRealAuotrViewController.h"
#import "DongwangRealAuorView.h"
#import "DongwangMyViewModel.h"
@interface DongwangRealAuotrViewController ()<DongwangRealAuorViewDelegate>
{
    UIButton * _AddBtn;
}
@property(nonatomic,strong) UITextField * DongwangCardTextField;
@property(nonatomic,strong) UITextField * DongwangNameTextField;
@property(nonatomic,strong) DongwangRealAuorView * autorView;
@property(nonatomic,strong)  NSString * showTimeStr;
@property(nonatomic,strong)  NSString * leaveTimeStr;
@end

@implementation DongwangRealAuotrViewController

-(DongwangRealAuorView *)autorView{
    if (!_autorView) {
        _autorView = [[DongwangRealAuorView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _autorView.delegate = self;
    }
    return _autorView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"实名认证";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#804AB7"];
    self.isShowBtomImgView = NO;
    
    
    UIImageView * DongwangWhiteView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(25), RealWidth(79.5)+NaviH, SCREEN_WIDTH-RealWidth(50), RealWidth(274))];
    DongwangWhiteView.userInteractionEnabled = YES;
    DongwangWhiteView.image = [UIImage imageNamed:@"realback"];
    [self.view addSubview:DongwangWhiteView];
    
    
    
    
    
    UILabel * DongwangFirstlb = [[UILabel alloc]initWithFrame:CGRectMake(K(0), K(10), CGRectGetWidth(DongwangWhiteView.frame), K(33.5))];
    DongwangFirstlb.textAlignment = NSTextAlignmentCenter;
    DongwangFirstlb.textColor = [UIColor whiteColor];
    DongwangFirstlb.font = KBlFont(font(24));
    DongwangFirstlb.text = @"实名认证 ";
//    [DongwangWhiteView addSubview:DongwangFirstlb];
    
    
    
    CGRect DongwangmsgRect = [@"为了保障您的资金安全，请填写与您身份证一致的信息，否则不会通过审核。" cxl_sizeWithMoreString:KSysFont(font(12)) maxWidth:CGRectGetWidth(DongwangWhiteView.frame)-K(16)];
    
    UILabel * Dongwangmsglb = [[UILabel alloc]initWithFrame:CGRectMake(K(8), CGRectGetMaxY(DongwangFirstlb.frame)+K(17), DongwangmsgRect.size.width, DongwangmsgRect.size.height)];
    Dongwangmsglb.textColor = [UIColor colorWithHexString:@"#8767E9"];
    Dongwangmsglb.font = KSysFont(font(12));
    Dongwangmsglb.numberOfLines = 0;
    Dongwangmsglb.text = @"为了保障您的资金安全，请填写与您身份证一致的信息，否则不会通过审核。 ";
    [DongwangWhiteView addSubview:Dongwangmsglb];

    
    UILabel * Dongwangnamelb = [[UILabel alloc]initWithFrame:CGRectMake(K(8), CGRectGetMaxY(Dongwangmsglb.frame)+K(63.5), K(80), K(16.5))];
    Dongwangnamelb.textColor = [UIColor colorWithHexString:@"#333333"];
    Dongwangnamelb.font = KSysFont(font(12));
    Dongwangnamelb.text = @"真实姓名：";
    [DongwangWhiteView addSubview:Dongwangnamelb];

    
    UILabel * Dongwangcardlb = [[UILabel alloc]initWithFrame:CGRectMake(K(8), CGRectGetMaxY(Dongwangnamelb.frame)+K(38.5), K(80), K(16.5))];
    Dongwangcardlb.textColor = [UIColor colorWithHexString:@"#333333"];
    Dongwangcardlb.font = KSysFont(font(12));
    Dongwangcardlb.text = @"身份证号：";
    [DongwangWhiteView addSubview:Dongwangcardlb];
    
    
    
    UITextField * DongwangNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(90), CGRectGetMidY(Dongwangnamelb.frame)-K(20), SCREEN_WIDTH-K(180), K(40))];
    DongwangNameTextField.tag = 0;
//    DongwangNameTextField.backgroundColor = LGDRedColor;
    DongwangNameTextField.textColor = [UIColor blackColor];
    DongwangNameTextField.font = KSysFont(font(15));
    DongwangNameTextField.clearButtonMode = UITextFieldViewModeAlways;
    DongwangNameTextField.keyboardType = UIKeyboardTypeDefault;
    DongwangNameTextField.attributedPlaceholder =  [[NSAttributedString alloc] initWithString:@"请填写您本人的真实姓名" attributes:@{NSFontAttributeName:KSysFont(font(12)),NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#999999"]}];
    [DongwangWhiteView addSubview:DongwangNameTextField];
    [DongwangNameTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    _DongwangNameTextField = DongwangNameTextField;
    
    UIView * NameView = [[UIView alloc]initWithFrame:CGRectMake(K(90), CGRectGetMaxY(DongwangNameTextField.frame), SCREEN_WIDTH-K(180), K(1))];
    NameView.backgroundColor = LGDLightGaryColor;
    [DongwangWhiteView addSubview:NameView];
    
    
    UITextField * DongwangCardTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(90), CGRectGetMidY(Dongwangcardlb.frame)-K(20), SCREEN_WIDTH-K(180), K(40))];
    DongwangCardTextField.tag =1;
    DongwangCardTextField.textColor = [UIColor blackColor];
    DongwangCardTextField.font = KSysFont(font(15));
    DongwangCardTextField.clearButtonMode = UITextFieldViewModeAlways;
    DongwangCardTextField.keyboardType = UIKeyboardTypeDefault;
    DongwangCardTextField.attributedPlaceholder =  [[NSAttributedString alloc] initWithString:@"请填写您本人的身份证号" attributes:@{NSFontAttributeName:KSysFont(font(12)),NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#999999"]}];
    [DongwangWhiteView addSubview:DongwangCardTextField];
    _DongwangCardTextField = DongwangCardTextField;
    
    UIView * CardView = [[UIView alloc]initWithFrame:CGRectMake(K(90), CGRectGetMaxY(DongwangCardTextField.frame), SCREEN_WIDTH-K(180), K(1))];
    CardView.backgroundColor = LGDLightGaryColor;
    [DongwangWhiteView addSubview:CardView];
    
    [DongwangCardTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

    
    UIButton * AddBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(28), CGRectGetMaxY(DongwangWhiteView.frame)+K(63.5), SCREEN_WIDTH-K(56), K(45))];
//    [AddBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];
    [AddBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
    AddBtn.enabled = NO;
    AddBtn.layer.cornerRadius = K(22.5);
    AddBtn.layer.masksToBounds = YES;
    [AddBtn addTarget:self action:@selector(AddBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [AddBtn setTitle:@"提交认证" forState:UIControlStateNormal];
    AddBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [AddBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    AddBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:AddBtn];
    _AddBtn  = AddBtn;
    
    

    
    
    // Do any additional setup after loading the view.
}
-(void)textFieldDidChange:(UITextField *)textField{
    NSLog(@"%@ %ld",textField.text,textField.tag);
    NSLog(@"%@ ----%@",_DongwangNameTextField.text,_DongwangCardTextField.text);
    if (_DongwangNameTextField.text.length != 0 && _DongwangCardTextField.text.length != 0) {
        [_AddBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];
        _AddBtn.enabled = YES;
    }else{

        _AddBtn.enabled = NO;
        [_AddBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    
}
-(void)AddBtnClick{
    NSLog(@"%s",__func__);
   
    if (![_DongwangCardTextField.text isValidIdCardNum]) {
        [CHShowMessageHud showMessageText:@"身份证号格式错误"];
        return;
    }
    
    //认证成功按钮
    [[DataBuried ShareManager] CLLogoninWithParmesWithShowTimeStr:[NSString currentTimeStr] LeaveTimeStr:[NSString currentTimeStr] ViewPageName:12];
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithrealAuth:@{@"idCard":[_DongwangCardTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""],@"name":[_DongwangNameTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""],@"userId":[NSString stringWithFormat:@"%@",[UserManager userInfo].userid]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        
//        [weakSelf.view addSubview:wea/zkSelf.autorView];
        [weakSelf.autorView show];
    } Deleaccountfairler:^(id  _Nonnull message) {
    }];
 
    
    
}
#pragma mark--v
-(void)DongwangRealAuorViewSucced{
    if (self.autoreBlock) {
        self.autoreBlock();
    }
[self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.view endEditing:YES];
    self.showTimeStr = [NSString currentTimeStr];
  
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

    self.leaveTimeStr =  [NSString currentTimeStr];
    [[DataBuried ShareManager] CLLogoninWithParmesWithShowTimeStr:self.showTimeStr LeaveTimeStr:self.leaveTimeStr ViewPageName:7];
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
