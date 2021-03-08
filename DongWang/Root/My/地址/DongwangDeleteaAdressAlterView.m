//
//  DongwangDeleteaAdressAlterView.m
//  DongWang
//
//  Created by codehzx on 2020/11/23.
//

#import "DongwangDeleteaAdressAlterView.h"
@interface DongwangDeleteaAdressAlterView ()
@property (nonatomic ,strong) UIImageView *deliverView; //底部View
@property (nonatomic ,strong) UIView *BGView; //遮罩
@end
@implementation DongwangDeleteaAdressAlterView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIView* BGView                 = [[UIView alloc] init];
        BGView.frame           = [[UIScreen mainScreen] bounds];
        BGView.userInteractionEnabled = YES;
        BGView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        BGView.opaque = NO;
        [self addSubview:BGView];
        self.BGView = BGView;
        
        UIImageView  * deliverView                 = [[UIImageView alloc] init];
        deliverView.frame           = CGRectMake(K(36), K(173)+StatuBar_Height, SCREEN_WIDTH-K(72), K(143));
        deliverView.backgroundColor = [UIColor whiteColor];
        deliverView.layer.cornerRadius = K(10);
        deliverView.layer.masksToBounds = YES;
        deliverView.userInteractionEnabled = YES;
        [self addSubview:deliverView];
        self.deliverView = deliverView;
        
        UILabel * Dongwangmsglb = [[UILabel alloc]initWithFrame:CGRectMake(0, K(44), CGRectGetWidth(deliverView.frame), K(20))];
        Dongwangmsglb.text = @"是否确定删除该地址?";
        Dongwangmsglb.textAlignment = NSTextAlignmentCenter;
        Dongwangmsglb.textColor = [UIColor blackColor];
        Dongwangmsglb.font = KBlFont(font(16));
        [deliverView addSubview:Dongwangmsglb];
        
        UIView * dongwangFirstline = [[UIView alloc]initWithFrame:CGRectMake(0, K(101), CGRectGetWidth(deliverView.frame), K(1))];
        dongwangFirstline.backgroundColor = [UIColor colorWithHexString:@"#DEDEDE"];
        [deliverView addSubview:dongwangFirstline];
        
        
        UIButton * DongwangcancleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, K(101), CGRectGetWidth(deliverView.frame)/2, K(42))];
        DongwangcancleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        DongwangcancleBtn.titleLabel.font = KBlFont(font(15));
        DongwangcancleBtn.tag = 0;
        [DongwangcancleBtn addTarget:self action:@selector(DongwangAdressAlterBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [DongwangcancleBtn setTitleColor:[UIColor colorWithHexString:@"#CB92FF"] forState:UIControlStateNormal];
        [DongwangcancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [deliverView addSubview:DongwangcancleBtn];
        
        UIButton * DongwangSureBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(deliverView.frame)/2, K(101), CGRectGetWidth(deliverView.frame)/2, K(42))];
        DongwangSureBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        DongwangSureBtn.titleLabel.font = KBlFont(font(15));
        [DongwangSureBtn setTitleColor:[UIColor colorWithHexString:@"#CB92FF"] forState:UIControlStateNormal];
        [DongwangSureBtn setTitle:@"确定" forState:UIControlStateNormal];
        DongwangSureBtn.tag = 1;
        [DongwangSureBtn addTarget:self action:@selector(DongwangAdressAlterBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [deliverView addSubview:DongwangSureBtn];

        
        UIView * dongwangSecondline = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(deliverView.frame)/2, K(101), K(1), K(42))];
        dongwangSecondline.backgroundColor = [UIColor colorWithHexString:@"#DEDEDE"];
        [deliverView addSubview:dongwangSecondline];
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
-(void)DongwangAdressAlterBtnClick:(UIButton *)alterBtn{
    if (alterBtn.tag == 0) {
        [self removeFromSuperview];
    }else{
        [self removeFromSuperview];
        [self.delegate DongwangDeleteaAdressAlterViewActions];
    }
}
@end
