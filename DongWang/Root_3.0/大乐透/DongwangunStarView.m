//
//  DongwangunStarView.m
//  DongWang
//
//  Created by codehzx on 2021/1/27.
//

#import "DongwangunStarView.h"
@interface DongwangunStarView ()
@property(nonatomic,strong)  UIImageView * dongwangbackImgView;
@property(nonatomic,strong)  UILabel * DongwangToplb;
@property(nonatomic,strong)  UILabel * DongwangBtomlb;
@property(nonatomic,strong) UIImageView * dongwangyelloImgView;
@property(nonatomic,strong) UILabel * dongwnagmoneylb;
@property(nonatomic,strong) CAGradientLayer *gradientLayer;
@property(nonatomic,strong) CAGradientLayer * MoneygradientLayer;
@property(nonatomic,strong) UIImageView * msgIcon;
@property(nonatomic,strong) UIView * BtomView;
@end
@implementation DongwangunStarView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    
        UIImageView * dongwangbackImgView  =[[UIImageView alloc]initWithFrame:CGRectZero];
        dongwangbackImgView.image = [UIImage imageNamed:@"unstar"];
        [self addSubview:dongwangbackImgView];
        _dongwangbackImgView = dongwangbackImgView;
        
        
//        UILabel * DongwangToplb  =[[UILabel alloc]initWithFrame:CGRectZero];
//        DongwangToplb.textAlignment = NSTextAlignmentCenter;
//        DongwangToplb.textColor = [UIColor whiteColor];
//        DongwangToplb.text = @"1月21日 12:00";
//        [dongwangbackImgView addSubview:DongwangToplb];
//        _DongwangToplb = DongwangToplb;
        
        
        
        
        UIImageView * msgIcon  =[[UIImageView alloc]initWithFrame:CGRectZero];
        msgIcon.image = [UIImage imageNamed:@"msg_icon"];
        [dongwangbackImgView addSubview:msgIcon];
        _msgIcon = msgIcon;
        
        
        
        
        UIView * BtomView  =[[UIView alloc]initWithFrame:CGRectZero];
        [dongwangbackImgView addSubview:BtomView];
        _BtomView = BtomView;
        
        
        UILabel * DongwangBtomlb  =[[UILabel alloc]initWithFrame:CGRectZero];
        DongwangBtomlb.textAlignment = NSTextAlignmentCenter;
        DongwangBtomlb.font = PFR10Font;
        [BtomView addSubview:DongwangBtomlb];
        
        _DongwangBtomlb =  DongwangBtomlb;
        
        
        
        CAGradientLayer * moneygradientLayer = [CAGradientLayer layer];
        moneygradientLayer.colors = @[(id)[UIColor  colorWithHexString:@"#B88800"].CGColor, (id)[UIColor colorWithHexString:@"#D5A406"].CGColor, (id)[UIColor colorWithHexString:@"#FFE113"].CGColor,(id)[UIColor colorWithHexString:@"#D2950C"],(id)[UIColor colorWithHexString:@"#AE7409"]];
        _MoneygradientLayer =  moneygradientLayer;
//        moneygradientLayer.startPoint = CGPointMake(0, 0);
//        moneygradientLayer.endPoint = CGPointMake(0, 1);
        [BtomView.layer addSublayer:moneygradientLayer];
        moneygradientLayer.mask = DongwangBtomlb.layer;
        
        
        UIImageView * dongwangyelloImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        dongwangyelloImgView.layer.cornerRadius = RealWidth(5);
        dongwangyelloImgView.layer.masksToBounds = YES;
        dongwangyelloImgView.image = [UIImage imageNamed:@"yelloback"];
        [dongwangbackImgView addSubview:dongwangyelloImgView];
        _dongwangyelloImgView  = dongwangyelloImgView;
        
        
        UILabel * dongwnagmoneylb = [[UILabel alloc]initWithFrame:CGRectZero];
        dongwnagmoneylb.textAlignment = NSTextAlignmentCenter;
        dongwnagmoneylb.font = PFS15Font;
        [dongwangyelloImgView addSubview:dongwnagmoneylb];
        _dongwnagmoneylb = dongwnagmoneylb;
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.colors = @[(id)[UIColor  colorWithHexString:@"#D8D8D8"].CGColor, (id)[UIColor colorWithHexString:@"#5F0000"].CGColor, (id)[UIColor colorWithHexString:@"940000" Alpha:0.5].CGColor];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(0, 1);
        [dongwangyelloImgView.layer addSublayer:gradientLayer];
        gradientLayer.mask = dongwnagmoneylb.layer;
        _gradientLayer = gradientLayer;

        
    }
    return self;
}
-(void)setStatusModel:(DongwangDaletouStatusModel *)statusModel{
    _statusModel = statusModel;
    NSString * FirstStr  =[NSString stringWithFormat:@"%@",statusModel.topPrize];
    NSString * SecondStr = @"元";
    NSMutableAttributedString * moneyAttbute = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",FirstStr,SecondStr]];
    [moneyAttbute addAttribute:NSFontAttributeName value:PFS70Font range:NSMakeRange(0, FirstStr.length)];
    [moneyAttbute addAttribute:NSFontAttributeName value:PFR16Font range:NSMakeRange(FirstStr.length, SecondStr.length)];
    _DongwangBtomlb.attributedText = moneyAttbute;
    _dongwnagmoneylb.text  = [NSString stringWithFormat:@"开始时间：%@",statusModel.nextTime];


}
-(void)layoutSubviews{
    _dongwangbackImgView.frame =self.bounds;
    _msgIcon.frame = CGRectMake(CGRectGetWidth(self.frame)/2-RealWidth(52), RealWidth(45), RealWidth(103), RealWidth(21));
//    _DongwangToplb.frame = CGRectMake(0, RealWidth(51), self.bounds.size.width, RealWidth(30));
    
    _BtomView.frame = CGRectMake(0, RealWidth(73), self.bounds.size.width, RealWidth(70));
    _DongwangBtomlb.frame = CGRectMake(0, 0, self.bounds.size.width, RealWidth(73));
    _MoneygradientLayer.frame =  CGRectMake(0, 0, self.bounds.size.width, RealWidth(150));
    
    _dongwangyelloImgView.frame = CGRectMake(0, self.bounds.size.height-RealWidth(47), self.bounds.size.width-RealWidth(9), RealWidth(38));
    _dongwnagmoneylb.frame = CGRectMake(0, 0, CGRectGetWidth(_dongwangyelloImgView.frame), CGRectGetHeight(_dongwangyelloImgView.frame));
    _gradientLayer.frame = _dongwnagmoneylb.frame;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
