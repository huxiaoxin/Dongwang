//
//  UIView+directionBorder.h
//  DongWang
//
//  Created by codehzx on 2021/1/8.
//
#import <UIKit/UIKit.h>

@interface UIView (directionBorder)
- (void)setDirectionBorderWithTop:(BOOL)hasTopBorder left:(BOOL)hasLeftBorder bottom:(BOOL)hasBottomBorder right:(BOOL)hasRightBorder borderColor:(UIColor *)borderColor withBorderWidth:(CGFloat)borderWidth;
@end


