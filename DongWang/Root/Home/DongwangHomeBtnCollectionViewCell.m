//
//  DongwangHomeBtnCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/30.
//

#import "DongwangHomeBtnCollectionViewCell.h"
@interface DongwangHomeBtnCollectionViewCell ()

@end
@implementation DongwangHomeBtnCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView * DongwangImgView  = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, K(51), K(51))];
        DongwangImgView.backgroundColor = LGDLightGaryColor;
        [self addSubview:DongwangImgView];
        
        UILabel * DonwangBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangImgView.frame)+K(5), K(51), K(13))];
        DonwangBtomlb.textAlignment = NSTextAlignmentCenter;
        DonwangBtomlb.font = KSysFont(font(13));
        DonwangBtomlb.textColor = [UIColor colorWithHexString:@"#333333"];
        DonwangBtomlb.text = @"签到";
        [self addSubview:DonwangBtomlb];
        
        
    }
    return self;
}
@end
