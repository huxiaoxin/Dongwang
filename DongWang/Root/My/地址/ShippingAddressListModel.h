//
//  ShippingAddressListModel.h
//  SYQuMinApp
//
//  Created by sycm on 2019/4/28.
//  Copyright © 2019 Shuyun. All rights reserved.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShippingAddressListModel : DongWangBaseModel
//@property (nonatomic, assign)NSInteger uid; // 地址id
//@property (nonatomic, copy)NSString *userName; // 收件人
//@property (nonatomic, copy)NSString *userPhone; // 收件人手机号
//@property (nonatomic, assign)NSInteger isDefault; // 是否是默认,0-不是, 1-是
//@property (nonatomic, copy)NSString *city; // 市代码
//@property (nonatomic, copy)NSString *detail; // 详细地址
//@property (nonatomic, copy)NSString *province; // 省份代码
//@property (nonatomic, copy)NSString *county; // 区县代码
//@property (nonatomic, copy)NSString *cityName; // 城市名称
//@property (nonatomic, copy)NSString *provinceName; // 省份名称
//@property (nonatomic, copy)NSString *countyName; // 区县名称


@property (nonatomic , copy) NSString              * uid;
@property (nonatomic , copy) NSString              * phone;
@property (nonatomic , copy) NSString              * insertUser;
@property (nonatomic , copy) NSString              * area;
@property (nonatomic , copy) NSString              * provinceCode;
 @property (nonatomic, copy) NSString              * provinceName; // 省份名称
@property (nonatomic , copy) NSString              * cityCode;
@property (nonatomic , copy)  NSString              * cityName; // 城市名称
@property (nonatomic , copy) NSString              * defaultReceiveAddress;
@property (nonatomic , copy) NSString              * del;
@property (nonatomic , copy) NSString              * countyCode;
@property (nonatomic ,  copy)  NSString              * countyName; // 区县名称
@property (nonatomic , copy) NSString              * detailAddress;
@property (nonatomic , copy) NSString              * insertTime;
@property (nonatomic , copy) NSString              * userName;
@property (nonatomic , copy) NSString              * versions;
@property (nonatomic , copy) NSString              * updateUser;
@property (nonatomic , copy) NSString              * updateTime;
@property(nonatomic,assign)  CGFloat                 cellheight;

@end

@interface AddShippingAddressListModel : DongWangBaseModel
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *code;
@property (nonatomic, strong)NSArray *childs;
@property (nonatomic, strong)NSMutableArray *childCitysArray;
@end

NS_ASSUME_NONNULL_END
