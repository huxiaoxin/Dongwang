//
//  BasePickerView.h
//  SYQuMinApp
//
//  Created by sycm on 2019/4/29.
//  Copyright © 2019 Shuyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHButton.h"
NS_ASSUME_NONNULL_BEGIN

@interface BasePickerView : UIView<UIPickerViewDataSource, UIPickerViewDelegate>
/** 确认按钮 */
@property (nonatomic, strong) CHButton *comfirmBtn;
/** 取消按钮 */
@property (nonatomic, strong) CHButton *cancelBtn;
/** pickerView */
@property (nonatomic, strong) UIPickerView *pickerView;
/** 子类实现的方法  */
- (void)setupPickerView;
/** 确认按钮点击事件 */
- (void)comfirmBtnClick;
/** 取消按钮点击事件 */
- (void)cancelBtnClick;
/** 弹出页面 */
- (void)show;

@end

NS_ASSUME_NONNULL_END
