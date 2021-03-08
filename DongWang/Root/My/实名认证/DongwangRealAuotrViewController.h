//
//  DongwangRealAuotrViewController.h
//  DongWang
//
//  Created by codehzx on 2020/11/10.
//

#import "DongwangBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^RealAuotrSucced)(void);
@interface DongwangRealAuotrViewController : DongwangBaseViewController
@property(nonatomic,copy) RealAuotrSucced   autoreBlock;
@end

NS_ASSUME_NONNULL_END
