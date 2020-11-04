#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Define.h"
typedef NS_ENUM(NSInteger,SSDeviceType) {
    DeviceiPhone=1,
    DeviceiPodTouch,
    DeviceiPad,
};
typedef NS_ENUM(NSInteger,SSDeviceModel) {
    Simulator=1,
    iPodTouch1G,
    iPodTouch2G,
    iPodTouch3G,
    iPodTouch4G,
    iPodTouch5Gen,
    iPhone3G,
    iPhone3GS,
    iPhone4,
    iPhone4S,
    iPhone5,
    iPhone5_GSM_CDMA,
    iPhone5C,
    iPhone5C_GSM,
    iPhone5C_GSM_CDMA,
    iPhone5S,
    iPhone5S_GSM,
    iPhone5S_GSM_CDMA,
    iPhone6,
    iPhone6Plus,
    iPhone6S,
    iPhone6SPlus,
    iPhoneSE,
    iPhone7,
    iPhone7Plus,
    iPhone8,
    iPhone8Plus,
    iPhoneX,
    iPhoneXS,
    iPhoneXR,
    iPhoneXSMax,
    iPhone7CGR,
    iPhone7PlusGC,
    iPhone7TM,
    iPhone7PlusTM,
    iPad=500,
    iPad3G,
    iPad2WiFi,
    iPad2,
    iPad3,
    iPad2_CDMA,
    iPadMini,
    iPadMiniWiFi,
    iPadMini_GSM_CDMA,
    iPad3WiFi,
    iPad3_GSM_CDMA,
    iPad4WiFi,
    iPad4,
    iPad4_GSM_CDMA,
    iPadAirWiFi,
    iPadAirCellular,
    iPadMini2,
    iPadMini2WiFi,
    iPadMini2Cellular,
    iPadMini3,
    iPadMini4WiFi,
    iPadMini4LTE,
    iPadAir2,
    iPadPro9_7,
    iPadPro12_9,
};
@interface SSDeviceDefault : NSObject
+(SSDeviceDefault *)shareCKDeviceDefault;
-(void)initData;
@property(nonatomic,assign)SSDeviceType deviceType;
@property(nonatomic,assign)SSDeviceModel deviceModel;
@property(nonatomic,assign)CGFloat statuBarHeight;
@property(nonatomic,assign)CGFloat navBarHeight;
@property(nonatomic,assign)CGFloat safeAreaTopHeight;
@property(nonatomic,assign)CGFloat safeAreaBottomHeight;
@property(nonatomic,assign)CGFloat tabBarHeight;
@end
