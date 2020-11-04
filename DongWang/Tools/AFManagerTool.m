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
        manager = [AFHTTPSessionManager manager];
    });
    return manager;
}
@end
