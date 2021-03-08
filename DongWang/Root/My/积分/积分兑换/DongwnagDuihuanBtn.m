//
//  DongwnagDuihuanBtn.m
//  DongWang
//
//  Created by codehzx on 2020/12/13.
//

#import "DongwnagDuihuanBtn.h"

@implementation DongwnagDuihuanBtn
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.TopimgView];
        [self addSubview:self.Centerlb];
        [self addSubview:self.BtomImgView];
        [_BtomImgView addSubview:self.Btomlb];
    }
    return self;
}
-(UILabel *)Btomlb{
    if (!_Btomlb) {
        _Btomlb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_BtomImgView.frame), CGRectGetHeight(_BtomImgView.frame))];
        _Btomlb.textAlignment = NSTextAlignmentCenter;
        _Btomlb.textColor = [UIColor whiteColor];
        _Btomlb.font = KBlFont(font(12));
//        _Btomlb.text = @"10积分兑换";
    }
    return _Btomlb;
}
-(UIImageView *)BtomImgView{
    if (!_BtomImgView) {
        _BtomImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_Centerlb.frame)+K(8), K(87), K(22))];
        _BtomImgView.image = [UIImage imageNamed:@"按钮"];
    }
    return _BtomImgView;
    //
}
-(UILabel *)Centerlb{
    if (!_Centerlb) {
        _Centerlb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_TopimgView.frame)+K(10), K(87), K(21))];
        _Centerlb.textAlignment = NSTextAlignmentCenter;
        _Centerlb.font = KBlFont(font(15));
//        _Centerlb.text = @"2313";
    }
    return _Centerlb;
}
-(UIImageView *)TopimgView{
    if (!_TopimgView) {
        _TopimgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(11), 0, K(65), K(65))];
//        _TopimgView.backgroundColor = LGDMianColor;
        
    }
    return _TopimgView;
}
@end
