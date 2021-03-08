//
//  DongwangCorectAlterView.m
//  DongWang
//
//  Created by codehzx on 2021/2/20.
//

#import "DongwangCorectAlterView.h"
@interface DongwangCorectAlterView ()
@property (nonatomic ,strong) UIView *deliverView; //底部View
@property (nonatomic ,strong) UILabel * dongwangToplb;
@property (nonatomic ,strong) UILabel * btommsglb;
@property (nonatomic ,strong) UIButton *  opneTimebtn;
@end
@implementation DongwangCorectAlterView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       // letou_corect
        //letou_open
        
        UIImageView  * deliverView                 = [[UIImageView alloc] init];
        deliverView.frame           = CGRectMake(SCREEN_WIDTH/2-RealWidth(187), K(80)+StatuBar_Height, RealWidth(375), RealWidth(414));
        deliverView.userInteractionEnabled = YES;
        deliverView.backgroundColor = [UIColor clearColor];
        deliverView.layer.cornerRadius = K(8);
        deliverView.layer.masksToBounds = YES;
        [self addSubview:deliverView];
        self.deliverView = deliverView;
        
        UIImageView  * bakcImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(deliverView.frame), CGRectGetHeight(deliverView.frame))];
        bakcImgView.image = [UIImage imageNamed:@"letou_corect"];
        [deliverView addSubview:bakcImgView];
        
        
        UILabel * topmsglb = [[UILabel alloc]initWithFrame:CGRectMake(0, RealWidth(173), CGRectGetWidth(bakcImgView.frame), RealWidth(21))];
        topmsglb.textAlignment = NSTextAlignmentCenter;
        topmsglb.textColor = [UIColor whiteColor];
        topmsglb.font = PFR15Font;
        topmsglb.text = @"获得一张奖券";
        [bakcImgView addSubview:topmsglb];
        
        
        UIButton *  opneTimebtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(bakcImgView.frame)/2-RealWidth(80), CGRectGetMaxY(topmsglb.frame)+RealWidth(27), RealWidth(160), RealWidth(33))];
        [opneTimebtn setBackgroundImage:[UIImage imageNamed:@"letou_open"] forState:UIControlStateNormal];
        opneTimebtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        opneTimebtn.titleLabel.font =  PFR18Font;
        [opneTimebtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [opneTimebtn setTitle:@"今日20:00开奖" forState:UIControlStateNormal];
        [bakcImgView addSubview:opneTimebtn];
        _opneTimebtn = opneTimebtn;
        
        
        UILabel * btommsglb = [[UILabel alloc]initWithFrame:CGRectMake(0, RealWidth(8)+CGRectGetMaxY(opneTimebtn.frame), CGRectGetWidth(bakcImgView.frame), RealWidth(25))];
        btommsglb.textAlignment = NSTextAlignmentCenter;
        btommsglb.textColor = [UIColor whiteColor];
        btommsglb.font = PFR15Font;
        [bakcImgView addSubview:btommsglb];
        _btommsglb= btommsglb;
        
        
        
        
        UIImageView * dongwangBackImgView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(bakcImgView.frame)/2-RealWidth(110), CGRectGetMaxY(btommsglb.frame)+RealWidth(20), RealWidth(220), RealWidth(95))];
        dongwangBackImgView.image =[UIImage imageNamed:@"myletouback"];
        [bakcImgView addSubview:dongwangBackImgView];
        
        UILabel * dongwangToplb = [[UILabel alloc]initWithFrame:CGRectMake(0, RealWidth(21), RealWidth(220), RealWidth(30))];
        dongwangToplb.text = @"btommsglb";
        dongwangToplb.textAlignment = NSTextAlignmentCenter;
        dongwangToplb.font = PFR30Font;
        dongwangToplb.textColor = [UIColor whiteColor];
        [dongwangBackImgView addSubview:dongwangToplb];
        _dongwangToplb = dongwangToplb;
        
        
        UILabel * dongwangBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(0, RealWidth(8)+CGRectGetMaxY(dongwangToplb.frame), RealWidth(220), RealWidth(20))];
        dongwangBtomlb.text = @"您的乐透码";
        dongwangBtomlb.textAlignment = NSTextAlignmentCenter;
        dongwangBtomlb.font = PFR14Font;
        dongwangBtomlb.textColor = [UIColor whiteColor];
        [dongwangBackImgView addSubview:dongwangBtomlb];
        
        UITapGestureRecognizer * tapgesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapgestureClicks)];
        [self addGestureRecognizer:tapgesture];
    }
    return self;
}
-(void)setResultModel:(DongwangAnswerResultModel *)resultModel{
    _resultModel = resultModel;
    _dongwangToplb.text = [NSString stringWithFormat:@"%@",resultModel.ticketNum];
    [_opneTimebtn setTitle:[NSString stringWithFormat:@"今日%@开奖",resultModel.openingTime] forState:UIControlStateNormal];
    NSString * firtStr = @"今日最高奖:";
    NSString * secondStr = [NSString stringWithFormat:@"%@元",resultModel.topPrize];
    NSString * threeStr  = @"（每日金额有所不同）";
    NSMutableAttributedString * btomAttbute = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@%@",firtStr,secondStr,threeStr]];
    [btomAttbute addAttribute:NSFontAttributeName value:PFR12Font range:NSMakeRange(0, firtStr.length)];
    
    [btomAttbute addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#333333"] range:NSMakeRange(0, firtStr.length)];

    [btomAttbute addAttribute:NSFontAttributeName value:PFR18Font range:NSMakeRange(firtStr.length, secondStr.length)];
    
    [btomAttbute addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#FF0000"] range:NSMakeRange(firtStr.length, secondStr.length)];

    [btomAttbute addAttribute:NSFontAttributeName value:PFR12Font range:NSMakeRange(firtStr.length+secondStr.length, threeStr.length)];
    
    [btomAttbute addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"333333"] range:NSMakeRange(firtStr.length+secondStr.length, threeStr.length)];

    _btommsglb.attributedText = btomAttbute;

}
-(void)tapgestureClicks{
    [self removeFromSuperview];
    [self.delegate DongwangCorectAlterViewDismiss];
}
-(void)Show{
    self.backgroundColor = [UIColor clearColor];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    self.deliverView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.2,0.2);
    self.deliverView.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.deliverView.transform = transform;
        self.deliverView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
