//
//  DongwangLogoinViewModel.m
//  DongWang
//
//  Created by codehzx on 2020/10/29.
//

#import "DongwangLogoinViewModel.h"
#import "DongwangAdpageModel.h"
#import <WXApi.h>
#import <MFSIdentifier-umbrella.h>
#import "DongwangLottieModel.h"
@implementation DongwangLogoinViewModel
+(void)CLShanyanLogoinWithParmters:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc logoinSuuced:(void(^)(id object))logoinblock logoinfairler:(void(^)(void))failerblock{
    NSString *deviceID = [MFSIdentifier deviceID];
    if (![mutableParmterDic.allKeys containsObject:@"deviceId"]) {
        [mutableParmterDic setValue:deviceID forKey:@"deviceId"];
    }
    NSLog(@"参数：%@",mutableParmterDic);
//    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_Login] HttpHeader:nil Parameters:mutableParmterDic Success:^(id responseObject) {
        NSLog(@"登录信息:%@",responseObject);
        NSDictionary * responeDic = (NSDictionary *)responseObject;
        NSDictionary * dataDic = [responeDic objectForKey:@"data"];
        NSString * token = [dataDic objectForKey:@"token"];
//        NSLog(@"登录Token：%@",token);
        if ([dataDic.allKeys containsObject:@"token"]) {
            if (token.length > 0) {
                [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"token"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                [UserManager userLoginSucced];
                [UserManager UserManagerRealoadinfomationSuuced:^{
                } fairler:^{
                }];

            }
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
    if (logoinblock) {
        logoinblock(responeDic);
        }
    } Failure:^(id failure) {
//        NSLog(@"错误信息:%@",failure);
        if ([NSString isBlankString:failure]) {
            failure = @"请求错误";
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
        if (failerblock) {
            failerblock();
        }

    }];
}
+(void)AdpageRequestWithParmters:(NSMutableDictionary * )mutablparmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc AdpageModel:(void (^)(DongwangAdpageModel * _Nonnull))adpageModel{
    NSLog(@"闪屏请求地址:%@",[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,Shanping_Img]);
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,Shanping_Img] HttpHeader:nil Parameters:mutablparmterDic Success:^(id responseObject) {
        NSLog(@"闪屏:%@",responseObject);
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
    } Failure:^(id failure) {
        DongwangAdpageModel * emtymodel = [DongwangAdpageModel new];
        emtymodel.isexsit = NO;
        adpageModel(emtymodel);
        if ([NSString isBlankString:failure]) {
            failure = @"请求错误";
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
//        [CHShowMessageHud showMessageText:failure];
        
    }];
    
}
+(void)CodeloginRequestWithParmtersw:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc logoinSuuced:(void(^)(id object))logoinblock logoinfairler:(void(^)(void))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    NSString *deviceID = [MFSIdentifier deviceID];

    if (![mutablParmerDic.allKeys containsObject:@"deviceId"]) {
        [mutablParmerDic setValue:deviceID forKey:@"deviceId"];
    }

    NSLog(@"验证码请求地址:%@",[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,Phone_Code]);
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,Phone_Code] HttpHeader:nil Parameters:mutablParmerDic Success:^(id responseObject) {
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        NSLog(@"%@",responseObject);
        NSDictionary * responeDic = (NSDictionary *)responseObject;
        if (logoinblock) {
            logoinblock(responeDic);
        }
        
    } Failure:^(id failure) {
        NSLog(@"验证码错误信息:%@",failure);
        if (failerblock) {
            failerblock();
        }
        if ([NSString isBlankString:failure]) {
            failure = @"请求错误";
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
        
    }];
    
}
+(void)DongwangLogoinViewModelWithLogintoutParmters:(NSMutableDictionary *)mutableParmtersDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc logoinSuuced:(void(^)(id object))logoinblock logoinfairler:(void(^)(void))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    NSString * httpUrl = [NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_Loginout];
    NSLog(@"登出：%@",httpUrl);
    [AFNetworkTool Post:httpUrl HttpHeader:nil Parameters:mutableParmtersDic Success:^(id responseObject) {
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
            if (logoinblock) {
            [UserManager userLoginout];
            logoinblock(responseObject);
            }
    } Failure:^(id failure) {
                if (failerblock) {
                    failerblock();
                }
                if ([NSString isBlankString:failure]) {
                    failure = @"请求错误";
                }
                [CHShowMessageHud dismissHideHUD:CurrentVc.view];
                [CHShowMessageHud showMessageText:failure];

    }];
}
+(void)DongwangRequestTabbarWithParmtersw:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc logoinSuuced:(void(^)(DongwangTabbarModel * tabbarModel))logoinblock logoinfairler:(void(^)(DongwangTabbarModel * tabbarModel))failerblock{
    NSDictionary *postHeader = [EncryptionTool getSignatureTimestamp];
    NSString *url = [NSString stringWithFormat:@"%@dongwang-app/app/activity/v1", Dongwang_BaseUrl];
    NSLog(@"动态tabbar地址:%@",url);
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool GET:url HttpHeader:postHeader Parameters:nil Success:^(id responseObject) {
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        NSLog(@"responseObject=%@",responseObject);
        NSDictionary *dic = (NSDictionary *)responseObject;
        id  dataDicobject = [dic objectForKey:@"data"];
        DongwangTabbarModel * Mymodels;
        if ([dataDicobject isKindOfClass:[NSDictionary class]]) {
            Mymodels = [DongwangTabbarModel BaseinitWithDic:dataDicobject];
        }else{
            DongwangTabbarModel * Mytempmodel = [[DongwangTabbarModel alloc]init];
            Mytempmodel.action = @"";
            Mytempmodel.imageUrl = @"";
            Mytempmodel.name = @"";
            Mytempmodel.type = @"";
            Mytempmodel.url = @"";
            Mymodels =  Mytempmodel;
        }
 
        logoinblock(Mymodels);
    } Failure:^(id failure) {
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        DongwangTabbarModel * Mymodel = [[DongwangTabbarModel alloc]init];
        Mymodel.action = @"";
        Mymodel.imageUrl = @"";
        Mymodel.name = @"";
        Mymodel.type = @"";
        Mymodel.url = @"";
        failerblock(Mymodel);
    }];
}
+(void)DongwangRequesteffectWithParmtersw:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc logoinSuuced:(void(^)(DongwangLottieModel * lottieModel))succedModelblock logoinfairler:(void(^)(DongwangLottieModel * lottieModel))failerblock{
    NSString *url = [NSString stringWithFormat:@"%@%@", Dongwang_BaseUrl,effect_lottie];
    NSLog(@"动效:%@",url);
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool GET:url HttpHeader:nil Parameters:nil Success:^(id responseObject) {
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        NSLog(@"responseObject=%@",responseObject);
        NSDictionary *dic = (NSDictionary *)responseObject;
        id  dataDicobject = [dic objectForKey:@"data"];
        DongwangLottieModel * Mymodels;
        if ([dataDicobject isKindOfClass:[NSDictionary class]]) {
            Mymodels = [DongwangLottieModel BaseinitWithDic:dataDicobject];
        }else{
            DongwangLottieModel * Mytempmodel = [[DongwangLottieModel alloc]init];
            Mymodels =  Mytempmodel;
        }
        succedModelblock(Mymodels);
    } Failure:^(id failure) {
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        DongwangLottieModel * Mymodel = [[DongwangLottieModel alloc]init];
        failerblock(Mymodel);
    }];
}
+(void)CodeloginRequestWithParmterswBandinghwc:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc logoinSuuced:(void(^)(id object))logoinblock logoinfairler:(void(^)(void))failerblock{
    NSString *deviceID = [MFSIdentifier deviceID];
//    if (![mutableParmterDic.allKeys containsObject:@"deviceId"]) {
//        [mutableParmterDic setValue:deviceID forKey:@"deviceId"];
//    }
    NSLog(@"参数：%@",mutablParmerDic);
//    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,userBanding_hwc] HttpHeader:nil Parameters:mutablParmerDic Success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary * responeDic = (NSDictionary *)responseObject;
        NSDictionary * dataDic = [responeDic objectForKey:@"data"];
        NSString * message = [dataDic objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:message];
        [UserManager UserManagerRealoadinfomationSuuced:^{
            if (logoinblock) {
                logoinblock(responeDic);
            }
            
        } fairler:^{
        }];

    } Failure:^(id failure) {
        NSLog(@"错误信息:%@",failure);
        if ([NSString isBlankString:failure]) {
            failure = @"请求错误";
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
        if (failerblock) {
            failerblock();
        }

    }];

    
}
+(void)DongwangWechatAutor{
    //构造SendAuthReq结构体
    SendAuthReq* req =[[SendAuthReq alloc ] init ];
    req.scope = @"snsapi_userinfo" ;
    req.state = @"App" ;
    //第三方向微信终端发送一个SendAuthReq消息结构
    [WXApi sendReq:req completion:^(BOOL success) {
        
    }];
}
@end
