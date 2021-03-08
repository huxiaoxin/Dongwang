//
//  DongwanngMyletouCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2021/2/1.
//

#import "DongwanngMyletouCollectionViewCell.h"
@interface DongwanngMyletouCollectionViewCell ()

@end
@implementation DongwanngMyletouCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView * dongwangBackImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, RealWidth(150), RealWidth(65))];
//        dongwangBackImgView.backgroundColor = [UIColor redColor];
        dongwangBackImgView.image =[UIImage imageNamed:@"myletouback"];
        [self addSubview:dongwangBackImgView];
        
        UILabel * dongwangToplb = [[UILabel alloc]initWithFrame:CGRectMake(0, RealWidth(15), RealWidth(150), RealWidth(27))];
        dongwangToplb.text = @"";
        dongwangToplb.textAlignment = NSTextAlignmentCenter;
        dongwangToplb.font = PFR18Font;
        dongwangToplb.textColor = [UIColor whiteColor];
        [dongwangBackImgView addSubview:dongwangToplb];
        _dongwangToplb = dongwangToplb;
        
        
        UILabel * dongwangBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(0, RealWidth(1)+CGRectGetMaxY(dongwangToplb.frame), RealWidth(150), RealWidth(10))];
        dongwangBtomlb.text = @"您的乐透码";
        dongwangBtomlb.textAlignment = NSTextAlignmentCenter;
        dongwangBtomlb.font = PFR9Font;
        dongwangBtomlb.textColor = [UIColor whiteColor];
        [dongwangBackImgView addSubview:dongwangBtomlb];
    }
    return self;
}
@end
