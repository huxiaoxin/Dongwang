//
//  DongwangFindViewModel.m
//  DongWang
//
//  Created by codehzx on 2020/12/6.
//

#import "DongwangFindViewModel.h"
#import "DongwangHotTizuModel.h"
@implementation DongwangFindViewModel
+(void)DongwangFindViewModelWithgetGrouphot:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc taskSuuced:(void(^)(id object))Succedblock taskfairler:(void(^)(id message))failerblock{
    NSString * page = [mutablParmerDic objectForKey:@"page"];
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@?page=%@",Dongwang_BaseUrl,User_getFindHotGroup,page] HttpHeader:nil Parameters:nil Success:^(id responseObject) {
        NSLog(@"=====%@",responseObject);
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        NSArray * responeDataArr = [[responseObject objectForKey:@"data"] objectForKey:@"resultList"];
        NSMutableArray * tempArr =[NSMutableArray array];
        for (NSDictionary *  responeDic in responeDataArr) {
            DongwangHotTizuModel * tizuModel = [DongwangHotTizuModel BaseinitWithDic:responeDic];
            [tempArr addObject:tizuModel];
        }
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
        if (Succedblock) {
            Succedblock(tempArr);
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
