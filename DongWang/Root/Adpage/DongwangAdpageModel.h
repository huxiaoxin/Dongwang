//
//  DongwangAdpageModel.h
//  DongWang
//
//  Created by codehzx on 2020/10/30.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangAdpageModel : DongWangBaseModel
@property (nonatomic , copy) NSString              * status;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * url;
@property (nonatomic , copy) NSString              * del;
@property (nonatomic , copy) NSString              * updateUser;
@property (nonatomic , copy) NSString              * updateTime;
@property (nonatomic , copy) NSString              * endTimeStr;
@property (nonatomic , copy) NSString              * action;
@property (nonatomic , copy) NSString              * endTime;
@property (nonatomic , copy) NSString              * sourceType;
@property (nonatomic , copy) NSString              * createTimeStr;
@property (nonatomic , copy) NSString              * terminal;
@property (nonatomic , copy) NSString              * imageUrl;
@property (nonatomic , copy) NSString              * type;
@property (nonatomic , copy) NSString              * Dongwang_id;
@property (nonatomic , copy) NSString              * startTimeStr;
@property (nonatomic , copy) NSString              * insertUser;
@property (nonatomic , copy) NSString              * versions;
@property (nonatomic , copy) NSString              * times;
@property (nonatomic , copy) NSString              * createTime;
@property (nonatomic , copy) NSString              * startTime;
@property (nonatomic , copy) NSString              * updateTimeStr;
@property(nonatomic,assign)  BOOL                    isexsit;  //是否存在model；
@end

NS_ASSUME_NONNULL_END
