//
//  DongwangNewBangdingNextViewController_V3.h
//  DongWang
//
//  Created by codehzx on 2021/1/18.
//

#import "DongwangBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangNewBangdingNextViewController_V3 : DongwangBaseViewController
@property(nonatomic,copy) NSString * phoneText;
@property(nonatomic,copy) NSString * wxSmsTip;
@property(nonatomic,copy) NSString * openid;
@property(nonatomic,copy) NSString * smsCode;
@property(nonatomic,assign) BOOL    isapplelogoin;
@property(nonatomic,copy) NSString * Mytype;  // type = 2 微信登录。 5 QQ登录

@end

NS_ASSUME_NONNULL_END
