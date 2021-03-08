//
//  DongwangSignQiandaoModel.h
//  DongWang
//
//  Created by codehzx on 2020/11/16.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN



@interface DongwangSignQiandaoModel : DongWangBaseModel
@property(nonatomic,assign)  BOOL  islast;
@property (nonatomic , copy) NSString              * prizeName;
@property (nonatomic , copy) NSString              * signDate;
@property (nonatomic , copy) NSString              * logo;
@property  (nonatomic, copy) NSString              * todayStatus;// 0,//今日是否签到状态，0-未签到,1-已签到,2-今日待签到
@end

NS_ASSUME_NONNULL_END
