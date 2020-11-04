//
//  EncryptionTool.m
//  SYQuMinApp
//
//  Created by apple on 2018/5/15.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import "EncryptionTool.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import <Security/Security.h>
#import "JKEncrypt.h"
#import "RSA.h"
@implementation EncryptionTool

+ (NSString *)getSignatureString:(NSString *)devId appId:(NSString *)appId v:(NSString *)v stamp:(NSString *)stamp mode:(NSString *)mode account:(NSString *)account tsn:(NSString *)tsn salt:(NSString *)salt appSecret:(NSString *)appSecret md:(NSString *)md {
    NSString *mdpwd;
    NSString *temp;
    if ([NSString isBlankString:md] == NO && [NSString isBlankString:tsn] == NO) {
        NSString *mdpwdtemp = [NSString stringWithFormat:@"%@%@", account, [md MD5String]];
        mdpwd = [mdpwdtemp MD5String];
        temp = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@", devId, appId, v, stamp, mode, account, tsn, salt, appSecret, mdpwd];
    } else  {
        temp = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@", devId, appId, v, stamp, mode, account, salt, appSecret];
    }
    return [temp getUrlEncode];
}
+ (NSString *)getSignatureString:(NSString *)devId appId:(NSString *)appId v:(NSString *)v stamp:(NSString *)stamp account:(NSString *)account type:(NSString *)type appSecret:(NSString *)appSecret {
    NSString *temp = [NSString stringWithFormat:@"%@%@%@%@%@%@%@", devId, appId, v, stamp, account, type, appSecret];
    return [temp getUrlEncode];
}

// 验证码加密签名
+ (NSString *)getCodeSignatureString:(NSString *)devId appId:(NSString *)appId v:(NSString *)v stamp:(NSString *)stamp phone:(NSString *)phone code:(NSString *)code pass:(NSString *)pass appSecret:(NSString *)appSecret {
    
    NSString *phoneCode = [NSString stringWithFormat:@"%@%@%@%@", phone, code, phone, code];
    NSString *desKey = [phoneCode substringToIndex:24];
    NSString *desPrivate = [EncryptionTool doEncrypt:pass privateKey:desKey];
//    NSString *gggg = [EncryptionTool doDecEncrypt:desPrivate privateKey:desKey];
//    NSString *hex = [NSString hexStringFromString:desPrivate];
    NSString *temp = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@", devId, appId, v, stamp, phone, code,desPrivate, appSecret];
    
    return [temp getUrlEncode];
}

/*
 jwtToken为登录返回的token中的第三段
 timestamp为头部的sycm中的时间戳字段
 v为头部的sycm中的接口版本字段
 salt为登录时，请求方生成的随机数
 random为登录成功后，从服务器端返回的随机数
 appKey为注册的应用key
 
 */
+ (NSDictionary *)getSignatureTimestamp {
    NSString *timestring = [NSString currentTimeStr];
    NSString *jwtToken = [NSUserDefaults ch_customObjectForKey:@"jwtToken"];
    NSString *salts = [NSUserDefaults ch_customObjectForKey:@"salts"];
    NSString *random = [NSUserDefaults ch_customObjectForKey:@"random"];
    NSString *temp = [NSString stringWithFormat:@"%@%@%@%@%@%@", jwtToken, timestring, QMGJV, salts, random, appScretLogin];
    NSString *scym = [NSString stringWithFormat:@"%@_%@_%@", QMGJV, timestring,[temp getUrlEncode]];
    NSString *bearerToken = [NSUserDefaults ch_customObjectForKey:@"BearerToken"];
    NSDictionary *dic = [NSDictionary dictionary];
    if ([NSString isBlankString:bearerToken] == NO) {
        dic = @{@"sycm":scym, @"Authorization":bearerToken};
    }
    return dic;
}
+ (NSDictionary *)getRegisterSignatureTimestamp:(NSString *)pwd {
    NSString *timestring = [NSString currentTimeStr];
    NSString *jwtToken = [NSUserDefaults ch_customObjectForKey:@"jwtToken"];
    NSString *salts = [NSUserDefaults ch_customObjectForKey:@"salts"];
    NSString *random = [NSUserDefaults ch_customObjectForKey:@"random"];
    NSString *temp = [NSString stringWithFormat:@"%@%@%@%@%@%@", jwtToken, timestring, QMGJV, salts, random, appScretLogin];
    NSString *scym = [NSString stringWithFormat:@"%@_%@_%@", QMGJV, timestring,[temp getUrlEncode]];
    NSString *bearerToken = [NSUserDefaults ch_customObjectForKey:@"BearerToken"];
    
    NSDictionary *dic;
    if ([NSString isBlankString:bearerToken] == NO) {
        dic = @{@"sycm":scym, @"Authorization":bearerToken, @"pwd":pwd};
    } else {
        dic = @{@"sycm":scym, @"pwd":pwd};
    }
    return dic;
}

#pragma mark -- 版本签名
+ (NSString *)getSignatureVersionStamp:(NSString *)stamp version:(NSString *)version {
    NSString *temp = [NSString stringWithFormat:@"%@%@%@%@%@%@", QMGJDEVID, QMGJAPPID, QMGJV, stamp, version, appScretLogin];
    NSString *scym = [temp getUrlEncode];
    return scym;
}

#pragma mark -- 广告签名
+ (NSString *)getSignatureADstamp:(NSString *)stamp {
    NSString *temp = [NSString stringWithFormat:@"%@%@%@%@%@", QMGJDEVID, QMGJAPPID, QMGJV, stamp, appScretLogin];
    NSString *scym = [temp getUrlEncode];
    return scym;
}


// 公钥加密, 返回字符串
+ (NSString *)encryptionToolString:(NSString *)str publicKey:(NSString *)pubKey {
    NSString *temp = [RSA encryptString:str publicKey:pubKey];
    return temp;
    
}
// 公钥加密, 返回data
+ (NSData *)encryptionToolData:(NSData *)data publicKey:(NSString *)pubKey {
    NSData *temp = [RSA encryptData:data publicKey:pubKey];
    return temp;
}
// 私钥加密, 返回字符串
+ (NSString *)encryptionToolString:(NSString *)str privateKey:(NSString *)privKey {
    NSString *temp = [RSA encryptString:str privateKey:privKey];
    return temp;
}
// 私钥加密, 返回data
+ (NSData *)encryptionToolData:(NSData *)data privateKey:(NSString *)privKey {
    NSData *temp = [RSA encryptData:data privateKey:privKey];
    return temp;
}
// 公钥解密, 返回字符串
+ (NSString *)decryptionToolString:(NSString *)str publicKey:(NSString *)pubKey {
    NSString *temp = [RSA decryptString:str publicKey:pubKey];
    return temp;
}
// 公钥解密, 返回data
+ (NSData *)decryptionToolData:(NSData *)data publicKey:(NSString *)pubKey {
    NSData *temp = [RSA decryptData:data publicKey:pubKey];
    return temp;
}
// 私钥解密, 返回字符串
+ (NSString *)decryptionToolString:(NSString *)str privateKey:(NSString *)privKey {
    NSString *temp = @"";
    if ([NSString isBlankString:str] == NO) {
        temp = [RSA decryptString:str privateKey:privKey];
    }
    return temp;
}
// 私钥解密, 返回data
+ (NSData *)decryptionToolData:(NSData *)data privateKey:(NSString *)privKey {
    NSData *temp = [RSA decryptData:data privateKey:privKey];
    return temp;
}


#pragma mark -- 3des
+ (NSString *)doEncrypt:(NSString *)plainText privateKey:(NSString *)gkeys{
//    NSString *hexString = @"";
    JKEncrypt * en = [[JKEncrypt alloc]init];
    //加密
    NSString *decEncryptStr = [en doEncryptHex:plainText privateKey:gkeys];
    return decEncryptStr;
}
#pragma mark -- 3des解密
+(NSString*)doDecEncrypt:(NSString *)hexString privateKey:(NSString *)gkeys{
    JKEncrypt * en = [[JKEncrypt alloc]init];
    NSString *result = [en doDecEncryptHex:hexString privateKey:gkeys];
    return result;
    
}

@end
