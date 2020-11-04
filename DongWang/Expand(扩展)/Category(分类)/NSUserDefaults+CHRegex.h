//
//  NSUserDefaults+CHRegex.h
//  SYQuMinApp
//
//  Created by apple on 2018/5/9.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (CHRegex)
+(void) ch_setCustomObject:(id)obj forKey:(NSString*)key;
+(id) ch_customObjectForKey:(NSString*)key;
+ (void)deleteObjectsForKey:(NSString *)key;
+ (void)deleteObjectsAllKeys;
@end
