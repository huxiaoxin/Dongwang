//
//  DongwangJoinModel.m
//  DongWang
//
//  Created by codehzx on 2021/2/19.
//

#import "DongwangJoinModel.h"
#import "NSString+SYCM_DES.h"
@implementation ResponseList
-(instancetype)initWithDictionaryed:(NSDictionary *)dict
{
    if (self =[super init]) {
    [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.List_id =  value;
    }
}

@end
@implementation DongwangJoinModel
-(instancetype)initWithDictionaryed:(NSDictionary *)dict
{
    if (self =[super init]) {
        NSDictionary * response   = [dict objectForKey:@"response"];
        [self setValuesForKeysWithDictionary:response];
        
        NSString * status = [NSString stringWithFormat:@"%@",dict[@"status"]];
        self.status = status;
        
        NSMutableArray * tempArr = [NSMutableArray array];
        
        NSArray * responseList=   [response objectForKey:@"responseList"];
        
        NSString * select = self.select;
        
        NSString * answers =  self.answers;
        //正确答案的ID
        NSString * coreect_ID = [NSString decryptUseDES:answers];
        if (![[response objectForKey:@"responseList"] isKindOfClass:[NSString class]]) {
            for (NSDictionary  * ansureDic in responseList) {
                ResponseList * listModel= [ResponseList BaseinitWithDic:ansureDic];
                listModel.status =  status;
                listModel.select =  select;
                if ([status integerValue] == 1) {
                    if ([select integerValue] == [listModel.List_id integerValue]) {
                        listModel.user_isCorect = YES;

                    }else{
                        listModel.user_isCorect = NO;

                    }

                }else{
                    listModel.user_isCorect = NO;
                }
                if ([coreect_ID integerValue] == [listModel.List_id integerValue]) {
                    listModel.is_Correct = YES;
                }else{
                    listModel.is_Correct = NO;
                }
                [tempArr addObject:listModel];
            }

        }
        self.responseList =  [tempArr copy];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ansure_id =  value;
    }
}

@end
