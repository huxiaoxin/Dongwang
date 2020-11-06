//
//  DongwangInfoMsgView.m
//  DongWang
//
//  Created by codehzx on 2020/11/6.
//

#import "DongwangInfoMsgView.h"

@implementation DongwangInfoMsgView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView * DongwangBjImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(33))];
        DongwangBjImgView.backgroundColor = [UIColor colorWithHexString:@"#E1E1E1"];
        [self addSubview:DongwangBjImgView];
        
        UILabel * Dongwangmsglb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(33))];
        Dongwangmsglb.text = @"首次完成以下信息填写，将获得300积分";
        Dongwangmsglb.textAlignment = NSTextAlignmentCenter;
        Dongwangmsglb.font = KSysFont(font(12));
        Dongwangmsglb.textColor = [UIColor colorWithHexString:@"#FE5A59"];
        [self addSubview:Dongwangmsglb];
    }
    return self;
}
@end
