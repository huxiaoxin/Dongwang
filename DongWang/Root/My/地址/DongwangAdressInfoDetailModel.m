//
//  DongwangAdressInfoDetailModel.m
//  DongWang
//
//  Created by codehzx on 2020/11/22.
//

#import "DongwangAdressInfoDetailModel.h"

@implementation DongwangAdressInfoDetailModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        _uid = value;
    }
}


@end
