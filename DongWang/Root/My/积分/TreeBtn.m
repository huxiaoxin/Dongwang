//
//  TreeBtn.m
//  DongWang
//
//  Created by codehzx on 2020/11/17.
//

#import "TreeBtn.h"

@implementation TreeBtn
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.actityImgView];
        [_actityImgView addSubview:self.numslb];
        [self addSubview:self.btomlb];
    }
    return self;
}
-(UIImageView *)actityImgView{
    if (!_actityImgView) {
        _actityImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(10), 0, K(40), K(40))];
        _actityImgView.image = [UIImage imageNamed:@"道具背景"];
    }
    return _actityImgView;
}
-(UILabel *)numslb{
    if (!_numslb) {
        _numslb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, K(40), K(40))];
        _numslb.textColor = [UIColor whiteColor];
        _numslb.font = KBlFont(font(20));
        _numslb.textAlignment = NSTextAlignmentCenter;
        _numslb.text = @"+1";
        
    }
    return _numslb;
}
-(UILabel *)btomlb{
    if (!_btomlb) {
        _btomlb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_actityImgView.frame)+K(10), K(60), K(13))];
        _btomlb.textColor = [UIColor whiteColor];
        _btomlb.font = KBlFont(font(13));
        _btomlb.textAlignment = NSTextAlignmentCenter;
        _btomlb.text = @"";
    }
    return _btomlb;
}
@end
