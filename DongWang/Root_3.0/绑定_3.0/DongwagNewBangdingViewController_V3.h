//
//  DongwagNewBangdingViewController_V3.h
//  DongWang
//
//  Created by codehzx on 2021/1/18.
//

#import "DongwangBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwagNewBangdingViewController_V3 : DongwangBaseViewController
@property(nonatomic,copy) NSString * wxSmsTip;
@property(nonatomic,copy) NSString * openid;
@property(nonatomic,assign) BOOL  isappleLogoin;
@property(nonatomic,copy) NSString * Mytype; // 2= 微信 5 = qq

@end

NS_ASSUME_NONNULL_END
