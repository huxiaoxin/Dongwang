//
//  DongwangAdressInfoDetailModel.h
//  DongWang
//
//  Created by codehzx on 2020/11/22.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangAdressInfoDetailModel : DongWangBaseModel
@property (nonatomic , copy) NSString              * uid;
@property (nonatomic , copy) NSString              * phone;
@property (nonatomic , copy) NSString              * insertUser;
@property (nonatomic , copy) NSString              * area;
@property (nonatomic , copy) NSString              * provinceCode;
@property (nonatomic , copy) NSString              * cityCode;
@property (nonatomic , copy) NSString              * defaultReceiveAddress;
@property (nonatomic , copy) NSString              * del;
@property (nonatomic , copy) NSString              * countyCode;
@property (nonatomic , copy) NSString              * detailAddress;
@property (nonatomic , copy) NSString              * insertTime;
@property (nonatomic , copy) NSString              * userName;
@property (nonatomic , copy) NSString              * versions;
@property (nonatomic , copy) NSString              * updateUser;
@property (nonatomic , copy) NSString              * updateTime;
@end

NS_ASSUME_NONNULL_END
