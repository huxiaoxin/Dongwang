//
//  DongwangMyHistoryModel.h
//  DongWang
//
//  Created by sycm on 2021/2/23.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangMyHistoryModel : DongWangBaseModel
@property (nonatomic , assign) NSInteger              status;
@property (nonatomic , assign) NSInteger              id;
@property (nonatomic , copy) NSString              * worth;
@property (nonatomic , assign) NSInteger              receive;
@property (nonatomic , copy) NSString              * name;
@property (nonatomic , copy) NSString              * ticketNum;
@end

NS_ASSUME_NONNULL_END
