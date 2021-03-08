//
//  DongwangDaletouViewModel.m
//  DongWang
//
//  Created by codehzx on 2021/2/2.
//

#import "DongwangDaletouViewModel.h"
#import "DongwangbulletChtaModel.h"
#import "DongwangDaletouStatusModel.h"
#import "DongwangDaletouHistoryModel.h"
#import "DongwangMyHistoryModel.h"
@implementation DongwangDaletouViewModel
+(void)DongwangDaletouRequestbulletChat:(NSMutableDictionary *)parmters RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc requestSucced:(void(^)(id object))succedblock requestfairler:(void(^)(void))failerblock{
      NSString *deviceID = [MFSIdentifier deviceID];
    if (![parmters.allKeys containsObject:@"deviceId"]) {
        [parmters setValue:deviceID forKey:@"deviceId"];
    }
    NSLog(@"请求地址:%@",[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,bulletChat_danmu]);
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,bulletChat_danmu] HttpHeader:nil Parameters:parmters Success:^(id responseObject) {
        NSArray * dataArr =  (NSArray *)[responseObject objectForKey:@"data"];
        NSMutableArray * TempArr = [NSMutableArray array];
        
        for (NSDictionary * responeDic in dataArr) {
            DongwangbulletChtaModel * chatModel = [DongwangbulletChtaModel BaseinitWithDic:responeDic];
            [TempArr addObject:chatModel];
        }
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        NSLog(@"%@",responseObject);
        if (succedblock) {
        succedblock(TempArr);
        }
    } Failure:^(id failure) {
        NSLog(@"错误信息:%@",failure);
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
+(void)DongwangDaletouRequestdaletouStatus:(NSMutableDictionary *)parmters RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc requestSucced:(void(^)(id object))succedblock requestfairler:(void(^)(void))failerblock{
    NSString *deviceID = [MFSIdentifier deviceID];
  if (![parmters.allKeys containsObject:@"deviceId"]) {
      [parmters setValue:deviceID forKey:@"deviceId"];
  }
  NSLog(@"请求地址:%@ token=%@",[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,daletou_status],[UserManager token]);
  [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,daletou_status] HttpHeader:nil Parameters:parmters Success:^(id responseObject) {
      NSDictionary * reseponeDic =  (NSDictionary *)[responseObject objectForKey:@"data"];
      NSLog(@"responseObject=%@",responseObject);
    DongwangDaletouStatusModel * daletouModel = [DongwangDaletouStatusModel BaseinitWithDic:reseponeDic];
      [CHShowMessageHud dismissHideHUD:CurrentVc.view];
      if (succedblock) {
      succedblock(daletouModel);
      }
  } Failure:^(id failure) {
      NSLog(@"错误信息:%@",failure);
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
+(void)DongwangDaletouRequestMyLottery:(NSMutableDictionary *)parmters RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc requestSucced:(void(^)(NSArray *  dataArr , NSString * openingTime))succedblock requestfairler:(void(^)(void))failerblock{
    NSString *deviceID = [MFSIdentifier deviceID];
  if (![parmters.allKeys containsObject:@"deviceId"]) {
      [parmters setValue:deviceID forKey:@"deviceId"];
  }
  NSLog(@"请求地址:%@",[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,daletou_myLottery]);
  [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,daletou_myLottery] HttpHeader:nil Parameters:parmters Success:^(id responseObject) {
      NSDictionary * reseponeDic =  (NSDictionary *)[responseObject objectForKey:@"data"];
      NSString * openingTime = [reseponeDic objectForKey:@"openingTime"];
      NSArray * dataArr;
      id ticketNums  = [reseponeDic objectForKey:@"ticketNums"];
      NSLog(@"---%@",[ticketNums class]);
      if ([ticketNums isKindOfClass:[NSArray class]]) {
          dataArr = (NSArray *)ticketNums;
      }
      [CHShowMessageHud dismissHideHUD:CurrentVc.view];
      NSLog(@"%@",responseObject);
      if (succedblock) {
        succedblock(dataArr,openingTime);
      }
  } Failure:^(id failure) {
      NSLog(@"错误信息:%@",failure);
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
+(void)DongwangDaletouRequestJoinLottery:(NSMutableDictionary *)parmters RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc requestSucced:(void(^)( DongwangJoinModel * joinModel,NSMutableDictionary * responseListDic))succedblock requestfairler:(void(^)(void))failerblock{
    NSString *deviceID = [MFSIdentifier deviceID];
  if (![parmters.allKeys containsObject:@"deviceId"]) {
      [parmters setValue:deviceID forKey:@"deviceId"];
  }
  NSLog(@"请求地址:%@",[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,joinLottery]);
  [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,joinLottery] HttpHeader:nil Parameters:parmters Success:^(id responseObject) {
      NSDictionary * reseponeDic =  (NSDictionary *)[responseObject objectForKey:@"data"];
      NSMutableDictionary * ParmterDic = [[NSMutableDictionary alloc]init];
      NSArray * responseListArr =  [[reseponeDic objectForKey:@"response"] objectForKey:@"responseList"];
      [ParmterDic setValue:responseListArr forKey:@"responseList"];
      DongwangJoinModel * joinModle = [DongwangJoinModel BaseinitWithDic:reseponeDic];
      [CHShowMessageHud dismissHideHUD:CurrentVc.view];
      NSLog(@"立即参与:%@",responseObject);
      if (succedblock) {
          succedblock(joinModle,ParmterDic);
      }
  } Failure:^(id failure) {
      NSLog(@"错误信息:%@",failure);
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
+(void)DongwangDaletouRequestgetAnswerResult:(NSMutableDictionary *)parmters RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc requestSucced:(void(^)(DongwangAnswerResultModel  *  resultModel))succedblock requestfairler:(void(^)(void))failerblock{
    NSString *deviceID = [MFSIdentifier deviceID];
  if (![parmters.allKeys containsObject:@"deviceId"]) {
      [parmters setValue:deviceID forKey:@"deviceId"];
  }
  NSLog(@"请求地址:%@",[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,getAnswerResult]);
  [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,getAnswerResult] HttpHeader:nil Parameters:parmters Success:^(id responseObject) {
      NSDictionary * reseponeDic =  (NSDictionary *)[responseObject objectForKey:@"data"];
//      NSString * openingTime = [reseponeDic objectForKey:@"openingTime"];
//      NSArray * dataArr;
//      id ticketNums  = [reseponeDic objectForKey:@"ticketNums"];
//      NSLog(@"---%@",[ticketNums class]);
//      if ([ticketNums isKindOfClass:[NSArray class]]) {
//          dataArr = (NSArray *)ticketNums;
//      }
      
      DongwangAnswerResultModel * resultModel = [DongwangAnswerResultModel BaseinitWithDic:reseponeDic];
      [CHShowMessageHud dismissHideHUD:CurrentVc.view];
      NSLog(@"%@",responseObject);
      if (succedblock) {
          succedblock(resultModel);
      }
  } Failure:^(id failure) {
      NSLog(@"错误信息:%@",failure);
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
+(void)DongwangDaletouRequestgetpastActivity:(NSMutableDictionary *)parmters RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc requestSucced:(void(^)(id    resultobject))succedblock requestfairler:(void(^)(void))failerblock{
    NSString *deviceID = [MFSIdentifier deviceID];
  if (![parmters.allKeys containsObject:@"deviceId"]) {
      [parmters setValue:deviceID forKey:@"deviceId"];
  }
  NSLog(@"请求地址:%@",[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,getAnswerResult]);
  [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,pastActivity] HttpHeader:nil Parameters:parmters Success:^(id responseObject) {
      NSDictionary * reseponeDic =  (NSDictionary *)[responseObject objectForKey:@"data"];
      NSArray *  resultList = [reseponeDic objectForKey:@"resultList"];
      NSMutableArray * Temp = [NSMutableArray array];
      for (NSDictionary * responeDic in resultList) {
          DongwangDaletouHistoryModel  * HistModel = [DongwangDaletouHistoryModel BaseinitWithDic:responeDic];
          [Temp addObject:HistModel];
      }
      [CHShowMessageHud dismissHideHUD:CurrentVc.view];
      NSLog(@"%@",responseObject);
      if (succedblock) {
          succedblock(Temp);
      }
  } Failure:^(id failure) {
      NSLog(@"错误信息:%@",failure);
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
+(void)DongwangDaletouRequestgetpastActivitydetail:(NSMutableDictionary *)parmters RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc requestSucced:(void(^)(id   resultobject, NSMutableArray * lotteryResponsesArr))succedblock requestfairler:(void(^)(void))failerblock{

    NSString *deviceID = [MFSIdentifier deviceID];
  if (![parmters.allKeys containsObject:@"deviceId"]) {
      [parmters setValue:deviceID forKey:@"deviceId"];
  }
    NSString * idStr = [parmters objectForKey:@"id"];
  NSLog(@"请求地址:%@",[NSString stringWithFormat:@"%@%@?id=%@",Dongwang_BaseUrl,getAnswerResult,idStr]);
  [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@?id=%@",Dongwang_BaseUrl,pastDetail,idStr] HttpHeader:nil Parameters:parmters Success:^(id responseObject) {
      NSDictionary * reseponeDic =  (NSDictionary *)[responseObject objectForKey:@"data"];
      NSMutableArray * lotteryResponsesArr = [NSMutableArray array];
      if ([[reseponeDic objectForKey:@"lotteryResponses"] isKindOfClass:[NSArray class]]) {
          NSArray * Arr = [reseponeDic objectForKey:@"lotteryResponses"];
          for (NSDictionary * respDic in Arr) {
              DongwangMyHistoryModel * histModel = [DongwangMyHistoryModel BaseinitWithDic:respDic];
              [lotteryResponsesArr addObject:histModel];
          }
      }
      [CHShowMessageHud dismissHideHUD:CurrentVc.view];
      NSLog(@"%@",responseObject);
      if (succedblock) {
          succedblock(responseObject,lotteryResponsesArr);
      }
  } Failure:^(id failure) {
      NSLog(@"错误信息:%@",failure);
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
+(void)DongwangDaletouRequestreceiveAwards:(NSMutableDictionary *)parmters RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc requestSucced:(void(^)(id   resultobject))succedblock requestfairler:(void(^)(void))failerblock{
    NSString *deviceID = [MFSIdentifier deviceID];
  if (![parmters.allKeys containsObject:@"deviceId"]) {
      [parmters setValue:deviceID forKey:@"deviceId"];
  }
    NSString * idStr = [parmters objectForKey:@"id"];
  NSLog(@"请求地址:%@",[NSString stringWithFormat:@"%@%@?id=%@",Dongwang_BaseUrl,receiveAwards,idStr]);
  [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@?id=%@",Dongwang_BaseUrl,receiveAwards,idStr] HttpHeader:nil Parameters:parmters Success:^(id responseObject) {
      NSDictionary * reseponeDic =  (NSDictionary *)[responseObject objectForKey:@"data"];
      NSMutableArray * lotteryResponsesArr = [NSMutableArray array];
      
      [CHShowMessageHud dismissHideHUD:CurrentVc.view];
      NSLog(@"%@",responseObject);
      if (succedblock) {
          succedblock(responseObject);
      }
  } Failure:^(id failure) {
      NSLog(@"错误信息:%@",failure);
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
@end
