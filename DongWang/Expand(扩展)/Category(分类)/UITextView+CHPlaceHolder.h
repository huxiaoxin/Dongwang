//
//  UITextView+CHPlaceHolder.h
//  SYQuMinApp
//
//  Created by apple on 2018/4/26.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (CHPlaceHolder)
/**
 *  UITextView+placeholder
 */
@property (nonatomic, copy) NSString *ch_placeHolder;
/**
 *  IQKeyboardManager等第三方框架会读取placeholder属性并创建UIToolbar展示
 */
@property (nonatomic, copy) NSString *placeholder;
/**
 *  placeHolder颜色
 */
@property (nonatomic, strong) UIColor *ch_placeHolderColor;
@end
