//
//  DongwangPrivetaWebViewController.h
//  DongWang
//
//  Created by codehzx on 2020/10/20.
//

#import "DongwangBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger ,VCType){
    VCPush = 0,
    VCPressent =1
};
@interface DongwangPrivetaWebViewController : DongwangBaseViewController
@property(nonatomic,copy)  NSString * protoclUrlText;
@property(nonatomic,assign) VCType  type;
@property(nonatomic,copy) NSString  * titleName;
@property(nonatomic,assign) BOOL  isActity; // 是否开启底部导航栏活动
@end

NS_ASSUME_NONNULL_END
