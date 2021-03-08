//
//  DongwnagMyletouFooterCollectionReusableView.m
//  DongWang
//
//  Created by codehzx on 2021/2/1.
//

#import "DongwnagMyletouFooterCollectionReusableView.h"

@implementation DongwnagMyletouFooterCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIView * contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RealWidth(30))];
        contentView.backgroundColor = [UIColor colorWithHexString:@"#804AB7"];
        [self addSubview:contentView];
        
        UILabel * Btomlb = [[UILabel alloc]initWithFrame:CGRectMake(0, RealWidth(0), SCREEN_WIDTH, RealWidth(30))];
        Btomlb.textAlignment = NSTextAlignmentCenter;
        Btomlb.font = PFR14Font;
        Btomlb.textColor = [UIColor whiteColor];
        Btomlb.text = @"获得乐透码越多，中奖概率越大";
        [contentView addSubview:Btomlb];
        
    }
    return self;
}
@end
