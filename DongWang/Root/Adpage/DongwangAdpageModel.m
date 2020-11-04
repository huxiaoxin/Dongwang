//
//  DongwangAdpageModel.m
//  DongWang
//
//  Created by codehzx on 2020/10/30.
//

#import "DongwangAdpageModel.h"

@implementation DongwangAdpageModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.Dongwang_id =  value;
    }
}

@end
