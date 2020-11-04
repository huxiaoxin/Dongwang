//
//  DongwangLogoinViewModel.h
//  DongWang
//
//  Created by codehzx on 2020/10/29.
//

#import <Foundation/Foundation.h>
#import "DongwangAdpageModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DongwangLogoinViewModel : NSObject
#pragma mark--闪验登录
+(void)CLShanyanLogoinWithParmters:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc logoinSuuced:(void(^)(void))logoinblock logoinfairler:(void(^)(void))failerblock;
#pragma mark--广告
+(void)AdpageRequestWithParmters:(NSMutableDictionary * )mutablparmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc AdpageModel:(void (^)(DongwangAdpageModel * _Nonnull))adpageModel;
#pragma mark--验证码登录
+(void)CodeloginRequestWithParmtersw:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc logoinSuuced:(void(^)(void))logoinblock logoinfairler:(void(^)(void))failerblock;
@end

NS_ASSUME_NONNULL_END
