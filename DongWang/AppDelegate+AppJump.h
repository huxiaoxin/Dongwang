//
//  AppDelegate+AppJump.h
//  DongWang
//
//  Created by codehzx on 2020/12/22.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (AppJump)
-(UIViewController *)getCurrentVC;
+(void)AppDelegateJumpVcWithapplication:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
@end

NS_ASSUME_NONNULL_END
