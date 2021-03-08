//
//  DongwangDeleAccountView.m
//  DongWang
//
//  Created by codehzx on 2020/11/10.
//

#import "DongwangDeleAccountView.h"
@interface DongwangDeleAccountView ()
@property (nonatomic ,strong) UIView *deliverView; //底部View
@property (nonatomic ,strong) UIView *BGView; //遮罩
@end
@implementation DongwangDeleAccountView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    
//        UIView* BGView                 = [[UIView alloc] init];
//        BGView.frame           = [[UIScreen mainScreen] bounds];
//        BGView.userInteractionEnabled = YES;
//        BGView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
//        BGView.opaque = NO;
//        [self addSubview:BGView];
//        self.BGView = BGView;
        
        UIView * deliverView = [[UIView alloc]initWithFrame:CGRectMake(K(39), K(184), SCREEN_WIDTH-K(78), K(188.5))];
        deliverView.backgroundColor = [UIColor whiteColor];
        deliverView.layer.cornerRadius = K(5);
        deliverView.layer.masksToBounds = YES;
        [self addSubview:deliverView];
        _deliverView  = deliverView;
        
        
        UIImageView * dongangbeiImgView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.frame)/2-K(52.75), CGRectGetMinY(deliverView.frame)-K(52.75), K(105.5), K(105.5))];
        dongangbeiImgView.image = [UIImage imageNamed:@"注销背景"];
        [self addSubview:dongangbeiImgView];
        
        
        UILabel * DongwangMsgllb = [[UILabel alloc]initWithFrame:CGRectMake(0, K(61), CGRectGetWidth(deliverView.frame), K(28))];
        DongwangMsgllb.textColor = [UIColor colorWithHexString:@"#8767E9"];
        DongwangMsgllb.font = KBlFont(font(20));
        DongwangMsgllb.text = @"账户注销申请提交成功";
        DongwangMsgllb.textAlignment = NSTextAlignmentCenter;
        [deliverView addSubview:DongwangMsgllb];
        
        
        UILabel * DongwangDetailMsgllb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangMsgllb.frame)+K(14.5), CGRectGetWidth(deliverView.frame), K(14))];
        DongwangDetailMsgllb.textColor = [UIColor colorWithHexString:@"#999999"];
        DongwangDetailMsgllb.font = KSysFont(font(12));
        DongwangDetailMsgllb.text = @"3个工作日内将进行人工审核";
        DongwangDetailMsgllb.textAlignment = NSTextAlignmentCenter;
        [deliverView addSubview:DongwangDetailMsgllb];
        
        UIView * Dongwangline = [[UIView alloc]initWithFrame:CGRectMake(0, K(145), CGRectGetWidth(deliverView.frame), K(1))];
        Dongwangline.backgroundColor =  LGDLightGaryColor;
        [deliverView addSubview:Dongwangline];
        
        UIButton * DongwangSureBtn =  [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(Dongwangline.frame), CGRectGetWidth(deliverView.frame), K(40))];
        [DongwangSureBtn setTitle:@"确定" forState:UIControlStateNormal];
        DongwangSureBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [DongwangSureBtn setTitleColor:[UIColor colorWithHexString:@"#8767E9"] forState:UIControlStateNormal];
        DongwangSureBtn.titleLabel.font = KSysFont(font(14));
        [DongwangSureBtn addTarget:self action:@selector(DongwangSureBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [deliverView addSubview:DongwangSureBtn];
        
        
    }
    return self;
}
-(void)DongwangSureBtnClick{
    [self.delegate DongwangDeleAccountViewDeleScuued];
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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
