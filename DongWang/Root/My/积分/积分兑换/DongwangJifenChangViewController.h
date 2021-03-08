//
//  DongwangJifenChangViewController.h
//  DongWang
//
//  Created by codehzx on 2020/11/18.
//

#import "DongwangBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^jifenDuihuanSuccedBlock)(void);
@interface DongwangJifenChangViewController : DongwangBaseViewController
@property(nonatomic,copy) jifenDuihuanSuccedBlock SuccedBlock;
@end

NS_ASSUME_NONNULL_END
