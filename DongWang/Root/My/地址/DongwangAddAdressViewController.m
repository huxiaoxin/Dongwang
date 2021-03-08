//
//  DongwangAddAdressViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/9.
//

#import "DongwangAddAdressViewController.h"
#import <UITextView+ZWPlaceHolder.h>
#import "CHAddressPickerView.h"
#import "DongwangMyViewModel.h"
#import "DongwangDeleteaAdressAlterView.h"
@interface DongwangAddAdressViewController ()<DongwangDeleteaAdressAlterViewDelegate,UITextFieldDelegate>
@property (nonatomic, strong)NSArray *cityDataArray; // 省市区数据
@property (nonatomic, strong)AddShippingAddressListModel *provinceAddModel; // 省份的model数据
@property (nonatomic, strong)AddShippingAddressListModel *cityAddModel; // 市的model数据
@property (nonatomic, strong)AddShippingAddressListModel *areaAddModel; // 区的model数据
@property (nonatomic, strong) UITextField * DongwangNameTextField;
@property (nonatomic, strong) UITextField * DongwangPhoneTextField;
@property (nonatomic, strong) UITextField * DongwangAdressTextField;
@property (nonatomic, strong) UITextView * DongwangTextDetailAdressTexView;
@property(nonatomic,assign) BOOL  isDefaultAdress;
@property(nonatomic,strong) DongwangDeleteaAdressAlterView * DongwangAlterView;
@property(nonatomic,strong) NSMutableArray * DongwangDataArr;
@property(nonatomic,strong) UIButton * AddBtn;
@end

@implementation DongwangAddAdressViewController
-(NSMutableArray *)DongwangDataArr{
    if (!_DongwangDataArr) {
        _DongwangDataArr = [[NSMutableArray alloc]initWithArray:@[@"",@"",@"",@""]];
    }
    return _DongwangDataArr;
}
- (AddShippingAddressListModel *)provinceAddModel {
    if (!_provinceAddModel) {
        _provinceAddModel = [[AddShippingAddressListModel alloc] init];
    }
    return _provinceAddModel;
}

- (AddShippingAddressListModel *)cityAddModel {
    if (!_cityAddModel) {
        _cityAddModel = [[AddShippingAddressListModel alloc] init];
    }
    return _cityAddModel;
}
- (AddShippingAddressListModel *)areaAddModel {
    if (!_areaAddModel) {
        _areaAddModel = [[AddShippingAddressListModel alloc] init];
    }
    return _areaAddModel;
}
-(DongwangDeleteaAdressAlterView *)DongwangAlterView{
    if (!_DongwangAlterView) {
        _DongwangAlterView = [[DongwangDeleteaAdressAlterView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _DongwangAlterView.delegate = self;
    }
    return _DongwangAlterView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#E5DAF0"];
    [self DongwangAdressInfo];
    self.gk_navTitle = ![NSString isBlankString:[NSString stringWithFormat:@"%@",self.shipingListModel.uid]] ? @"编辑收货地址" : @"添加收货地址";
    UIView * FirstlineView = [self DongwangConfigerWithline:CGRectMake(K(23), NaviH+K(45.5), SCREEN_WIDTH-K(46), K(1))];
    [self.view addSubview:FirstlineView];
    
    UIView * SecondlineView = [self DongwangConfigerWithline:CGRectMake(K(23), CGRectGetMaxY(FirstlineView.frame)+K(45.5), SCREEN_WIDTH-K(46), K(1))];
    [self.view addSubview:SecondlineView];
    
    UIView * ThreelineView = [self DongwangConfigerWithline:CGRectMake(K(23), CGRectGetMaxY(SecondlineView.frame)+K(45.5), SCREEN_WIDTH-K(46), K(1))];
    [self.view addSubview:ThreelineView];
    
    UIView * FourelineView = [self DongwangConfigerWithline:CGRectMake(K(23), CGRectGetMaxY(ThreelineView.frame)+K(70.5), SCREEN_WIDTH-K(46), K(1))];
    [self.view addSubview:FourelineView];
    
    UIView * FivelineView = [self DongwangConfigerWithline:CGRectMake(K(23), CGRectGetMaxY(FourelineView.frame)+K(45.5), SCREEN_WIDTH-K(46), K(1))];
    [self.view addSubview:FivelineView];

    UILabel * Firstleftlb = [self DongwangConfigersWithleftlb:@"收货人" lbFrame:CGRectMake(K(22.5), K(12.5)+NaviH, K(80), K(21))];
    [self.view addSubview:Firstleftlb];
    
    UILabel * Secondleftlb = [self DongwangConfigersWithleftlb:@"手机号码" lbFrame:CGRectMake(K(22.5), K(10.5)+CGRectGetMaxY(FirstlineView.frame), K(80), K(21))];
    [self.view addSubview:Secondleftlb];

    UILabel * Threeleftlb = [self DongwangConfigersWithleftlb:@"所在地区" lbFrame:CGRectMake(K(22.5), K(10.5)+CGRectGetMaxY(SecondlineView.frame), K(80), K(21))];
    [self.view addSubview:Threeleftlb];
    
    UILabel * Foureleftlb = [self DongwangConfigersWithleftlb:@"详细地址" lbFrame:CGRectMake(K(22.5), K(10.5)+CGRectGetMaxY(ThreelineView.frame), K(80), K(21))];
    [self.view addSubview:Foureleftlb];

    
    UILabel * Fiveleftlb = [self DongwangConfigersWithleftlb:@"设为默认地址" lbFrame:CGRectMake(K(22.5), K(10.5)+CGRectGetMaxY(FourelineView.frame), K(100), K(21))];
    [self.view addSubview:Fiveleftlb];


    
    UITextField * DongwangNameTextField = [self DongwangTextFieldConfigerWithHolderText:@"请输入姓名" FieldFrame:CGRectMake(K(100), NaviH, K(250), K(45)) KeyBoaryType:UIKeyboardTypeDefault];
    DongwangNameTextField.delegate = self;
    DongwangNameTextField.tag = 0;
    [DongwangNameTextField addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:DongwangNameTextField];
    _DongwangNameTextField = DongwangNameTextField;
    
    
    UITextField * DongwangPhoneTextField = [self DongwangTextFieldConfigerWithHolderText:@"请输入手机号" FieldFrame:CGRectMake(K(100), CGRectGetMaxY(FirstlineView.frame), K(250), K(45)) KeyBoaryType:UIKeyboardTypeNumberPad];
    DongwangPhoneTextField.delegate = self;
    DongwangPhoneTextField.tag = 1;
    [DongwangPhoneTextField addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:DongwangPhoneTextField];
    _DongwangPhoneTextField = DongwangPhoneTextField;
    

    UITextField * DongwangAdressTextField = [self DongwangTextFieldConfigerWithHolderText:@"请输入所在地区" FieldFrame:CGRectMake(K(100), CGRectGetMaxY(SecondlineView.frame), K(250), K(45)) KeyBoaryType:UIKeyboardTypeDefault];
    DongwangAdressTextField.delegate = self;
    DongwangAdressTextField.tag = 2;
    DongwangAdressTextField.enabled = NO;
    [DongwangAdressTextField addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];

    [self.view addSubview:DongwangAdressTextField];
    _DongwangAdressTextField=  DongwangAdressTextField;
    
    
    UIImageView * DongwangRightImgView  = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-K(6.46+23), CGRectGetMaxY(SecondlineView.frame)+K(16.5), K(6.46), K(10.6))];
    DongwangRightImgView.image = [UIImage imageNamed:@"Fill2_black"];
    DongwangRightImgView.userInteractionEnabled = YES;
    
    [self.view addSubview:DongwangRightImgView];
    
    UIButton  * DonwangAdressBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(100), CGRectGetMaxY(SecondlineView.frame), K(250), K(45))];
    [DonwangAdressBtn addTarget:self action:@selector(DonwangAdressBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:DonwangAdressBtn];
    
    
    UITextView * DongwangTextDetailAdressTexView = [[UITextView alloc]initWithFrame:CGRectMake(K(100), CGRectGetMaxY(ThreelineView.frame)+K(6), K(250), K(62))];
    DongwangTextDetailAdressTexView.backgroundColor = [UIColor clearColor];
    DongwangTextDetailAdressTexView.font = KSysFont(font(14));
    DongwangTextDetailAdressTexView.placeholder = @"街道，小区，门牌号等";
    DongwangTextDetailAdressTexView.zw_placeHolderColor = LGDBLackColor;
    DongwangTextDetailAdressTexView.textColor = LGDBLackColor;
    [self.view addSubview:DongwangTextDetailAdressTexView];
    _DongwangTextDetailAdressTexView = DongwangTextDetailAdressTexView;
    
    UISwitch * defaultswitch = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-K(70+15), CGRectGetMaxY(FourelineView.frame)+K(8), K(60), K(30))];
    [defaultswitch addTarget:self action:@selector(defaultswitchClicks:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:defaultswitch];
    if ([NSString isBlankString:[NSString stringWithFormat:@"%@",self.shipingListModel.uid]]) {
        //添加收货地址
        self.isDefaultAdress =  NO;
        defaultswitch.on = NO;
    }else{
        //编辑收货地址
        if ([[NSString stringWithFormat:@"%@",self.shipingListModel.defaultReceiveAddress] isEqualToString:@"0"]) {
            defaultswitch.on = YES;
            self.isDefaultAdress = YES;
        }else{
            self.isDefaultAdress = NO;
            defaultswitch.on = NO;
        }
    }
    
    
    CGSize DongwangDelebtnSize=  [@"删除收货地址" cxl_sizeWithString:KSysFont(font(14))];
    UIButton * DongwangDelebtn = [[UIButton alloc]initWithFrame:CGRectMake(K(22), CGRectGetMaxY(FivelineView.frame)+K(13), DongwangDelebtnSize.width, K(20))];
    [DongwangDelebtn addTarget:self action:@selector(DongwangDelebtnClick) forControlEvents:UIControlEventTouchUpInside];
    [DongwangDelebtn setTitle:@"删除收货地址" forState:UIControlStateNormal];
    DongwangDelebtn.titleLabel.font = KSysFont(font(14));
    [DongwangDelebtn setTitleColor:[UIColor colorWithHexString:@"#E02020"] forState:UIControlStateNormal];
    if ([NSString isBlankString:[NSString stringWithFormat:@"%@",self.shipingListModel.uid]]) {
        DongwangDelebtn.hidden = YES;
    }else{
        DongwangDelebtn.hidden = NO;
    }
    [self.view addSubview:DongwangDelebtn];
    

    UIButton * AddBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(28), CGRectGetMaxY(FivelineView.frame)+K(126.5), SCREEN_WIDTH-K(56), K(45))];
    [AddBtn addTarget:self action:@selector(AddBtnClick) forControlEvents:UIControlEventTouchUpInside];
    AddBtn.layer.cornerRadius = K(22.5);
    AddBtn.layer.masksToBounds = YES;
    [AddBtn setTitle:@"保存" forState:UIControlStateNormal];
    AddBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [AddBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    AddBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:AddBtn];
    _AddBtn = AddBtn;
    if ([NSString isBlankString:[NSString stringWithFormat:@"%@",self.shipingListModel.uid]]) {
//        DongwangDelebtn.hidden = YES;
        //添加
    
        [AddBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];

    }else{
        
        [AddBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];
       // _DongwangLogoinBtn.enabled = NO;

        //bianianji
    }
    
}
-(void)textFieldEditingChanged:(UITextField *)InputTextField{
    //[InputTextField.text isValidPhoneNum]
    NSLog(@"----%@",InputTextField.text);
    
    
    if (InputTextField.tag == 0) {
        //姓名
        [self.DongwangDataArr replaceObjectAtIndex:0 withObject:InputTextField.text];
    }else if (InputTextField.tag == 1){
        //手机号
        [self.DongwangDataArr replaceObjectAtIndex:1 withObject:InputTextField.text];

    }else if (InputTextField.tag == 2){
        //所在地
        [self.DongwangDataArr replaceObjectAtIndex:2 withObject:InputTextField.text];

    }
    
    NSString * firstStr =  self.DongwangDataArr.firstObject;
    NSString * secondStr = [self.DongwangDataArr objectAtIndex:1];
    NSString * threeStr = [self.DongwangDataArr objectAtIndex:2];
    NSString * foureStr = [self.DongwangDataArr objectAtIndex:3];
    NSLog(@"%@-%@-%@",firstStr,secondStr,threeStr);
    if (firstStr.length > 0 & secondStr.length > 0 & threeStr.length > 0 ) {
        [_AddBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];
    }else{
        [_AddBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
    }
}

-(void)defaultswitchClicks:(UISwitch *)myswitch{
    if (myswitch.on) {
        self.isDefaultAdress = YES;
    }else{
        self.isDefaultAdress = NO;
    }
    
}
#pragma mark--删除默认地址
-(void)DongwangDelebtnClick{
    [_DongwangAlterView removeFromSuperview];
    _DongwangAlterView = nil;
    [self.DongwangAlterView show];
}
#pragma mark--保存
-(void)AddBtnClick{


    
    if (_DongwangNameTextField.text.length == 0) {
        [CHShowMessageHud showMessageText:@"请填写收货人姓名"];
        return;
    }
    if (_DongwangPhoneTextField.text.length == 0) {
        [CHShowMessageHud showMessageText:@"请填写手机号"];
        return;
    }
    if (![[_DongwangPhoneTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""] isValidPhoneNum]) {
        [CHShowMessageHud showMessageText:@"手机号格式有误"];
        return;
    }

    if (_DongwangAdressTextField.text.length == 0) {
        [CHShowMessageHud showMessageText:@"请选择所在小区"];
        return;
    }
    if (_DongwangTextDetailAdressTexView.text.length == 0) {
        [CHShowMessageHud showMessageText:@"请选择详细地址"];
        return;
    }
    [self.view endEditing:YES];
    
    
    
    if (![NSString isBlankString:[NSString stringWithFormat:@"%@",self.shipingListModel.uid]]) {
        //编辑收货地址
        MJWeakSelf;
        [DongwangMyViewModel DongwangMyViewModelWitheditAdress:@{@"id":[NSString stringWithFormat:@"%@",self.shipingListModel.uid],@"userName":[_DongwangNameTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""],@"phone":[_DongwangPhoneTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""],@"area":[_DongwangAdressTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""],@"detailAddress":_DongwangTextDetailAdressTexView.text,@"defaultReceiveAddress":self.isDefaultAdress ? @"0" : @"1",@"provinceCode":[NSString stringWithFormat:@"%@",self.provinceAddModel.code],@"cityCode":[NSString stringWithFormat:@"%@",self.cityAddModel.code],@"countyCode":[NSString stringWithFormat:@"%@",self.areaAddModel.code]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"DongwangAdressRealod" object:nil];
        [weakSelf.navigationController popViewControllerAnimated:YES];
        } Deleaccountfairler:^(id  _Nonnull message) {
            
        }];
        
        return;
    }
    
    
    //新增收货地址
    //defaultReceiveAddress 1否 0是（默认收货地址）
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithCommiteAdress:@{@"userName":[_DongwangNameTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""],@"phone":[_DongwangPhoneTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""],@"area":[_DongwangAdressTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""],@"detailAddress":_DongwangTextDetailAdressTexView.text,@"defaultReceiveAddress":self.isDefaultAdress ? @"0" : @"1",@"provinceCode":[NSString stringWithFormat:@"%@",self.provinceAddModel.code],@"cityCode":[NSString stringWithFormat:@"%@",self.cityAddModel.code],@"countyCode":[NSString stringWithFormat:@"%@",self.areaAddModel.code]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"DongwangAdressRealod" object:nil];

        [weakSelf.navigationController popViewControllerAnimated:YES];
    } Deleaccountfairler:^(id  _Nonnull message) {
        
    }];
    
    
    
    
}

#pragma mark--收货地址
-(void)DonwangAdressBtnClick{
    
    [self.view endEditing:YES];
//    NSLog(@"==============%ld",self.cityDataArray.count);
    MJWeakSelf;
    if (weakSelf.cityDataArray.count == 0) {
        [DongwangMyViewModel DongwangMyViewModelWithProvinceList:@{}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
            
       weakSelf.cityDataArray = (NSArray *)object;
      NSMutableDictionary *dic = [NSMutableDictionary dictionary];
     if ([NSString isBlankString:[NSString stringWithFormat:@"%@",weakSelf.shipingListModel.provinceCode]] == NO) {
         if ([self.shipingListModel.area isEqualToString:@"澳门特别行政区"]) {
             [dic setValue:[NSNumber numberWithInt:33] forKey:@"province"];
             [dic setValue:[NSNumber numberWithInt:0] forKey:@"county"];
             [dic setValue:[NSNumber numberWithInt:0] forKey:@"city"];
         }else if ([self.shipingListModel.area isEqualToString:@"香港特别行政区"]){
             [dic setValue:[NSNumber numberWithInt:32] forKey:@"province"];
             [dic setValue:[NSNumber numberWithInt:0] forKey:@"county"];
             [dic setValue:[NSNumber numberWithInt:0] forKey:@"city"];
         }else if ([self.shipingListModel.area isEqualToString:@"台湾省"]){
             [dic setValue:[NSNumber numberWithInt:31] forKey:@"province"];
             [dic setValue:[NSNumber numberWithInt:0] forKey:@"county"];
             [dic setValue:[NSNumber numberWithInt:0] forKey:@"city"];
         }else{
            dic = [DongwangMyViewModel scrollShippingAddressAllArray:weakSelf.cityDataArray currentModel:weakSelf.shipingListModel].copy;
         }
     }
            
    [CHAddressPickerView showWithAddressDataArray:weakSelf.cityDataArray AddShippingAdressDic:dic.copy AddressBlock:^(AddShippingAddressListModel * _Nonnull provinceModel, AddShippingAddressListModel * _Nonnull cityModel, AddShippingAddressListModel * _Nonnull areaModel) {
        weakSelf.provinceAddModel = provinceModel;
        weakSelf.cityAddModel = cityModel;
        weakSelf.areaAddModel = areaModel;
        weakSelf.shipingListModel.provinceCode = provinceModel.code;
        weakSelf.shipingListModel.provinceName = provinceModel.name;
        weakSelf.shipingListModel.cityCode = cityModel.code;
        weakSelf.shipingListModel.cityName = cityModel.name;
        weakSelf.shipingListModel.countyCode = areaModel.code;
        weakSelf.shipingListModel.countyName = areaModel.name;
        [weakSelf.DongwangAdressTextField insertText:[NSString stringWithFormat:@"%@%@%@",provinceModel.name,[NSString isBlankString:cityModel.name] ? @"" : cityModel.name,[NSString isBlankString:areaModel.name] ? @"" : areaModel.name]];
//        weakSelf.DongwangAdressTextField.text =[NSString stringWithFormat:@"%@%@%@",provinceModel.name,[NSString isBlankString:cityModel.name] ? @"" : cityModel.name,[NSString isBlankString:areaModel.name] ? @"" : areaModel.name];
            }];
        } Deleaccountfairler:^(id  _Nonnull message) {
            
        }];
    }else{
        MJWeakSelf;
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        if ([NSString isBlankString:[NSString stringWithFormat:@"%@",self.shipingListModel.provinceCode]] == NO) {
            if ([self.shipingListModel.area isEqualToString:@"澳门特别行政区"]) {
                [dic setValue:[NSNumber numberWithInt:33] forKey:@"province"];
                [dic setValue:[NSNumber numberWithInt:0] forKey:@"county"];
                [dic setValue:[NSNumber numberWithInt:0] forKey:@"city"];
            }else if ([self.shipingListModel.area isEqualToString:@"香港特别行政区"]){
                [dic setValue:[NSNumber numberWithInt:32] forKey:@"province"];
                [dic setValue:[NSNumber numberWithInt:0] forKey:@"county"];
                [dic setValue:[NSNumber numberWithInt:0] forKey:@"city"];
            }else if ([self.shipingListModel.area isEqualToString:@"台湾省"]){
                [dic setValue:[NSNumber numberWithInt:31] forKey:@"province"];
                [dic setValue:[NSNumber numberWithInt:0] forKey:@"county"];
                [dic setValue:[NSNumber numberWithInt:0] forKey:@"city"];
            }else{
               dic = [DongwangMyViewModel scrollShippingAddressAllArray:weakSelf.cityDataArray currentModel:weakSelf.shipingListModel].copy;
            }
        }
        
    [CHAddressPickerView showWithAddressDataArray:weakSelf.cityDataArray AddShippingAdressDic:dic.copy AddressBlock:^(AddShippingAddressListModel * _Nonnull provinceModel, AddShippingAddressListModel * _Nonnull cityModel, AddShippingAddressListModel * _Nonnull areaModel) {
            weakSelf.provinceAddModel = provinceModel;
            weakSelf.cityAddModel = cityModel;
            weakSelf.areaAddModel = areaModel;
            weakSelf.shipingListModel.provinceCode = provinceModel.code;
            weakSelf.shipingListModel.provinceName = provinceModel.name;
            weakSelf.shipingListModel.cityCode = cityModel.code;
            weakSelf.shipingListModel.cityName = cityModel.name;
            weakSelf.shipingListModel.countyCode = areaModel.code;
            weakSelf.shipingListModel.countyName = areaModel.name;
            weakSelf.DongwangAdressTextField.text =[NSString stringWithFormat:@"%@%@%@",provinceModel.name,[NSString isBlankString:cityModel.name] ? @"" : cityModel.name,[NSString isBlankString:areaModel.name] ? @"" : areaModel.name];
        }];
    }
}
-(void)setShipingListModel:(ShippingAddressListModel *)shipingListModel{
    _shipingListModel = shipingListModel;
    if (_shipingListModel.uid != 0) {
        self.provinceAddModel.name = _shipingListModel.provinceName;
        self.provinceAddModel.code = _shipingListModel.provinceCode;
        self.cityAddModel.name = _shipingListModel.cityName;
        self.cityAddModel.code = _shipingListModel.cityCode;
        self.areaAddModel.name = _shipingListModel.countyName;
        self.areaAddModel.code = _shipingListModel.countyCode;
    }
}
-(UILabel *)DongwangConfigersWithleftlb:(NSString *)lbText lbFrame:(CGRect)lbFrame{
    UILabel * Dongwanglb = [[UILabel alloc]initWithFrame:lbFrame];
    Dongwanglb.text = lbText;
    Dongwanglb.font =  KSysFont(font(14));
    Dongwanglb.textColor = [UIColor colorWithHexString:@"#333333"];
    return Dongwanglb;
}
-(UIView *)DongwangConfigerWithline:(CGRect)lineFrame{
    UIView * Dongwangline = [[UIView alloc]initWithFrame:lineFrame];
    Dongwangline.backgroundColor = [UIColor colorWithHexString:@"#ECECEC"];
    return Dongwangline;
}
-(UITextField *)DongwangTextFieldConfigerWithHolderText:(NSString *)HolderStr FieldFrame:(CGRect)Frame KeyBoaryType:(UIKeyboardType )Type{
    UITextField * DongwangField = [[UITextField alloc]initWithFrame:Frame];
    DongwangField.keyboardType = UIKeyboardTypeNumberPad;
    DongwangField.keyboardType = Type;
    DongwangField.clearButtonMode =  UITextFieldViewModeAlways;
    DongwangField.textColor = [UIColor blackColor];
    DongwangField.font = KSysFont(font(14));
    DongwangField.attributedPlaceholder =  [[NSAttributedString alloc] initWithString:HolderStr attributes:@{NSFontAttributeName:KSysFont(font(15)),NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#999999"]}];
    return DongwangField;
}
-(void)DongwangAdressInfo{
    if ([NSString isBlankString:[NSString stringWithFormat:@"%@",self.shipingListModel.uid]]) {
//        [CHShowMessageHud showMessageText:@"空的"];
        return;
    }
    
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithAdressDetail:@{@"id":self.shipingListModel.uid}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(DongwangAdressInfoDetailModel * infoModel) {
        if ([NSString stringWithFormat:@"%@",weakSelf.shipingListModel.uid].length !=0) {
            weakSelf. DongwangNameTextField.text = infoModel.userName;
            weakSelf. DongwangPhoneTextField.text = [NSString stringWithFormat:@"%@",infoModel.phone];
            weakSelf.  DongwangTextDetailAdressTexView.text = infoModel.detailAddress;
            weakSelf.DongwangAdressTextField.text =  infoModel.area;
        }
    } Deleaccountfairler:^(id  _Nonnull message) {
        
    }];
}
#pragma mark--DongwangDeleteaAdressAlterViewDelegate
-(void)DongwangDeleteaAdressAlterViewActions{
    [_DongwangAlterView removeFromSuperview];
    _DongwangAlterView = nil;
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithDeleateAdress:@{@"ids":@[self.shipingListModel.uid]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"DongwangAdressRealod" object:nil];
        [weakSelf.navigationController popViewControllerAnimated:YES];
    } Deleaccountfairler:^(id  _Nonnull message) {
        
    }];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
