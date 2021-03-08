//
//  DongwangTopPrizeView.m
//  DongWang
//
//  Created by sycm on 2021/2/23.
//

#import "DongwangTopPrizeView.h"
@interface DongwangTopPrizeView ()


@end
@implementation DongwangTopPrizeView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        UIView * whiteView = [[UIView alloc]initWithFrame:CGRectMake(RealWidth(10), 0, SCREEN_WIDTH-RealWidth(20), RealWidth(40))];
        [self addSubview:whiteView];

        CAGradientLayer *gl = [CAGradientLayer layer];
        gl.frame = whiteView.bounds;
        gl.startPoint = CGPointMake(0.5, 0);
        gl.endPoint = CGPointMake(0.5, 1);
        gl.colors = @[(__bridge id)[UIColor colorWithRed:128/255.0 green:74/255.0 blue:183/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:37/255.0 green:5/255.0 blue:68/255.0 alpha:0.66].CGColor];
        gl.locations = @[@(0), @(1.0f)];
        whiteView.layer.cornerRadius = 4;

        
    }
    return self;
}
@end
