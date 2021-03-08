//
//  DongwangDaletouStatusModel.h
//  DongWang
//
//  Created by codehzx on 2021/2/2.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangDaletouStatusModel : DongWangBaseModel
@property (nonatomic , copy) NSString              * status; //状态 0-未开始 （返回下轮开启时间） 1-开始了（返回本轮结束时间） 2-等待开奖 3-查看开奖结果
@property (nonatomic , copy) NSString              * nextTime; //下一场的开始时间
@property (nonatomic , copy) NSString              * endTime; //如果是开始的话 返回本轮结束时间
@property (nonatomic , copy) NSString              * ruleDes; //规则描述
@property (nonatomic , copy) NSString              * message;
@property (nonatomic , copy) NSString              * topPrize; //本期最高奖项 价值
@property (nonatomic , copy) NSString              * openingTime; //开奖时间
@property (nonatomic , copy) NSString              * url; //背景图
@property (nonatomic , copy) NSString              * limitTime; //答题限制的时间 时间戳
@property (nonatomic , copy) NSString              * scheduleId; 


@end

NS_ASSUME_NONNULL_END
