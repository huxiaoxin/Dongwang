//
//  DongwangLogoinViewModel.m
//  DongWang
//
//  Created by codehzx on 2020/10/29.
//

#import "DongwangLogoinViewModel.h"
#import "DongwangAdpageModel.h"
@implementation DongwangLogoinViewModel
+(void)CLShanyanLogoinWithParmters:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc logoinSuuced:(void (^)(void))logoinblock logoinfairler:(void (^)(void))failerblock{
    NSArray *  Keys =  mutableParmterDic.allKeys;
    NSMutableDictionary * tempDic = [NSMutableDictionary dictionary];
    for (NSString * key in Keys) {
    if ([key isEqualToString:@"version"]) {
        [tempDic setObject:@"" forKey:@""];
        }else if (![key isEqualToString:@"appID"]){
    [tempDic setObject:[NSString stringWithFormat:@"%@",mutableParmterDic[key]] forKey:key];
        }
    }
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:@"http://192.168.3.157:8069/dongwang-app/app/user/login" HttpHeader:nil Parameters:mutableParmterDic Success:^(id responseObject) {
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
    if (logoinblock) {
    logoinblock();
        }
    } Failure:^(id  message) {
        if (failerblock) {
            failerblock();
        }
        if ([NSString isBlankString:message]) {
            message = @"请求错误";
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:message];
    }];
}
+(void)AdpageRequestWithParmters:(NSMutableDictionary * )mutablparmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc AdpageModel:(void (^)(DongwangAdpageModel * _Nonnull))adpageModel{
//    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
        [AFNetworkTool Post:@"http://192.168.3.157:8069/dongwang-app/app/screen/getScreenData" HttpHeader:nil Parameters:mutablparmterDic Success:^(id responseObject) {
        NSLog(@"闪频:%@",responseObject);
//        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        id  data = [responseObject objectForKey:@"data"];
        if ([data isKindOfClass:[NSDictionary class]]) {
            NSDictionary * responeDic = (NSDictionary *)data;
            if (responeDic.allKeys.count > 0) {
                NSDictionary * responeData = (NSDictionary *)data;
                DongwangAdpageModel * pageModel = [DongwangAdpageModel BaseinitWithDic:responeData];
                pageModel.isexsit = YES;
                adpageModel(pageModel);

            }else{
                DongwangAdpageModel * emtymodel = [DongwangAdpageModel new];
                emtymodel.isexsit = NO;
                adpageModel(emtymodel);
            }
        }else{
            DongwangAdpageModel * emtymodel = [DongwangAdpageModel new];
            emtymodel.isexsit = NO;
            adpageModel(emtymodel);
        }
    } Failure:^(id  message) {
        
        DongwangAdpageModel * emtymodel = [DongwangAdpageModel new];
        emtymodel.isexsit = NO;
        adpageModel(emtymodel);
        if ([NSString isBlankString:message]) {
            message = @"请求错误";
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:message];

    }];
    
}
+(void)CodeloginRequestWithParmtersw:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc logoinSuuced:(void(^)(void))logoinblock logoinfairler:(void(^)(void))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:@"http://192.168.3.157:8069/dongwang-app/app/sms/getSmsCodeByPhone" HttpHeader:nil Parameters:mutablParmerDic Success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (logoinblock) {
        logoinblock();
        }
    } Failure:^(id message) {
        if (failerblock) {
            failerblock();
        }
        if ([NSString isBlankString:message]) {
            message = @"请求错误";
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:message];

    }];
    
}
@end
