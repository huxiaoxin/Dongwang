//
//  DongWangBaseModel.m
//  DongWang
//
//  Created by codehzx on 2020/10/20.
//

#import "DongWangBaseModel.h"

@implementation DongWangBaseModel
+(instancetype)BaseinitWithDic:(NSDictionary *)Dic;
{
    return [[self alloc]initWithDictionaryed:Dic];
}
-(instancetype)initWithDictionaryed:(NSDictionary *)dict
{
    if (self =[super init]) {
    [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
   
}

@end
