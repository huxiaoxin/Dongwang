//
//  DongwangHomeBannarModel.m
//  DongWang
//
//  Created by codehzx on 2020/12/8.
//

#import "DongwangHomeBannarModel.h"

@implementation DongwangHomeBannarModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.bannarid = [NSString stringWithFormat:@"%@",value];
    }
}
@end
