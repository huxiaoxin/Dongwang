//
//  DongwangMsgModel.h
//  DongWang
//
//  Created by codehzx on 2020/11/23.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangMsgModel : DongWangBaseModel
@property (nonatomic , copy) NSString              * status;
@property (nonatomic , copy) NSString              * content;
@property (nonatomic , copy) NSString              * insertTimeStr;
@property (nonatomic , copy) NSString              * id;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * type;
@property (nonatomic , copy) NSString              * insertTime;
@property (nonatomic , copy) NSString              * url;
@property(nonatomic,assign)  CGFloat                Cellheight;
@end

NS_ASSUME_NONNULL_END
