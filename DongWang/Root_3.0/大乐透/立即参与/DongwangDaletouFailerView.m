//
//  DongwangDaletouFailerView.m
//  DongWang
//
//  Created by codehzx on 2021/2/20.
//

#import "DongwangDaletouFailerView.h"
@interface DongwangDaletouFailerView ()
@property (nonatomic ,strong) UIView *deliverView; //底部View

@end
@implementation DongwangDaletouFailerView
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        //
        
        UIImage * imgNames = [UIImage imageNamed:@"letouthank"];
        UIImageView  * deliverView                 = [[UIImageView alloc] init];
        deliverView.frame           = CGRectMake(SCREEN_WIDTH/2-imgNames.size.width/2, K(100)+StatuBar_Height, imgNames.size.width, imgNames.size.height);
        deliverView.userInteractionEnabled = YES;
        deliverView.backgroundColor = [UIColor clearColor];
        deliverView.layer.cornerRadius = K(8);
        deliverView.layer.masksToBounds = YES;
        [self addSubview:deliverView];
        self.deliverView = deliverView;
        
        UIImageView  * bakcImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(deliverView.frame), CGRectGetHeight(deliverView.frame))];
        bakcImgView.userInteractionEnabled = YES;
        bakcImgView.image = imgNames;
        [deliverView addSubview:bakcImgView];
        
        UILabel * dongwangToplb = [[UILabel alloc]initWithFrame:CGRectMake(0, RealWidth(145), CGRectGetWidth(bakcImgView.frame), RealWidth(42))];
        dongwangToplb.numberOfLines = 0;
        dongwangToplb.text = @"好可惜，回答错了\n下一轮还有机会哦～";
        dongwangToplb.textAlignment = NSTextAlignmentCenter;
        dongwangToplb.font = PFR15Font;
        dongwangToplb.textColor = [UIColor blackColor];
        [bakcImgView addSubview:dongwangToplb];
        [dongwangToplb setText:@"好可惜，回答错了\n下一轮还有机会哦～" lineSpacing:RealWidth(4)];
        dongwangToplb.height = [dongwangToplb getSpaceLabelHeight:@"好可惜，回答错了\n下一轮还有机会哦～" withFont:PFR15Font withWidth:CGRectGetWidth(bakcImgView.frame) lineSpacing:RealWidth(4)].height;
        
        
        UIButton * DongwangBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(bakcImgView.frame)/2-K(85), CGRectGetMaxY(dongwangToplb.frame)+RealWidth(10), K(170), K(40))];
        DongwangBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [DongwangBtn setTitleColor:[UIColor colorWithHexString:@"#FF7240"] forState:UIControlStateNormal];
        DongwangBtn.layer.cornerRadius = K(20);
        DongwangBtn.layer.masksToBounds = YES;
        [DongwangBtn addTarget:self action:@selector(dissMissTapClicks) forControlEvents:UIControlEventTouchUpInside];
        [DongwangBtn setTitle: @"确定" forState:UIControlStateNormal];
        [DongwangBtn setBackgroundImage:[UIImage imageNamed:@"确定"] forState:UIControlStateNormal];
        [bakcImgView addSubview:DongwangBtn];

        
    }
    return self;
}
-(void)dissMissTapClicks{
    [self removeFromSuperview];
    
    [self.delegate DongwangDaletouFailerViewhideAction];
}
-(void)FailerShow{
    self.backgroundColor = [UIColor clearColor];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    self.deliverView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.2,0.2);
    self.deliverView.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
       self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.65];
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

