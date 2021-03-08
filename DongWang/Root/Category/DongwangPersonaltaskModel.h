//
//  DongwangPersonaltaskModel.h
//  DongWang
//
//  Created by codehzx on 2020/11/27.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangPersonaltaskModel : DongWangBaseModel
@property(nonatomic,copy)  NSString  *  imgName;
@property(nonatomic,copy)  NSString  *  title;
@property(nonatomic,copy)  NSString  *  detaildesc;
@property(nonatomic,copy)  NSString  *   btnTitle;
@property(nonatomic,assign) NSInteger    type;
@property(nonatomic,assign)  BOOL      iscomplete;

@end

NS_ASSUME_NONNULL_END
