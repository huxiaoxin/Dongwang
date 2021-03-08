//
//  DongwangbannarCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/12/10.
//

#import "DongwangbannarCollectionViewCell.h"

@implementation DongwangbannarCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        UIImageView * ThubImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(10), 0, SCREEN_WIDTH-RealWidth(20), RealWidth(174))];
        ThubImgView.contentMode = UIViewContentModeScaleAspectFill;
        ThubImgView.layer.cornerRadius = K(5);
        ThubImgView.layer.masksToBounds  =YES;
        [self.contentView addSubview:ThubImgView];
        _ThubImgView = ThubImgView;
        
    }
    return self;
}
@end
