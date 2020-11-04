//
//  AFNetworkTool.h
//  SY全民共进
//
//  Created by apple on 2018/4/9.
//  Copyright © 2018年 gch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFNetworkTool : NSObject
/**
 *  GET请求
 *
 *  @param url        请求接口
 *  @param httpHeader 请求头
 *  @param parameters 向服务器请求时的参数
 *  @param success    请求成功，block的参数为服务返回的数据
 *  @param failure    请求失败，block的参数为错误信息
 */
+ (void)GET:(NSString *)url
 HttpHeader:(NSDictionary *)httpHeader
 Parameters:(NSDictionary *)parameters
    Success:(void(^)(id responseObject))success
    Failure:(void (^)(NSError *error))failure;
/**
 *  POST请求
 *
 *  @param url        要提交的数据结构
 *  @param httpHeader 请求头
 *  @param parameters 要提交的数据
 *  @param success    成功执行，block的参数为服务器返回的内容
 *  @param failure    执行失败，block的参数为错误信息
 */
+ (void)Post:(NSString *)url
  HttpHeader:(NSDictionary *)httpHeader
  Parameters:(NSDictionary *)parameters
     Success:(void(^)(id responseObject))success
     Failure:(void (^)(id))failure;



@end
