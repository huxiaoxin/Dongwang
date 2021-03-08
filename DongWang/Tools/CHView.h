//
//  CHView.h
//  SYQuMinApp
//
//  Created by apple on 2018/8/25.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHView : UIView

- (instancetype)initWithFrame:(CGRect)textFrame cornerRadius:(CGFloat)cornerRadius borderColor:(CGColorRef)borderColor borderWidth:(CGFloat)borderWidth backColor:(UIColor *)backColor;
- (instancetype)initWithFrame:(CGRect)textFrame backColor:(UIColor *)backColor;
@end
