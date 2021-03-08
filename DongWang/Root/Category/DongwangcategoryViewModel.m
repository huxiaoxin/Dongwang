//
//  DongwangcategoryViewModel.m
//  DongWang
//
//  Created by codehzx on 2020/12/2.
//

#import "DongwangcategoryViewModel.h"
#import "DongwangPersonaltaskModel.h"
@implementation DongwangcategoryViewModel
+(DongwangPersonaltaskModel *)DongwangTaskConfigersWithImgName:(NSString *)ImgNames titles:(NSString *)titleText DetailDesc:(NSString *)DescText btntitle:(NSString *)btnTitleText taskisComplte:(BOOL)isColpmte mytype:(NSInteger)type{
    DongwangPersonaltaskModel * taskModel =[[DongwangPersonaltaskModel alloc]init];
    taskModel.imgName = ImgNames;
    taskModel.title = titleText;
    taskModel.detaildesc = DescText;
    taskModel.btnTitle = btnTitleText;
    taskModel.iscomplete = isColpmte;
    taskModel.type = type;
    return taskModel;
}
+(void)DongwangFenleiViewModelWithgetTask:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc taskSuuced:(void(^)(id object,BOOL isNewTask,NSString *completeProgress))Succedblock taskfairler:(void(^)(id message))failerblock{    [CHShowMessageHud showHUDPlainText:@"" view:CurrentVc.view];
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_getTaskList] HttpHeader:nil Parameters:nil Success:^(id responseObject) {
        NSLog(@"任务模块:%@",responseObject);
        NSDictionary * dataDic = [responseObject objectForKey:@"data"];
        NSMutableArray * TempArr = [NSMutableArray array];
        //是否完成新手任务
        BOOL  newbieStatus = [[dataDic objectForKey:@"newbieStatus"]      boolValue];
        ////完善个人资料,0代表未完善,1代表已完善(新手任务)
        NSString * personalData = [dataDic objectForKey:@"personalData"];
        //完成一次签到,0代表未完成,1代表已完成(新手任务)
        NSString * signTask = [dataDic objectForKey:@"signTask"];
        //完成一次答题,0代表未完成,1代表已完成(新手任务)
        NSString * answerTask = [dataDic objectForKey:@"answerTask"];
        //绑定微信账号,0代表未绑定,1代表已绑定(新手任务)
        NSString * wxTask = [dataDic objectForKey:@"wxTask"];
        
        //绑定手机号,0代表未绑定,1代表已绑定(新手任务)
        NSString * phoneTask = [dataDic objectForKey:@"phoneTask"];
        //完成实名认证,0代表未完成,1代表已完成(新手任务)
        NSString * realName = [dataDic objectForKey:@"realName"];
        
        //参与今日答题,0代表未完成,1代表已完成(日常任务)
        NSString * todayAnswer = [dataDic objectForKey:@"todayAnswer"];
        //答题过程中使用道具,0代表未使用,1代表已使用(日常任务)
        NSString * answerProp = [dataDic objectForKey:@"answerProp"];
        //积分抽奖,0代表未完成,1代表已完成(日常任务)
        NSString * integralDraw = [dataDic objectForKey:@"integralDraw"];
        //积分兑换,0代表未完成,1代表已完成(日常任务)
        NSString * integralExchange = [dataDic objectForKey:@"integralExchange"];
        
        NSInteger mytype = [[dataDic objectForKey:@"type"] integerValue];
        
        //日常任务完成度
        NSString * completeProgressStr = [NSString stringWithFormat:@"%@",[dataDic objectForKey:@"completeProgress"]];
        if ([CurrentVc isKindOfClass:NSClassFromString(@"DongwangSubFenleiViewController")]) {
         //新手任务
        if (newbieStatus == NO) {
        [TempArr addObject:[self DongwangTaskConfigersWithImgName:@"个人资料" titles:@"完善个人资料" DetailDesc:@"积分+10" btntitle:@"去完善" taskisComplte:[personalData boolValue] mytype:mytype]];
            
        [TempArr addObject:[self DongwangTaskConfigersWithImgName:@"签到任务" titles:@"完成一次签到" DetailDesc:@"积分+10" btntitle:@"去签到" taskisComplte:[signTask boolValue] mytype:mytype]];
            
        [TempArr addObject:[self DongwangTaskConfigersWithImgName:@"答题" titles:@"完成一次答题" DetailDesc:@"积分+10" btntitle:@"去答题" taskisComplte:[answerTask boolValue] mytype:mytype]];
            
        if (mytype == 0) {
        [TempArr addObject:[self DongwangTaskConfigersWithImgName:@"绑定微信账号" titles:@"绑定微信账号" DetailDesc:@"积分+20" btntitle:@"去绑定" taskisComplte:[wxTask boolValue] mytype:mytype]];
        }else{
        [TempArr addObject:[self DongwangTaskConfigersWithImgName:@"绑定手机号" titles:@"绑定手机号" DetailDesc:@"积分+20" btntitle:@"去绑定" taskisComplte:[phoneTask boolValue] mytype:mytype]];
        }
            
      [TempArr addObject:[self DongwangTaskConfigersWithImgName:@"完成实名认证" titles:@"完成实名认证" DetailDesc:@"积分+20" btntitle:@"去认证" taskisComplte:[realName boolValue] mytype:mytype]];
        }
        }else{
        //日常任务
        [TempArr addObject:[self DongwangTaskConfigersWithImgName:@"话题" titles:@"参与今日答题" DetailDesc:@"1个题组，+ 2积分（上限10积分）" btntitle:@"去答题" taskisComplte:[todayAnswer boolValue] mytype:mytype]];
        [TempArr addObject:[self DongwangTaskConfigersWithImgName:@"道具" titles:@"答题过程中使用道具" DetailDesc:@"使用道具1次，积分+2" btntitle:@"去使用" taskisComplte:[answerProp boolValue] mytype:mytype]];
        [TempArr addObject:[self DongwangTaskConfigersWithImgName:@"积分抽奖" titles:@"积分抽奖" DetailDesc:@"完成1次积分抽奖，积分+2" btntitle:@"去抽奖" taskisComplte:[integralDraw boolValue] mytype:mytype]];
            
        [TempArr addObject:[self DongwangTaskConfigersWithImgName:@"积分兑换" titles:@"积分兑换" DetailDesc:@"完成1次积分兑换，积分+2 " btntitle:@"去兑换" taskisComplte:[integralExchange boolValue] mytype:mytype]];

        }
        NSString * message = [responseObject objectForKey:@"message"];
        [CHShowMessageHud dismissHideHUD:CurrentVc.view];
        if (![message isEqualToString:@"请求成功"] && ![message isEqualToString:@"success"]) {
            [CHShowMessageHud showMessageText:message];
        }
        if (Succedblock) {
            Succedblock(TempArr,newbieStatus,completeProgressStr);
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
