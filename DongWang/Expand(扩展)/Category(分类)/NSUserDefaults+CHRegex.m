//
//  NSUserDefaults+CHRegex.m
//  SYQuMinApp
//
//  Created by apple on 2018/5/9.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import "NSUserDefaults+CHRegex.h"

@implementation NSUserDefaults (CHRegex)
+ (void)ch_setCustomObject:(id)obj forKey:(NSString*)key {
    if ([obj respondsToSelector:@selector(encodeWithCoder:)] == NO) {
        NSLog(@"Error save object to NSUserDefaults. Object must respond to encodeWithCoder: message");
        return;
    }
    NSString *encodedObject;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    encodedObject = [NSString stringWithFormat:@"%@", obj];
    [defaults setObject:encodedObject forKey:key];
    
    [defaults synchronize];
}
+ (id)ch_customObjectForKey:(NSString*)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *encodeObject = [NSString stringWithFormat:@"%@", [defaults objectForKey:key]];
    if ([NSString isBlankString:encodeObject] == YES) {
        encodeObject = @"";
    }
    return encodeObject;
}
+ (void)deleteObjectsForKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults removeObjectForKey:key];
    [defaults setObject:@"" forKey:key];
    [defaults synchronize];
}
+ (void)deleteObjectsAllKeys {
//    NSUserDefaults *defatluts = [NSUserDefaults standardUserDefaults];
//    NSDictionary *dictionary = [defatluts dictionaryRepresentation];
//    for(NSString *key in [dictionary allKeys]){
//        [defatluts removeObjectForKey:key];
//    }
//    [defatluts synchronize];
#pragma mark -- 这种删除全部的NSUserDefault本地保存的数据花费的时间比上一个方法花费的时间少
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    NSUserDefaults * defautls = [NSUserDefaults standardUserDefaults];
    [defautls removePersistentDomainForName:appDomain];
}
@end
