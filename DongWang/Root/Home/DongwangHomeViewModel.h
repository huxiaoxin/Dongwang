//
//  DongwangHomeViewModel.h
//  DongWang
//
//  Created by codehzx on 2020/12/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DongwangHomeViewModel : NSObject
+(void)DongwangHomeTagList:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc taskSuuced:(void(^)(NSMutableArray * modelAarr ,NSMutableArray *  TagArr))Succedblock taskfairler:(void(^)(id message))failerblock;

+(void)DongwangHomeBannar:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc taskSuuced:(void(^)(NSMutableArray * modelAarr ,NSMutableArray * ImgsUrl))Succedblock taskfairler:(void(^)(id message))failerblock;

+(void)DongwangHomeIcon:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc taskSuuced:(void(^)(NSMutableArray * modelAarr,NSMutableArray * chunModelArr))Succedblock taskfairler:(void(^)(id message))failerblock;

+(void)DongwangHomeAnsurelist:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc taskSuuced:(void(^)(NSMutableArray * modelAarr))Succedblock taskfairler:(void(^)(id message))failerblock;
+(void)DongwangHomeAnsurelist_old:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc taskSuuced:(void(^)(NSMutableArray * modelAarr))Succedblock taskfairler:(void(^)(id message))failerblock;

//

+(void)DongwangHomeBroadcastlist:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc taskSuuced:(void(^)(NSMutableArray * modelAarr))Succedblock taskfairler:(void(^)(id message))failerblock;

@end

NS_ASSUME_NONNULL_END
