//
//  DongwangDuihuanAlterView.m
//  DongWang
//
//  Created by codehzx on 2020/12/14.
//

#import "DongwangDuihuanAlterView.h"
@interface DongwangDuihuanAlterView ()
@property (nonatomic ,strong) UIView *deliverView; //底部View
@property(nonatomic,strong) NSString * type;
@end
@implementation DongwangDuihuanAlterView
-(instancetype)initWithFrame:(CGRect)frame withinfoMsg:(NSString *)infoStr ViewType:(NSString *)type{
    if (self = [super initWithFrame:frame]) {
        
        self.type = type;
        UIImageView  * deliverView                 = [[UIImageView alloc] init];
        deliverView.frame           = CGRectMake(K(48), K(224)+StatuBar_Height, SCREEN_WIDTH-K(96), K(211));
        deliverView.userInteractionEnabled = YES;
        deliverView.backgroundColor = [UIColor whiteColor];
        deliverView.layer.cornerRadius = K(8);
        deliverView.layer.masksToBounds = YES;
        [self addSubview:deliverView];
        self.deliverView = deliverView;

        UILabel * DongwangToplb = [[UILabel alloc]initWithFrame:CGRectMake(0, K(40), CGRectGetWidth(deliverView.frame), K(20))];
        DongwangToplb.textAlignment = NSTextAlignmentCenter;
        DongwangToplb.font =  KBlFont(font(20));
        DongwangToplb.text  =@"温馨提示";
        DongwangToplb.textColor = [UIColor colorWithHexString:@"#333333"];
        [deliverView addSubview:DongwangToplb];
        
        
        UILabel * DongwangMsglb  =[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangToplb.frame)+K(10), CGRectGetWidth(deliverView.frame), K(41))];
        DongwangMsglb.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangMsglb.font = KSysFont(font(16));
        DongwangMsglb.numberOfLines = 0;
        DongwangMsglb.textAlignment =  NSTextAlignmentCenter;
        DongwangMsglb.text = infoStr;
        [deliverView addSubview:DongwangMsglb];
        
        
        
        UIView * topline =  [[UIView alloc]initWithFrame:CGRectMake(0, K(149), CGRectGetWidth(deliverView.frame), K(1))];
        topline.backgroundColor = [UIColor colorWithHexString:@"#DEDEDE"];
        [deliverView addSubview:topline];
        
        
        UIView * verline =  [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(deliverView.frame)/2, CGRectGetMaxY(topline.frame), K(1), K(61))];
        verline.backgroundColor = [UIColor colorWithHexString:@"#DEDEDE"];
        [deliverView addSubview:verline];

        
        
        UIButton * cancleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topline.frame), CGRectGetWidth(deliverView.frame)/2, K(61))];
        cancleBtn.tag = 0;
        cancleBtn.titleLabel.font = KSysFont(font(16));
        cancleBtn.titleLabel.textAlignment =  NSTextAlignmentCenter;
        [cancleBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [cancleBtn addTarget:self action:@selector(DongwangAlterBtbClick:) forControlEvents:UIControlEventTouchUpInside];
        [deliverView addSubview:cancleBtn];
        
        
        UIButton * sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(deliverView.frame)/2, CGRectGetMaxY(topline.frame), CGRectGetWidth(deliverView.frame)/2, K(61))];
        sureBtn.tag = 1;
        sureBtn.titleLabel.font = KSysFont(font(16));
        sureBtn.titleLabel.textAlignment =  NSTextAlignmentCenter;
        [sureBtn setTitleColor:[UIColor colorWithHexString:@"#8767E9"] forState:UIControlStateNormal];
        [sureBtn addTarget:self action:@selector(DongwangAlterBtbClick:) forControlEvents:UIControlEventTouchUpInside];
        [deliverView addSubview:sureBtn];
        [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [sureBtn setTitle:@"兑换" forState:UIControlStateNormal];
        
        
        
        
        
    }
    return self;
}
-(void)DongwangAlterBtbClick:(UIButton *)alterBtn{
    
    [self removeFromSuperview];
    
    [self.delegate DongwangDuihuanAlterViewBtnAcctionWithBtnIndex:alterBtn.tag AlterType:self.type];
    
//    [self.delegate DongwangDuihuanAlterViewBtnAcctionWithBtnIndex:alterBtn.tag];
    
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
