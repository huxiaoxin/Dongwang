//
//  DongwangDaletouHistoryModel.h
//  DongWang
//
//  Created by codehzx on 2021/2/23.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface PrizeResponses :DongWangBaseModel
@property (nonatomic , copy) NSString              * awardsWorth;
@property (nonatomic , copy) NSString              * awardsName;
@property (nonatomic , copy) NSString              * awardsNum;
@end
@interface DongwangDaletouHistoryModel : DongWangBaseModel
@property (nonatomic , copy) NSString              * daletou_id;
@property (nonatomic , copy) NSArray<NSString *>              * ticketNums;
@property (nonatomic , copy) NSString              * schedule;
@property (nonatomic , copy) NSArray<PrizeResponses *>              * prizeResponses;
@property (nonatomic , copy) NSString              * topPrize;
@property(nonatomic,assign) CGFloat CellHeight;
@property(nonatomic,assign) BOOL isShowline;

@end

NS_ASSUME_NONNULL_END
