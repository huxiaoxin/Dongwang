//
//  DongwangwangqinBtn.m
//  DongWang
//
//  Created by codehzx on 2021/1/27.
//

#import "DongwangwangqinBtn.h"

@implementation DongwangwangqinBtn
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.topImgView];
        [self addSubview:self.btomlb];
    }
    return self;
}
-(UIImageView *)topImgView{
    if (!_topImgView) {
        _topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(5), 0, RealWidth(30), RealWidth(30))];
        
    }
    return _topImgView;
}
-(UILabel *)btomlb{
    if (!_btomlb) {
        _btomlb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_topImgView.frame)+RealWidth(5), RealWidth(40), RealWidth(15))];
        _btomlb.textAlignment = NSTextAlignmentCenter;
        _btomlb.textColor = [UIColor whiteColor];
        _btomlb.font = PFR13Font;
    }
    return _btomlb;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
