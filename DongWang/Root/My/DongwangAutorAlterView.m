//
//  DongwangAutorAlterView.m
//  DongWang
//
//  Created by codehzx on 2020/11/19.
//

#import "DongwangAutorAlterView.h"
@interface DongwangAutorAlterView ()
@property (nonatomic ,strong) UIView *deliverView; //底部View
@property (nonatomic ,strong) UIView *BGView; //遮罩

@end
@implementation DongwangAutorAlterView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
      
        UIView* BGView                 = [[UIView alloc] init];
        BGView.frame           = [[UIScreen mainScreen] bounds];
        BGView.userInteractionEnabled = YES;
        BGView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        BGView.opaque = NO;
//        [self addSubview:BGView];
//        self.BGView = BGView;
        
        
        UIView * deliverView = [[UIView alloc]initWithFrame:CGRectMake(K(36), K(172)+StatuBar_Height, SCREEN_WIDTH-K(72), K(143))];
        deliverView.backgroundColor = [UIColor whiteColor];
        deliverView.layer.cornerRadius = K(12);
        deliverView.layer.masksToBounds = YES;
        [self addSubview:deliverView];
        _deliverView = deliverView;
        
        
        
        UILabel * DongwangTpislb = [[UILabel alloc]initWithFrame:CGRectMake(0, K(25), CGRectGetWidth(deliverView.frame), K(22))];
        DongwangTpislb.textAlignment = NSTextAlignmentCenter;
        DongwangTpislb.textColor = [UIColor blackColor];
        DongwangTpislb.font = KBlFont(font(16));
        DongwangTpislb.text = @"温馨提示";
        [deliverView addSubview:DongwangTpislb];
        
        UILabel * DongwangMsglb = [[UILabel alloc]initWithFrame:CGRectMake(0, K(65), CGRectGetWidth(deliverView.frame), K(15))];
        DongwangMsglb.textAlignment = NSTextAlignmentCenter;
        DongwangMsglb.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangMsglb.font = KSysFont(font(11));
        DongwangMsglb.text = @"为了您的账号安全，提现之前请先进行实名认证";
        [deliverView addSubview:DongwangMsglb];
        
        UIView * Dongwangline = [[UIView alloc]initWithFrame:CGRectMake(0, K(101), CGRectGetWidth(deliverView.frame), K(1))];
        Dongwangline.backgroundColor = [UIColor colorWithHexString:@"#DEDEDE"];
        [deliverView addSubview:Dongwangline];
        
        UIButton * SureBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(Dongwangline.frame), CGRectGetWidth(deliverView.frame), K(42))];
        [SureBtn addTarget:self action:@selector(SureBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [SureBtn setTitleColor:[UIColor colorWithHexString:@"#CB92FF"] forState:UIControlStateNormal];
        [SureBtn setTitle:@"确定" forState:UIControlStateNormal];
        SureBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        SureBtn.titleLabel.font = KSysFont(font(14));
        [deliverView addSubview:SureBtn];
        
    }
    return self;
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
-(void)SureBtnClick{
    [self removeFromSuperview];
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.delegate DongwangAutorAlterViewSureAction];

    });
}
@end
