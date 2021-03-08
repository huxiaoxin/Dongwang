//
//  CHAddressPickerView.m
//  SYQuMinApp
//
//  Created by sycm on 2019/4/29.
//  Copyright © 2019 Shuyun. All rights reserved.
//

#import "CHAddressPickerView.h"
#import "NSArray+CHRegex.h"
#import "ShippingAddressListModel.h"
@interface CHAddressPickerView ()
@property (nonatomic, strong)NSArray *cityAddressArray; // 省市区数组
@property (nonatomic, strong) NSArray *provinceArray; // 省份数组
@property (nonatomic, strong) NSArray *cityArray; // 城市数组
@property (nonatomic, strong) NSArray *townArray; // 地区数组
@property (nonatomic, strong)AddShippingAddressListModel *provinceModel; // 省
@property (nonatomic, strong)AddShippingAddressListModel *cityModel; // 市
@property (nonatomic, strong)AddShippingAddressListModel *areaModel; // 区
@property (nonatomic, strong)NSDictionary *defaultAddressDictionary; // 修改地址的默认model
@end
@implementation CHAddressPickerView

+ (instancetype)showWithAddressDataArray:(NSArray *)dataArray AddShippingAdressDic:( NSDictionary *)addAddressDictionary AddressBlock:(AddressBlcok)block {
    CHAddressPickerView *pickerView = [[CHAddressPickerView alloc] init];
    pickerView.cityAddressArray = dataArray;
    pickerView.defaultAddressDictionary = addAddressDictionary;
    pickerView.addressBlock = block;
    [pickerView show];
    return pickerView;
}
#pragma mark -- 修改收货地址,自动回滚到之前选中的地址
- (void)setDefaultAddressDictionary:(NSDictionary *)defaultAddressDictionary {
    _defaultAddressDictionary = defaultAddressDictionary;
    NSInteger tempProvinceIndex = [defaultAddressDictionary[@"province"] integerValue];
    NSInteger tempCityIndex = [defaultAddressDictionary[@"city"] integerValue];
    NSInteger tempCountyIndex = [defaultAddressDictionary[@"county"] integerValue];
    if (tempProvinceIndex < self.cityAddressArray.count && tempProvinceIndex != self.cityAddressArray.count) {
        AddShippingAddressListModel *cityModel = self.cityAddressArray[tempProvinceIndex];
        NSArray *tempCity = [cityModel.childCitysArray copy];
        self.provinceModel = cityModel;
        self.cityArray = tempCity;
        if ([NSArray isArrayEmpty:self.cityArray] == NO) {
            if (tempCityIndex < self.cityArray.count && tempCityIndex != self.cityArray.count) {
                AddShippingAddressListModel *twonModel = self.cityArray[tempCityIndex];
                self.townArray = [twonModel.childCitysArray copy];
                self.cityModel = self.cityArray[tempCityIndex];
            }
            if (tempCountyIndex < self.townArray.count && tempCountyIndex != self.townArray.count) {
                self.areaModel = self.townArray[tempCountyIndex];
            }
        } else {
            self.townArray = @[];
            self.cityModel = nil;
            self.areaModel = nil;
        }
        [self.pickerView reloadComponent:0];
        [self.pickerView selectRow:tempProvinceIndex inComponent:0 animated:YES];
        [self.pickerView reloadComponent:1];
        [self.pickerView selectRow:tempCityIndex inComponent:1 animated:YES];
        [self.pickerView reloadComponent:2];
        [self.pickerView selectRow:tempCountyIndex inComponent:2 animated:YES];
    }
    
}
- (void)setCityAddressArray:(NSArray *)cityAddressArray {
    _cityAddressArray = cityAddressArray;
    [self loadAddressData];
}

- (void)loadAddressData {
    AddShippingAddressListModel *cityModel = [self.cityAddressArray firstObject];
    NSArray *tempCity = [cityModel.childCitysArray copy];
    self.cityArray = tempCity;
    AddShippingAddressListModel *townModel = [cityModel.childCitysArray firstObject];
    NSArray *tempTownArray = townModel.childCitysArray;
    self.townArray = tempTownArray;
    
    self.provinceModel = [self.cityAddressArray firstObject];
    self.cityModel = [self.cityArray firstObject];
    self.areaModel = [self.townArray firstObject];
    NSLog(@"%ld----%ld----%ld",self.cityAddressArray.count,self.cityArray.count,self.townArray.count);
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.cityAddressArray.count;
    } else if (component == 1) {
        return self.cityArray.count;
    } else {
        return self.townArray.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        if (row < self.cityAddressArray.count && row != self.cityAddressArray.count) {
            AddShippingAddressListModel *provinceModel = self.cityAddressArray[row];
            return [NSString stringWithFormat:@"%@", provinceModel.name];
        }else{
            NSLog(@"第一部分异常---------");
            return @"";
        }
    } else if (component == 1) {
        if (row < self.cityArray.count && row != self.cityArray.count) {
            AddShippingAddressListModel *cityModel = self.cityArray[row];
            return [NSString stringWithFormat:@"%@", cityModel.name];
        }else{
            NSLog(@"第二部异常-----");
            return @"";
        }
    } else {
        if (row < self.townArray.count && row != self.townArray.count) {
            AddShippingAddressListModel *townModel = self.townArray[row];
            return [NSString stringWithFormat:@"%@", townModel.name];
        }else{
            NSLog(@"第三部分异常-----");
            return @"";
        }
    }
    return @"";
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return self.frame.size.width / 3;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        if (row < self.cityAddressArray.count && row != self.cityAddressArray.count) {
            AddShippingAddressListModel *cityModel = self.cityAddressArray[row];
            NSArray *tempCity = [cityModel.childCitysArray copy];
            self.provinceModel = cityModel;
            self.cityArray = tempCity;
            if ([NSArray isArrayEmpty:self.cityArray] == NO) {
                AddShippingAddressListModel *twonModel = [self.cityArray firstObject];
                self.townArray = [twonModel.childCitysArray copy];
                self.cityModel = [self.cityArray firstObject];
                self.areaModel = [self.townArray firstObject];
            } else {
                self.townArray = @[];
                self.cityModel = nil;
                self.areaModel = nil;
            }
            [pickerView reloadComponent:1];
            [pickerView selectRow:0 inComponent:1 animated:YES];
            [pickerView reloadComponent:2];
            [pickerView selectRow:0 inComponent:2 animated:YES];
        }
    }
    if (component == 1) {
        if (row < self.cityArray.count && row != self.cityArray.count) {
             AddShippingAddressListModel *twonModel = self.cityArray[row];

            self.cityModel = self.cityArray[row];
            self.townArray = twonModel.childCitysArray;
            if ([NSArray isArrayEmpty:self.townArray] == NO) {
                self.areaModel = [self.townArray firstObject];
            } else {
                self.areaModel = nil;
            }
            [pickerView reloadComponent:2];
            [pickerView selectRow:0 inComponent:2 animated:YES];
        }
    }
    if (component == 2) {
        if (row < self.townArray.count && row != self.townArray.count) {
            self.areaModel = self.townArray[row];
        }
    }
    
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return RealWidth(35);
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        pickerLabel.textColor = LGDBLackColor;
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:14]];
    }
    pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    [self changeSpearatorLineColor];
    return pickerLabel;
}
#pragma mark - 改变分割线的颜色
- (void)changeSpearatorLineColor {
    for(UIView *speartorView in self.pickerView.subviews) {
        if (speartorView.frame.size.height < 1) {
            speartorView.backgroundColor = Color88;
        }
    }
}
#pragma mark - 点击确定按钮
- (void)comfirmBtnClick {
    NSInteger selectProvince = [self.pickerView selectedRowInComponent:0];
    NSInteger selectCity     = [self.pickerView selectedRowInComponent:1];
    NSInteger selectArea     = [self.pickerView selectedRowInComponent:2];
//#pragma mark - 记录用户选择的
//    NSString *tempProvince = [NSString stringWithFormat:@"%ld", selectProvince];
//    NSString *tempCity = [NSString stringWithFormat:@"%ld", selectCity];
//    NSString *tempArea = [NSString stringWithFormat:@"%ld", selectArea];
//    [NSUserDefaults ch_setCustomObject:tempProvince forKey:CHPickerProvinceIndex];
//    [NSUserDefaults ch_setCustomObject:tempCity forKey:CHPickerCityIndex];
//    [NSUserDefaults ch_setCustomObject:tempArea forKey:CHPickerCountyIndex];
    
    if (selectProvince < self.cityAddressArray.count && selectProvince != self.cityAddressArray.count) {
        self.provinceModel = self.cityAddressArray[selectProvince];
    }
    if (selectCity < self.cityArray.count && selectCity != self.cityArray.count) {
        self.cityModel = self.cityArray[selectCity];
    }
    if (selectArea < self.townArray.count && selectArea != self.townArray.count) {
        self.areaModel = self.townArray[selectArea];
    }
    if (self.addressBlock) {
        NSLog(@"=====点击确定了, 数据");
        self.addressBlock(self.provinceModel,self.cityModel,self.areaModel);
    }
    [super comfirmBtnClick];
}

@end
