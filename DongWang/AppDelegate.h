//
//  AppDelegate.h
//  DongWang
//
//  Created by codehzx on 2020/10/20.
//

#import <UIKit/UIKit.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property(nonatomic,strong) UIWindow * window;
@property(nonatomic,strong) TencentOAuth * tencentOAuth;



+ (AppDelegate *)getAppDelegate;

@end

