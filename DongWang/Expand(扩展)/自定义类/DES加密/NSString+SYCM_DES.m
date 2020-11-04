//
//  NSString+SYCM_DES.m
//  DongWang
//
//  Created by codehzx on 2020/10/28.
//

#import "NSString+SYCM_DES.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import <Security/Security.h>

#define key @"521qqqcc"
@implementation NSString (SYCM_DES)

/**
 * 加密
 */
+ (NSString *)encryptUseDESa:(NSString *)clearText
{
    NSData *data = [clearText dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding ,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          nil,
                                          [data bytes],
                                          [data length],
                                          buffer,
                                          1024,
                                          &numBytesEncrypted);
    
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData *dataTemp = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        plainText = [dataTemp base64EncodedStringWithOptions:0];
//        plainText = [self encodeString:plainText];
        NSLog(@"%@",plainText);
    }else{
                NSLog(@"DES加密失败");
    }
    return plainText;
}
@end
