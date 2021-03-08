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
#import <AuthenticationServices/AuthenticationServices.h>
#import <Aspects/Aspects-umbrella.h>
#import "DongwangHotTizuViewController.h"
#import "Cat.h"
#import "DongwangBaseTabBarViewController.h"
#import "DongwangHomeViewController.h"
#import "AppDelegate+AppJump.h"
#import "DongwangSigninQiandaoViewController.h"
#import "DongwangJifenChangViewController.h"
#import "DongwangMyjifenViewController.h"
#import "DongwangPropsViewController.h"
#import "DongwangMyPrizeViewController.h"
#import "DongwangCLLoginViewController.h"
#import "DongwangCodeLoginViewController.h"
#import "DongwangMyInfoViewController.h"
#import "DongwangFindDetailViewController.h"
#import "DongwangFenleiViewController.h"
@interface AppDelegate ()<WXApiDelegate,QQApiInterfaceDelegate>
@end

@implementation AppDelegate

+ (AppDelegate *)getAppDelegate{
 return (AppDelegate *)[UIApplication sharedApplication].delegate;
}
-(void)AppTabbarActitytapNotiCationAction:(NSNotification *)notication{
    NSDictionary * responeDic = notication.userInfo;
    NSLog(@"%@",responeDic);
    //0-跳转 1-不跳转
    NSString * action = [responeDic objectForKey:@"action"];
    //跳转内部还是h5 0-跳转内部 1-跳转h5
    NSString * type = [responeDic objectForKey:@"type"];
    //跳转地址
    NSString * url = [responeDic objectForKey:@"url"];
    if ([type isEqualToString:@"0"]) {
    //跳转原生
    if ([url isEqualToString:@"MyTask"]) {
//        DongwangBaseTabBarViewController * Tabbar = (DongwangBaseTabBarViewController * )self.window.rootViewController;
//        Tabbar.selectedIndex = 1;
        DongwangFenleiViewController * fenwuVc = [[DongwangFenleiViewController alloc]init];
        
        fenwuVc.hidesBottomBarWhenPushed = YES;
        UIViewController * CurrentVc = [self getCurrentVC];
        [CurrentVc.navigationController pushViewController:fenwuVc animated:YES];
        
       // 任务
    }else if ([url isEqualToString:@"MyFind"]){
        //发现
        DongwangBaseTabBarViewController * Tabbar = (DongwangBaseTabBarViewController * )self.window.rootViewController;
        BOOL  ishaveActity = [[NSUserDefaults  standardUserDefaults] boolForKey:AppisHaveactivity];
        Tabbar.selectedIndex = ishaveActity ? 3 : 2;
    }else if ([url isEqualToString:@"SignList"]){
        //签到
        DongwangSigninQiandaoViewController * qiandaoVc = [[DongwangSigninQiandaoViewController alloc]init];
        qiandaoVc.hidesBottomBarWhenPushed = YES;
        UIViewController * CurrentVc = [self getCurrentVC];
        [CurrentVc.navigationController pushViewController:qiandaoVc animated:YES];
    }else if ([url isEqualToString:@"Exchange"]){
        //兑换
        DongwangJifenChangViewController * duihuanVc = [[DongwangJifenChangViewController alloc]init];
        duihuanVc.hidesBottomBarWhenPushed = YES;
        UIViewController * CurrentVc = [self getCurrentVC];
        [CurrentVc.navigationController pushViewController:duihuanVc animated:YES];
    }else if ([url isEqualToString:@"PointsFlop"]){
        //翻牌
        DongwangPrivetaWebViewController * webVc =  [[DongwangPrivetaWebViewController alloc]init];
        webVc.type = VCPush;
        webVc.hidesBottomBarWhenPushed = YES;
        webVc.protoclUrlText =  [NSString stringWithFormat:@"%@%@",Protocl_Url,jifenpaifan];
        UIViewController * CurrentVc = [self getCurrentVC];
        [CurrentVc.navigationController pushViewController:webVc animated:YES];
    }else if ([url isEqualToString:@"MyScores"]){
        //积分
        DongwangMyjifenViewController * jifenVc = [[DongwangMyjifenViewController alloc]init];
        jifenVc.hidesBottomBarWhenPushed = YES;
        UIViewController * CurrentVc = [self getCurrentVC];
        [CurrentVc.navigationController pushViewController:jifenVc animated:YES];
    }else if ([url isEqualToString:@"MyCenter"]){
        //个人中心
        DongwangBaseTabBarViewController * Tabbar = (DongwangBaseTabBarViewController * )self.window.rootViewController;
        BOOL  ishaveActity = [[NSUserDefaults  standardUserDefaults] boolForKey:AppisHaveactivity];
        Tabbar.selectedIndex = ishaveActity ? 4 : 3;
    }else if ([url isEqualToString:@"MyProps"]){
        //道具
        DongwangPropsViewController * propsVc = [[DongwangPropsViewController alloc]init];
        propsVc.hidesBottomBarWhenPushed = YES;
        UIViewController * CurrentVc = [self getCurrentVC];
        [CurrentVc.navigationController pushViewController:propsVc animated:YES];
        
    }else if ([url  isEqualToString:@"MyPrizes"]){
        //我的奖品
        DongwangMyPrizeViewController * MyprizeVc = [[DongwangMyPrizeViewController alloc]init];
        MyprizeVc.hidesBottomBarWhenPushed = YES;
        UIViewController * CurrentVc = [self getCurrentVC];
        [CurrentVc.navigationController pushViewController:MyprizeVc animated:YES];
        
    }else if ([url  isEqualToString:@"HomePage"]){
        //首页
        DongwangBaseTabBarViewController * Tabbar = (DongwangBaseTabBarViewController * )self.window.rootViewController;
        Tabbar.selectedIndex = 0;
    }else if ([url  isEqualToString:@"Profile"]){
        //个人资料
        DongwangMyInfoViewController * MyprizeVc = [[DongwangMyInfoViewController alloc]init];
        MyprizeVc.hidesBottomBarWhenPushed = YES;
        UIViewController * CurrentVc = [self getCurrentVC];
        [CurrentVc.navigationController pushViewController:MyprizeVc animated:YES];
    }else if ([url  isEqualToString:@"Battle"]){
        //跳转pk
        DongwangFindDetailViewController * MypkVc = [[DongwangFindDetailViewController alloc]init];
        MypkVc.hidesBottomBarWhenPushed = YES;
        MypkVc.indexs = 3;
        UIViewController * CurrentVc = [self getCurrentVC];
        [CurrentVc.navigationController pushViewController:MypkVc animated:YES];
    }
    }else if ([type isEqualToString:@"1"]){
        //跳转h5
        DongwangPrivetaWebViewController * webVc =  [[DongwangPrivetaWebViewController alloc]init];
        webVc.type = VCPush;
        webVc.hidesBottomBarWhenPushed = YES;
        webVc.protoclUrlText =  url;
        UIViewController * CurrentVc = [self getCurrentVC];
       [CurrentVc.navigationController pushViewController:webVc animated:YES];
    }
    
    //
}
#pragma mark--toke失效
-(void)TokenRestNotificationAction:(NSNotification *)notication{
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UserManager userLoginout];
        NSString *shanyanLogin = [NSString stringWithFormat:@"%@", [NSUserDefaults ch_customObjectForKey:CHSYTagPhoneNumberBOOL]];
        [weakSelf DongwangLogoinConfigerType:shanyanLogin];
        
    });
}
- (void)applicationWillEnterForeground:(UIApplication *)application{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    NSString * valueString = pasteboard.string;
    NSArray * valueStringArray = pasteboard.strings;
    NSLog(@"valueString=%@-valueStringArray=%@",valueString,valueStringArray);

}
-(void)DongwangLogoinConfigerType:(NSString * )type{
    if ([type isEqualToString:@"1"]) {
        //闪验登录
        DongwangCLLoginViewController * DongwangClVc = [[DongwangCLLoginViewController alloc]init];
        UINavigationController * DongwangclNav = [UINavigationController rootVC:DongwangClVc translationScale:YES];
        if (self.window.rootViewController) {
            self.window.rootViewController = nil;
        }
        self.window.rootViewController = DongwangclNav;
        
//      /  [self.window.rootViewController presentViewController:DongwangclNav animated:YES completion:nil];
    }else {
        //验证码登
        DongwangCodeLoginViewController * DongwangLoginVc = [[DongwangCodeLoginViewController alloc]init];
        UINavigationController * DongwangNav = [UINavigationController rootVC:DongwangLoginVc translationScale:YES];
        self.window.rootViewController = DongwangNav;
//        [self.window.rootViewController presentViewController:DongwangNav animated:YES completion:nil];
    }
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%f-%f",SCREEN_WIDTH,SCREEN_HEIGHT);
    
    sleep(1);
    //底部活动按钮点击
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AppTabbarActitytapNotiCationAction:) name:AppTabbarActitytapNotiCation object:nil];
    //token失效
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(TokenRestNotificationAction:) name:TokenRestNotification object:nil];
    [AppDelegate AppDelegateJumpVcWithapplication:application didFinishLaunchingWithOptions:launchOptions];
//  NSLog(@"加密:%@",[NSString encryptUseDESa:@"SYCM"]);
//    NSLog(@"解谜:%@",[NSString decryptUseDES:@"eCkEjXy1+uA="]);
    #pragma mark-- 监听苹果登录状态
   // [self monitorSignInWithAppleState];
    #pragma mark -- 初始化导航配置
    [self initGKNavConfigers];
    #pragma mark -- 初始化闪验
    [self initShanyanLogin];
     #pragma mark -- iOS11适配
    [self setUpFixiOS11];
    
    #pragma mark -- 微信注册
//    [WXApi startLogByLevel:WXLogLevelDetail logBlock:^(NSString *log) {
//         NSLog(@"WeChatSDK: %@", log);
//    }];
    [WXApi registerApp:@"wx557d5dc578daf830" universalLink:@"https://zch64l.xinstall.top/tolink/"];
//    [WXApi checkUniversalLinkReady:^(WXULCheckStep step, WXCheckULStepResult* result) { NSLog(@"step：%@, %u, %@", @(step), result.success, result.errorInfo); }];
#pragma mark--QQ注册
//    self.tencentOAuth = [[TencentOAuth alloc]initWithAppId:@"1106248070" andUniversalLink:nil andDelegate:self];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
     //self.window.rootViewController = [UIViewController new];
//     self.window.rootViewController = [NSClassFromString(@"DongwangMofangTestViewController") new];
      #pragma mark -- 进入app
     [self userEntersFirstTime];
    
    
    
    
    
//    Class clazz = NSClassFromString(@"DongwangHomeViewController");
//    Class classE = NSClassFromString(@"DongwangHotTizuViewController");
//    [clazz aspect_hookSelector:@selector(viewDidDisappear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> objectinfo){
//        NSLog(@"视图出现：%@",objectinfo.arguments.firstObject);
//        NSLog(@"====%@===%@",objectinfo.instance,objectinfo.arguments);
//        DongwangHomeViewController * tabbr = objectinfo.instance;
//        NSLog(@"====%ld",tabbr.selectedIndex);
//        NSLog(@"showTimeStr=%@=%@",tabbr.showTimeStr,tabbr.leaveTimeStr);
//      NSArray * Arrs =    [objectinfo.instance arguments];
        
        
//        NSLog(@"class==%@",[objectinfo.instance class]);
//    } error:nil];
    
//    [classE aspect_hookSelector:@selector(viewDidDisappear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> objectinfo){
//        NSLog(@"class==%@",[objectinfo.instance class]);

//        NSLog(@"视图出现：%@",objectinfo.arguments.firstObject);
//        NSLog(@"====%@===%@",objectinfo.instance,objectinfo.arguments);
//        DongwangHomeViewController * tabbr = objectinfo.instance;
//        NSLog(@"====%ld",tabbr.selectedIndex);
//        NSLog(@"showTimeStr=%@=%@",tabbr.showTimeStr,tabbr.leaveTimeStr);
//      NSArray * Arrs =    [objectinfo.instance arguments];
//    } error:nil];

    return YES;
}
#pragma mark--导航初始化
-(void)initGKNavConfigers{
    if (@available(iOS 13.0, *)) {
    [UIApplication sharedApplication].statusBarStyle =  UIStatusBarStyleLightContent;
    }else{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
    GKNavigationBarConfigure *DongwangConfigers = [GKNavigationBarConfigure sharedInstance];
    [DongwangConfigers setupDefaultConfigure];
    DongwangConfigers.backgroundColor = LGDMianColor;
    DongwangConfigers.backStyle = GKNavigationBarBackStyleWhite;
    DongwangConfigers.titleColor = [UIColor whiteColor];
    DongwangConfigers.titleFont = KBlFont(font(16));
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
//        DongWang(16554,0x103bc38c0) malloc: recording malloc and VM allocation stacks using lite mode
//        objc[16554]: Class _NSZombie_NSCheapMutableString is implemented in both ?? (0x1070061c0) and ?? (0x107106650). One of the two will be used. Which one is undefined.
//        AppDelegate.m:148    宽414.000000--高896.000000
//        AppDelegate.m:252    版本号:2.3.3.2
//        2020-12-24 10:29:01.318315+0800 DongWang[16554:2216281] [core] Credential State request returned with error: Error Domain=AKAuthenticationError Code=-7074 "(null)"
//        AppDelegate.m:435    state is failure =The operation couldn’t be completed. (com.apple.AuthenticationServices.AuthorizationError error 1000.)
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
-(BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray<id<UIUserActivityRestoring>> * __nullable restorableObjects))restorationHandler NS_AVAILABLE_IOS(8_0); {
        if ([userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb]) {
           NSURL *url = userActivity.webpageURL;
            if (url && [TencentOAuth CanHandleUniversalLink:url]) {
     // 兼容[QQApiInterface handleOpenURL:delegate:]的接口回调能力
    //       [QQApiInterface handleOpenUniversallink:url delegate:(id<QQApiInterfaceDelegate>) [QQApiShareEntry class]];
                 return [TencentOAuth HandleUniversalLink:url];
            }else{
                return   [WXApi handleOpenUniversalLink:userActivity delegate:self];
            }

        }

        return YES;

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
    if (YES == [TencentOAuth CanHandleOpenURL:url])
    {
        return [TencentOAuth HandleOpenURL:url];
    }
    if([QQApiInterface handleOpenURL:url delegate:self]==YES) {
        return YES;
    }

    if(YES == [WXApi handleOpenURL:url delegate:self])
    {
        return YES;
    }
    return YES;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
//    [QQApiInterface handleOpenURL:url delegate:self];
    if (YES == [TencentOAuth CanHandleOpenURL:url])
    {
        return [TencentOAuth HandleOpenURL:url];
    }
    if([QQApiInterface handleOpenURL:url delegate:self]==YES) {
        return YES;
    }

    if(YES == [WXApi handleOpenURL:url delegate:self])
    {
        return YES;
    }
    return YES;
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
//    [QQApiInterface handleOpenURL:url delegate:self];
    if (YES == [TencentOAuth CanHandleOpenURL:url])
    {
        return [TencentOAuth HandleOpenURL:url];
    }
    if([QQApiInterface handleOpenURL:url delegate:self]==YES) {
        return YES;
    }

    if(YES == [WXApi handleOpenURL:url delegate:self])
    {
        return YES;
    }
    return YES;
}

#pragma mark - 监听apple登录的状态 用户注销 AppleId 或 停止使用 Apple ID 的状态处理
- (void)monitorSignInWithAppleState {
    if (@available(iOS 13.0,*)) {
        
        NSString *user = [[NSUserDefaults standardUserDefaults] objectForKey:@"userIdentifier"];
        ASAuthorizationAppleIDProvider *provider = [[ASAuthorizationAppleIDProvider alloc] init];
        __block NSString *errorMsg;
        [provider getCredentialStateForUserID:user completion:^(ASAuthorizationAppleIDProviderCredentialState credentialState, NSError * _Nullable error) {
            if (!error) {
                switch (credentialState) {
                    case ASAuthorizationAppleIDProviderCredentialRevoked:
                        NSLog(@"Revoked");
                        //删除钥匙串保持的信息 登出apple登录，等待下次重新登录
                        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userIdentifier"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                        errorMsg = @"苹果授权凭证失效";
                        break;
                        
                    case ASAuthorizationAppleIDProviderCredentialAuthorized:
                        NSLog(@"Authorized");
                        errorMsg = @"苹果授权凭证状态良好";
                        break;
                        
                    case ASAuthorizationAppleIDProviderCredentialNotFound:
                        NSLog(@"NotFound");
                        errorMsg = @"未发现苹果授权凭证";
                        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userIdentifier"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                        break;
                        
                    case ASAuthorizationAppleIDProviderCredentialTransferred:
                        NSLog(@"CredentialTransferred");
                        errorMsg = @"未发现苹果授权凭证";
                        break;
                        
                    default:
                        break;
                }
            } else {
                
                NSLog(@"state is failure =%@",error.localizedDescription);
            }
        }];
    }
}

@end
