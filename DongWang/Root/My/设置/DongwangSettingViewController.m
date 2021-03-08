//
//  DongwangSettingViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/6.
//

#import "DongwangSettingViewController.h"
#import "DongwangSettingTableViewCell.h"
#import "DongwangMyInfoViewController.h"
#import "DongwangadviceViewController.h"
#import "DongwangAboutusViewController.h"
#import "DongwangProtoclViewController.h"
#import "DongwangDeleAccountViewController.h"
#import "DongwangPrivetaWebViewController.h"
#import "DongwangLogoinViewModel.h"
#import "DongwangCLLoginViewController.h"
#import "DongwangCodeLoginViewController.h"
#import "DongwangLogoinOutView.h"
@interface DongwangSettingViewController ()<UITableViewDataSource,UITableViewDelegate,DongwangLogoinOutViewDelegate>
@property(nonatomic,strong) UITableView * DongwangSettingTableView;
@property(nonatomic,strong) NSMutableArray  * DongwangDataArr;
@property(nonatomic,strong) DongwangLogoinOutView  * logoinoutView;
@end

@implementation DongwangSettingViewController

-(NSMutableArray *)DongwangDataArr{
    if (!_DongwangDataArr) {
        _DongwangDataArr = [[NSMutableArray alloc]initWithArray:@[@"个人资料",@"清除缓存",@"当前版本",@"意见反馈",@"关于我们",@"用户协议",@"账户注销"]];
    }
    return _DongwangDataArr;
}
-(DongwangLogoinOutView *)logoinoutView{
    if (!_logoinoutView) {
        _logoinoutView = [[DongwangLogoinOutView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _logoinoutView.delegate = self;
    }
    return _logoinoutView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle  = @"设置";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#E5DAF0"];
    self.isShowBtomImgView = NO;
    [self.view addSubview:self.DongwangSettingTableView];
    UIButton * AddBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(28), SCREEN_HEIGHT-K(45+116)-SafeAreaBottom_Height-NaviH, SCREEN_WIDTH-K(56), K(45))];
    [AddBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];
    [AddBtn addTarget:self action:@selector(AddBtnClick) forControlEvents:UIControlEventTouchUpInside];
    AddBtn.titleLabel.font = KBlFont(font(15));
    [AddBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    AddBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [AddBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    AddBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:AddBtn];


    
    // Do any additional setup after loading the view.
}
#pragma mark--退出登录
-(void)AddBtnClick{
    [self.logoinoutView show];

}
-(void)DongwangLogoinConfigerType:(NSString * )type{
    if ([type isEqualToString:@"1"]) {
    //闪验登录
     DongwangCLLoginViewController * DongwangClVc = [[DongwangCLLoginViewController alloc]init];
    UINavigationController * DongwangclNav = [UINavigationController rootVC:DongwangClVc translationScale:YES];
    [AppDelegate getAppDelegate].window.rootViewController = DongwangclNav;
    }else {
    //验证码登
    DongwangCodeLoginViewController * DongwangLoginVc = [[DongwangCodeLoginViewController alloc]init];
    UINavigationController * DongwangNav = [UINavigationController rootVC:DongwangLoginVc translationScale:YES];
    [AppDelegate getAppDelegate].window.rootViewController = DongwangNav;
    }
    
}

-(UITableView *)DongwangSettingTableView{
    if (!_DongwangSettingTableView) {
        _DongwangSettingTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH) style:UITableViewStylePlain];
        _DongwangSettingTableView.delegate = self;
        _DongwangSettingTableView.dataSource = self;
        _DongwangSettingTableView.showsVerticalScrollIndicator = NO;
        _DongwangSettingTableView.showsHorizontalScrollIndicator = NO;
        _DongwangSettingTableView.backgroundColor = [UIColor clearColor];
        _DongwangSettingTableView.separatorStyle=   UITableViewCellSelectionStyleNone;
    }
    return _DongwangSettingTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DongwangDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangSettingIdentifer = @"DongwangSettingTableViewCell";
    DongwangSettingTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangSettingIdentifer];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwangSettingTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangSettingIdentifer];
    }
    DongwangCell.ContentText = self.DongwangDataArr[indexPath.row];
    if (indexPath.row == 1) {
        DongwangCell.DongwangRightTitle.text = [NSString stringWithFormat:@"%.2fMB",[self UJNJobCenterMemorjisuan]];
    }else if (indexPath.row == 2){
        DongwangCell.DongwangRightTitle.text = @"V1.0.0";

    }else{
        DongwangCell.DongwangRightTitle.text = @"";

    }
    return DongwangCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        DongwangMyInfoViewController * InfoVc = [[DongwangMyInfoViewController alloc]init];
        [self.navigationController pushViewController:InfoVc animated:YES];
    }else if (indexPath.row == 1){
        [self UJNJobCenterClearmemory];
    }else if (indexPath.row == 2){
    NSLog(@"服务器版本:%@",[UserManager userInfo].versions);
    NSString * CurrentVersion = [NSString stringWithFormat:@"%@",[UserManager userInfo].versions];
      NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
       NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        NSLog(@"本机版本:%@",app_Version);
        if ([app_Version isEqualToString:CurrentVersion]) {
            [CHShowMessageHud showMessageText:@"当前版本为最新版本"];
        }


        
    }else if (indexPath.row == 3){
        DongwangadviceViewController * DongwangAdviceVc= [[DongwangadviceViewController alloc]init];
        DongwangAdviceVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:DongwangAdviceVc animated:YES];
    }else if (indexPath.row == 4){
        
        DongwangPrivetaWebViewController * DongwangprotolVc = [[DongwangPrivetaWebViewController alloc]init];
        DongwangprotolVc.protoclUrlText = [NSString stringWithFormat:@"%@%@",Protocl_Url,@"dongwang_h5/document/index.html?type=aboutUs"];
        DongwangprotolVc.type = VCPush;
        [self.navigationController pushViewController:DongwangprotolVc animated:YES];

        
//        DongwangAboutusViewController * DongwangaboutVc = [[DongwangAboutusViewController alloc]init];
//
//        [self.navigationController pushViewController:DongwangaboutVc animated:YES];
    }else if (indexPath.row == 5){
        DongwangPrivetaWebViewController * DongwangprotolVc = [[DongwangPrivetaWebViewController alloc]init];
        DongwangprotolVc.protoclUrlText = [NSString stringWithFormat:@"%@%@",Protocl_Url,@"dongwang_h5/document/index.html?type=user"];
        DongwangprotolVc.type = VCPressent;
        [self presentViewController:DongwangprotolVc animated:YES completion:nil];
//        [self.navigationController pushViewController:DongwangprotolVc animated:YES];
        
    }else if (indexPath.row == 6){
        DongwangDeleAccountViewController * DonngwangDeleVc = [[DongwangDeleAccountViewController alloc]init];
        
        [self.navigationController pushViewController:DonngwangDeleVc animated:YES];
        
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(50.5);
}
- (CGFloat)UJNJobCenterMemorjisuan{
    CGFloat UJNJobCenterMemorjisuan = 0.0;
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)firstObject];
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    for(NSString *path in files) {
        NSString*filePath = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",path]];
        UJNJobCenterMemorjisuan += [[NSFileManager defaultManager]attributesOfItemAtPath:filePath error:nil].fileSize;
    }
    CGFloat sizeM = UJNJobCenterMemorjisuan /1024.0/1024.0;
    
    return sizeM;
}
- (void)UJNJobCenterClearmemory{
    NSString*cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)objectAtIndex:0];
    NSArray*files = [[NSFileManager defaultManager]subpathsAtPath:cachePath];
    for(NSString *p in files){
        NSError*error;
        
        NSString*path = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",p]];
        
        if([[NSFileManager defaultManager]fileExistsAtPath:path])
        {
            BOOL isRemove = [[NSFileManager defaultManager]removeItemAtPath:path error:&error];
            if(isRemove) {
                [CHShowMessageHud showMessageText:@"清除成功"];
                [self.DongwangSettingTableView reloadData];
            }else{
                
            }
        }
    }
}
#pragma mark--DongwangLogoinOutViewDelegate
-(void)DongwangLogoinOutViewlogintouViewWithBtnIndex:(NSInteger)index{
    if (index == 0) {
        MJWeakSelf;
     [DongwangLogoinViewModel DongwangLogoinViewModelWithLogintoutParmters:[NSMutableDictionary dictionary] RequestCuurentControlers:self logoinSuuced:^(id  _Nonnull object) {
         NSString *shanyanLogin = [NSString stringWithFormat:@"%@", [NSUserDefaults ch_customObjectForKey:CHSYTagPhoneNumberBOOL]];
         [weakSelf DongwangLogoinConfigerType:shanyanLogin];
        } logoinfairler:^{
            
        }];
    }
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
