//
//  AFManagerTool.m
//  SYQuMinApp
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import "AFManagerTool.h"

@implementation AFManagerTool
+(AFHTTPSessionManager *)shareManager {
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        manager = [AFHTTPSessionManager manager];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = 10.0;
        manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:config];
        
        
        
//        [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
//        //设置请求的超时时间
//        manager.requestSerializer.timeoutInterval = 10;
//        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    });
    return manager;
}
@end
