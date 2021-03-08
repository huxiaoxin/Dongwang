//
//  DongwangDaletouHistoryModel.m
//  DongWang
//
//  Created by codehzx on 2021/2/23.
//

#import "DongwangDaletouHistoryModel.h"
@implementation PrizeResponses

@end
@implementation DongwangDaletouHistoryModel
-(instancetype)initWithDictionaryed:(NSDictionary *)dict
{
    if (self =[super init]) {
    [self setValuesForKeysWithDictionary:dict];
        NSMutableArray * tempArr = [NSMutableArray array];
        NSArray * prizeResponsesArr = [dict objectForKey:@"prizeResponses"];
        for (NSDictionary * responeDic in prizeResponsesArr) {
            PrizeResponses * res = [PrizeResponses BaseinitWithDic:responeDic];
            [tempArr addObject:res];
        }
        if (tempArr.count == 1) {
        [tempArr removeObjectAtIndex:0];
        }
        self.prizeResponses =  [tempArr copy];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.daletou_id = value;
    }
}
@end
