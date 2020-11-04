//
//  AFNetworkTool.m
//  SY全民共进
//
//  Created by apple on 2018/4/9.
//  Copyright © 2018年 gch. All rights reserved.
//

#import "AFNetworkTool.h"
#import "AFManagerTool.h"
#import "NSDictionary+DeleteNull.h"
@interface AFNetworkTool ()
//@property(nonatomic, strong)AFNetworkReachabilityManager *reachabilityManager;
@end
@implementation AFNetworkTool
//创建网络请求对象
+ (AFHTTPSessionManager *)createAFHTTPSessionManager {
    AFHTTPSessionManager *manager = [AFManagerTool shareManager];;
    //设置请求的超时时间
    manager.requestSerializer.timeoutInterval = 15;
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
+ (void)GET:(NSString *)url HttpHeader:(NSDictionary *)httpHeader Parameters:(NSDictionary *)parameters Success:(void (^)(id))success Failure:(void (^)(NSError *))failure{
    [AFNetworkTool setAFNetWorkings];
    AFHTTPSessionManager *manager = [AFNetworkTool createAFHTTPSessionManager];
    if ([httpHeader allKeys].count != 0) {
        NSArray *dickey = [httpHeader allKeys];
    for (NSString *string in dickey) {
    [manager.requestSerializer setValue:httpHeader[string] forHTTPHeaderField:string];
    }
    }
    //发起get请求
    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        //通过block，将数据回掉给用户
        if (success) {
            success(dic);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //通过block,将错误信息回传给用户
        if (error) {
            NSLog(@"====%ld", (long)error.code);
            if (failure) {
                failure(error);
            }
        }
    }];
}

/**
 *  POST请求
 */
+ (void)Post:(NSString *)url HttpHeader:(NSDictionary *)httpHeader Parameters:(NSDictionary *)parameters  Success:(void (^)(id))success Failure:(void (^)(id))failure{
    AFHTTPSessionManager *manager = [AFNetworkTool createAFHTTPSessionManager];
    [AFNetworkTool setAFNetWorkings];
    manager.requestSerializer = [AFJSONRequestSerializer serializer]; // 上传JSON格式
    if ([httpHeader allKeys].count != 0) {
        NSArray *dickey = [httpHeader allKeys];
        for (NSString *string in dickey) {
            [manager.requestSerializer setValue:httpHeader[string] forHTTPHeaderField:string];
        }
    }
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //将返回的数据转成json数据格式
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSDictionary * reseponeDic = [NSDictionary changeType:dic];
        NSLog(@"%@",reseponeDic);
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
        //通过block,将错误信息回传给用户
        if (failure) {
            failure(@"请求错误");
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
