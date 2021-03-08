//
//  DongwangStyeTwoMofangCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/12/9.
//

#import "DongwangStyeTwoMofangCollectionViewCell.h"
@interface DongwangStyeTwoMofangCollectionViewCell ()
{
    UIImageView * _DongwangImgView;
}
@end
                                        
@implementation DongwangStyeTwoMofangCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView * DongwangImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH-K(30))/2, K(85))];
//        DongwangImgView.userInteractionEnabled = YES;
//        DongwangImgView.backgroundColor = LGDMianColor;
        DongwangImgView.layer.masksToBounds = YES;
        DongwangImgView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:DongwangImgView];
        _DongwangImgView  =DongwangImgView;
    }
    return self;
}
-(void)setListmodel:(MagicList *)listmodel{
    _listmodel = listmodel;
    [_DongwangImgView sd_setImageWithURL:[NSURL URLWithString:listmodel.imageUrl]];
}
@end
