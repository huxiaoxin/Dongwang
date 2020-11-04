//
//  NSArray+CHRegex.m
//  SYQuMinApp
//
//  Created by apple on 2018/7/26.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import "NSArray+CHRegex.h"

@implementation NSArray (CHRegex)
// 判断数组判空
+ (BOOL) isArrayEmpty:(NSArray *)emptyArray {
    if (emptyArray != nil && ![emptyArray isKindOfClass:[NSNull class]] && emptyArray.count != 0 ) {
        return NO;
    } 
    return YES;
}
@end
