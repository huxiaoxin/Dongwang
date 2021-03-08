//
//  DongwangMyVipView.m
//  DongWang
//
//  Created by codehzx on 2020/12/7.
//

#import "DongwangMyVipView.h"
#import "DongwangJifenTreeModel.h"
#import "DongwangJifenDetailModel.h"
#import "DongwangDuihuanModel.h"
@implementation DongwangMyVipView
//活跃积分
+(void)DongwangMyViewModelWithActiveRewardList:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    //    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
        [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,ActiveReward] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
            [CHShowMessageHud dismissHideHUD:CurrentVc.view];
            NSLog(@"积分:%@",responseObject);
            NSMutableArray * TempArr  = [[NSMutableArray alloc]init];
            NSArray * data = [responseObject objectForKey:@"data"];
            for (NSDictionary * responeDic in data) {
                DongwangJifenTreeModel * treeModel = [DongwangJifenTreeModel BaseinitWithDic:responeDic];
                [TempArr addObject:treeModel];
            }
            if (Succedblock) {
                Succedblock(TempArr);
            }
            
            NSString * message = [responseObject objectForKey:@"message"];
            if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
                [CHShowMessageHud showMessageText:message];
            }

        } Failure:^(id failure) {
            
            if (failerblock) {
                failerblock(failure);
            }
            [CHShowMessageHud dismissHideHUD:CurrentVc.view];
            [CHShowMessageHud showMessageText:failure];
        }];

}
//领取积分
+(void)DongwangMyViewModelWithtakeActiveIntegral:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
//    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,takeActiveIntegral] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        NSLog(@"领取活跃积分:%@",responseObject);
        [UserManager UserManagerRealoadinfomationSuuced:^{
        if (Succedblock) {
        Succedblock(responseObject);
        }
        } fairler:^{
            
        }];
        NSString * message = [responseObject objectForKey:@"message"];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }

    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];

    
}
//积分列表
+(void)DongwangMyViewModelWithMyRewardList:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    NSString * Page = [NSString stringWithFormat:@"%@",mutableParmterDic[@"page"]];
    //    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    NSLog(@"请求地址:%@",[NSString stringWithFormat:@"%@%@?page=%@",Dongwang_BaseUrl,getIntegralDetailList,Page]);
        [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@?page=%@",Dongwang_BaseUrl,getIntegralDetailList,Page] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
            [CHShowMessageHud dismissHideHUD:CurrentVc.view];
            NSLog(@"积分列表:%@",responseObject);
            NSArray * DataArr =(NSArray *) [[responseObject objectForKey:@"data"] objectForKey:@"resultList"];
            NSMutableArray * TempArr  = [[NSMutableArray alloc]init];
            for (int index = 0; index < DataArr.count; index ++ ) {
                DongwangJifenDetailModel * jifenModel = [DongwangJifenDetailModel BaseinitWithDic:DataArr[index]];
                [TempArr addObject:jifenModel];
            }
            if (Succedblock) {
                Succedblock(TempArr);
            }
            NSString * message = [responseObject objectForKey:@"message"];
            if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
                [CHShowMessageHud showMessageText:message];
            }
        } Failure:^(id failure) {
            
            if (failerblock) {
                failerblock(failure);
            }
            [CHShowMessageHud dismissHideHUD:CurrentVc.view];
            [CHShowMessageHud showMessageText:failure];
        }];

    
}

//积分翻牌奖品展示列表接口
+(void)DongwangMyViewModelWithgetIntegralPrizeList:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    
    //    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
        [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,getIntegralDetailList] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
            [CHShowMessageHud dismissHideHUD:CurrentVc.view];
            NSLog(@"积分翻牌奖品列表:%@",responseObject);
            NSMutableArray * TempArr  = [[NSMutableArray alloc]init];
            
            if (Succedblock) {
                Succedblock(TempArr);
            }
            
            NSString * message = [responseObject objectForKey:@"message"];
            if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
                [CHShowMessageHud showMessageText:message];
            }

        } Failure:^(id failure) {
            
            if (failerblock) {
                failerblock(failure);
            }
            [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        }];
    
}
//积分兑换模块兑换记录列表
+(void)DongwangMyViewModelWithgetExchangeCardList:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    NSString * page = [NSString stringWithFormat:@"%@",mutableParmterDic[@"page"]];
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@?page=%@",Dongwang_BaseUrl,getExchangeCardList,page] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        NSLog(@"积分兑换模块积分纪录列表:%@",responseObject);
        NSMutableArray * TempArr  = [[NSMutableArray alloc]init];
        NSArray  * DataArr = [[responseObject objectForKey:@"data"] objectForKey:@"resultList"];
        for (NSDictionary * resPoneDic in DataArr) {
            DongwangDuihuanModel * duihuanModel = [DongwangDuihuanModel BaseinitWithDic:resPoneDic];
            [TempArr addObject:duihuanModel];
        }
        if (Succedblock) {
            Succedblock(TempArr);
        }
        
        NSString * message = [responseObject objectForKey:@"message"];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }

    } Failure:^(id failure) {
        
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
    }];

}
//用户积分兑换道具(免答卡、加时卡)
+(void)DongwangMyViewModelWithuserexchangeProp:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    NSLog(@"参数:%@",mutableParmterDic);
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,userexchangeProp] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        NSLog(@"积分兑换道具:%@",responseObject);
        [UserManager UserManagerRealoadinfomationSuuced:^{
        if (Succedblock) {
        Succedblock(responseObject);
        }
        } fairler:^{
            
        }];
        NSString * message = [responseObject objectForKey:@"message"];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
    } Failure:^(id failure) {
        
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
//        [CHShowMessageHud showMessageText:failure];
    }];

    
}
@end
