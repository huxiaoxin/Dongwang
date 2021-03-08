//
//  DongwangcategoryViewModel.h
//  DongWang
//
//  Created by codehzx on 2020/12/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DongwangcategoryViewModel : NSObject
+(void)DongwangFenleiViewModelWithgetTask:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc taskSuuced:(void(^)(id object,BOOL isNewTask,NSString *completeProgress))Succedblock taskfairler:(void(^)(id message))failerblock;
@end

NS_ASSUME_NONNULL_END
