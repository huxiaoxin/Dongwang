#import "SSDeviceDefault.h"
#ifndef Define_h
#define Define_h
#define SCREEN_Height [[UIScreen mainScreen] bounds].size.height
#define SCREEN_Width  [[UIScreen mainScreen] bounds].size.width
#define makeColorRgb(_r, _g, _b)   [UIColor colorWithRed:_r / 255.0f green: _g / 255.0f blue:_b / 255.0f alpha:1]
#define SSChatCellColor  makeColorRgb(250, 250, 250)
#define BackGroundColor  makeColorRgb(246, 247, 248)
#define CellLineColor  makeColorRgb(200, 200, 200)
#define SafeAreaTop_Height  [SSDeviceDefault shareCKDeviceDefault].safeAreaTopHeight
#define SafeAreaBottom_Height  [SSDeviceDefault shareCKDeviceDefault].safeAreaBottomHeight
#define StatuBar_Height  [SSDeviceDefault shareCKDeviceDefault].statuBarHeight
#endif
