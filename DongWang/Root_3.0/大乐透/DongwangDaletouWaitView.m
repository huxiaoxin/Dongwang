//
//  DongwangDaletouWaitView.m
//  DongWang
//
//  Created by codehzx on 2021/1/29.
//

#import "DongwangDaletouWaitView.h"
@interface DongwangDaletouWaitView ()
@property(nonatomic,strong) UIImageView * dongwangbackImgView;
@property(nonatomic,strong) UILabel * dongwangToplb;
@property(nonatomic,strong) UILabel * dongwangbtomlb;
@end
@implementation DongwangDaletouWaitView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView * dongwangbackImgView  =[[UIImageView alloc]initWithFrame:CGRectZero];
        dongwangbackImgView.image = [UIImage imageNamed:@"waitng_back"];
        [self addSubview:dongwangbackImgView];
        _dongwangbackImgView = dongwangbackImgView;
        [dongwangbackImgView addSubview:self.dongwangToplb];
        [dongwangbackImgView addSubview:self.dongwangbtomlb];
        
        
    }
    return self;
}
-(UILabel *)dongwangToplb{
    if (!_dongwangToplb) {
        _dongwangToplb = [[UILabel alloc]initWithFrame:CGRectZero];
        _dongwangToplb.textColor = [UIColor colorWithHexString:@"#5F0000"];
        _dongwangToplb.font = PFS18Font;
        _dongwangToplb.text = @"8点开奖";
        _dongwangToplb.textAlignment = NSTextAlignmentCenter;
    }
    return _dongwangToplb;
}
-(UILabel *)dongwangbtomlb{
    if (!_dongwangbtomlb) {
        _dongwangbtomlb =  [[UILabel alloc]initWithFrame:CGRectZero];
        _dongwangbtomlb.textColor = [UIColor colorWithHexString:@"#5F0000"];
        _dongwangbtomlb.font = PFR13Font;
        _dongwangbtomlb.text = @"(最高奖金1680)";
        _dongwangbtomlb.textAlignment = NSTextAlignmentCenter;

    }
    return _dongwangbtomlb;
}
-(void)setStatusModel:(DongwangDaletouStatusModel *)statusModel{
    _statusModel = statusModel;
    _dongwangToplb.text = [NSString stringWithFormat:@"%@点开奖",statusModel.openingTime];
    _dongwangbtomlb.text =  [NSString stringWithFormat:@"（最高奖金%@）",statusModel.topPrize];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    _dongwangbackImgView.frame = self.bounds;
    _dongwangToplb.frame = CGRectMake(0, RealWidth(145), self.bounds.size.width, RealWidth(20));
    _dongwangbtomlb.frame =  CGRectMake(0, CGRectGetMaxY(_dongwangToplb.frame)+RealWidth(5), self.bounds.size.width, RealWidth(15));
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
