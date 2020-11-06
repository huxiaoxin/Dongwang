//
//  AppDelegate.m
//  DongWang
//
//  Created by codehzx on 2020/10/20.
//

#import "AppDelegate.h"
#import <CL_ShanYanSDK/CL_ShanYanSDK.h>
#import "DongwangQidonyeViewController.h"
#import "ADPageViewController.h"
#import "DongWangPrivateView.h"
#import <WXApi.h>
#import "DongwangBangdingNextViewController.h"
#import "EncryptionTool.h"
#import "NSString+SYCM_DES.h"
#import "DongwangLogoinViewModel.h"
#import "DongwangAdpageModel.h"
@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate
+ (AppDelegate *)getAppDelegate{
 return (AppDelegate *)[UIApplication sharedApplication].delegate;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    sleep(2);
    
    NSLog(@"----%@",[NSString encryptUseDESa:@"SYCM"]);
    #pragma mark -- 初始化导航配置
    [self initGKNavConfigers];
    #pragma mark -- 初始化闪验
    [self initShanyanLogin];
     #pragma mark -- iOS11适配
    [self setUpFixiOS11];
    #pragma mark -- 微信注册
    [WXApi registerApp:@"" universalLink:@"https://www.dongwangapp.com/apple-app-site-association"];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
//    self.window.rootViewController = [UIViewController new];
//    self.window.rootViewController = [NSClassFromString(@"ViewController") new];
      #pragma mark -- 进入app
    [self userEntersFirstTime];
    return YES;
}
#pragma mark--导航初始化
-(void)initGKNavConfigers{
    GKNavigationBarConfigure *DongwangConfigers = [GKNavigationBarConfigure sharedInstance];
    [DongwangConfigers setupDefaultConfigure];
    DongwangConfigers.backStyle = GKNavigationBarBackStyleBlack;
    DongwangConfigers.backgroundColor = LGDMianColor;
    DongwangConfigers.titleColor = [UIColor blackColor];
    DongwangConfigers.titleFont = KBlFont(font(17));
//    DongwangConfigers.gk_navItemLeftSpace = K(15);
}
#pragma mark -- 用户启动app
- (void)userEntersFirstTime {
    NSString *tempFirst = [NSString stringWithFormat:@"%@", [NSUserDefaults ch_customObjectForKey:CHUserEntersFirstTime]];
    if ([NSString isBlankString:tempFirst] == YES) {
     //首次安装
    // 加载一个假的启动页 放授权弹窗 （此时出现弹唱） ----然后再加载引导页
   DongwangQidonyeViewController * StarVc = [[DongwangQidonyeViewController alloc]init];
    UINavigationController * StarNav = [UINavigationController rootVC:StarVc translationScale:YES];
    self.window.rootViewController = StarNav;
    } else {
    //非首次安装
     //广告页
        
    ADPageViewController * AdpageVc = [[ADPageViewController alloc]init];
    UINavigationController * StarNav = [UINavigationController rootVC:AdpageVc translationScale:YES];
    self.window.rootViewController = StarNav;
        
    }
    
}

#pragma mark -- 闪验初始化
- (void)initShanyanLogin {
    NSLog(@"版本号:%@",[CLShanYanSDKManager clShanYanSDKVersion]);
    //初始化
    MJWeakSelf;
    [CLShanYanSDKManager initWithAppId:@"HQU84PAt" complete:^(CLCompleteResult * _Nonnull completeResult) {
        if (completeResult.error == nil) {
         [weakSelf shanyanGetPhoneNum];
        }else{
        NSLog(@"错误信息%@",completeResult.error.localizedDescription);
//         [CHShowMessageHud showMessageText:completeResult.error.localizedDescription];
        }
    }];
}
#pragma mark -- 闪验获取号码
- (void)shanyanGetPhoneNum {
    [CLShanYanSDKManager preGetPhonenumber:^(CLCompleteResult * _Nonnull completeResult) {
        NSString *tempPhoneNumBOOL = @"0";
        if (completeResult.error == nil) {
        tempPhoneNumBOOL = @"1";
        NSLog(@"预取号成功");
        }else{
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (DEBUG) {
//        [CHShowMessageHud showMessageText:[NSString stringWithFormat:@"%@",completeResult.error.localizedDescription]];
            }
        });
        }
      [NSUserDefaults ch_setCustomObject:tempPhoneNumBOOL forKey:CHSYTagPhoneNumberBOOL];
    }];
}
#pragma mark--WXApiDelegate
- (void)onReq:(BaseReq *)req{
    NSLog(@"wx onReq");
}
- (void)onResp:(BaseResp *)resp{
    NSLog(@"wx onResp");
    //登录 分享 都走同一个回调
    if ([resp isKindOfClass:[SendAuthResp class]]) {
        SendAuthResp* authResp = (SendAuthResp *)resp;
        [self loginResponse:authResp];
    }
}
- (void)loginResponse:(SendAuthResp*)response{
    switch (response.errCode) {
        case WXSuccess:{
            [self getUserToken:response.code];
        }
            break;
        case WXErrCodeCommon:
            break;
        case WXErrCodeUserCancel:
            break;
        case WXErrCodeSentFail:
            break;
        case WXErrCodeAuthDeny:
            break;
        case WXErrCodeUnsupport:
            break;
    }
}
- (void)getUserToken:(NSString*)code{
    NSLog(@"code:%@", code);
    if ([NSString isBlankString:code] == NO) {
        NSDictionary *codeDictionary = @{@"wxCode" : code};
        [[NSNotificationCenter defaultCenter] postNotificationName:CHWXCodeNotification object:nil userInfo:codeDictionary];
    }
}
#pragma mark - 适配
- (void)setUpFixiOS11 {
    if (@available(ios 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
    }
}
-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    return [WXApi handleOpenURL:url delegate:self];
}
@end
