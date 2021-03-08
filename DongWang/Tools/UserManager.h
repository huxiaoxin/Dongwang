//
//  UserManager.h
//  DongWang
//
//  Created by codehzx on 2020/10/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInfo : NSObject
@property (nonatomic , copy) NSString              * password;
@property (nonatomic , copy) NSString              * realNameAuth;//代**|420*************35"//实名认证加密
@property (nonatomic , copy) NSString              * versions;
@property (nonatomic , copy) NSString              * wxOpenId;
@property (nonatomic , copy) NSString              * wxHeader;
@property (nonatomic , copy) NSString              * userid;
@property (nonatomic , copy) NSString              * registerTime;
@property (nonatomic , copy) NSString              * remark;
@property (nonatomic , copy) NSString              * withdrawLimit;
@property (nonatomic , copy) NSString              * currentBalance;
@property (nonatomic , copy) NSString              * wxName;
@property (nonatomic , copy) NSString              * loginCount;
@property (nonatomic , copy) NSString              * headId;
@property (nonatomic , copy) NSString              * answerNum;
@property (nonatomic , copy) NSString              * idCard;
@property (nonatomic , copy) NSString              * account;
@property (nonatomic , copy) NSString              * insertUser;
@property (nonatomic , copy) NSString              * addressStatus;
@property (nonatomic , copy) NSString              * payName;
@property (nonatomic , copy) NSString              * updateUser;
@property (nonatomic , copy) NSString              * email;
@property (nonatomic , copy) NSString              * updateTime;
@property (nonatomic , copy) NSString              * appleId;
@property (nonatomic , copy) NSString              * nickName;
@property (nonatomic , copy) NSString              * code;
@property (nonatomic , copy) NSString              * realName;
@property (nonatomic , copy) NSString              * payAccount;
@property (nonatomic , copy) NSString              * status;
@property (nonatomic , copy) NSString              * withdrawTips;
@property (nonatomic , copy) NSString              * wxStatus;
@property (nonatomic , copy) NSString              * qqOpenId;
@property (nonatomic , copy) NSString              * gender;
@property (nonatomic , copy) NSString              * createTime;
@property (nonatomic , copy) NSString              * certification;
@property (nonatomic , copy) NSString              * header;
@property (nonatomic , copy) NSString              * personDataStatus;//表示用户资料是否所有全部完成
@property (nonatomic , copy) NSString              * ip;
@property (nonatomic , copy) NSString              * displayStatus;//微信显示状态 0-显示  1-隐藏
@property (nonatomic , copy) NSString              * phone;
@property (nonatomic , copy) NSString              * myIntegral;
@property (nonatomic , copy) NSString              * loginTime;
@property (nonatomic , copy) NSString              * alipayStatus;//0未绑定，1已绑定

@property(nonatomic,copy) NSString *  userPayAccount;

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

//获取用户信息字符串
+(NSDictionary * ) userInfoTojsonStr;

/**
  清空用户信息
 @return <#return value description#>
 */
+ (BOOL)clearUserInfo;

+(BOOL)userisLogoin;
+(void)userLoginSucced;
+(void)userLoginout;
+(NSString *)token;
+(void)UserManagerRealoadinfomationSuuced:(void(^)(void))Successblock fairler:(void(^)(void))failerblock;
@end

NS_ASSUME_NONNULL_END
