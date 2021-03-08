//
//  AFNetworkTool.m
//
//  Created by apple on 2018/4/9.
//  Copyright © 2018年 gch. All rights reserved.

#import "AFNetworkTool.h"
#import "AFManagerTool.h"
#import "NSDictionary+DeleteNull.h"
@interface AFNetworkTool ()
//@property(nonatomic, strong)AFNetworkReachabilityManager *reachabilityManager;
@end
@implementation AFNetworkTool
//创建网络请求对象
+ (AFHTTPSessionManager *)createAFHTTPSessionManager {
    AFHTTPSessionManager *manager = [AFManagerTool shareManager];
//    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
//    //设置请求的超时时间
//    manager.requestSerializer.timeoutInterval = 10;
//    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    //设置请求参数的类型:HTTP (AFJSONRequestSerializer,AFHTTPRequestSerializer)
    // 声明上传的是json格式的参数，需要你和后台约定好，不然会出现后台无法获取到你上传的参数问题
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 上传普通格式
  manager.requestSerializer = [AFJSONRequestSerializer serializer]; // 上传JSON格式
    
    //设置服务器返回结果的类型:JSON (AFJSONResponseSerializer,AFHTTPResponseSerializer)
    // 声明获取到的数据格式AFJSONResponseSerializer AFN不会解析,数据是data，需要自己解析
    // AFHTTPResponseSerializer  AFN会JSON解析返回的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    return manager;
}

/**
 *  GET请求
 */
+ (void)GET:(NSString *)url
 HttpHeader:(NSDictionary *)httpHeader
 Parameters:(NSDictionary *)parameters
    Success:(void(^)(id responseObject))success
    Failure:(void (^)(id failure))failure{
    [AFNetworkTool setAFNetWorkings];
    AFHTTPSessionManager *manager = [AFNetworkTool createAFHTTPSessionManager];
    
    if ([httpHeader allKeys].count != 0) {
    NSArray *dickey = [httpHeader allKeys];
    for (NSString *string in dickey) {
    [manager.requestSerializer setValue:httpHeader[string] forHTTPHeaderField:string];
    }
    }
    if ([UserManager userisLogoin]) {
    [manager.requestSerializer setValue:[UserManager token] forHTTPHeaderField:@"token"];
    }
//    NSString * parmetesStr = [self convertToJsonData:parameters];
    //NSLog(@"base参数:%@===%@",parmetesStr);
    //发起get请求
    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSDictionary * reseponeDic = [NSDictionary changeType:dic];
        NSString * code = [NSString stringWithFormat:@"%@",reseponeDic[@"code"]];
        NSString * message = [NSString stringWithFormat:@"%@",reseponeDic[@"message"]];
        if ([code isEqualToString:@"200"]) {
            if (success) {
            success(reseponeDic);
            }
        }else if ([code isEqualToString:@"401"]){
        if (failure) {
        failure(message);
        }
        //登录失效
       [[NSNotificationCenter defaultCenter] postNotificationName:TokenRestNotification object:@{@"message":message}];
        }
        else{
        if (failure) {
        failure(message);
        }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //通过block,将错误信息回传给用户
        NSLog(@"错误信息:%@\n请求地址:%@",error.localizedDescription,url);

        if (failure) {
            if (error.code  == -1001) {
            failure(@"请求超时");
            }else{
//            failure(@"请求错误");
                failure(@"");
            }

        }
    }];
    
    
    
    
    
}
+ (NSString *)convertToJsonData:(NSDictionary *)dict {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}

/**
 *  POST请求
 */
+ (void)Post:(NSString *)url
  HttpHeader:(NSDictionary *)httpHeader
  Parameters:(NSDictionary *)parameters
     Success:(void(^)(id responseObject))success
     Failure:(void (^)(id failure))failure{
    AFHTTPSessionManager *manager = [AFNetworkTool createAFHTTPSessionManager];
    [AFNetworkTool setAFNetWorkings];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer]; // 上传JSON格式
    if ([httpHeader allKeys].count != 0) {
        NSArray *dickey = [httpHeader allKeys];
        for (NSString *string in dickey) {
    [manager.requestSerializer setValue:httpHeader[string] forHTTPHeaderField:string];
        }
    }
    if ([UserManager userisLogoin]) {
        [manager.requestSerializer setValue:[UserManager token] forHTTPHeaderField:@"token"];
    }
    NSLog(@"header:%@",manager.requestSerializer.HTTPRequestHeaders);
//    NSLog(@"参数:%@",parameters);
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //将返回的数据转成json数据格式
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSDictionary * reseponeDic = [NSDictionary changeType:dic];
//        NSLog(@"%@",reseponeDic);

        //通过block，将数据回掉给用户
        NSString * code = [NSString stringWithFormat:@"%@",reseponeDic[@"code"]];
        NSString * message = [NSString stringWithFormat:@"%@",reseponeDic[@"message"]];
        if ([code isEqualToString:@"200"]) {
            if (success) {
            success(reseponeDic);
            }
        }else{
            if (failure) {
                failure(message);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"服务器内部错误:%@ 请求参数:%@",error,parameters);
        //通过block,将错误信息回传给用户
        if (failure) {
        if (error.code  == -1001) {
        failure(@"请求超时");
        }else{
//        failure(@"请求错误");
            failure(@"");
        }
        }
    }];
}

#pragma mark -- 判断是否有网
+ (void)setAFNetWorkings {
    // 创建网络监控对象
    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    // 设置监听
    [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未识别的网络");
                [CHShowMessageHud showMessageText:@"当前无网络, 请检查网络后再重试!"];
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"不可达的网络(未连接)");
                [CHShowMessageHud showMessageText:@"当前无网络, 请检查网络后再重试!"];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"2G,3G,4G...的网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"wifi的网络");
                break;
            default:
                break;
        }
    }];
    //开始监听网络状况.
    [reachabilityManager startMonitoring];
}


@end
