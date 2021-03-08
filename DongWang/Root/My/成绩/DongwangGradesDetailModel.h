//
//  DongwangGradesDetailModel.h
//  DongWang
//
//  Created by codehzx on 2020/11/25.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangGradesDetailModel : DongWangBaseModel
@property (nonatomic , copy) NSString              * myAnswer;
@property (nonatomic , copy) NSString              * questionTitle;
@property (nonatomic , copy) NSString              * statusValue;
@property (nonatomic , copy) NSString              * optionId;
@property (nonatomic , copy) NSString              * rightAnswer;
@property (nonatomic , copy) NSString              * questionDesc;
@property (nonatomic , copy) NSString              * orderNo;
@property (nonatomic , copy) NSString              * userId;
@property (nonatomic , copy) NSString              * questionId;
@property (nonatomic , copy) NSString              * groupId;
@property (nonatomic , copy) NSString              * status;
@property (nonatomic , copy) NSString              * name;
@property (nonatomic,assign) CGFloat                 Cellheight;
@end

NS_ASSUME_NONNULL_END
