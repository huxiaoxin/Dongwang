//
//  DongwangDaletouViewModel.h
//  DongWang
//
//  Created by codehzx on 2021/2/2.
//

#import <Foundation/Foundation.h>
#import "DongwangJoinModel.h"
#import "DongwangAnswerResultModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DongwangDaletouViewModel : NSObject
#pragma mark--弹幕
+(void)DongwangDaletouRequestbulletChat:(NSMutableDictionary *)parmters RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc requestSucced:(void(^)(id object))succedblock requestfairler:(void(^)(void))failerblock;

#pragma mark--大乐透状态
+(void)DongwangDaletouRequestdaletouStatus:(NSMutableDictionary *)parmters RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc requestSucced:(void(^)(id object))succedblock requestfairler:(void(^)(void))failerblock;

#pragma mark--我的乐透码
+(void)DongwangDaletouRequestMyLottery:(NSMutableDictionary *)parmters RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc requestSucced:(void(^)(NSArray *  dataArr , NSString * openingTime))succedblock requestfairler:(void(^)(void))failerblock;

#pragma mark--立即参与
+(void)DongwangDaletouRequestJoinLottery:(NSMutableDictionary *)parmters RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc requestSucced:(void(^)( DongwangJoinModel * joinModel,NSMutableDictionary *responseListDic))succedblock requestfairler:(void(^)(void))failerblock;

#pragma mark--获取正确答案
+(void)DongwangDaletouRequestgetAnswerResult:(NSMutableDictionary *)parmters RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc requestSucced:(void(^)(DongwangAnswerResultModel  *  resultModel))succedblock requestfairler:(void(^)(void))failerblock;

#pragma mark--往期列表
+(void)DongwangDaletouRequestgetpastActivity:(NSMutableDictionary *)parmters RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc requestSucced:(void(^)(id    resultobject))succedblock requestfairler:(void(^)(void))failerblock;
#pragma mark --往期详情
+(void)DongwangDaletouRequestgetpastActivitydetail:(NSMutableDictionary *)parmters RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc requestSucced:(void(^)(id   resultobject, NSMutableArray * lotteryResponsesArr))succedblock requestfairler:(void(^)(void))failerblock;

#pragma mark --去领取
+(void)DongwangDaletouRequestreceiveAwards:(NSMutableDictionary *)parmters RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc requestSucced:(void(^)(id   resultobject))succedblock requestfairler:(void(^)(void))failerblock;


@end

NS_ASSUME_NONNULL_END
