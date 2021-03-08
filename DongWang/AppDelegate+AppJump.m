//
//  AppDelegate+AppJump.m
//  DongWang
//
//  Created by codehzx on 2020/12/22.
//

#import "AppDelegate+AppJump.h"

@implementation AppDelegate (AppJump)
//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }

    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    
    return currentVC;
}
//-(UIViewController *)getCurrentVC
//{
// UIViewController *result = nil;
//    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
//    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到UIWindowLevelNormal的
//    if (window.windowLevel != UIWindowLevelNormal)
//    {
//        NSArray *windows = [[UIApplication sharedApplication] windows];
//        for(UIWindow * tmpWin in windows)
//        {
//            if (tmpWin.windowLevel == UIWindowLevelNormal)
//            {
//                window = tmpWin;
//                break;
//            }
//        }
//    }
//    id  nextResponder = nil;
//    UIViewController *appRootVC=window.rootViewController;
//    //    如果是present上来的appRootVC.presentedViewController 不为nil
//    if (appRootVC.presentedViewController) {
//        nextResponder = appRootVC.presentedViewController;
//    }else{
//
//        UIView *frontView = [[window subviews] objectAtIndex:0];
//        nextResponder = [frontView nextResponder];
//    }
//
//    if ([nextResponder isKindOfClass:[UITabBarController class]]){
//        UITabBarController * tabbar = (UITabBarController *)nextResponder;
//        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
//        //        UINavigationController * nav = tabbar.selectedViewController ; 上下两种写法都行
//        result=nav.childViewControllers.lastObject;
//
//    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
//        UIViewController * nav = (UIViewController *)nextResponder;
//        result = nav.childViewControllers.lastObject;
//    }else{
//        result = nextResponder;
//    }
//    return result;
//}

+(void)AppDelegateJumpVcWithapplication:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
}

@end
