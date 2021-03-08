//
//  DongwangMofangModel.m
//  DongWang
//
//  Created by codehzx on 2020/12/9.
//

#import "DongwangMofangModel.h"

@implementation MagicList

@end

@implementation DongwangMofangModel
-(instancetype)initWithDictionaryed:(NSDictionary *)dict
{
    if (self =[super init]) {
    [self setValuesForKeysWithDictionary:dict];
    NSMutableArray * tempArr = [NSMutableArray array];
    NSArray * magicListArr = [dict objectForKey:@"magicList"];
        NSInteger style = [[dict objectForKey:@"style"] integerValue];
    for (NSDictionary * magDic in magicListArr) {
        MagicList * list = [MagicList BaseinitWithDic:magDic];
        if (style == 0) {
            list.countNums =magicListArr.count;
        }else{
            list.countNums =  2;
        }
        [tempArr addObject:list];
    }
        self.magicList = [tempArr copy];
    }
    return self;
}

@end

