//
//  CHButton.m
//  SYQuMinApp
//
//  Created by apple on 2018/5/2.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import "CHButton.h"
#import "CHView.h"
#import "CHLabel.h"
@interface CHButton ()

@end
@implementation CHButton

- (instancetype)initWithFrame:(CGRect)textFrame title:(NSString *)textTitle titleColor:(UIColor *)textTitleColor titleFont:(UIFont *)titleFont backColor:(UIColor *)btnbackColor {
    self = [super initWithFrame:textFrame];
    if (self) {
        self.frame = textFrame;
        if ([NSString isBlankString:textTitle] == NO) {
            [self setTitle:textTitle forState:(UIControlStateNormal)];
        }
        [self setTitleColor:textTitleColor forState:(UIControlStateNormal)];
        self.titleLabel.font = titleFont;
        self.backgroundColor = btnbackColor;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)textFrame imageButton:(NSString *)imagestring {
    self = [super initWithFrame:textFrame];
    if (self) {
        self.frame = textFrame;
        [self setImage:[UIImage imageNamed:imagestring] forState:(UIControlStateNormal)];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)textFrame imageDataButton:(UIImage *)imageData {
    self = [super initWithFrame:textFrame];
    if (self) {
        self.frame = textFrame;
        [self setImage:imageData forState:(UIControlStateNormal)];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)textFrame imageData:(NSString *)imageData imageSize:(CGSize)imageSize imageSpacing:(CGFloat)imageSpacing title:(NSString *)title titleFont:(CGFloat)titleFont titleFontName:(NSString *)titleFontName titleTextColor:(UIColor *)textColor imageBack:(NSString *)imageBack {
    self = [super initWithFrame:textFrame];
    if (self) {
        self.frame = textFrame;
        [self setButtonImageData:imageData imageSize:imageSize imageSpacing:imageSpacing title:title titleFont:titleFont titleFontName:titleFontName titleTextColor:textColor imageBack:imageBack];
    }
    return self;
}
- (void)setButtonImageData:(NSString *)imageData imageSize:(CGSize)imageSize imageSpacing:(CGFloat)imageSpacing title:(NSString *)title titleFont:(CGFloat)titleFont titleFontName:(NSString *)titleFontName titleTextColor:(UIColor *)textColor imageBack:(NSString *)imageBack {
    CHImageView *backImageView = [[CHImageView alloc] initWithFrame:self.bounds userEnabled:NO];
    backImageView.image = [UIImage imageNamed:imageBack];
    [self addSubview:backImageView];
    CGFloat tw = 0;
    CGFloat tx = 0;
    CGSize tempTitleSize = [title getStringWidthIncomingHeight:self.height fontSize:titleFont fontName:titleFontName textColor:Color1];
    if ([NSString isBlankString:imageData] == NO) {
        tw = imageSize.width + tempTitleSize.width + 1 + imageSpacing;
    } else {
        tw = tempTitleSize.width + 1;
    }
    tx = (self.width - tw) / 2;
    CHView *backView = [[CHView alloc] initWithFrame:CGRectMake(tx, 0, tw, backImageView.height)];
    [backImageView addSubview:backView];
    CHImageView *tempImageView = [[CHImageView alloc] initWithFrame:CGRectMake(0, (backView.height - imageSize.height) / 2, imageSize.width, imageSize.height) userEnabled:YES];
    if ([NSString isBlankString:imageData] == NO) {
         tempImageView.image = [UIImage imageNamed:imageData];
    }
    [backView addSubview:tempImageView];
    CHLabel *tempLabel = [[CHLabel alloc] initWithFrame:CGRectMake(tempImageView.right + imageSpacing, 0, backView.width - imageSpacing - tempImageView.width, backView.height) numberOfLines:0 textFont:[UIFont fontWithName:titleFontName size:titleFont] textColor:textColor userEnabled:YES textAlignments:(NSTextAlignmentCenter)];
    tempLabel.text = title;
    [backView addSubview:tempLabel];
    
}

- (void)setTextTitleButton:(NSString *)textTitleButton {
    _textTitleButton = textTitleButton;
    if ([NSString isBlankString:_textTitleButton] == NO) {
        [self setTitle:_textTitleButton forState:(UIControlStateNormal)];
    }
}


- (void)verticalImageAndTitle:(CGFloat)spacing {
//    self.titleLabel.backgroundColor = [UIColor greenColor];
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font];
//    CGSize textSize = [self.titleLabel.text getStringHeightIncomingWidth:self.width fontSize:self.titleLabel.font fontName:PFR textColor:self.titleLabel.backgroundColor].siz
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
    
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event{
    CGRect bounds = self.bounds;
    //若原热区小于44x44，则放大热区，否则保持原大小不变
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
}
@end
