//
//  DongwangJoinModel.h
//  DongWang
//
//  Created by codehzx on 2021/2/19.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface ResponseList :DongWangBaseModel
@property (nonatomic , copy) NSString              * List_id;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * questionId;
@property(nonatomic,assign)  CGFloat   CellHeight;

@property(nonatomic,assign) BOOL  is_Correct;   //是否是正确答案

@property(nonatomic,assign) BOOL  user_isCorect;  //用户的答案

@property (nonatomic , copy) NSString              * status;//0-没有答过 1-已经答过

//已经答过会返回用户选择的答案
@property (nonatomic , copy) NSString              * select;


@end

@interface DongwangJoinModel : DongWangBaseModel
@property (nonatomic , copy) NSString              * ansure_id;
@property (nonatomic , copy) NSString              * answers;
@property (nonatomic , copy) NSArray<ResponseList *>              * responseList;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * select;
@property (nonatomic , copy) NSString              * status;//0-没有答过 1-已经答过 已经答过会返回用户选择的答案


@end

NS_ASSUME_NONNULL_END
