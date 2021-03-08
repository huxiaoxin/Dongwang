//
//  DongwangChatBtn.m
//  DongWang
//
//  Created by sycm on 2021/3/1.
//

#import "DongwangChatBtn.h"

@implementation DongwangChatBtn
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.leftImgView];
        [self addSubview:self.rightlb];
    }
    return self;
}
-(UIImageView *)leftImgView{
    if (!_leftImgView) {
        _leftImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, RealWidth(20), RealWidth(20))];
    }
    return _leftImgView;
}
-(UILabel *)rightlb{
    if (!_rightlb) {
        _rightlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftImgView.frame)+RealWidth(2), RealWidth(5), RealWidth(50), RealWidth(15))];
        _rightlb.textColor =[UIColor whiteColor];
        _rightlb.font = PFR13Font;
    }
    return _rightlb;
}
@end
