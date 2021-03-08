//
//  DongwangAdressViewController.h
//  DongWang
//
//  Created by codehzx on 2020/11/9.
//

#import "DongwangBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^AdressRealod)(void);
@interface DongwangAdressViewController : DongwangBaseViewController
@property(nonatomic,copy) AdressRealod realoadBlock;
@end

NS_ASSUME_NONNULL_END
