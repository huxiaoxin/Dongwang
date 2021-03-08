//
//  DongwangHomeTagModel.m
//  DongWang
//
//  Created by codehzx on 2020/12/8.
//

#import "DongwangHomeTagModel.h"

@implementation DongwangHomeTagModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.tagid = [NSString stringWithFormat:@"%@",value];
    }
}

@end
