//
//  DongwangJifenVipView.m
//  DongWang
//
//  Created by codehzx on 2020/12/16.
//

#import "DongwangJifenVipView.h"
@interface DongwangJifenVipView ()
@property (nonatomic ,strong) UIView *deliverView; //底部View

@end
@implementation DongwangJifenVipView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       
//        积分商城
        UIImageView  * deliverView                 = [[UIImageView alloc] init];
        deliverView.frame           = CGRectMake(K(48), K(139)+StatuBar_Height, SCREEN_WIDTH-K(96), K(309));
        deliverView.userInteractionEnabled = YES;
        deliverView.backgroundColor = [UIColor whiteColor];
        deliverView.layer.cornerRadius = K(8);
        deliverView.layer.masksToBounds = YES;
        [self addSubview:deliverView];
        self.deliverView = deliverView;
        
        UIImageView  * bakcImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(deliverView.frame), K(157))];
        bakcImgView.image = [UIImage imageNamed:@"会员vip"];
        [deliverView addSubview:bakcImgView];
        
        
        UILabel * Toplb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(bakcImgView.frame)+K(20), CGRectGetWidth(deliverView.frame), K(17))];
        Toplb.textAlignment = NSTextAlignmentCenter;
        Toplb.font = KBlFont(font(17));
        Toplb.textColor = LGDBLackColor;
        Toplb.text = @"会员特权";
        [deliverView addSubview:Toplb];
        
        UILabel * Toplb1 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(Toplb.frame)+K(13), CGRectGetWidth(deliverView.frame), K(13))];
        Toplb1.textAlignment = NSTextAlignmentCenter;
        Toplb1.font = KSysFont(font(13));
        Toplb1.textColor = LGDBLackColor;
        Toplb1.text = @"正在筹备中";
        [deliverView addSubview:Toplb1];
        
        
        UILabel * Toplb2 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(Toplb1.frame)+K(5), CGRectGetWidth(deliverView.frame), K(13))];
        Toplb2.textAlignment = NSTextAlignmentCenter;
        Toplb2.font = KSysFont(font(13));
        Toplb2.textColor = LGDBLackColor;
        Toplb2.text = @"......";
        [deliverView addSubview:Toplb2];


        UILabel * Toplb3 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(Toplb2.frame)+K(15), CGRectGetWidth(deliverView.frame), K(13))];
        Toplb3.textAlignment = NSTextAlignmentCenter;
        Toplb3.font = KSysFont(font(13));
        Toplb3.textColor = LGDBLackColor;
        Toplb3.text = @"积分换会员";
        [deliverView addSubview:Toplb3];

        
        UILabel * Toplb4 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(Toplb3.frame)+K(10), CGRectGetWidth(deliverView.frame), K(13))];
        Toplb4.textAlignment = NSTextAlignmentCenter;
        Toplb4.font = KSysFont(font(13));
        Toplb4.textColor = LGDBLackColor;
        Toplb4.text = @"超多会员福利抢先领取～";
        [deliverView addSubview:Toplb4];
        
        UITapGestureRecognizer  * MyTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangMyTapActions)];
        
        [self addGestureRecognizer:MyTap];
        
    }
    return self;
}
-(void)DongwangMyTapActions{
    [self removeFromSuperview];
    [self.delegate DongwangJifenVipViewRemoveFromeActions];
}
-(void)show{
    self.backgroundColor = [UIColor clearColor];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    self.deliverView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.2,0.2);
    self.deliverView.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.9f];
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
