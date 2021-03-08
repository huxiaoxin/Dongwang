//
//  DongwangHomeViewModel.m
//  DongWang
//
//  Created by codehzx on 2020/12/8.
//

#import "DongwangHomeViewModel.h"
#import "DongwangHomeTagModel.h"
#import "DongwangHomeBannarModel.h"
#import "DongwangHotTizuModel.h"
#import "DongwangMofangModel.h"
@implementation DongwangHomeViewModel
+(void)DongwangHomeTagList:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc taskSuuced:(void(^)(NSMutableArray * modelAarr ,NSMutableArray *  TagArr))Succedblock taskfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,Home_taglist] HttpHeader:nil Parameters:nil Success:^(id responseObject) {
        NSLog(@"首页标签接口:%@",responseObject);
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        NSArray * responeDataArr = [responseObject objectForKey:@"data"] ;
        NSMutableArray * tempModelArr =[NSMutableArray array];
        NSMutableArray  * TempTagArr = [NSMutableArray array];
        DongwangHomeTagModel  * tagTuijina = [[DongwangHomeTagModel alloc]init];
        tagTuijina.isSeltecd = NO;
        tagTuijina.tagName = @"推荐";
        tagTuijina.tagid = @"0000";
        [tempModelArr addObject:tagTuijina];
        [TempTagArr addObject:tagTuijina.tagName];
        
        for (NSDictionary * homeTagDic in responeDataArr) {
            DongwangHomeTagModel * homeTagModel = [DongwangHomeTagModel BaseinitWithDic:homeTagDic];
            homeTagModel.isSeltecd = NO;
            [tempModelArr addObject:homeTagModel];
            [TempTagArr addObject:homeTagModel.tagName];
        }
        
        DongwangHomeTagModel * FirstTagModel =  tempModelArr.firstObject;
        FirstTagModel.isSeltecd = YES;
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
        if (Succedblock) {
            Succedblock(tempModelArr,TempTagArr);
        }
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];
    
}
+(void)DongwangHomeBannar:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc taskSuuced:(void(^)(NSMutableArray * modelAarr ,NSMutableArray * ImgsUrl))Succedblock taskfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,Home_bannar] HttpHeader:nil Parameters:nil Success:^(id responseObject) {
        NSLog(@"首页banner:%@",responseObject);
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        NSArray * responeDataArr = [responseObject objectForKey:@"data"] ;
        NSMutableArray * tempModelArr =[NSMutableArray array];
        NSMutableArray * tempImgurlArr =[NSMutableArray array];
        for (NSDictionary * homeTagDic in responeDataArr) {
            DongwangHomeBannarModel * homebannarModel = [DongwangHomeBannarModel BaseinitWithDic:homeTagDic];
            [tempModelArr addObject:homebannarModel];
            [tempImgurlArr addObject:homebannarModel.bannerImage];
        }
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
        if (Succedblock) {
            Succedblock(tempModelArr,tempImgurlArr);
        }
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];
}
+(void)DongwangHomeIcon:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc taskSuuced:(void(^)(NSMutableArray * modelAarr,NSMutableArray * chunModelArr))Succedblock taskfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,Home_IconList] HttpHeader:nil Parameters:nil Success:^(id responseObject) {
        NSLog(@"首页魔方Icon:%@",responseObject);
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        NSArray * responeDataArr = [responseObject objectForKey:@"data"] ;
        NSMutableArray * tempModelArr =[NSMutableArray array];
        NSMutableArray * MagicArr = [NSMutableArray array];
        for (NSDictionary * homeDic in responeDataArr) {
            DongwangMofangModel * homemofangModel = [DongwangMofangModel BaseinitWithDic:homeDic];
//            NSLog(@"style======%ld",homemofangModel.style);
            NSArray * magicListArr = [homeDic objectForKey:@"magicList"];
            for (NSDictionary  * magicDic in magicListArr) {
                MagicList * gicmodel = [MagicList BaseinitWithDic:magicDic];
                gicmodel.mofangSize = CGSizeMake(0, 0);
                if (homemofangModel.style == 1) {
                    gicmodel.countNums =  2;
                }else{
                    gicmodel.countNums =  magicListArr.count;
                }
//                NSLog(@"数量:%ld",gicmodel.countNums);
                [MagicArr addObject:gicmodel];
            }
//            homemofangModel.magicList =magicListArr;
            [tempModelArr addObject:homemofangModel];

        }
//        NSLog(@"纯Model:%@",MagicArr);
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
        if (Succedblock) {
        Succedblock(tempModelArr,MagicArr);
        }
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];

}
+(void)DongwangHomeAnsurelist:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc taskSuuced:(void(^)(NSMutableArray * modelAarr))Succedblock taskfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    NSString * pageNo = [NSString stringWithFormat:@"%@",[mutablParmerDic objectForKey:@"pageNo"]];
    NSString * pageSize = [NSString stringWithFormat:@"%@",[mutablParmerDic objectForKey:@"pageSize"]];
    NSString * type   = [NSString stringWithFormat:@"%@",[mutablParmerDic objectForKey:@"type"]];
    NSString * requestUrl = [NSString stringWithFormat:@"%@%@?pageNo=%@&pageSize=%@&type=%@",Dongwang_BaseUrl,Home_AnsureList,pageNo,pageSize,type];
    NSLog(@"请求地址:%@",requestUrl);
    [AFNetworkTool GET:requestUrl HttpHeader:nil Parameters:nil Success:^(id responseObject) {
        NSLog(@"首页题组:%@",responseObject);
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        NSArray * responeDataArr = [[responseObject objectForKey:@"data"] objectForKey:@"resultList"];
        NSMutableArray * tempModelArr =[NSMutableArray array];
        for (NSDictionary * homeTagDic in responeDataArr) {
            DongwangHotTizuModel * homebannarModel = [DongwangHotTizuModel BaseinitWithDic:homeTagDic];
            [tempModelArr addObject:homebannarModel];
        }
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
        if (Succedblock) {
            Succedblock(tempModelArr);
        }
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];

}
+(void)DongwangHomeAnsurelist_old:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc taskSuuced:(void(^)(NSMutableArray * modelAarr))Succedblock taskfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    NSString * Page = [NSString stringWithFormat:@"%@",[mutablParmerDic objectForKey:@"page"]];
    NSString * tagId = [NSString stringWithFormat:@"%@",[mutablParmerDic objectForKey:@"tagId"]];
    NSString * requestUrl;
    if (mutablParmerDic.allKeys.count == 2) {
    requestUrl = [NSString stringWithFormat:@"%@%@?page=%@&tagId=%@",Dongwang_BaseUrl,Home_AnsureList_old,Page,tagId];
    }else{
    requestUrl = [NSString stringWithFormat:@"%@%@?page=%@",Dongwang_BaseUrl,Home_AnsureList,Page];
    }
    NSLog(@"请求地址:%@",requestUrl);
    [AFNetworkTool GET:requestUrl HttpHeader:nil Parameters:nil Success:^(id responseObject) {
//        NSLog(@"首页题组:%@",responseObject);
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        NSArray * responeDataArr = [[responseObject objectForKey:@"data"] objectForKey:@"resultList"];
        NSMutableArray * tempModelArr =[NSMutableArray array];
        for (NSDictionary * homeTagDic in responeDataArr) {
            DongwangHotTizuModel * homebannarModel = [DongwangHotTizuModel BaseinitWithDic:homeTagDic];
            [tempModelArr addObject:homebannarModel];
        }
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
        if (Succedblock) {
            Succedblock(tempModelArr);
        }
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];

}

+(void)DongwangHomeBroadcastlist:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc taskSuuced:(void(^)(NSMutableArray * modelAarr))Succedblock taskfairler:(void(^)(id message))failerblock{
    
    NSLog(@"链接-----:%@",[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,broadcast]);
    
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,broadcast] HttpHeader:nil Parameters:nil Success:^(id responseObject) {
        NSLog(@"消息滚动:%@",responseObject);
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        NSArray * responeDataArr = [responseObject objectForKey:@"data"] ;
        NSMutableArray * titleTempArr = [NSMutableArray array];
        for (NSDictionary * homeTagDic in responeDataArr) {
            NSString * Title =  [homeTagDic objectForKey:@"content"];
            [titleTempArr addObject:Title];
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (Succedblock) {
            Succedblock(titleTempArr);
        }
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];

    
}
@end
