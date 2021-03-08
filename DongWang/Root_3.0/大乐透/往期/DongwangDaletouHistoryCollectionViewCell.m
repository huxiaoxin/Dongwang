//
//  DongwangDaletouHistoryCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2021/2/23.
//

#import "DongwangDaletouHistoryCollectionViewCell.h"
@interface DongwangDaletouHistoryCollectionViewCell ()
@property(nonatomic,strong) UILabel * Toplb;
@property(nonatomic,strong) UILabel * Centerlb;
@property(nonatomic,strong) UILabel * Btomlb;
@end
@implementation DongwangDaletouHistoryCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.Toplb];
        [self addSubview:self.Centerlb];
        [self addSubview:self.Btomlb];
        
    }
    return self;
}
-(UILabel *)Toplb{
    if (!_Toplb) {
        _Toplb = [[UILabel alloc]init];
        _Toplb.textColor = [UIColor colorWithHexString:@"#804AB7"];
        _Toplb.font =   PFS15Font;
        _Toplb.textAlignment = NSTextAlignmentCenter;
        }
    return _Toplb;
}
-(UILabel *)Centerlb{
    if (!_Centerlb) {
        _Centerlb = [[UILabel alloc]init];
        _Centerlb.textAlignment  = NSTextAlignmentCenter;
        _Centerlb.textColor = [UIColor colorWithHexString:@"#804AB7"];
        _Centerlb.font =  PFR13Font;
    }
    return _Centerlb;
}
-(UILabel *)Btomlb{
    if (!_Btomlb) {
        _Btomlb = [[UILabel alloc]init];
        _Btomlb.textAlignment = NSTextAlignmentCenter;
        _Btomlb.textColor = [UIColor colorWithHexString:@"#804AB7"];
        _Btomlb.font = PFS15Font;
    }
    return _Btomlb;
}
-(void)setResPone:(PrizeResponses *)resPone{
    _resPone = resPone;
    _Toplb.text =  resPone.awardsName;
    _Centerlb.text = [NSString stringWithFormat:@"¥%@",resPone.awardsWorth];
    _Btomlb.text = [NSString stringWithFormat:@"%@个",resPone.awardsNum];
}
-(void)layoutSubviews{
    _Toplb.frame = CGRectMake(0, RealWidth(10), self.bounds.size.width, RealWidth(15));
    _Centerlb.frame = CGRectMake(0, CGRectGetMaxY(_Toplb.frame)+RealWidth(7), self.bounds.size.width, RealWidth(13));
    _Btomlb.frame = CGRectMake(0, CGRectGetMaxY(_Centerlb.frame)+RealWidth(10), self.bounds.size.width, RealWidth(15));
    
}
@end
