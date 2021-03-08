//
//  DongwangHomeTagModel.h
//  DongWang
//
//  Created by codehzx on 2020/12/8.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangHomeTagModel : DongWangBaseModel
@property (nonatomic , copy) NSString              * tagid;
@property (nonatomic , copy) NSString              * tagName;
@property(nonatomic,assign)  BOOL                    isSeltecd;
 @end

NS_ASSUME_NONNULL_END
