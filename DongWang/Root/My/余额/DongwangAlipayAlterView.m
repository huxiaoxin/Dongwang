//
//  DongwangAlipayAlterView.m
//  DongWang
//
//  Created by codehzx on 2020/11/24.
//

#import "DongwangAlipayAlterView.h"
@interface DongwangAlipayAlterView ()
@property (nonatomic ,strong) UIImageView *deliverView; //底部View
@property (nonatomic ,strong) UIView *BGView; //遮罩
@end
@implementation DongwangAlipayAlterView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView  * deliverView                 = [[UIImageView alloc] init];
        deliverView.frame           = CGRectMake(K(39), K(65.5)+kStatusBarHeight, SCREEN_WIDTH-K(78), K(287.5+67));
        deliverView.userInteractionEnabled = YES;
        [self addSubview:deliverView];
        self.deliverView = deliverView;
        
        UIImageView * dongwangBtomImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, K(60), K(297), K(207.5))];
        dongwangBtomImgView.image = [UIImage imageNamed:@"纯背景"];
        dongwangBtomImgView.userInteractionEnabled = YES;
        [deliverView addSubview:dongwangBtomImgView];
        
        
        UIImageView * dongwangTopImgView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(deliverView.frame)/2-K(71.425), 0, K(142.85), K(111.53))];
        dongwangTopImgView.image = [UIImage imageNamed:@"提现顶部背景"];
        [deliverView addSubview:dongwangTopImgView];
        
        UILabel * DongwangToplb = [[UILabel alloc]initWithFrame:CGRectMake(0, K(109), CGRectGetWidth(dongwangBtomImgView.frame), K(28))];
        DongwangToplb.textAlignment = NSTextAlignmentCenter;
        DongwangToplb.textColor = [UIColor colorWithHexString:@"#8767E9"];
        DongwangToplb.font = KBlFont(font(20));
        DongwangToplb.text =  @"绑定成功";
        [dongwangBtomImgView addSubview:DongwangToplb];
        
        
        
        UIButton * DongwangSureBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(84), CGRectGetMaxY(DongwangToplb.frame)+K(18.5), K(129), K(36))];
        [DongwangSureBtn  setTitle:@"确定" forState:UIControlStateNormal];
        DongwangSureBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        DongwangSureBtn.titleLabel.font = KBlFont(font(15));
        DongwangSureBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [DongwangSureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [DongwangSureBtn setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
        DongwangSureBtn.adjustsImageWhenHighlighted = NO;
        [DongwangSureBtn addTarget:self action:@selector(DongwangSureBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [dongwangBtomImgView addSubview:DongwangSureBtn];
    }
    return self;
}
-(void)DongwangSureBtnClick{
    [self removeFromSuperview];
    [self.delegate DongwangAlipayAlterViewSucced];
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
