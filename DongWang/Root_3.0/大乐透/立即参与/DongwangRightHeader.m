//
//  DongwangRightHeader.m
//  DongWang
//
//  Created by codehzx on 2021/2/19.
//

#import "DongwangRightHeader.h"
@interface DongwangRightHeader ()
@property(nonatomic,strong) UILabel *  Dongwanglb;
@end
@implementation DongwangRightHeader
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.Dongwanglb];
    }
    return self;
}
-(void)setTitle:(NSString *)title{
    _title = title;
    [_Dongwanglb setText:title lineSpacing:RealWidth(4)];
     CGSize lbSize = [_Dongwanglb getSpaceLabelHeight:title withFont:PFR16Font withWidth:SCREEN_WIDTH-RealWidth(16+20) lineSpacing:RealWidth(4)];
    _Dongwanglb.size = lbSize;
    self.HeaderHeight =  CGRectGetMaxY(_Dongwanglb.frame)+RealWidth(15);
}
-(UILabel *)Dongwanglb{
    if (!_Dongwanglb) {
        _Dongwanglb =  [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(10), RealWidth(10), 0, 0)];
        _Dongwanglb.numberOfLines = 0;
        _Dongwanglb.textColor = [UIColor whiteColor];
        _Dongwanglb.font = PFR16Font;
    }
    return _Dongwanglb;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
