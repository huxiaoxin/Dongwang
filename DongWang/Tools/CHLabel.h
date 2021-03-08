//
//  CHLabel.h
//  SYQuMinApp
//
//  Created by apple on 2018/5/2.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface CHLabel : UILabel
- (instancetype)initWithFrame:(CGRect)textFrame numberOfLines:(NSInteger)numLines textFont:(UIFont *)textFont textColor:(UIColor *)textColor userEnabled:(BOOL)enabled textAlignments:(NSTextAlignment)textAlign;
- (instancetype)initWithFrame:(CGRect)textFrame numberOfLines:(NSInteger)numLines textFont:(UIFont *)textFont textColor:(UIColor *)textColor userEnabled:(BOOL)enabled textAlignments:(NSTextAlignment)textAlign backColor:(UIColor *)backColor;

@property (nonatomic, assign)UIEdgeInsets edgeInsets;
@property (nonatomic, assign)VerticalAlignment verticalAlignment; // 吸顶

//- (void)chWithnumberOfLines:(NSInteger)numLines textFont:(UIFont *)textFont textColor:(UIColor *)textColor userEnabled:(BOOL)enabled textAlignments:(NSTextAlignment)textAlign backColor:(UIColor *)backColor;

@end
