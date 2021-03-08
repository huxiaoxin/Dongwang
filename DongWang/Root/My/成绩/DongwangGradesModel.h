//
//  DongwangGradesModel.h
//  DongWang
//
//  Created by codehzx on 2020/11/23.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangGradesModel : DongWangBaseModel
@property (nonatomic , copy) NSString              * userId;
@property (nonatomic , copy) NSString              * startTimeStr;
@property (nonatomic , copy) NSString              * correctRateStr;
@property (nonatomic , copy) NSString              * picture;
@property (nonatomic , copy) NSString              * correctRate;
@property (nonatomic , copy) NSString              * groupId;
@property (nonatomic , copy) NSString              * startTime;
@property (nonatomic , copy) NSString              * name;
@property (nonatomic , copy) NSString              * id;

@end

NS_ASSUME_NONNULL_END
