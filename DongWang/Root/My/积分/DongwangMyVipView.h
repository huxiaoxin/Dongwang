//
//  DongwangMyVipView.h
//  DongWang
//
//  Created by codehzx on 2020/12/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DongwangMyVipView : UIView
#pragma mark -- 获取活跃积分
+(void)DongwangMyViewModelWithActiveRewardList:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;

#pragma mark-- 领取活跃积分
+(void)DongwangMyViewModelWithtakeActiveIntegral:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;

#pragma mark -- 积分列表
+(void)DongwangMyViewModelWithMyRewardList:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;

#pragma mark--积分翻牌奖品展示列表接口
+(void)DongwangMyViewModelWithgetIntegralPrizeList:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;

#pragma mark--积分兑换模块兑换记录列表
+(void)DongwangMyViewModelWithgetExchangeCardList:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;

#pragma mark--用户积分兑换道具(免答卡、加时卡)
+(void)DongwangMyViewModelWithuserexchangeProp:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;

@end

NS_ASSUME_NONNULL_END
