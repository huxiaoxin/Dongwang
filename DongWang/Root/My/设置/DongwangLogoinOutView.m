//
//  DongwangLogoinOutView.m
//  DongWang
//
//  Created by codehzx on 2020/11/25.
//

#import "DongwangLogoinOutView.h"
@interface DongwangLogoinOutView ()
@property (nonatomic ,strong) UIView *deliverView; //底部View
@property (nonatomic ,strong) UIView *BGView; //遮罩
@end
@implementation DongwangLogoinOutView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIView * deliverView = [[UIView alloc]initWithFrame:CGRectMake(K(39), K(172)+StatuBar_Height, SCREEN_WIDTH-K(78), K(153.5))];
        deliverView.backgroundColor = [UIColor whiteColor];
        deliverView.layer.cornerRadius = K(12);
        deliverView.layer.masksToBounds = YES;
        [self addSubview:deliverView];
        _deliverView = deliverView;
        
        
        UILabel * Dongwangmsglb = [[UILabel alloc]initWithFrame:CGRectMake(0, K(48.5), CGRectGetWidth(deliverView.frame), K(21))];
        Dongwangmsglb.textAlignment = NSTextAlignmentCenter;
        Dongwangmsglb.textColor = LGDBLackColor;
        Dongwangmsglb.font = KSysFont(font(15));
        Dongwangmsglb.text = @"是否确认退出账号?";
        [deliverView addSubview:Dongwangmsglb];
        
        UIView * dongwangFirstline = [[UIView alloc]initWithFrame:CGRectMake(0, K(108), CGRectGetWidth(deliverView.frame), K(1))];
        dongwangFirstline.backgroundColor = [UIColor colorWithHexString:@"#DEDEDE"];
        [deliverView addSubview:dongwangFirstline];
        
        
        
        UIButton * DongwangSureBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(dongwangFirstline.frame), CGRectGetWidth(deliverView.frame)/2, K(44.5))];
        DongwangSureBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [DongwangSureBtn setTitleColor:[UIColor colorWithHexString:@"#8767E9"] forState:UIControlStateNormal];
        DongwangSureBtn.titleLabel.font = KBlFont(font(15));
        DongwangSureBtn.tag = 0;
        [DongwangSureBtn addTarget:self action:@selector(DongwangSureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [DongwangSureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [deliverView addSubview:DongwangSureBtn];
        
        UIButton * DongwangThinkBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(deliverView.frame)/2, CGRectGetMaxY(dongwangFirstline.frame), CGRectGetWidth(deliverView.frame)/2, K(44.5))];
        DongwangThinkBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [DongwangThinkBtn setTitleColor:[UIColor colorWithHexString:@"#8767E9"] forState:UIControlStateNormal];
        DongwangThinkBtn.titleLabel.font = KBlFont(font(15));
        DongwangThinkBtn.tag = 1;
        [DongwangThinkBtn addTarget:self action:@selector(DongwangSureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [DongwangThinkBtn setTitle:@"手抖了，再看看" forState:UIControlStateNormal];
        [deliverView addSubview:DongwangThinkBtn];

        
        
        UIView * dongwangSecondline = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(deliverView.frame)/2, K(108), K(1), K(44.5))];
        dongwangSecondline.backgroundColor = [UIColor colorWithHexString:@"#DEDEDE"];
        [deliverView addSubview:dongwangSecondline];

        
    }
    return self;
}
-(void)DongwangSureBtnClick:(UIButton *)dongwangBtn{
    [self.delegate DongwangLogoinOutViewlogintouViewWithBtnIndex:dongwangBtn.tag];
    [self removeFromSuperview];
    
    
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
