//
//  DongwangTieziBtn.m
//  DongWang
//
//  Created by sycm on 2021/3/8.
//

#import "DongwangTieziBtn.h"

@implementation DongwangTieziBtn
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.topImgView];
        [self addSubview:self.btomlb];
    }
    return self;
}
-(UILabel *)btomlb{
    if (!_btomlb) {
        _btomlb = [[UILabel alloc]initWithFrame:CGRectZero];
        _btomlb.textAlignment = NSTextAlignmentCenter;
        _btomlb.textColor =[UIColor whiteColor];
        _btomlb.font = PFR17Font;
    }
    return _btomlb;
}
-(UIImageView *)topImgView{
    if (!_topImgView) {
        _topImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _topImgView;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    _topImgView.frame = CGRectMake(self.bounds.size.width/2-RealWidth(20), 0, RealWidth(40), RealWidth(40));
    _btomlb.frame = CGRectMake(0, CGRectGetMaxY(_topImgView.frame)+RealWidth(10), self.bounds.size.width, RealWidth(17));
}
@end
