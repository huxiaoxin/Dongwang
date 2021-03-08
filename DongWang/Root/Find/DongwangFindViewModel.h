//
//  DongwangFindViewModel.h
//  DongWang
//
//  Created by codehzx on 2020/12/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DongwangFindViewModel : NSObject
+(void)DongwangFindViewModelWithgetGrouphot:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc taskSuuced:(void(^)(id object))Succedblock taskfairler:(void(^)(id message))failerblock;

@end

NS_ASSUME_NONNULL_END
