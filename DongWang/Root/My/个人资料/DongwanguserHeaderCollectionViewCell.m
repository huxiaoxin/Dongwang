//
//  DongwanguserHeaderCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/6.
//

#import "DongwanguserHeaderCollectionViewCell.h"
@interface DongwanguserHeaderCollectionViewCell ()
{
    UIImageView * _DongwangImgView;
}
@end
@implementation DongwanguserHeaderCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView * DongwangImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, K(73), K(73))];
        DongwangImgView.backgroundColor = [UIColor clearColor];
        [self addSubview:DongwangImgView];
        _DongwangImgView = DongwangImgView;
        
    }
    return self;
}
-(void)setImgStrName:(NSString *)imgStrName{
    _imgStrName = imgStrName;
    _DongwangImgView.image = [UIImage imageNamed:imgStrName];
    
}
@end
