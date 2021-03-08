//
//  DongwangTimeoutView.m
//  DongWang
//
//  Created by codehzx on 2021/2/1.
//

#import "DongwangTimeoutView.h"
@interface DongwangTimeoutView ()
@property (nonatomic ,strong) UIView *deliverView; //底部View

@end
@implementation DongwangTimeoutView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView  * deliverView                 = [[UIImageView alloc] init];
        deliverView.frame           = CGRectMake(SCREEN_WIDTH/2-RealWidth(140), K(139)+StatuBar_Height, RealWidth(280), RealWidth(279));
        deliverView.userInteractionEnabled = YES;
        deliverView.backgroundColor = [UIColor clearColor];
        deliverView.layer.cornerRadius = K(8);
        deliverView.layer.masksToBounds = YES;
        [self addSubview:deliverView];
        self.deliverView = deliverView;
        
        UIImageView  * bakcImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(deliverView.frame),CGRectGetHeight(deliverView.frame))];
        bakcImgView.image = [UIImage imageNamed:@"timeoutIcon"];
        [deliverView addSubview:bakcImgView];
        
        CGRect myRect =[@"时间已经到了哟\n下一轮还有机会哦～" cxl_sizeWithMoreString:PFR15Font maxWidth:CGRectGetWidth(deliverView.frame)-RealWidth(20)];
        
        
        UILabel * Contentlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(deliverView.frame)/2-myRect.size.width/2, RealWidth(160), myRect.size.width, myRect.size.height)];
        Contentlb.font = PFR15Font;
        Contentlb.numberOfLines = 0;
        Contentlb.textColor = [UIColor colorWithHexString:@"#333333"];
        Contentlb.text =  @"时间已经到了哟\n下一轮还有机会哦～";
        [bakcImgView addSubview:Contentlb];
        Contentlb.textAlignment = NSTextAlignmentCenter;

        //
        
        
        UIButton * sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(deliverView.frame)/2-RealWidth(62), CGRectGetMaxY(Contentlb.frame)+RealWidth(22), RealWidth(124), RealWidth(37))];
        [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        sureBtn.titleLabel.font = PFR16Font;
        [sureBtn addTarget:self action:@selector(sureBtnClicks) forControlEvents:UIControlEventTouchUpInside];
        [sureBtn setTitleColor:[UIColor colorWithHexString:@"#DF5300"] forState:UIControlStateNormal];
        [sureBtn setBackgroundImage:[UIImage imageNamed:@"确定"] forState:UIControlStateNormal];
        [bakcImgView addSubview:sureBtn];
      
        UITapGestureRecognizer  * MyTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangMyTapActions)];
        
        [self addGestureRecognizer:MyTap];

        
    }
    return self;
}
-(void)DongwangMyTapActions{
    [self  removeFromSuperview];
}
-(void)sureBtnClicks{
    
}
-(void)ShowView{
    self.frame =  CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [[AppDelegate getAppDelegate].window addSubview:self];
    self.backgroundColor = [UIColor clearColor];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    self.deliverView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.2,0.2);
    self.deliverView.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.8f];
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
