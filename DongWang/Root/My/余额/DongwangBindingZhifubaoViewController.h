//
//  DongwangBindingZhifubaoViewController.h
//  DongWang
//
//  Created by codehzx on 2020/11/11.
//

#import "DongwangBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^bindingAplipay)(void);
@interface DongwangBindingZhifubaoViewController : DongwangBaseViewController
@property(nonatomic,copy) bindingAplipay  bindblock;
@end

NS_ASSUME_NONNULL_END
