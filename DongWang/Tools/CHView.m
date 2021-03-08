//
//  CHView.m
//  SYQuMinApp
//
//  Created by apple on 2018/8/25.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import "CHView.h"

@implementation CHView

- (instancetype)initWithFrame:(CGRect)textFrame cornerRadius:(CGFloat)cornerRadius borderColor:(CGColorRef)borderColor borderWidth:(CGFloat)borderWidth backColor:(UIColor *)backColor {
    self = [super initWithFrame:textFrame];
    if (self) {
        self.frame = textFrame;
        [self cornerRadius:cornerRadius borderColor:borderColor borderWidth:borderWidth];
        self.backgroundColor = backColor;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)textFrame backColor:(UIColor *)backColor {
    self = [super initWithFrame:textFrame];
    if (self) {
        self.frame = textFrame;
        self.backgroundColor = backColor;
    }
    return self;
}
@end
