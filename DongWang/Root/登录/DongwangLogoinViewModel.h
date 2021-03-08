//
//  DongwangLogoinViewModel.h
//  DongWang
//
//  Created by codehzx on 2020/10/29.
//

#import <Foundation/Foundation.h>
#import "DongwangAdpageModel.h"
#import "DongwangTabbarModel.h"
#import "DongwangLottieModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DongwangLogoinViewModel : NSObject
#pragma mark--闪验登录
+(void)CLShanyanLogoinWithParmters:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc logoinSuuced:(void(^)(id object))logoinblock logoinfairler:(void(^)(void))failerblock;
#pragma mark--广告
+(void)AdpageRequestWithParmters:(NSMutableDictionary * )mutablparmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc AdpageModel:(void (^)(DongwangAdpageModel * _Nonnull))adpageModel;
#pragma mark--获取验证码
+(void)CodeloginRequestWithParmtersw:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc logoinSuuced:(void(^)(id object))logoinblock logoinfairler:(void(^)(void))failerblock;
#pragma mark--登出
+(void)DongwangLogoinViewModelWithLogintoutParmters:(NSMutableDictionary *)mutableParmtersDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc logoinSuuced:(void(^)(id object))logoinblock logoinfairler:(void(^)(void))failerblock;
#pragma mark--动态加载Tabbar
+(void)DongwangRequestTabbarWithParmtersw:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc logoinSuuced:(void(^)(DongwangTabbarModel * tabbarModel))logoinblock logoinfairler:(void(^)(DongwangTabbarModel * tabbarModel))failerblock;

#pragma mark--获取动效
+(void)DongwangRequesteffectWithParmtersw:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc logoinSuuced:(void(^)(DongwangLottieModel * lottieModel))succedModelblock logoinfairler:(void(^)(DongwangLottieModel * lottieModel))failerblock;


//绑定手机号
+(void)CodeloginRequestWithParmterswBandinghwc:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc logoinSuuced:(void(^)(id object))logoinblock logoinfairler:(void(^)(void))failerblock;


#pragma mark--微信登录授权
+(void)DongwangWechatAutor;

@end

NS_ASSUME_NONNULL_END
