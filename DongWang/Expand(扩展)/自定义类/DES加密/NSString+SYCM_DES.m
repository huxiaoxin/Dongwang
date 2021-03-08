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
#import "GTMBase64.h"
#define key @"sycmdwan"
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
        NSLog(@"%@",plainText);
    }else{
    NSLog(@"DES加密失败");
    }
    return plainText;
}
//解密
+(NSString *)decryptUseDES:(NSString *)cipherText{
    NSData* cipherData = [GTMBase64 decodeString:cipherText];

  unsigned char buffer[1024];
 memset(buffer, 0, sizeof(char));
 size_t numBytesDecrypted = 0;
  NSString *testString = key;
  NSData *testData = [testString dataUsingEncoding: NSUTF8StringEncoding];
 Byte *iv = (Byte *)[testData bytes];
// CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES, kCCOptionPKCS7Padding, [key UTF8String], kCCKeySizeDES, iv, [cipherData bytes], [cipherData length], buffer, 1024, &numBytesDecrypted);
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          nil,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);

  NSString* plainText = nil;
  if (cryptStatus == kCCSuccess) {
  NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
 plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
 }
  return plainText;
 }



@end
