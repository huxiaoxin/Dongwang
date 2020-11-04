//
//  Macros.h
//  SYQuMinApp
//
//  Created by apple on 2018/4/16.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define CHIS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define CHISiPhoneX [[UIScreen mainScreen] bounds].size.width >=375.0f && [[UIScreen mainScreen] bounds].size.height >=812.0f&& CHIS_IPHONE
//状态栏高度
#define kStatusBarHeight (CGFloat)(CHISiPhoneX?(44):(20))
// 导航栏高度
#define kNavBarHBelow7 (44)
// 状态栏和导航栏总高度
#define kNavBarHAbove7 (CGFloat)(CHISiPhoneX?(88):(64))
// TabBar高度
#define kTabBarHeight (CGFloat)(CHISiPhoneX?(49+34):(49))
// 顶部安全区域远离高度
#define kTopBarSafeHeight (CGFloat)(CHISiPhoneX?(44):(0))
// 底部安全区域远离高度
#define kBottomSafeHeight (CGFloat)(CHISiPhoneX?(34):(0))
// iPhoneX的状态栏高度差值
#define kTopBarDifHeight (CGFloat)(CHISiPhoneX?(24):(0))


//屏幕宽高
#define  SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define  SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define Proport_Width (SCREEN_WIDTH * (1.0 / 375.0))
#define Proport_Height (SCREEN_HEIGHT * (1.0 / 667.0))

//屏幕的高度
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))

//屏幕是否是横屏状态
#define ISHORIZONTALSCREEM UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)
//retain屏
#define ISRETAIN ([[UIScreen mainScreen] scale] >= 2.0)
//屏幕尺寸判断
#define ISIPHONE   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define ISIPHONE_4  (ISIPHONE && SCREEN_MAX_LENGTH == 480.0f)  // 4/4s            3.5寸   320*480
#define ISIPHONE_5  (ISIPHONE && SCREEN_MAX_LENGTH == 568.0f)  // 5/5s/se           4寸   320*568
//#define ISIPHONE_5 YES
#define ISIPHONE_6  (ISIPHONE && SCREEN_MAX_LENGTH == 667.0f)  // 6/6s/7/8        4.7寸   375*667
#define ISIPHONE_6P (ISIPHONE && SCREEN_MAX_LENGTH == 736.0f)  // 6p/6ps/7p/8p    5.5寸   414*736
#define ISIPHONE_X  (ISIPHONE && SCREEN_MAX_LENGTH >= 812.0f && [[UIScreen mainScreen] bounds].size.width >=375.0f)  // iPhonex         5.8寸   375*812

//iOS版本判断
#define SYSTEM_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])
#define IS_IOS7_OR_LATER (SYSTEM_VERSION >= 7.0)
#define IS_IOS8_OR_LATER (SYSTEM_VERSION >= 8.0)
#define IS_IOS9_OR_LATER (SYSTEM_VERSION >= 9.0)
#define IS_IOS10_OR_LATER (SYSTEM_VERSION >= 10.0)
#define IS_IOS11_OR_LATER (SYSTEM_VERSION >= 11.0)


//statusbar默认高度
#define STATUS_H  ([UIApplication sharedApplication].statusBarFrame.size.height)

//状态栏高度
#define NAV_STATE_HEIGHT (ISHORIZONTALSCREEM ? (ISIPHONE_X ? 0 : STATUS_H) : STATUS_H )

//导航栏高度
#define NAV_HEIGHT (NAV_STATE_HEIGHT + 44.0f)



//去掉导航栏后的view的frame
//#define TABLE_FRAME CGRectMake(0, NAV_HEIGHT, SCREEN_WIDTH,SCREEN_HEIGHT-NAV_HEIGHT )


/****图片****/
//#define kImage(image)   [UIImage imageNamed:image]
//bundle中的图片
//#define EasyImageFile(file) [@"EasyNavButton.bundle" stringByAppendingPathComponent:file]


//强弱引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type
#define kStrongSelf(type) __strong typeof(type) type = weak##type;
#define WEAK(weaks,s)  __weak __typeof(&*s)weaks = s;

/**打印****/
#define ISSHOWLOG 0
#define EasyLog(fmt, ...) if(ISSHOWLOG) { NSLog(fmt,##__VA_ARGS__); }


/*随机颜色*/
#define kColorRandom kColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define kColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

/***通知***/
#define EasyNotificaiotn [NSNotificationCenter defaultCenter]
#define EasyNotificationAdd(kSelector,kName) [EasyNotificaiotn addObserver:self selector:@selector(kSelector) name:kName object:nil];
#define EasyNotificationPost(kName) [EasyNotificaiotn postNotificationName:kName object:nil];
#define EasyNotificationRemove(kName) [EasyNotificaiotn removeObserver:self name:kName object:nil];
// 右侧响应长度
#define CARDITEM_RIGHT_RESPONDLENGTH    SCREEN_WIDTH / 320.0 * 80

// --- 字体
#define RealWidth(x) (int)(x * Proport_Width)
#define PFR [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? @"PingFangSC-Regular" : @"PingFang SC"
#define PFR40Font [UIFont fontWithName:PFR size:40]
#define PFR32Font [UIFont fontWithName:PFR size:32]
#define PFR30Font [UIFont fontWithName:PFR size:30]
#define PFR24Font [UIFont fontWithName:PFR size:RealWidth(24)]
#define PFR22Font [UIFont fontWithName:PFR size:RealWidth(22)]
#define PFR20Font [UIFont fontWithName:PFR size:RealWidth(20)]
#define PFR18Font [UIFont fontWithName:PFR size:RealWidth(18)]
#define PFR17Font [UIFont fontWithName:PFR size:RealWidth(17)]
#define PFR16Font [UIFont fontWithName:PFR size:RealWidth(16)]
#define PFR15Font [UIFont fontWithName:PFR size:RealWidth(15)]
#define PFR14Font [UIFont fontWithName:PFR size:RealWidth(14)]
#define PFR13Font [UIFont fontWithName:PFR size:RealWidth(13)]
#define PFR12Font [UIFont fontWithName:PFR size:RealWidth(12)]
#define PFR11Font [UIFont fontWithName:PFR size:RealWidth(11)]
#define PFR10Font [UIFont fontWithName:PFR size:RealWidth(10)]
#define PFR9Font [UIFont fontWithName:PFR size:RealWidth(9)]
#define PFR8Font [UIFont fontWithName:PFR size:RealWidth(8)]
#define PFR7Font [UIFont fontWithName:PFR size:RealWidth(7)]

#define PFS @"PingFangSC-Semibold" // 平方中粗
#define PFS50Font [UIFont fontWithName:PFS size:RealWidth(50)]
#define PFS40Font [UIFont fontWithName:PFS size:RealWidth(40)]
#define PFS32Font [UIFont fontWithName:PFS size:RealWidth(32)]
#define PFS30Font [UIFont fontWithName:PFS size:RealWidth(30)]
#define PFS26Font [UIFont fontWithName:PFS size:RealWidth(26)]
#define PFS25Font [UIFont fontWithName:PFS size:RealWidth(25)]
#define PFS24Font [UIFont fontWithName:PFS size:RealWidth(24)]
#define PFS22Font [UIFont fontWithName:PFS size:RealWidth(22)]
#define PFS20Font [UIFont fontWithName:PFS size:RealWidth(20)]
#define PFS18Font [UIFont fontWithName:PFS size:RealWidth(18)]
#define PFS17Font [UIFont fontWithName:PFS size:RealWidth(17)]
#define PFS16Font [UIFont fontWithName:PFS size:RealWidth(16)]
#define PFS15Font [UIFont fontWithName:PFS size:RealWidth(15)]
#define PFS14Font [UIFont fontWithName:PFS size:RealWidth(14)]
#define PFS13Font [UIFont fontWithName:PFS size:RealWidth(13)]
#define PFS12Font [UIFont fontWithName:PFS size:RealWidth(12)]
#define PFS11Font [UIFont fontWithName:PFS size:RealWidth(11)]
#define PFS10Font [UIFont fontWithName:PFS size:RealWidth(10)]
#define PFS9Font [UIFont fontWithName:PFS size:RealWidth(9)]

#define HEXCOLOR(hexColor)  [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:1]
#define RGBCOLOR(hexColor,hexalpha) [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:hexalpha]

#pragma mark -- 用户头像
#define HeaderImageArray @[@"头像-2", @"头像-3", @"头像-4", @"头像-5", @"头像-6", @"头像-7", @"头像-8", @"头像-9"]

#pragma mark -- ipurl
#define BASE_IPURL @"http://192.168.3.155" // http://192.168.3.137:8080| http://192.168.3.157
//#define BASE_IPURL @"http://139.224.221.200:8080"
//#define BASE_IPURL @"http://139.224.199.106:8080"
//#define BASE_IPURL @"https://api-syksc.25876.com"



#define Protocl_Url @"http://192.168.3.157/"  //隐私协议 用户政策

#pragma mark -- 轮循3次之后都不成功, 使用ip请求一次数据
#define StandbyIPURL @"http://106.15.130.118" // http://106.15.130.118

#define BASE_IPURLHTML @"https://api-syksc.25876.com/web/h5"

#define BASE_VIEWRULESHTML @"https://api-syksc.25876.com/web/h5/static.html#/text" // 开宝箱的查看答题规则
#define BASE_ANSWERHTML @"https://api-syksc.25876.com/web/h5/index.html?v=3.0.8" //
// http://192.168.191.1:8080/?debug=1 /https://api-syksc.25876.com/h5/index.html?v=3.0.8  // 答题h5
#define BASE_OPENPRICEHTML @"https://api-syksc.25876.com/web/h5/index.html?prize=1" // http://192.168.191.1:8080/?debug=1&prize=1/http://192.168.3.250:8080?prize=1 // 开宝箱
#endif /* Macros_h */
