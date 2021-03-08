//
//  DongwangMyBtn.m
//  DongWang
//
//  Created by codehzx on 2020/11/11.
//

#import "DongwangMyCenterBtn.h"
@interface DongwangMyCenterBtn ()

@end
@implementation DongwangMyCenterBtn
-(instancetype)initWithFrame:(CGRect)frame{
    if (self  =[super initWithFrame:frame]) {
        [self addSubview:self.DongwangToplb];
        [self addSubview:self.DongwangBtomlb];
    }
    return self;
}
-(UILabel *)DongwangBtomlb{
    if (!_DongwangBtomlb) {
        _DongwangBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_DongwangToplb.frame)+K(5), K(341/2), K(16.5))];
        _DongwangBtomlb.textAlignment = NSTextAlignmentCenter;
        _DongwangBtomlb.textColor = [UIColor colorWithHexString:@"#DEDEDE"];
        _DongwangBtomlb.font = KSysFont(font(12));
        _DongwangBtomlb.text =  @"123142";
    }
    return _DongwangBtomlb;
}
-(UILabel *)DongwangToplb{
    if (!_DongwangToplb) {
        _DongwangToplb = [[UILabel alloc]initWithFrame:CGRectMake(0, K(10), K(341/2), K(18))];
        _DongwangToplb.textAlignment = NSTextAlignmentCenter;
        _DongwangToplb.font = KSysFont(font(18));
        _DongwangToplb.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
        _DongwangToplb.text =  @"123142";
    }
    return _DongwangToplb;
}
@end
