//
//  DongwangtixianModel.h
//  DongWang
//
//  Created by codehzx on 2020/11/24.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangtixianModel : DongWangBaseModel
@property (nonatomic , copy) NSString              * amount;
@property (nonatomic , copy) NSString              * status;
@property (nonatomic , copy) NSString              * userId;
@property (nonatomic , copy) NSString              * withdrawStatus;
@property (nonatomic , copy) NSString              * applyTime;
@property (nonatomic , copy) NSString              * opinion;
@property (nonatomic , copy) NSString              * applyTimeStr;
@property (nonatomic , copy) NSString              * finishTimeStr;
@property (nonatomic , copy) NSString              * finishTime;
@property(nonatomic  , copy) NSString              * channel;//渠道 0-支付宝 1-微信

@end

NS_ASSUME_NONNULL_END
