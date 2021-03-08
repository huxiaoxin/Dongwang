//
//  DongwangHotTizuModel.m
//  DongWang
//
//  Created by codehzx on 2020/12/6.
//

#import "DongwangHotTizuModel.h"

@implementation DongwangHotTizuModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ( [key isEqualToString:@"description"]) {
        self.Dongwangdescription =  value;
    }
    if ([key isEqualToString:@"newGroup"]) {
        self.DongwangnewGroup = value;
    }
}

@end
