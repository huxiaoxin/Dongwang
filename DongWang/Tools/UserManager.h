//
//  UserManager.h
//  DongWang
//
//  Created by codehzx on 2020/10/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInfo : NSObject
@property (nonatomic,copy)NSString *userid;//用户id
@property (nonatomic,copy)NSString *avatar;//头像
@property (nonatomic,copy)NSString *mobile;//手机号
@property (nonatomic,copy)NSString *userName;//用户名
@property (nonatomic,copy)NSString *nickname;//用户昵称
@property (nonatomic,copy)NSString *birthday;//生日
@property (nonatomic,copy)NSString *token;//token
@property (nonatomic,copy)NSString *sex;//性别
 - (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

@interface UserManager : NSObject
/**
  存储用户信息
 @param dic 服务器获取来的用户信息字典
 @return <#return value description#>
 */
+ (BOOL)saveUserInfo:(NSDictionary *)dic;
 
/**
 取用户信息
 @return 返回用户信息模型
 */
+ (UserInfo *)userInfo;
 
/**
  清空用户信息
 @return <#return value description#>
 */
+ (BOOL)clearUserInfo;
+(BOOL)userisLogoin;
+(void)userLoginSucced;
+(void)userLoginout;
@end

NS_ASSUME_NONNULL_END
