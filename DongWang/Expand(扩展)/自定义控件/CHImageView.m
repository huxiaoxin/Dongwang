//
//  CHImageView.m
//  SYQuMinApp
//
//  Created by apple on 2018/5/2.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import "CHImageView.h"

@implementation CHImageView

- (instancetype)initWithFrame:(CGRect)textFrame userEnabled:(BOOL)enabled {
    self = [super initWithFrame:textFrame];
    if (self) {
        self.frame = textFrame;
        self.userInteractionEnabled = enabled;
//        [self setContentMode:UIViewContentModeScaleAspectFill];
//        self.clipsToBounds = YES;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)textFrame cornerRadius:(CGFloat)cornerRadius borderColor:(CGColorRef)borderColor borderWidth:(CGFloat)borderWidth userEnabled:(BOOL)enabled {
    self = [super initWithFrame:textFrame];
    if (self) {
        self.frame = textFrame;
        self.userInteractionEnabled = enabled;
        if (cornerRadius != 0 || borderWidth != 0) {
           [self cornerRadius:cornerRadius borderColor:borderColor borderWidth:borderWidth];
        }
        /**
         UIViewContentModeScaleAspectFit, //这个图片都会在view里面显示，并且比例不变 这就是说 如果图片和view的比例不一样 就会有留白
         UIViewContentModeScaleAspectFill, // 这是整个view会被图片填满，图片比例不变
         
         既然要求不高 又不能留白 那我就可以用第二种 可是这样就超出位置了， 截掉就可以了！
         然后完整过程就两步
        [self.imageView setContentMode:UIViewContentModeScaleAspectFill];
         self.imageView.clipsToBounds = YES;
         */
//        [self setContentMode:UIViewContentModeScaleAspectFill];
//        self.clipsToBounds = YES;
    }
    return self;
}
+ (CHImageView *)createImageViewWithFrame:(CGRect)frame tag:(NSInteger)tag named:(NSString *)name {
    CHImageView *imageView = [[CHImageView alloc]initWithFrame:frame];
    imageView.tag = tag;
    imageView.image = [UIImage imageNamed:name];
    imageView.layer.anchorPoint = CGPointMake(28.5/ 45.0, 16/ 45.0);
    return imageView;
}

@end
