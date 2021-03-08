//
//  DongwangLottieModel.h
//  DongWang
//
//  Created by codehzx on 2021/1/11.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangLottieModel : DongWangBaseModel
@property (nonatomic , copy) NSString              * audioStatus; //0-启动 1-不启动 默认0
@property (nonatomic , copy) NSString              * actionStatus; //0-启动 1-不启动 默认0
@property (nonatomic , copy) NSString              * actionUrl;
@property (nonatomic , copy) NSString              * audioUrl;
@end

NS_ASSUME_NONNULL_END
