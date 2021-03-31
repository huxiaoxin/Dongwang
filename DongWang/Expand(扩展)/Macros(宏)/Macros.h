//
//  Macros.h
//  SYQuMinApp
//
//  Created by apple on 2018/4/16.
//  Copyright © 2018年 Shuyun. All rights reserved.

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

#define ISIPHONE_6  (ISIPHONE && SCREEN_MAX_LENGTH == 667.0f)  // 6/6s/7/8 /se       4.7寸   375*667
#define ISIPHONE_11  (ISIPHONE && SCREEN_MAX_LENGTH == 896.0f) //11   11promax       414*896
#define ISIPHONE_11Pro  (ISIPHONE && SCREEN_MAX_LENGTH == 812.0f) //11pro         375*812
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
#define PFS70Font [UIFont fontWithName:PFS size:RealWidth(70)]
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

  //#define Protocl_Url @"http://192.168.3.157/"  //隐私协议 用户政策
   #define Protocl_Url @"http://47.101.168.243:91/preview/"  //隐私协议 用户政策
//#define jifenpaifan @"dongwang_h5/integral_flip"  //积分翻牌测试
 #define daletou @"dongwang_h5/document/index.html?type=grandLotto"  //大乐透规则

 #define jifenpaifan @"dongwang_h5/integral_flip/index.html"  //积分翻牌予发布

#define MyintegralExchange  @"/dongwang_h5/document/index.html?type=integralExchange" //积分兑换规则
  // #define Dongwang_BaseUrl @"http://192.168.3.180:8069/" //本机
   // #define Dongwang_BaseUrl   @"http://192.168.3.157:8069/" //测试
  //#define Dongwang_BaseUrl      @"http://3621g2l767.wicp.vip:17570/"//外网
  //#define Dongwang_BaseUrl @"http://192.168.3.117:8069/" //本机
#define Dongwang_BaseUrl @"http://47.101.168.243:8090/" //生产


#define User_Login        @"dongwang-app/app/user/login/v1"  //用户登录
#define Shanping_Img      @"dongwang-app/app/screen/getScreenData" //闪屏
#define effect_lottie     @"/dongwang-app/app/effect/v1" //动效
#define broadcast         @"/dongwang-app/app/broadcast/v1" //中奖列表(消息滚动)
#define Phone_Code        @"dongwang-app/app/sms/getSmsCodeByPhone" //获取验证码
#define User_Loginout     @"dongwang-app/app/user/logout" //登出
#define User_Info         @"dongwang-app/app/user/info" //用户信息
#define User_DeleAccount  @"dongwang-app/app/user/cancelAccount" //注销账户
#define User_UploadImg    @"dongwang-app/app/user/updateUserInfo"//上传头像
#define User_realAuth     @"dongwang-app/app/user/realAuth/v1"//实名认证
#define User_bingwechat   @"dongwang-app/app/user/bindWx"  //绑定微信
#define User_bingwechat_hwc   @"dongwang-app/app/user/bindWx/v1"  //绑定微信
#define User_addresslist  @"dongwang-app/receive/address/addressList" //收货地址列表
#define User_commiteaddress @"dongwang-app/receive/address/save" //新增收货地址
#define User_deleateddress @"dongwang-app/receive/address/delete" //删除收货地址
#define User_editaddress @"dongwang-app/receive/address/update" //编辑收货地址

#define User_ProvinceList @"dongwang-app/app/province/getProvinceList" //省市区
#define User_addressInfo  @"dongwang-app/receive/address/info" //地址详情
#define User_prize         @"dongwang-app/app/prize/getMyPrizeList/v1"//我的奖品信息列表接口
#define User_daoju         @"dongwang-app/app/prize/getPropList/v1"//我的道具列表接口
#define User_exam         @"dongwang-app/log/exam/getMyGroupList"//我的成绩
#define User_DetailList         @"dongwang-app/log/exam/getMyGroupDetailList"//我的成绩详情

#define User_meaasge      @"dongwang-app/app/message/list"//我的消息
#define User_meaasgeDetai @"dongwang-app/app/user/info"//我的消息详情

#define User_feedBack      @"dongwang-app/app/feedBack/save"//用户反馈
#define User_bindalipay     @"dongwang-app/app/user/bindAliPay/v1"//绑定支付宝
#define User_goWithdraw    @"dongwang-app/app/user/goWithdraw/v1"//提现
#define User_drawdetail    @"dongwang-app/app/withdraw/cashDetail"//明细
#define User_getSignList   @"dongwang-app/app/sign/getSignList/v1"//签到
#define User_goSign        @"dongwang-app/app/sign/goSign/v1"//立即签到

#define User_getTaskList      @"dongwang-app/app/task/getTaskList"//任务
#define User_getFindHotGroup   @"dongwang-app/app/find/getFindHotGroup"//发现



#define Home_taglist        @"dongwang-app/app/tag/list" //首页顶部标签栏
#define Home_bannar        @"dongwang-app/app/home/getBannerList/v1" //首页banner
#define Home_IconList        @"dongwang-app/app/home/getHomeIconList/v1" //首页Icon
#define Home_AnsureList       @"dongwang-app/app/home/homeAnswerList/v1" //首页题组
#define Home_AnsureList_old       @"dongwang-app/app/home/homeAnswerList" //首页题组(代志成)

#define ActiveReward          @"dongwang-app/app/integral/getActiveRewardList"
//活跃奖励积分

#define takeActiveIntegral   @"dongwang-app/app/integral/takeActiveIntegral"
//领取活跃积分

#define getIntegralDetailList          @"dongwang-app/app/integral/getIntegralDetailList"
//活跃列表
#define getIntegralPrizeList @"dongwang-app/app/integral/getIntegralPrizeList"
//积分翻牌奖品展示列表

//用户积分兑换道具(免答卡、加时卡)
#define  userexchangeProp   @"dongwang-app/app/integral/exchangeProp"
#define getExchangeCardList @"dongwang-app/app/integral/getExchangeCardList"
//积分兑换模块兑换记录列表
#define ViewsTimer   @"dongwang-app/app/point/detention/v1"
//页面浏览时长

#define userBanding_hwc   @"/dongwang-app/app/user/bindPhone"  //绑定微信

#define bulletChat_danmu  @"dongwang-app/app/game/lottery/bulletChat" //弹幕

#define daletou_status    @"dongwang-app/app/game/lottery/getSection" //大乐透状态

#define daletou_myLottery  @"dongwang-app/app/game/lottery/myLottery"//我的乐透码


#define joinLottery       @"dongwang-app/app/game/lottery/joinLottery" //立即参与

#define pastActivity        @"dongwang-app/app/game/lottery/pastActivity" //往期列表
#define pastDetail         @"dongwang-app/app/game/lottery/pastDetail" //往期详情
#define getAnswerResult    @"dongwang-app/app/game/lottery/getAnswerResult"//获取正确答案

#define receiveAwards      @"dongwang-app/app/game/lottery/receiveAwards" //去领取
#pragma mark -- 轮循3次之后都不成功, 使用ip请求一次数据
#define StandbyIPURL @"http://106.15.130.118" // http://106.15.130.118

#define BASE_IPURLHTML @"https://api-syksc.25876.com/web/h5"

#define BASE_VIEWRULESHTML @"https://api-syksc.25876.com/web/h5/static.html#/text" // 开宝箱的查看答题规则
#define BASE_ANSWERHTML @"https://api-syksc.25876.com/web/h5/index.html?v=3.0.8" //
// http://192.168.191.1:8080/?debug=1 /https://api-syksc.25876.com/h5/index.html?v=3.0.8  // 答题h5
#define BASE_OPENPRICEHTML @"https://api-syksc.25876.com/web/h5/index.html?prize=1" // http://192.168.191.1:8080/?debug=1&prize=1/http://192.168.3.250:8080?prize=1 // 开宝箱
#endif /* Macros_h */
