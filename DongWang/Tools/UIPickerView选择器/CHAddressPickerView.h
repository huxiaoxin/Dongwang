//
//  CHAddressPickerView.h
//  SYQuMinApp
//
//  Created by sycm on 2019/4/29.
//  Copyright © 2019 Shuyun. All rights reserved.
//

#import "BasePickerView.h"
@class AddShippingAddressListModel;
NS_ASSUME_NONNULL_BEGIN
typedef void(^AddressBlcok)(AddShippingAddressListModel *provinceModel,AddShippingAddressListModel *cityModel,AddShippingAddressListModel *areaModel);
@interface CHAddressPickerView : BasePickerView
/** 回调block */
@property (nonatomic, copy) AddressBlcok addressBlock;
+ (instancetype)showWithAddressDataArray:(NSArray *)dataArray AddShippingAdressDic:( NSDictionary *)addAddressDictionary AddressBlock:(AddressBlcok)block;
@end

NS_ASSUME_NONNULL_END
