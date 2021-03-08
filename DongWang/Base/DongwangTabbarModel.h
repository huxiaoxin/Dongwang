//
//  DongwangTabbarModel.h
//  DongWang
//
//  Created by codehzx on 2020/10/27.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangTabbarModel : DongWangBaseModel
@property (nonatomic , copy) NSString              * action1;
@property (nonatomic , strong) NSString              * status;
@property (nonatomic , copy) NSString              * height;
@property (nonatomic , copy) NSString              * mode;
@property (nonatomic , copy) NSString              * color;
@property (nonatomic , copy) NSString              * width;
@property (nonatomic , copy) NSString              * picture;
@property (nonatomic , copy) NSString              * h5Url;
@property(nonatomic,assign) BOOL                   isexsit;  //是否存在model；



@property (nonatomic , copy) NSString              * url;
@property (nonatomic , copy) NSString              * imageUrl;
@property (nonatomic , copy) NSString              * name;
@property (nonatomic , copy) NSString              * type;
@property (nonatomic , copy) NSString              * action;



@end

NS_ASSUME_NONNULL_END
