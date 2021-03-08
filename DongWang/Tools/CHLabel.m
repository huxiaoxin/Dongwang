//
//  CHLabel.m
//  SYQuMinApp
//
//  Created by apple on 2018/5/2.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import "CHLabel.h"
@interface CHLabel ()
@end

@implementation CHLabel

- (instancetype)initWithFrame:(CGRect)textFrame numberOfLines:(NSInteger)numLines textFont:(UIFont *)textFont textColor:(UIColor *)textColor userEnabled:(BOOL)enabled textAlignments:(NSTextAlignment)textAlign {
    self = [super initWithFrame:textFrame];
    if (self) {
        self.frame = CGRectIntegral(textFrame);
        self.textColor = textColor;
        self.font = textFont;
        self.numberOfLines = numLines;
        self.userInteractionEnabled = enabled;
        self.textAlignment = textAlign;
        self.verticalAlignment = VerticalAlignmentMiddle;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)textFrame numberOfLines:(NSInteger)numLines textFont:(UIFont *)textFont textColor:(UIColor *)textColor userEnabled:(BOOL)enabled textAlignments:(NSTextAlignment)textAlign backColor:(UIColor *)backColor {
    self = [super initWithFrame:textFrame];
    if (self) {
        self.frame = CGRectIntegral(textFrame);
        self.textColor = textColor;
        self.font = textFont;
        self.numberOfLines = numLines;
        self.userInteractionEnabled = enabled;
        self.textAlignment = textAlign;
        self.backgroundColor = backColor;
        self.verticalAlignment = VerticalAlignmentMiddle;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    if (_verticalAlignment == VerticalAlignmentMiddle) {
        [super drawTextInRect:UIEdgeInsetsInsetRect(self.bounds, self.edgeInsets)];
    } else {
        CGRect actualRect = [self textRectForBounds:UIEdgeInsetsInsetRect(rect, self.edgeInsets) limitedToNumberOfLines:self.numberOfLines];
        [super drawTextInRect:actualRect];
    }
}

- (void)setEdgeInsets:(UIEdgeInsets)edgeInsets {
    _edgeInsets = edgeInsets;
}
- (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment {
    _verticalAlignment = verticalAlignment;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAlignment) {
        case VerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case VerticalAlignmentMiddle:
            // Fall through.
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
            break;

        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}


@end
