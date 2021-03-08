//
//  DongwangRealAuorView.m
//  DongWang
//
//  Created by codehzx on 2020/11/10.
//

#import "DongwangRealAuorView.h"
@interface DongwangRealAuorView ()
@property (nonatomic ,strong) UIImageView *deliverView; //底部View
@property (nonatomic ,strong) UIView *BGView; //遮罩

@end
@implementation DongwangRealAuorView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
//        UIView* BGView                 = [[UIView alloc] init];
//        BGView.frame           = [[UIScreen mainScreen] bounds];
//        BGView.userInteractionEnabled = YES;
//        BGView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
//        BGView.opaque = NO;
//        [self addSubview:BGView];
//        self.BGView = BGView;
        
        
        UIImageView * dongangbeiImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(39), K(35)+NaviH, SCREEN_WIDTH-K(78), K(274.5))];
        dongangbeiImgView.image = [UIImage imageNamed:@"认证成功"];
        dongangbeiImgView.userInteractionEnabled  = YES;
        [self addSubview:dongangbeiImgView];
        _deliverView = dongangbeiImgView;
        
        UIButton * SureBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(84), K(225), K(129), K(36))];
        [SureBtn addTarget:self action:@selector(SureBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [SureBtn setBackgroundColor:[UIColor clearColor]];
        [dongangbeiImgView addSubview:SureBtn];

        
        
    }
    return self;
}
-(void)SureBtnClick{
    [self removeFromSuperview];
    [self.delegate DongwangRealAuorViewSucced];
}
-(void)show{
    self.backgroundColor = [UIColor clearColor];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    self.deliverView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.2,0.2);
    self.deliverView.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.4f];
        self.deliverView.transform = transform;
        self.deliverView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}
@end
