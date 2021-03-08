//
//  DongwangJifenChangeCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/18.
//

#import "DongwangJifenChangeCollectionViewCell.h"

@implementation DongwangJifenChangeCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        UIView * DongwangContentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(77), K(126))];
        DongwangContentView.backgroundColor = LGDMianColor;
        [self addSubview:DongwangContentView];
        
        UILabel * DongwangNumslb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangContentView.frame)+K(14), K(77), K(21))];
        DongwangNumslb.textAlignment = NSTextAlignmentCenter;
        DongwangNumslb.font = KBlFont(font(15));
        DongwangNumslb.text = @"20积分";
        DongwangNumslb.textColor = [UIColor colorWithHexString:@"#803100"];
        [self addSubview:DongwangNumslb];
        
    }
    return self;
}
@end
