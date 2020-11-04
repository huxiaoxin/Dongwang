//
//  EncryptionTool.h
//  SYQuMinApp
//
//  Created by apple on 2018/5/15.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#define appScretLogin @"d1PPRRCg5Ib1467ZeoNs7OaQHQ0eC6e9bZcwNDls4KEaovf06uW0kZ5fkYUIX0lGTvfrFkR43zTGHreWzz4NHHkhf2pltXmW29618IPaOGBd"

#pragma mark -- RSA
#define pubkey  @"-----BEGIN PUBLIC KEY-----\n  \n-----END PUBLIC KEY-----"
#define privkey  @"-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCW05nUBJkbpBE8JGDPRWEQioZkRGNjCPnHETbsSgXVdEgS5oxxggAjDyMjrjnyJmMLbLN6es4yQwAj8KENSImqt+KmNJ+d2K0Sgd+SL0/SjENBI/B1PF30Q3LfiXfuSGooK2uOgig5pAB1/6QdBTfHuFOZY8LpomTstTgmjBMy267UaiAVuhBE3DauWo1N72OZGMVDhRDpwuyh/go1mherOMsY22l+GQNk0DpFfZbdHdGlhY70smZiBVCya8Yw54IoDS4l1+XSPfm369OsnUsK8UxwPavbwo5RnJDuj/EQzEwiIthKCh5y7bGuThWThbPkPJC0Vo0WwmOqIAzYQJRRAgMBAAECggEAHt0wNl22gxyA1mDPWrrk0QC33Z7NA8AbdOwF5DaFmReRhCSfir7CjmoTk8KcYvwN+pGE7MRim5BwX+pm2pQEb+XvQHm2TBPB3u6qtHxwBjLjtFnJZAQ1ab2/rRSxcRZqesvf16q01o7D9WGZ0MJ3lqwWl2X9xdeQdYvj8KdralWOKwPntzOv3SBoFemS+aGUaSDjtqSwN7HkGZhhPfECN4kQ/wixZcU34S3u/uDic+YhPbYGDum5m1BBX7Uq115nVLF3pWNNCsuHmdkF/4N6a5lU5CfxYWDlMgjTg3JMDLSdFlCYDzrasgthTRWQvyn/z9jjmWH7DxUG88OviJF/bQKBgQDu93ShuAHZKxUUaa7vtXrdOjLuRd2UFPlFy+KB3izJLWUIiJKEIRHCA8X+EoR5rHU83zCsQoW80twrhB8dWyFwhwas5R+hBOyqDf2hcJ+ZJqJ89aVonY+T96Rq+bD8nicdv/BWGuH+fxAEIIk6y1fZUttTKeZvxr6IOlU1ODr8fwKBgQChk88rHiVryhOx7K1uYo6PrCngFgXiah4MF9v9MnJ6Bc95VkeguvPeKrxjPUOmRVvXarND1xPHmrFoOLFJBKHOTQnbqQDChOI+tKpga0PPMRGVUze9SmkkGZn5BConwiz2vbcSul+AvBsoCa1NYJHmD/HA1BJNvVqnQHpleBtHLwKBgH6zfYdxRKmciiS0lChMlMRPY0mqiX1GUZSMMaCh6CUSiIspvmWIEx5HWecIcm0A33hS7j+nVbl0I4B/IPAzrVs4fHWXVlnNfp37pQq/6B8PuP+ATx9UyxetKeP+V7TZNew0JH3C6yhAvoExrxEZV47Gu7swcBm7yrH4G82H7t6JAoGAAtcWTSu6fKqQrg/6/HW/C8d69PVuJQy4en3w4AKDAKIZg4iAudKPdthJd3UcO0/8zUyS2h5tupR9idd1RlNOhNHV2oad/M1ZLMEAPbGk/39dT8KmuC0WrAvHKRlppElFgRDUpv+friOgVpPU+Ac6iVC+byVLLRKnBUmc3Su/TwECgYAjBgFdWem++ty/y3cG0vrtjPGSY03DsG+eeL87NCtjRnRzYM58KoFSpkhiwvkIcEWRJPzCVAL2W9qHOMBTH0E55uQUbWp4uIOcR9rc/4BWV35MzPmDC2encgImRbJP1GGp5cFjOxi4UGj9gZtbVYNauNNzlMJGp3nr2gyNcBOo7g==\n-----END PRIVATE KEY-----"


@interface EncryptionTool : NSObject
#pragma mark -- 签名计算
/*
 devId:开发者id appId:应用id v:登录接口版本号 stamp:当前时间戳 mode:登录模式 account:用户账号 tsn:登录终端序列号 salt:随机生成的数(8~16) appSecret:appkey(本地) md: md5(account+md5(password))
 */
+ (NSString *)getSignatureString:(NSString *)devId appId:(NSString *)appId v:(NSString *)v stamp:(NSString *)stamp mode:(NSString *)mode account:(NSString *)account tsn:(NSString *)tsn salt:(NSString *)salt appSecret:(NSString *)appSecret md:(NSString *)md;
+ (NSString *)getSignatureString:(NSString *)devId appId:(NSString *)appId v:(NSString *)v stamp:(NSString *)stamp account:(NSString *)account type:(NSString *)type appSecret:(NSString *)appSecret;

// 验证码加密签名
+ (NSString *)getCodeSignatureString:(NSString *)devId appId:(NSString *)appId v:(NSString *)v stamp:(NSString *)stamp phone:(NSString *)phone code:(NSString *)code pass:(NSString *)pass appSecret:(NSString *)appSecret;
+ (NSDictionary *)getSignatureTimestamp;
#pragma mark -- 注册设置密码
+ (NSDictionary *)getRegisterSignatureTimestamp:(NSString *)pwd;

+ (NSString *)getSignatureADstamp:(NSString *)stamp;

+ (NSString *)getSignatureVersionStamp:(NSString *)stamp version:(NSString *)version;


#pragma mark -- RSA加密
// 公钥加密, 返回字符串
+ (NSString *)encryptionToolString:(NSString *)str publicKey:(NSString *)pubKey;
// 公钥加密, 返回data
+ (NSData *)encryptionToolData:(NSData *)data publicKey:(NSString *)pubKey;
// 私钥加密, 返回字符串
+ (NSString *)encryptionToolString:(NSString *)str privateKey:(NSString *)privKey;
// 私钥加密, 返回data
+ (NSData *)encryptionToolData:(NSData *)data privateKey:(NSString *)privKey;
// 公钥解密, 返回字符串
+ (NSString *)decryptionToolString:(NSString *)str publicKey:(NSString *)pubKey;
// 公钥解密, 返回data
+ (NSData *)decryptionToolData:(NSData *)data publicKey:(NSString *)pubKey;
// 私钥解密, 返回字符串
+ (NSString *)decryptionToolString:(NSString *)str privateKey:(NSString *)privKey;
// 私钥解密, 返回data
+ (NSData *)decryptionToolData:(NSData *)data privateKey:(NSString *)privKey;

#pragma mark -- 3des
// 加密
+ (NSString *)doEncrypt:(NSString *)plainText privateKey:(NSString *)gkeys;
// 解密
+ (NSString*)doDecEncrypt:(NSString *)hexString privateKey:(NSString *)gkeys;
@end
