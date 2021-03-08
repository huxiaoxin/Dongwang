//
//  DongwangMyInfoViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/6.
//

#import "DongwangMyInfoViewController.h"
#import "DongwangMyInfoTableViewCell.h"
#import "DongwangMyInfoHeaderView.h"
#import "DongwangInfoMsgView.h"
#import "DongwanguserHeaderImgView.h"
#import "DongwangNickView.h"
#import "DongwangNatureView.h"
#import "DongwangAdressViewController.h"
#import "DongwangRealAuotrViewController.h"
#import "DongwangMyViewModel.h"
#import "DongwangLogoinViewModel.h"
#import <MFSIdentifier-umbrella.h>
#import "DongwagNewBangdingViewController_V3.h"
@interface DongwangMyInfoViewController ()<UITableViewDelegate,UITableViewDataSource,DongwangMyInfoHeaderViewDelegate,DongwanguserHeaderImgViewDelegate,DongwangNickViewDelegate,DongwangNatureViewDelegate>
@property(nonatomic,strong) UITableView * DongwangMyInfoTableView;
@property(nonatomic,strong) NSMutableArray * DongwangInfoLeftDataArr;
@property(nonatomic,strong) NSMutableArray * DongwangInfoRightDataArr;
@property(nonatomic,strong) UIScrollView * DongwangBjScroolView;
@property(nonatomic,strong) DongwangMyInfoHeaderView * InfoHeader;
@property(nonatomic,strong) DongwangInfoMsgView * msgView;
@property(nonatomic,strong) DongwanguserHeaderImgView * ImgView;
@property(nonatomic,strong) DongwangNickView * NickView;
@property(nonatomic,strong) DongwangNatureView * NatureView;
@end

@implementation DongwangMyInfoViewController
-(NSMutableArray *)DongwangInfoLeftDataArr{
    if (!_DongwangInfoLeftDataArr) {
        if ([[NSString stringWithFormat:@"%@",[UserManager userInfo].displayStatus] isEqualToString:@"1"]) {
            //QQ登录
    _DongwangInfoLeftDataArr = [[NSMutableArray alloc]initWithArray:@[@"昵称",@"性别",@"绑定手机号",@"收货地址",@"实名认证"]];
        }else{
        //非QQ登录
    _DongwangInfoLeftDataArr = [[NSMutableArray alloc]initWithArray:@[@"昵称",@"性别",@"绑定手机号",@"微信绑定",@"收货地址",@"实名认证"]];
        }
    }
    return _DongwangInfoLeftDataArr;
}
-(DongwanguserHeaderImgView *)ImgView{
    if (!_ImgView) {
        _ImgView = [[DongwanguserHeaderImgView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _ImgView.delegate = self;
    }
    return _ImgView;
}
-(DongwangNickView *)NickView{
    if (!_NickView) {
        _NickView = [[DongwangNickView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _NickView.delegate = self;
        
    }
    return _NickView;
}
-(DongwangNatureView *)NatureView{
    if (!_NatureView) {
        _NatureView = [[DongwangNatureView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _NatureView.delegate = self;
    }
    return _NatureView;
}
-(NSMutableArray *)DongwangInfoRightDataArr{
    if (!_DongwangInfoRightDataArr) {
        NSString * nicekName;
        if ([NSString stringWithFormat:@"%@",[UserManager userInfo].nickName].length == 0) {
            nicekName = [NSString numberPhoneSuitScanf:[UserManager userInfo].phone strRange:NSMakeRange(3, 4)];
        }else{
            nicekName = [UserManager userInfo].nickName;
        }
        
        NSString * gender;
        NSString * genderStatus;
        genderStatus = [NSString isBlankString:[NSString stringWithFormat:@"%@",[UserManager userInfo].gender]] ? @"0" : [NSString stringWithFormat:@"%@",[UserManager userInfo].gender];
        if ([genderStatus isEqualToString:@"0"]) {
            gender = @"未知";
        }else if ([genderStatus isEqualToString:@"1"]){
            gender = @"男";
        }else if ([genderStatus isEqualToString:@"2"]){
            gender = @"女";
        }else if ([genderStatus isEqualToString:@"3"]){
            gender = @"保密";
        }
        
        NSString * wxStatus;
        NSString * wxStatusStr;
        wxStatusStr = [NSString isBlankString:[NSString stringWithFormat:@"%@",[UserManager userInfo].wxStatus]] ? @"0" : [NSString stringWithFormat:@"%@",[UserManager userInfo].wxStatus];
        if ([wxStatusStr isEqualToString:@"0"]) {
            wxStatus = @"未绑定";
        }else{
            wxStatus = @"已绑定";
        }
        
        NSString * addressStatus;
        NSString * addressStatusStr;
        addressStatusStr = [NSString isBlankString:[NSString stringWithFormat:@"%@",[UserManager userInfo].addressStatus]] ? @"0" : [NSString stringWithFormat:@"%@",[UserManager userInfo].addressStatus];
        if ([addressStatusStr isEqualToString:@"0"]) {
            addressStatus = @"未填写";
        }else{
            addressStatus = @"已填写";
        }
        
        NSString * certification;
        NSString * certificationStr;
        certificationStr = [NSString isBlankString:[NSString stringWithFormat:@"%@",[UserManager userInfo].certification]] ? @"0" : [NSString stringWithFormat:@"%@",[UserManager userInfo].certification];
        if ([certificationStr isEqualToString:@"1"]) {
            certification = [NSString stringWithFormat:@"%@",[UserManager userInfo].realNameAuth];

        }else{
            certification = @"去认证";
        }
        NSString * phone = [NSString stringWithFormat:@"%@",[UserManager userInfo].phone];
        
        if ([[NSString stringWithFormat:@"%@",[UserManager userInfo].displayStatus] isEqualToString:@"1"]) {
            //QQ登录 隐藏微信
        _DongwangInfoRightDataArr = [[NSMutableArray alloc]initWithArray:@[nicekName,gender,phone.length == 0 ? @"去绑定":[NSString numberPhoneSuitScanf:[NSString stringWithFormat:@"%@",[UserManager userInfo].phone] strRange:NSMakeRange(3, 4)],addressStatus,certification]];
        }else{
            //已认证
        _DongwangInfoRightDataArr = [[NSMutableArray alloc]initWithArray:@[nicekName,gender,phone.length == 0 ? @"去绑定":[NSString numberPhoneSuitScanf:[NSString stringWithFormat:@"%@",[UserManager userInfo].phone] strRange:NSMakeRange(3, 4)],wxStatus,addressStatus,certification]];
        }
        
       
    }
    return _DongwangInfoRightDataArr;
}
-(DongwangMyInfoHeaderView *)InfoHeader{
    if (!_InfoHeader) {
        _InfoHeader = [[DongwangMyInfoHeaderView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_msgView.frame)+K(33), SCREEN_WIDTH, K(100+15))];
        _InfoHeader.delegate = self;
    }
    return _InfoHeader;
}
-(DongwangInfoMsgView *)msgView{
    if (!_msgView) {
        _msgView = [[DongwangInfoMsgView alloc]initWithFrame:CGRectMake(0, -K(33), SCREEN_WIDTH, K(33))];
    }
    return _msgView;
}
-(void)DongwangAdressRealod{
    [self RealodaDataArr];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"个人资料";
    self.isShowBtomImgView = NO;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#804AB7"];
    [self.view addSubview:self.DongwangBjScroolView];
    [_DongwangBjScroolView addSubview:self.msgView];
    [_DongwangBjScroolView addSubview:self.InfoHeader];
    [_DongwangBjScroolView addSubview:self.DongwangMyInfoTableView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DongwangAdressRealod) name:@"DongwangAdressRealod" object:nil];
    
    UserInfo * info = [UserManager userInfo];
    NSInteger personDataStatus =  [info.personDataStatus integerValue];
    if (personDataStatus == 1) {
        CGRect frame = self.msgView.frame;
        frame.origin.y = 0;
        self.msgView.frame = frame;
        self.InfoHeader.y = CGRectGetMaxY(self.msgView.frame)+K(33);
        self.DongwangMyInfoTableView.y =  CGRectGetMaxY(self.InfoHeader.frame)+K(33);
    }
    
//    [self DongwangRealodinfoMsgViews:personDataStatus];
}
-(void)DongwangRealodinfoMsgViews:(NSInteger)personDataStatus{
    NSLog(@"personDataStatus=%ld",personDataStatus);
    //0 = 已完成。 1 = 未完成
    if (personDataStatus == 0) {
        CGRect frame = self.msgView.frame;
        frame.origin.y = -K(33);
        self.msgView.frame = frame;
        self.InfoHeader.y = CGRectGetMaxY(self.msgView.frame)+K(33);
        self.DongwangMyInfoTableView.y =  CGRectGetMaxY(self.InfoHeader.frame)+K(33);
    }else{
        
        CGRect frame = self.msgView.frame;
        frame.origin.y = K(0);
        self.msgView.frame = frame;
        self.InfoHeader.y = CGRectGetMaxY(self
                                          .msgView.frame)+K(33);
        self.DongwangMyInfoTableView.y =  CGRectGetMaxY(self.InfoHeader.frame)+K(33);
        
    }

}
-(UIScrollView *)DongwangBjScroolView{
    if (!_DongwangBjScroolView) {
        _DongwangBjScroolView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height)];
        _DongwangBjScroolView.showsVerticalScrollIndicator  = NO;
        _DongwangBjScroolView.showsHorizontalScrollIndicator = NO;
        _DongwangBjScroolView.scrollEnabled = NO;
        _DongwangBjScroolView.backgroundColor = [UIColor clearColor];
        _DongwangBjScroolView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _DongwangBjScroolView;
}
-(UITableView *)DongwangMyInfoTableView{
    if (!_DongwangMyInfoTableView) {
        _DongwangMyInfoTableView   = [[UITableView alloc]initWithFrame:CGRectMake(K(21), CGRectGetMaxY(_InfoHeader.frame)+K(20), SCREEN_WIDTH-K(42), self.DongwangInfoLeftDataArr.count*K(45)) style:UITableViewStylePlain];
        _DongwangMyInfoTableView.scrollEnabled = NO;
        _DongwangMyInfoTableView.delegate = self;
        _DongwangMyInfoTableView.dataSource = self;
        _DongwangMyInfoTableView.layer.cornerRadius = K(8);
        _DongwangMyInfoTableView.layer.masksToBounds = YES;
        _DongwangMyInfoTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _DongwangMyInfoTableView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF" Alpha:0.8];
        _DongwangMyInfoTableView.showsVerticalScrollIndicator = NO;
        _DongwangMyInfoTableView.showsHorizontalScrollIndicator = NO;
        [_DongwangMyInfoTableView viewShadowPathWithColor:LGDBLackColor shadowOpacity:0.09 shadowRadius:K(4) shadowPathType:LeShadowPathAround shadowPathWidth:K(3)];

    }
    return _DongwangMyInfoTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DongwangInfoLeftDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangIdentifer  = @"DongwangMyInfoTableViewCell";
    DongwangMyInfoTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangIdentifer];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwangMyInfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangIdentifer];
    }
    [DongwangCell DongwangMyInfoTableViewCellConfigerData:self.DongwangInfoLeftDataArr RightData:self.DongwangInfoRightDataArr indexPath:indexPath];
    
    return DongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(45);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
//        [self.view addSubview:self.NickView];
        [self.NickView show];
    }else if (indexPath.row == 1){
        
        UIAlertController   * sexAlterVc = [UIAlertController alertControllerWithTitle:@"请选择" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
        
        MJWeakSelf;
        UIAlertAction * manAction = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [weakSelf DongwangMyInfoHeaderSexWith:1];
        }];
        
        UIAlertAction * sexAction = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [weakSelf DongwangMyInfoHeaderSexWith:2];
                
        }];
        
        UIAlertAction * noneAction = [UIAlertAction actionWithTitle:@"保密" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [weakSelf DongwangMyInfoHeaderSexWith:3];
        }];


        
        UIAlertAction * cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
        }];
        [sexAlterVc addAction:manAction];
        [sexAlterVc addAction:sexAction];
        [sexAlterVc addAction:noneAction];
//      [sexAlterVc addAction:baomiAction];
        [sexAlterVc addAction:cancleAction];        
        [self presentViewController:sexAlterVc animated:YES completion:nil];
        
    }else if (indexPath.row == 2){
        NSString * phone = [NSString stringWithFormat:@"%@",[UserManager userInfo].phone];
        if (phone.length > 0) {
            return;
        }
        DongwagNewBangdingViewController_V3 * DongwnagVc = [[DongwagNewBangdingViewController_V3 alloc]init];
        DongwnagVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:DongwnagVc animated:YES];
    }else if (indexPath.row == 3){
        if ([[NSString stringWithFormat:@"%@",[UserManager userInfo].displayStatus] isEqualToString:@"1"]) {
        //为qq登录，隐藏微信
            DongwangAdressViewController * adressVc = [[DongwangAdressViewController alloc]init];
            adressVc.hidesBottomBarWhenPushed = YES;
            adressVc.realoadBlock = ^{
                
            };
            [self.navigationController pushViewController:adressVc animated:YES];

            
        }else{
            NSString * wxStatusStr;
            wxStatusStr = [NSString isBlankString:[NSString stringWithFormat:@"%@",[UserManager userInfo].wxStatus]] ? @"0" : [NSString stringWithFormat:@"%@",[UserManager userInfo].wxStatus];
            // 微信绑定
            if ([wxStatusStr isEqualToString:@"0"]) {
                [DongwangLogoinViewModel DongwangWechatAutor];
            }

        }
               
    }else if (indexPath.row == 4){
        
        
        if ([[NSString stringWithFormat:@"%@",[UserManager userInfo].displayStatus] isEqualToString:@"1"]) {
            //为qq登录，隐藏微信
            NSString * certificationStr;
            certificationStr = [NSString isBlankString:[NSString stringWithFormat:@"%@",[UserManager userInfo].certification]] ? @"0" : [NSString stringWithFormat:@"%@",[UserManager userInfo].certification];
            if ([certificationStr isEqualToString:@"1"]) {
            //[CHShowMessageHud showMessageText:@"已认证"];
                return;
            }
            MJWeakSelf;
            DongwangRealAuotrViewController * DongwangRealVc = [[DongwangRealAuotrViewController alloc]init];
            DongwangRealVc.autoreBlock = ^{
            [weakSelf RealodaDataArr];
            };
            [self.navigationController pushViewController:DongwangRealVc animated:YES];
        }else{
            
            
            
            DongwangAdressViewController * adressVc = [[DongwangAdressViewController alloc]init];
            adressVc.hidesBottomBarWhenPushed = YES;
            adressVc.realoadBlock = ^{
                
            };
            [self.navigationController pushViewController:adressVc animated:YES];

        }
       
    }else if (indexPath.row == 5){
        NSString * certificationStr;
        certificationStr = [NSString isBlankString:[NSString stringWithFormat:@"%@",[UserManager userInfo].certification]] ? @"0" : [NSString stringWithFormat:@"%@",[UserManager userInfo].certification];
        if ([certificationStr isEqualToString:@"1"]) {
        //[CHShowMessageHud showMessageText:@"已认证"];
            return;
        }
        MJWeakSelf;
        DongwangRealAuotrViewController * DongwangRealVc = [[DongwangRealAuotrViewController alloc]init];
        DongwangRealVc.autoreBlock = ^{
        [weakSelf RealodaDataArr];
        };
        [self.navigationController pushViewController:DongwangRealVc animated:YES];
    }
}
#pragma mark-修改性别
-(void)DongwangMyInfoHeaderSexWith:(NSInteger)type{
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithupheaderImg:@{@"sex":[NSString stringWithFormat:@"%ld",type]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        [weakSelf RealodaDataArr];
        [weakSelf.NickView removeFromSuperview];
    } Deleaccountfairler:^(id  _Nonnull message) {
        
    }];

}
#pragma mark--DongwangMyInfoHeaderViewDelegate
-(void)DongwangMyInfoHeaderViewChangeuserinfoImg{
    [self.view addSubview:self.ImgView];
}
#pragma mark--DongwanguserHeaderImgViewDelegate
-(void)DongwanguserHeaderImgViewDidSeltecdWithName:(NSString *)ImgName{
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithupheaderImg:@{@"headId":ImgName}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        weakSelf.InfoHeader.info = [UserManager userInfo];
        [weakSelf RealodaDataArr];
    } Deleaccountfairler:^(id  _Nonnull message) {
    }];
}
#pragma mark--DongwangNickViewDelegate昵称
-(void)DongwangNickViewWithContentIndex:(NSInteger)btnindex ContentText:(NSString *)text{
    [self.view endEditing:YES];
    if (btnindex== 1) {
        if (text.length == 0) {
            [CHShowMessageHud showMessageText:@"请填写昵称"];
            return;
        }
        [self.NickView removeFromSuperview];
        self.NickView = nil;
        MJWeakSelf;
        [DongwangMyViewModel DongwangMyViewModelWithupheaderImg:@{@"nickName":text}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
            [weakSelf RealodaDataArr];
        } Deleaccountfairler:^(id  _Nonnull message) {
            
        }];
    }
}

#pragma mark--DongwangNatureViewDelegate 签名
-(void)DongwangNatureViewDidChangeWithContent:(NSString *)text btnindex:(NSInteger)btnindex{
    [self.view endEditing:YES];
    if (btnindex == 1) {
        //简介
    }
}
-(void)RealodaDataArr{
    
    UserInfo * info = [UserManager userInfo];
    NSInteger personDataStatus =  [info.personDataStatus integerValue];
    [self DongwangRealodinfoMsgViews:personDataStatus];
    if (_DongwangInfoRightDataArr.count > 0) {
        [_DongwangInfoRightDataArr removeAllObjects];
    }
    NSString * nicekName;
    if ([NSString stringWithFormat:@"%@",[UserManager userInfo].nickName].length == 0) {
        nicekName = [NSString numberPhoneSuitScanf:[UserManager userInfo].phone strRange:NSMakeRange(3, 4)];
    }else{
        nicekName = [UserManager userInfo].nickName;
    }
    NSString * gender;
    NSString * genderStatus;
    genderStatus = [NSString isBlankString:[NSString stringWithFormat:@"%@",[UserManager userInfo].gender]] ? @"0" : [NSString stringWithFormat:@"%@",[UserManager userInfo].gender];
    if ([genderStatus isEqualToString:@"0"]) {
        gender = @"未知";
    }else if ([genderStatus isEqualToString:@"1"]){
        gender = @"男";
    }else if ([genderStatus isEqualToString:@"2"]){
        gender = @"女";
    }else if ([genderStatus isEqualToString:@"3"]){
        gender = @"保密";
    }
    
    NSString * wxStatus;
    NSString * wxStatusStr;
    wxStatusStr = [NSString isBlankString:[NSString stringWithFormat:@"%@",[UserManager userInfo].wxStatus]] ? @"0" : [NSString stringWithFormat:@"%@",[UserManager userInfo].wxStatus];
    if ([wxStatusStr isEqualToString:@"0"]) {
        wxStatus = @"未绑定";
    }else{
        wxStatus = @"已绑定";
    }
    
    NSString * addressStatus;
    NSString * addressStatusStr;
    addressStatusStr = [NSString isBlankString:[NSString stringWithFormat:@"%@",[UserManager userInfo].addressStatus]] ? @"0" : [NSString stringWithFormat:@"%@",[UserManager userInfo].addressStatus];
    if ([addressStatusStr isEqualToString:@"0"]) {
        addressStatus = @"未填写";
    }else{
        addressStatus = @"已填写";
    }
    
    NSString * certification;
    NSString * certificationStr;
    certificationStr = [NSString isBlankString:[NSString stringWithFormat:@"%@",[UserManager userInfo].certification]] ? @"0" : [NSString stringWithFormat:@"%@",[UserManager userInfo].certification];
    if ([certificationStr isEqualToString:@"1"]) {
        //换成后台进行字符串拼接
//        NSString * DongwangRealName = [UserManager userInfo].realName;
//        NSString * idCardStr = [NSString stringWithFormat:@"%@",[UserManager userInfo].idCard];
//        certification =  [NSString stringWithFormat:@"%@ | %@",[NSString replaceStringWithAsterisk:DongwangRealName startLocation:1 lenght:DongwangRealName.length-1],[NSString replaceStringWithAsterisk:idCardStr startLocation:3 lenght:idCardStr.length-7]];
        certification = [NSString stringWithFormat:@"%@",[UserManager userInfo].realNameAuth];
    }else{
        certification = @"去认证";
    }
    NSString * phone = [NSString stringWithFormat:@"%@",[UserManager userInfo].phone];
        //已认证
//    _DongwangInfoRightDataArr = [[NSMutableArray alloc]initWithArray:@[nicekName,gender,phone.length == 0 ? @"去绑定":[NSString numberPhoneSuitScanf:[NSString stringWithFormat:@"%@",[UserManager userInfo].phone] strRange:NSMakeRange(3, 4)],wxStatus,addressStatus,certification]];
    
    
    if ([[NSString stringWithFormat:@"%@",[UserManager userInfo].displayStatus] isEqualToString:@"1"]) {
        //QQ登录 隐藏微信
    _DongwangInfoRightDataArr = [[NSMutableArray alloc]initWithArray:@[nicekName,gender,phone.length == 0 ? @"去绑定":[NSString numberPhoneSuitScanf:[NSString stringWithFormat:@"%@",[UserManager userInfo].phone] strRange:NSMakeRange(3, 4)],addressStatus,certification]];
    }else{
        //已认证
    _DongwangInfoRightDataArr = [[NSMutableArray alloc]initWithArray:@[nicekName,gender,phone.length == 0 ? @"去绑定":[NSString numberPhoneSuitScanf:[NSString stringWithFormat:@"%@",[UserManager userInfo].phone] strRange:NSMakeRange(3, 4)],wxStatus,addressStatus,certification]];
    }

    
    [self.DongwangMyInfoTableView reloadData];
    
}
#pragma mark--微信登录回调
- (void)chWxCodeNotification:(NSNotification *)notification {
    NSLog(@"微信登录回调DongwangMyInfoViewController_:%@",notification);
    NSDictionary *notificatDictionary = notification.userInfo;
    NSString * wxCode= [notificatDictionary objectForKey:@"wxCode"];
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithbindingWechat_hwc:@{@"code":wxCode,@"userId":[NSString stringWithFormat:@"%@",[UserManager userInfo].userid]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        [weakSelf RealodaDataArr];
    } Deleaccountfairler:^(id  _Nonnull message) {
        
    }];

}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CHWXCodeNotification object:nil];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chWxCodeNotification:) name:CHWXCodeNotification object:nil];
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
