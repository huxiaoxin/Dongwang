//
//  UIView+CHFrame.m
//  SY全民共进
//
//  Created by apple on 2018/4/9.
//  Copyright © 2018年 gch. All rights reserved.
//

#import "UIView+CHFrame.h"

@implementation UIView (CHFrame)
- (CGFloat)left {
    return self.frame.origin.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)top {
    return self.frame.origin.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerX {
    return self.center.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerY {
    return self.center.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)width {
    return self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)height {
    return self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGPoint)origin {
    return self.frame.origin;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)size {
    return self.frame.size;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (void)cornerRadius:(CGFloat)cornerRadius
         borderColor:(CGColorRef)borderColor
         borderWidth:(CGFloat)borderWidth
{
    self.layer.masksToBounds      = YES;
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderColor  = borderColor;
    self.layer.borderWidth  = borderWidth;
}
- (void)setBorderView:(UIView *)views cornerRadius:(CGFloat)cornerRadius strokeColor:(CGColorRef)strokeColor lineWidth:(CGFloat)lineWidth lineDashPattern:(NSArray *)lineDashPattern {
    CAShapeLayer *border = [CAShapeLayer layer];
    //虚线的颜色
    border.strokeColor = strokeColor;
    //填充的颜色
    border.fillColor = [UIColor clearColor].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:views.bounds cornerRadius:cornerRadius];
    //设置路径
    border.path = path.CGPath;
    border.frame = views.bounds;
    //虚线的宽度
    border.lineWidth = lineWidth;
    //设置线条的样式
    //    border.lineCap = @"square";
    //虚线的间隔
    border.lineDashPattern = lineDashPattern;
    views.layer.cornerRadius = cornerRadius;
    views.layer.masksToBounds = YES;
    [views.layer addSublayer:border];
}
- (void)addShadowCornerRadius:(CGFloat)cornerRadus shadowColor:(UIColor *)shadowColor shadowOfset:(CGSize)shadSize shadowOpac:(CGFloat)shadowOpac shadowRadius:(CGFloat)shadowRadius {
    self.layer.cornerRadius = cornerRadus;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = shadSize;
    self.layer.shadowOpacity = shadowOpac;
    self.layer.shadowRadius = shadowRadius;
}

// 设置下划线
- (NSMutableAttributedString *)getUnderlineStyleSingle:(NSString *)textStr {
//    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attributedString=[[NSMutableAttributedString alloc] initWithString:textStr];
    NSMutableParagraphStyle *paragraphStyle=[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:2];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, textStr.length)];
    
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, textStr.length)];
//    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:textStr attributes:attribtDic];
    return attributedString;
}
- (NSMutableAttributedString *)getUnderlineStyleSingleRange:(NSRange *)range string:(NSString *)textStr fromStringIndex:(NSInteger)fromIndex ToStringIndex:(NSInteger)toIndex{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:textStr];
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(fromIndex, toIndex)];
    return str;
}

- (NSMutableAttributedString *)setAttributedString:(NSString *)str attributed:(NSString *)attributedString textColor:(UIColor *)color  {
    NSString *string = [NSString stringWithFormat:@"%@",str];
    NSMutableAttributedString *attrDescribeStr = [[NSMutableAttributedString alloc] initWithString:string];
    [attrDescribeStr addAttribute:NSForegroundColorAttributeName
     
                            value:color
     
                            range:[str rangeOfString:attributedString]];
    return  attrDescribeStr;
}
// 指定字符串字体大小,颜色
- (NSMutableAttributedString *)setAttributedString:(NSString *)str attributed:(NSString *)attributedString attributedFont:(CGFloat)textFont attributedTextColor:(UIColor *)textColor strColor:(UIColor *)strColor lineSpacing:(NSInteger)linespcaing {
    NSMutableAttributedString *attributedS = [[NSMutableAttributedString alloc] initWithString:str];
    if (linespcaing != 0) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = linespcaing;// 字体的行间距
        [attributedS addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    }
    if (textFont != 0 && [NSString isBlankString:attributedString] == NO) {
        [attributedS addAttribute:NSFontAttributeName value:[UIFont fontWithName:PFR size:textFont] range:[str rangeOfString:attributedString]];
    }
    
    [attributedS addAttribute:NSForegroundColorAttributeName value:strColor range:NSMakeRange(0, str.length)];
    if ([NSString isBlankString:str] == NO && [NSString isBlankString:attributedString] == NO) {
        [attributedS addAttribute:NSForegroundColorAttributeName value:textColor range:[str rangeOfString:attributedString]];
    }
    return attributedS;
}
- (NSMutableAttributedString *)setAttributedString:(NSString *)str attributed:(NSString *)attributedString attributedFont:(CGFloat)textFont {
    NSMutableAttributedString *attributedS = [[NSMutableAttributedString alloc] initWithString:str];
     [attributedS addAttribute:NSFontAttributeName value:[UIFont fontWithName:PFR size:textFont] range:[str rangeOfString:attributedString]];
    return attributedS;
}

- (NSMutableAttributedString *)getChiesAttributedString:(NSString *)str boldString:(NSString *)boldString boldFont:(UIFont *)boldfont textString1:(NSString *)textString1 textString2:(NSString *)textString2 textString3:(NSString *)textString3 textColor:(UIColor *)color lineSpacing:(NSInteger)linespcaing letterSpacing:(NSInteger)letterSpacing font:(UIFont *)font {
    NSString *string = [NSString stringWithFormat:@"%@",str];
    
    NSMutableAttributedString *attrDescribeStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    // 行间距
    if (linespcaing != 0) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = linespcaing;// 字体的行间距
        [attrDescribeStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    }
    // 字间距
    if (letterSpacing != 0) {
        [attrDescribeStr setAttributes:@{NSKernAttributeName:@(letterSpacing)} range:NSMakeRange(0, [string length])];
        NSMutableParagraphStyle *paragraphStyles = [[NSMutableParagraphStyle alloc] init];
        [attrDescribeStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyles range:NSMakeRange(0, [string length])];
    }
    
    [attrDescribeStr addAttribute:NSFontAttributeName
     
                            value:font
     
                            range:[str rangeOfString:string]];
    if ([NSString isBlankString:boldString] == NO) {
        [attrDescribeStr addAttribute:NSFontAttributeName
         
                                value:boldfont
         
                                range:[str rangeOfString:boldString]];
    }
    
    if ([NSString isBlankString:textString1] == NO) {
        [attrDescribeStr addAttribute:NSForegroundColorAttributeName
         
                                value:color
         
                                range:[str rangeOfString:textString1]];
    }
    if ([NSString isBlankString:textString2] == NO) {
        [attrDescribeStr addAttribute:NSForegroundColorAttributeName
         
                                value:color
         
                                range:[str rangeOfString:textString2]];
    }
    
    if ([NSString isBlankString:textString3] == NO) {
        [attrDescribeStr addAttribute:NSForegroundColorAttributeName
         
                                value:color
         
                                range:[str rangeOfString:textString3]];
    }
    
    return  attrDescribeStr;
}
- (NSMutableAttributedString *)getChiesAttributedStr:(NSString *)str remarkArray:(NSArray *)remarkArray textIndexArray:(NSArray *)textIndexArray textColorArray:(NSArray *)textColorArray {
    NSString *string = [NSString stringWithFormat:@"%@",str];
    NSMutableAttributedString *attrDescribeStr = [[NSMutableAttributedString alloc] initWithString:string];
    if (remarkArray.count > 1) {
        for (int i = 0; i < textIndexArray.count; i ++) {
            NSInteger tempIndex = [textIndexArray[i] integerValue];
            NSString *tempTextColor = textColorArray[i];
            UIColor *textColor = [UIColor colorWithHex:tempTextColor hexAlpha:@"1"];
            NSString *tempString = [NSString stringWithFormat:@"%@", remarkArray[tempIndex]];
            [attrDescribeStr addAttribute:NSForegroundColorAttributeName value:textColor range:[string rangeOfString:tempString]];
        }
    }
    return attrDescribeStr;
}


- (NSAttributedString *)getChiesAttributedString:(NSString *)str {
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    return attributedString;
}


- (CAShapeLayer *)getViewShapeLayer:(NSInteger )roundCorner rectCorner1:(UIRectCorner)rectTpye1 rectCorner2:(UIRectCorner)rectType2 {
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:(rectTpye1 | rectType2) cornerRadii:CGSizeMake(roundCorner,roundCorner)];//圆角大小
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    return maskLayer;
}
+ (void)renViewShapeLayer:(UIView *)view size:(CGSize)size left:(BOOL)left right:(BOOL)right bottomLeft:(BOOL)bottomLeft bottomRight:(BOOL)bottomRight {
    UIRectCorner Left = 0;
    UIRectCorner Right = 0;
    UIRectCorner BottomLeft = 0;
    UIRectCorner BottomRight = 0;
    if (left) {
        Left = UIRectCornerTopLeft;
    }
    if (right) {
        Right = UIRectCornerTopRight;
    }
    if (bottomLeft) {
        BottomLeft = UIRectCornerBottomLeft;
    }
    if (bottomRight) {
        BottomRight = UIRectCornerBottomRight;
    }
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:Left|Right|BottomLeft|BottomRight cornerRadii:size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
}


#pragma mark Tabbar(redPoint)
//显示小红点
- (void)showBadgeOnItemIndex:(int)index AllItemIndex:(int)allIndex{
    //移除之前可能存在的小红点
    [self removeBadgeOnItemIndex:index AllItemIndex:allIndex];
    //新建小红点
    CHImageView *badgeView = [[CHImageView alloc]init];
    badgeView.tag = 8888 + index;
//    badgeView.layer.cornerRadius = 4;
    badgeView.image = [UIImage imageNamed:@"RedOval"];
//    badgeView.backgroundColor = [UIColor redColor];
//    badgeView.backgroundColor = [UIColor redColor];
    CGRect tabFrame = self.frame;
    //确定小红点的位置
    float percentX = (index + 0.55) / allIndex;
    //5为tabbaritem的总个数
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.05 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 8, 8);
    [self addSubview:badgeView];
}
//移除
- (void)removeBadgeOnItemIndex:(int)index AllItemIndex:(int)allIndex{
    UIView *tempView = (UIView *)[self viewWithTag:8888+index];
    if (tempView) {
        [tempView removeFromSuperview];
    }
//    //按照tag值进行移除
//    for (UIView *subView in self.subviews) {
//        if (subView.tag == 8888+index) {
//            [subView removeFromSuperview];
//
//        }
//
//    }
    
}

- (UIViewController *)viewController {
    UIResponder *next = self.nextResponder;
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        } else if ([next isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nav = (UINavigationController *)next;
            return nav.viewControllers.lastObject;
        }
        next = next.nextResponder;
    }while (next != nil);
    return nil;
}


@end
