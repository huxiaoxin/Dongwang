//
//  ADPageViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/20.
//

#import "ADPageViewController.h"
#import "ProcessLaunchImageView.h"
#import "DongwangCodeLoginViewController.h"
#import "DongwangCLLoginViewController.h"
#import "DongwangAdpageWebViewController.h"
#import "DongwangLogoinViewModel.h"
#import "DongwangAdpageModel.h"
#import "DongwangBaseTabBarViewController.h"
#import "DongwangTabbarModel.h"
@interface ADPageViewController ()
@property(nonatomic,strong) ProcessLaunchImageView * AdpageView;
@property(nonatomic,strong) DongwangAdpageModel * CuurentpageModel;
@property(nonatomic,strong) UIImageView *  DongwangImgView;
@property(nonatomic,strong) DongwangTabbarModel * SeltecdModel;
@end

@implementation ADPageViewController
-(ProcessLaunchImageView *)AdpageView{
    if (!_AdpageView) {
        MJWeakSelf;
        _AdpageView = [ProcessLaunchImageView initShareView:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-kHeight(120)) bgImageName:self.CuurentpageModel.imageUrl ShowType:ButtonTitleTimeShowType Time:[self.CuurentpageModel.times integerValue] ResultBlock:^{
            DongwangAdpageWebViewController * dongwangVc = [[DongwangAdpageWebViewController alloc]init];
            dongwangVc.pageModel = weakSelf.CuurentpageModel;
            dongwangVc.imgWeb =  weakSelf.CuurentpageModel.url;
            UINavigationController * Nav = [UINavigationController rootVC:dongwangVc translationScale:YES];
            [AppDelegate getAppDelegate].window.rootViewController =  Nav;
        } btnClickBlock:^{
            if ([UserManager userisLogoin]) {
//                [weakSelf tabarRequest];
                if (weakSelf.SeltecdModel) {
                [weakSelf loadHomeTabbarWithTabbarModel:weakSelf.SeltecdModel];
                }else{
                [weakSelf loadHomeTabbarWithTabbarModel:nil];
                }
            }else{
                NSString *shanyanLogin = [NSString stringWithFormat:@"%@", [NSUserDefaults ch_customObjectForKey:CHSYTagPhoneNumberBOOL]];
                [weakSelf DongwangLogoinConfigerType:shanyanLogin];
            }
        }];
    }
    return _AdpageView;
}
-(void)tabarRequest{
    NSDictionary *postHeader = [EncryptionTool getSignatureTimestamp];
    NSString *url = [NSString stringWithFormat:@"%@/rest/home/tab", BASE_IPURL];
    kWeakSelf(self);
//    [CHShowMessageHud showHUDPlainText:@"" view:self.view];
    [AFNetworkTool GET:url HttpHeader:postHeader Parameters:nil Success:^(id responseObject) {
//        [CHShowMessageHud dismissHideHUD:self.view];
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSLog(@"动态：%@",dic);
        if ([dic[@"err"] isEqualToString:@"00000"]) {
            NSDictionary *tempData = (NSDictionary *)dic[@"dat"];
            DongwangTabbarModel * model = [DongwangTabbarModel BaseinitWithDic:tempData];
            weakself.SeltecdModel = model;
//            [weakself loadHomeTabbarWithTabbarModel:model];
        } else {
//            [weakself loadHomeTabbarWithTabbarModel:nil];
        }
    } Failure:^(NSError *error) {
//        [CHShowMessageHud dismissHideHUD:self.view];
//        [weakself loadHomeTabbarWithTabbarModel:nil];
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
-(UIImageView *)DongwangImgView{
    if (!_DongwangImgView) {
        _DongwangImgView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _DongwangImgView.image = [UIImage LaunchImgNameSize];
    }
    return _DongwangImgView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self tabarRequest];
    
    
//    UIImageView * DongwangImgView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    DongwangImgView.image = [UIImage LaunchImgNameSize];
//    DongwangImgView.userInteractionEnabled = YES;
//    [self.view addSubview:DongwangImgView];

    
    
    //广告页
    CGSize DWLogoTitleSize=  [@"懂王更懂你" cxl_sizeWithString:KBlFont(20)];
    UIImageView * DWLogoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-K(35)-DWLogoTitleSize.width/2,SCREEN_HEIGHT-K(70+30), K(70), K(70))];
    DWLogoImgView.image = [UIImage imageNamed:@"applogo"];
    [self.view addSubview:DWLogoImgView];
    
    UILabel * DWLogoTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DWLogoImgView.frame)+K(10), CGRectGetMidY(DWLogoImgView.frame)-K(10), DWLogoTitleSize.width, K(15))];
    DWLogoTitle.textColor = LGDMianColor;
    DWLogoTitle.font = KBlFont(20);
    DWLogoTitle.text = @"懂王更懂你";
    [self.view addSubview:DWLogoTitle];
    [self.view addSubview:self.DongwangImgView];
    
    MJWeakSelf;
    [DongwangLogoinViewModel AdpageRequestWithParmters:@{@"type":@"2"}.mutableCopy RequestCuurentControlers:self AdpageModel:^(DongwangAdpageModel * AdPageModel) {
        if (AdPageModel.isexsit) {
        weakSelf.DongwangImgView.hidden = YES;
        weakSelf.CuurentpageModel = AdPageModel;
        [weakSelf.view addSubview:weakSelf.AdpageView];
        }else{
        weakSelf.DongwangImgView.hidden = NO;
        //请求失败 直接判断是否登录过
        if ([UserManager userisLogoin]) {
        [weakSelf tabarRequest];
        }else{
        NSString *shanyanLogin = [NSString stringWithFormat:@"%@", [NSUserDefaults ch_customObjectForKey:CHSYTagPhoneNumberBOOL]];
        [weakSelf DongwangLogoinConfigerType:shanyanLogin];
    }
    }
    }];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
