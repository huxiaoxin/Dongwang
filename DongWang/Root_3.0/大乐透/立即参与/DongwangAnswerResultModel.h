//
//  DongwangAnswerResultModel.h
//  DongWang
//
//  Created by codehzx on 2021/2/19.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangAnswerResultModel : DongWangBaseModel
@property (nonatomic , copy) NSString              * topPrize; //本期最高奖项
@property (nonatomic , copy) NSString              * openingTime; //开奖时间
@property (nonatomic , copy) NSString              * ticketNum; //奖券码
@end

NS_ASSUME_NONNULL_END
