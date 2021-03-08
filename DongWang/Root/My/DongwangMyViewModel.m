//
//  DongwangMyViewModel.m
//  DongWang
//
//  Created by codehzx on 2020/11/19.
//

#import "DongwangMyViewModel.h"
#import "DongwangMyPrizeModel.h"
#import "DongwangDaojuModel.h"
#import "DongwangGradesModel.h"
#import "DongwangMsgModel.h"
#import "DongwangShouriMingxiModel.h"
#import "DongwangtixianModel.h"
#import "DongwangGradesDetailModel.h"
#import "DongwangSignQiandaoModel.h"
#import "DongwangSigninQiandaoFrameModel.h"
#import "NSDictionary+DeleteNull.h"
@implementation DongwangMyViewModel
+(void)DongwangMyViewModelWithDeleAccoutn:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_DeleAccount] HttpHeader:@{}.mutableCopy Parameters:@{}.mutableCopy Success:^(id responseObject) {
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
        if (Succedblock) {
            Succedblock(responseObject);
        }
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];

}
+(void)DongwangMyViewModelWithupheaderImg:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_UploadImg] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
        [UserManager UserManagerRealoadinfomationSuuced:^{
            if (Succedblock) {
                Succedblock(responseObject);
            }
        } fairler:^{
        }];
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];
}
+(void)DongwangMyViewModelWithrealAuth:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_realAuth] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
        [UserManager UserManagerRealoadinfomationSuuced:^{
            if (Succedblock) {
                Succedblock(responseObject);
            }
        } fairler:^{
        }];
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];

}
+(void)DongwangMyViewModelWithbindingWechat:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    //[CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_bingwechat] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
        [UserManager UserManagerRealoadinfomationSuuced:^{
            if (Succedblock) {
                Succedblock(responseObject);
            }
        } fairler:^{
        }];
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];

}
+(void)DongwangMyViewModelWithbindingWechat_hwc:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    //[CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_bingwechat_hwc] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
        [CHShowMessageHud showMessageText:message];
        }
        [UserManager UserManagerRealoadinfomationSuuced:^{
            if (Succedblock) {
                Succedblock(responseObject);
            }
        } fairler:^{
        }];
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];

}

+(void)DongwangMyViewModelWithAdressList:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
   NSString * pageText =  [mutableParmterDic objectForKey:@"page"];
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@?page=%@",Dongwang_BaseUrl,User_addresslist,pageText] HttpHeader:nil Parameters:nil Success:^(id responseObject) {
        NSArray * listArr = (NSArray *)[[responseObject objectForKey:@"data"] objectForKey:@"resultList"];
        NSLog(@"%@",listArr);
        NSMutableArray * tempArr = [[NSMutableArray alloc]init];
        for (NSDictionary * dicModel in listArr) {
        ShippingAddressListModel * adresModel  =[ShippingAddressListModel BaseinitWithDic:dicModel];
            [tempArr addObject:adresModel];
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
+(void)DongwangMyViewModelWithProvinceList:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_ProvinceList]);
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_ProvinceList] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
        NSDictionary * reseponeDic = [NSDictionary changeType:responseObject];
//        NSLog(@"----%@",reseponeDic);
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
      NSArray * dataArr  = [self addShippingAddressCityDictionary:reseponeDic];
        if (Succedblock) {
            Succedblock(dataArr);
        }
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];

}
+(void)DongwangMyViewModelWithAdressDetail:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(DongwangAdressInfoDetailModel *))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    NSString * uid = [mutableParmterDic objectForKey:@"id"];
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@?id=%@",Dongwang_BaseUrl,User_addressInfo,uid] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
        NSDictionary * responeDic = [responseObject objectForKey:@"data"];
            DongwangAdressInfoDetailModel * infoModel= [DongwangAdressInfoDetailModel BaseinitWithDic:responeDic];
            if (Succedblock) {
                Succedblock(infoModel);
            }
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
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
#pragma mark -- 添加收货地址省市区数据组装
+ (NSArray *)addShippingAddressCityDictionary:(NSDictionary *)dic {
    NSMutableArray *tMutableArray = @[].mutableCopy;
    NSArray *tempArray = (NSArray *)dic[@"data"];
    for (NSDictionary *dictionary in tempArray) {
        AddShippingAddressListModel *model = [[AddShippingAddressListModel alloc] init];
        [model setValuesForKeysWithDictionary:dictionary];
        if ([model.childs isKindOfClass:[NSString class]] ) {
        }else{
        if ([NSArray isArrayEmpty:model.childs] == NO) {
        [self addShippingAddressCityModel:model];
        }
        }
        [tMutableArray addObject:model];
    }
    return [tMutableArray copy];
}

+ (void)addShippingAddressCityModel:(AddShippingAddressListModel *)addModel {
    addModel.childCitysArray = [NSMutableArray array];
    if ([addModel.childs isKindOfClass:[NSArray class]]) {
        for (NSDictionary *dic in addModel.childs) {
            AddShippingAddressListModel *model = [[AddShippingAddressListModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [addModel.childCitysArray addObject:model];
            if ([model.childs isKindOfClass:[NSArray class]]) {
                if ([NSArray isArrayEmpty:model.childs] == NO) {
                    [self addShippingAddressCityModel:model];
                }
            }
        }
        
    }
}
#pragma mark -- 修改地址, 自动滑动到选择的省市区
+ (NSDictionary *)scrollShippingAddressAllArray:(NSArray *)allArray currentModel:(ShippingAddressListModel *)shippingAddModel {
    NSInteger tempProvinceIndex = 0;
    NSInteger tempCityIndex = 0;
    NSInteger tempCountIndex = 0;
    for (int i = 0; allArray.count; i++) {
        if (i < allArray.count && i != allArray.count) {
            AddShippingAddressListModel *tempCityModel = allArray[i];
            if ([[NSString stringWithFormat:@"%@",tempCityModel.code] isEqualToString:[NSString stringWithFormat:@"%@",shippingAddModel.provinceCode]]) {
                tempProvinceIndex = i;
                NSArray *tempCityArray = tempCityModel.childCitysArray;
                for (int j = 0; j < tempCityArray.count; j ++) {
                    if (j < tempCityArray.count && j != tempCityArray.count) {
                        AddShippingAddressListModel *tempCModel = tempCityArray[j];
                        if ([[NSString stringWithFormat:@"%@",tempCModel.code] isEqualToString:[NSString stringWithFormat:@"%@",shippingAddModel.cityCode]]) {
                            tempCityIndex = j;
                            NSArray *tempCountArray = tempCModel.childCitysArray;
                            for (int k = 0; k < tempCountArray.count; k ++) {
                                if (k < tempCountArray.count && k != tempCountArray.count) {
                                    AddShippingAddressListModel *tempCountModel = tempCountArray[k];
                                    if ([[NSString stringWithFormat:@"%@",tempCountModel.code] isEqualToString:[NSString stringWithFormat:@"%@",shippingAddModel.countyCode]]) {
                                        tempCountIndex = k;
                                        NSDictionary *dictionary = @{@"province":[NSString stringWithFormat:@"%ld", tempProvinceIndex], @"city":[NSString stringWithFormat:@"%ld", tempCityIndex], @"county":[NSString stringWithFormat:@"%ld", tempCountIndex]};
                                        return dictionary;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    NSDictionary *dictionary = @{@"province":[NSString stringWithFormat:@"%ld", tempProvinceIndex], @"city":[NSString stringWithFormat:@"%ld", tempCityIndex], @"county":[NSString stringWithFormat:@"%ld", tempCountIndex]};
    return dictionary;
}
+(void)DongwangMyViewModelWithMyprize:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    NSString * page = [mutableParmterDic objectForKey:@"pageNo"];
    NSString * status = [mutableParmterDic objectForKey:@"status"];
    NSLog(@"get请求:%@",[NSString stringWithFormat:@"%@%@?pageNo=%@&status=%@",Dongwang_BaseUrl,User_prize,page,status]);
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@?pageNo=%@&status=%@",Dongwang_BaseUrl,User_prize,page,status] HttpHeader:nil Parameters:nil Success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        NSArray * resultList =  [[responseObject objectForKey:@"data"] objectForKey:@"resultList"];
        NSMutableArray * TempArr = [[NSMutableArray alloc]init];
        if (resultList.count> 0) {
            for (NSDictionary * resDic in resultList) {
                DongwangMyPrizeModel * myprzeModel = [DongwangMyPrizeModel BaseinitWithDic:resDic];
                [TempArr addObject:myprzeModel];
            }
            
        }
       if (Succedblock) {
        Succedblock(TempArr);
        }
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
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
+(void)DongwangMyViewModelWithMydaoju:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
//    NSLog(@"%@",[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_daoju]);
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_daoju] HttpHeader:nil Parameters:nil Success:^(id responseObject) {
//        NSLog(@"%@",responseObject);
        NSArray * dataArr =  [responseObject objectForKey:@"data"];
        NSMutableArray * DongwangTempArr =[NSMutableArray array];
        for (NSDictionary * DongwangDic in dataArr) {
            DongwangDaojuModel * dongwangmodel= [DongwangDaojuModel BaseinitWithDic:DongwangDic];
            [DongwangTempArr addObject:dongwangmodel];
        }
        if (Succedblock) {
            Succedblock(DongwangTempArr);
        }
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
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
+(void)DongwangMyViewModelWithMychenji:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    NSString * page = [mutableParmterDic objectForKey:@"page"];
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@?page=%@",Dongwang_BaseUrl,User_exam,page] HttpHeader:nil Parameters:nil Success:^(id responseObject) {
        NSMutableArray * tempArr =[NSMutableArray array];
        NSArray * dataArr =[[responseObject objectForKey:@"data"] objectForKey:@"resultList"];
        for (NSDictionary * responeDic in dataArr) {
            DongwangGradesModel * gardModel  =[DongwangGradesModel BaseinitWithDic:responeDic];
            [tempArr addObject:gardModel];
        }
        NSLog(@"%@",responseObject);
        if (Succedblock) {
            Succedblock(tempArr);
        }
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
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
+(void)DongwangMyViewModelWithMychenjiDetail:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    NSString * page = [mutableParmterDic objectForKey:@"page"];
    NSString * groupId = [mutableParmterDic objectForKey:@"groupId"];
    NSString * Id = [mutableParmterDic objectForKey:@"id"];

    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@?page=%@&groupId=%@&id=%@",Dongwang_BaseUrl,User_DetailList,page,groupId,Id] HttpHeader:nil Parameters:nil Success:^(id responseObject) {
//        NSLog(@"%@",responseObject);
        NSMutableArray * tempArr =[NSMutableArray array];
        NSArray * dataArr =[[responseObject objectForKey:@"data"] objectForKey:@"resultList"];
        for (NSDictionary * responeDic in dataArr) {
            DongwangGradesDetailModel * gardModel  =[DongwangGradesDetailModel BaseinitWithDic:responeDic];
            [tempArr addObject:gardModel];
        }
        if (Succedblock) {
            Succedblock(tempArr);
        }
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
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
+(void)DongwangMyViewModelWithMymessage:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    NSString * page = [mutableParmterDic objectForKey:@"page"];
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@?page=%@",Dongwang_BaseUrl,User_meaasge,page] HttpHeader:nil Parameters:nil Success:^(id responseObject) {
        NSMutableArray * TempArr = [[NSMutableArray alloc]init];
        NSArray * DataArr = [[responseObject objectForKey:@"data"] objectForKey:@"resultList"];
        for (NSDictionary * responeDic in DataArr) {
            DongwangMsgModel * msgModel = [DongwangMsgModel BaseinitWithDic:responeDic];
            [TempArr addObject:msgModel];
        }
        if (Succedblock) {
            Succedblock(TempArr);
        }
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
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
+(void)DongwangMyViewModelWithMymessageDetail:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    NSString * page = [mutableParmterDic objectForKey:@"page"];
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@?page=%@",Dongwang_BaseUrl,User_meaasgeDetai,page] HttpHeader:nil Parameters:nil Success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        if (Succedblock) {
            Succedblock(responseObject);
        }
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
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
+(void)DongwangMyViewModelWithMyfeedBack:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_feedBack] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        NSString * message = [responseObject objectForKey:@"message"];
//        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
        if (Succedblock) {
            Succedblock(responseObject);
        }
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];

}
+(void)DongwangMyViewModelWithCommiteAdress:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    NSLog(@"参数:%@",mutableParmterDic);
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_commiteaddress] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
        NSLog(@"提交：%@",responseObject);
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
      NSArray * dataArr  = [self addShippingAddressCityDictionary:responseObject];
        [UserManager UserManagerRealoadinfomationSuuced:^{
            if (Succedblock) {
                Succedblock(dataArr);
            }

        } fairler:^{
            
        }];
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];

}
+(void)DongwangMyViewModelWithDeleateAdress:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    NSLog(@"参数:%@",mutableParmterDic);
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_deleateddress] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
        NSLog(@"删除收货地址：%@",responseObject);
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
      NSArray * dataArr  = [self addShippingAddressCityDictionary:responseObject];
        if (Succedblock) {
            Succedblock(dataArr);
        }
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];

}
+(void)DongwangMyViewModelWitheditAdress:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    NSLog(@"参数:%@",mutableParmterDic);
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_editaddress] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
        NSLog(@"编辑收货地址：%@",responseObject);
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
      NSArray * dataArr  = [self addShippingAddressCityDictionary:responseObject];
        [UserManager UserManagerRealoadinfomationSuuced:^{
            if (Succedblock) {
                Succedblock(dataArr);
            }
        } fairler:^{
            
        }];
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];

}
+(void)DongwangMyViewModelWithBindingAliPay:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_bindalipay] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
        [CHShowMessageHud showMessageText:message];
        }
        [UserManager UserManagerRealoadinfomationSuuced:^{
        if (Succedblock) {
            Succedblock(responseObject);
        }
        } fairler:^{
            
        }];
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];
}
+(void)DongwangMyViewModelWithgoWithdraw:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    NSLog(@"参数:%@",mutableParmterDic);
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_goWithdraw] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
        NSLog(@"提现：%@\n参数:%@",responseObject,mutableParmterDic);
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
        [UserManager UserManagerRealoadinfomationSuuced:^{
            if (Succedblock) {
                Succedblock(responseObject);
            }
        } fairler:^{
            
        }];
    } Failure:^(id failure) {
        if (failerblock) {
            failerblock(failure);
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        [CHShowMessageHud showMessageText:failure];
    }];

}
+(void)DongwangMyViewModelWithdrawlist:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    NSString * page = [mutableParmterDic objectForKey:@"page"];
    NSString * type = [mutableParmterDic objectForKey:@"type"];
    NSString * ViewPage = [mutableParmterDic objectForKey:@"viewPage"];
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@?page=%@&type=%@",Dongwang_BaseUrl,User_drawdetail,page,type] HttpHeader:nil Parameters:nil Success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        NSMutableArray * TempArr =[[NSMutableArray alloc]init];
        NSArray * dataArr = [[responseObject objectForKey:@"data"] objectForKey:@"resultList"];
        
        for (NSDictionary * responeDic in dataArr) {
            if ([ViewPage isEqualToString:@"1"]) {
                DongwangShouriMingxiModel * mingxiModel = [DongwangShouriMingxiModel BaseinitWithDic:responeDic];
                [TempArr addObject:mingxiModel];
            }else{
                DongwangtixianModel * txianMode= [DongwangtixianModel BaseinitWithDic:responeDic];
                [TempArr addObject:txianMode];
            }
        }
        if (Succedblock) {
            Succedblock(TempArr);
        }
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
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

+(void)DongwangMyViewModelWithSign:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object,NSDictionary * dic))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
//    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
//    NSLog(@"地址:%@",[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_getSignList]);
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_getSignList] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        NSLog(@"签到:%@",responseObject);
        NSDictionary * TempDic  = (NSDictionary *) responseObject;
        NSArray * DataArr =(NSArray *) [[responseObject objectForKey:@"data"] objectForKey:@"signList"];
        NSMutableArray * TempArr  = [[NSMutableArray alloc]init];
        for (int index = 0; index < DataArr.count; index ++) {
            DongwangSigninQiandaoFrameModel * qiandaoFrameModel = [[DongwangSigninQiandaoFrameModel alloc]init];
            DongwangSignQiandaoModel *  qiandaoModel = [DongwangSignQiandaoModel BaseinitWithDic:DataArr[index]];
            if (index == DataArr.count -1) {
                qiandaoModel.islast = YES;
            }else{
                qiandaoModel.islast = NO;
            }
            qiandaoFrameModel.qiandaoModel = qiandaoModel;
            [TempArr addObject:qiandaoFrameModel];
        }
        
        
        if (Succedblock) {
            Succedblock(TempArr,TempDic);
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
+(void)DongwangMyViewModelWithgoSign:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock{
    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_goSign] HttpHeader:@{}.mutableCopy Parameters:mutableParmterDic Success:^(id responseObject) {
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        NSLog(@"立即签到:%@",responseObject);
            if (Succedblock) {
            Succedblock(responseObject);
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
@end
