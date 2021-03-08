//
//  DataBuried.m
//  DongWang
//
//  Created by codehzx on 2020/12/14.
//

#import "DataBuried.h"
#import <MFSIdentifier-umbrella.h>

@implementation DataBuried
+(instancetype)ShareManager{
    static DataBuried *dataBase = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataBase = [[DataBuried alloc] init];
    });
    
    return dataBase;}
-(void)CLLogoninWithParmesWithShowTimeStr:(NSString *)ShowTimeStr LeaveTimeStr:(NSString *)LeaveTimeStr ViewPageName:(int)PageName{
    NSMutableDictionary * Parmters = [NSMutableDictionary dictionary];
    [Parmters setValue:[NSNumber numberWithDouble:[LeaveTimeStr doubleValue]] forKey:@"endTime"];
    [Parmters setValue:[NSNumber numberWithDouble:[ShowTimeStr doubleValue]] forKey:@"startTime"];
    [Parmters setValue:[NSNumber numberWithInt:PageName] forKey:@"type"];
    [Parmters setValue:@"1" forKey:@"source"];
    NSString *deviceID = [MFSIdentifier deviceID];
    [Parmters setValue:deviceID forKey:@"deviceId"];
    //deviceId
    
//    NSLog(@"参数:%@",Parmters);
    //这里需要做优化
    [AFNetworkTool Post:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,ViewsTimer] HttpHeader:@{}.mutableCopy Parameters:Parmters Success:^(id responseObject) {
    } Failure:^(id failure) {

    }];

}
@end
