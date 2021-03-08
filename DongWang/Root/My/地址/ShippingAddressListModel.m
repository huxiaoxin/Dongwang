//
//  ShippingAddressListModel.m
//  SYQuMinApp
//
//  Created by sycm on 2019/4/28.
//  Copyright © 2019 Shuyun. All rights reserved.
//

#import "ShippingAddressListModel.h"

@implementation ShippingAddressListModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        _uid = value;
    }
}
@end
@implementation AddShippingAddressListModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
