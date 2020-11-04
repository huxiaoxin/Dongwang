//
//  UIView+CHFrame.h
//  SY全民共进
//
//  Created by apple on 2018/4/9.
//  Copyright © 2018年 gch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CHFrame)
/**
 * Shortcut for frame.origin.x
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY;
/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size;

// 设置圆角
- (void)cornerRadius:(CGFloat)cornerRadius
         borderColor:(CGColorRef)borderColor
         borderWidth:(CGFloat)borderWidth;
// 设置边框 cornerRadius:圆角, strokeColor:填充颜色, lineWidth:虚线的宽度, lineDashPattern:虚线的间隔
- (void)setBorderView:(UIView *)views cornerRadius:(CGFloat)cornerRadius strokeColor:(CGColorRef)strokeColor lineWidth:(CGFloat)lineWidth lineDashPattern:(NSArray *)lineDashPattern;
// 设置阴影
// 圆角, 阴影的颜色, 阴影的偏移量, 阴影的透明度, 阴影半径
- (void)addShadowCornerRadius:(CGFloat)cornerRadus shadowColor:(UIColor *)shadowColor shadowOfset:(CGSize)shadSize shadowOpac:(CGFloat)shadowOpac shadowRadius:(CGFloat)shadowRadius;

// 设置下划线
- (NSMutableAttributedString *)getUnderlineStyleSingle:(NSString *)textString;
// 指定范围设置下划线
- (NSMutableAttributedString *)getUnderlineStyleSingleRange:(NSRange *)range string:(NSString *)textStr fromStringIndex:(NSInteger)fromIndex ToStringIndex:(NSInteger)toIndex;
// 指定字符串变颜色
- (NSMutableAttributedString *)setAttributedString:(NSString *)str attributed:(NSString *)attributedString textColor:(UIColor *)color;
// 指定字符串字体大小,颜色
- (NSMutableAttributedString *)setAttributedString:(NSString *)str attributed:(NSString *)attributedString attributedFont:(CGFloat)textFont attributedTextColor:(UIColor *)textColor strColor:(UIColor *)strColor lineSpacing:(NSInteger)linespcaing;
// 指定字符串字体大小
- (NSMutableAttributedString *)setAttributedString:(NSString *)str attributed:(NSString *)attributedString attributedFont:(CGFloat)textFont;

/*    *
 str:字符串
 boldString:加粗字符串
 textString1:变颜色的字符串1
 textString2:变颜色的字符串2
 textString3:变颜色的字符串3
 textColor : 变的颜色
 linespcaing:行间距
 letterSpacing:字间距
 font : 字体大小
 */
- (NSMutableAttributedString *)getChiesAttributedString:(NSString *)str boldString:(NSString *)boldString boldFont:(UIFont *)boldfont textString1:(NSString *)textString1 textString2:(NSString *)textString2 textString3:(NSString *)textString3 textColor:(UIColor *)color lineSpacing:(NSInteger)linespcaing letterSpacing:(NSInteger)letterSpacing font:(UIFont *)font;
// str:字符串显示内容,
- (NSMutableAttributedString *)getChiesAttributedStr:(NSString *)str remarkArray:(NSArray *)remarkArray textIndexArray:(NSArray *)textIndexArray textColorArray:(NSArray *)textColorArray;

// 直接显示html标签文本, 显示不全不显示
- (NSAttributedString *)getChiesAttributedString:(NSString *)str;

// 指定边裁剪
- (CAShapeLayer *)getViewShapeLayer:(NSInteger )roundCorner rectCorner1:(UIRectCorner)rectTpye1 rectCorner2:(UIRectCorner)rectType2;
/**
 view 传入要变圆角的视图
 size自己根据需要设置角度大小
 后面的4个角 BOOL 1 是设置该角为圆角 0 不改变
 */
+ (void)renViewShapeLayer:(UIView *)view size:(CGSize)size left:(BOOL)left right:(BOOL)right bottomLeft:(BOOL)bottomLeft bottomRight:(BOOL)bottomRight;

#pragma mark == tabbar方法
- (void)showBadgeOnItemIndex:(int)index AllItemIndex:(int)allIndex; // 显示小红点index, allIndex共有多少个item
- (void)removeBadgeOnItemIndex:(int)index AllItemIndex:(int)allIndex; // 移除小红点

- (UIViewController *)viewController;
@end
