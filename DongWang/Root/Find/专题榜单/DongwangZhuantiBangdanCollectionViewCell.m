//
//  DongwangZhuantiBangdanCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/26.
//

#import "DongwangZhuantiBangdanCollectionViewCell.h"

@implementation DongwangZhuantiBangdanCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView * DongwangImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, K(77), K(109))];
        DongwangImgView.image = [UIImage imageNamed:@"奖品"];
        [self addSubview:DongwangImgView];
    }
    return self;
}
@end
