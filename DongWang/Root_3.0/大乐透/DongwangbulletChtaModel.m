//
//  DongwangbulletChtaModel.m
//  DongWang
//
//  Created by codehzx on 2021/2/2.
//

#import "DongwangbulletChtaModel.h"

@implementation DongwangbulletChtaModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqual:@"id"]) {
        self.bulledt_id = (NSString *) value;
    }
}

@end
