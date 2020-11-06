//
//  DongwanguserHeaderCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/6.
//

#import "DongwanguserHeaderCollectionViewCell.h"

@implementation DongwanguserHeaderCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView * DongwangImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, K(73), K(73))];
        DongwangImgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:DongwangImgView];
    }
    return self;
}
@end
