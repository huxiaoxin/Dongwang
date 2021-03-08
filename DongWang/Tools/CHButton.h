//
//  CHButton.h
//  SYQuMinApp
//
//  Created by apple on 2018/5/2.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHButton : UIButton
- (instancetype)initWithFrame:(CGRect)textFrame title:(NSString *)textTitle titleColor:(UIColor *)textTitleColor titleFont:(UIFont *)titleFont backColor:(UIColor *)btnbackColor;
- (instancetype)initWithFrame:(CGRect)textFrame imageButton:(NSString *)imagestring;
- (instancetype)initWithFrame:(CGRect)textFrame imageDataButton:(UIImage *)imageData;
- (instancetype)initWithFrame:(CGRect)textFrame imageData:(NSString *)imageData imageSize:(CGSize)imageSize imageSpacing:(CGFloat)imageSpacing title:(NSString *)title titleFont:(CGFloat)titleFont titleFontName:(NSString *)titleFontName titleTextColor:(UIColor *)textColor imageBack:(NSString *)imageBack;
@property (nonatomic, copy)NSString *textTitleButton; // 修改button的title
- (void)verticalImageAndTitle:(CGFloat)spacing;
@end
