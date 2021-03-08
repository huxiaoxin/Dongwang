//
//  DongwangBandingViewController.h
//  DongWang
//
//  Created by codehzx on 2020/10/22.
//

#import "DongwangBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangBandingViewController : DongwangBaseViewController
@property(nonatomic,copy) NSString * wxSmsTip;
@property(nonatomic,copy) NSString * openid;
@property(nonatomic,assign) BOOL  isappleLogoin;
@property(nonatomic,copy) NSString * Mytype; // 2= 微信 5 = qq
@end

NS_ASSUME_NONNULL_END
