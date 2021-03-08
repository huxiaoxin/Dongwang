//
//  DongwangNickView.m
//  DongWang
//
//  Created by codehzx on 2020/11/9.
//

#import "DongwangNickView.h"
@interface DongwangNickView ()<UITextFieldDelegate>
@property (nonatomic ,strong) UIImageView *deliverView; //底部View
@property (nonatomic ,strong) UIView *BGView; //遮罩
@property (nonatomic ,strong) UITextField * NickTextField;
@end
@implementation DongwangNickView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIView* BGView                 = [[UIView alloc] init];
        BGView.frame           = [[UIScreen mainScreen] bounds];
        BGView.userInteractionEnabled = YES;
        BGView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        BGView.opaque = NO;
//        [self addSubview:BGView];
//        self.BGView = BGView;
//
  
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(exitClick)];
        gesture.numberOfTapsRequired = 1;
        gesture.cancelsTouchesInView = NO;
//        [self.BGView addGestureRecognizer:gesture];
        
        UIImageView  * deliverView                 = [[UIImageView alloc] init];
        deliverView.frame           = CGRectMake(K(39), K(224), SCREEN_WIDTH-K(78), K(153.5));
        deliverView.layer.cornerRadius = RealWidth(20);
        deliverView.layer.masksToBounds = YES;
//        deliverView.image = [UIImage imageNamed:@"nickicon"];
        deliverView.userInteractionEnabled = YES;
        deliverView.backgroundColor = [UIColor whiteColor];
        [self addSubview:deliverView];
        self.deliverView = deliverView;
        
        UIImageView * dongwangnickTopImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(deliverView.frame), RealWidth(44))];
        dongwangnickTopImgView.image = [UIImage imageNamed:@"nickicons"];
        [deliverView addSubview:dongwangnickTopImgView];
        
        
        
      
        
        UILabel * DongwangTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, K(7), CGRectGetWidth(deliverView.frame), K(28))];
        DongwangTitle.textAlignment = NSTextAlignmentCenter;
        DongwangTitle.textColor  = [UIColor whiteColor];
        DongwangTitle.text =  @"修改昵称";
        DongwangTitle.font = KBlFont(font(20));
        [deliverView addSubview:DongwangTitle];
        
        
        
        UIView * NickTextView = [[UIView alloc]initWithFrame:CGRectMake(K(14), K(58), CGRectGetWidth(deliverView.frame)-K(27), K(35))];
        NickTextView.backgroundColor = [UIColor colorWithHexString:@"#EDEDED"];
        NickTextView.layer.cornerRadius = K(5);
        NickTextView.layer.masksToBounds = YES;
        [deliverView addSubview:NickTextView];
        
        
        
        UITextField * NickTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(5), K(0), CGRectGetWidth(NickTextView.frame)-K(10), K(35))];
        NickTextField.layer.cornerRadius = K(5);
        NickTextField.font = KSysFont(font(13));
        NickTextField.delegate = self;
        NickTextField.clearButtonMode =  UITextFieldViewModeAlways;
        NickTextField.layer.masksToBounds = YES;
        NickTextField.attributedPlaceholder =  [[NSAttributedString alloc] initWithString:@"30个字符以内，支持中英文，数字" attributes:@{NSFontAttributeName:KSysFont(font(12)),NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#999999"]}];
        [NickTextView addSubview:NickTextField];
        _NickTextField = NickTextField;
        [NickTextField becomeFirstResponder];
        
        
        UIView * Firstline = [[UIView alloc]initWithFrame:CGRectMake(0, K(108), CGRectGetWidth(deliverView.frame), K(1))];
        Firstline.backgroundColor =  [UIColor colorWithHexString:@"#DEDEDE"];
        [deliverView addSubview:Firstline];
        
        UIView * Secondline = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(deliverView.frame)/2, K(108), K(1), K(45))];
        Secondline.backgroundColor =  [UIColor colorWithHexString:@"#DEDEDE"];
        [deliverView addSubview:Secondline];
        
        UIButton * DongwangcancleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, K(109), CGRectGetWidth(deliverView.frame)/2, K(45))];
        DongwangcancleBtn.tag = 0;
        [DongwangcancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        DongwangcancleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        DongwangcancleBtn.titleLabel.font = KSysFont(15);
        [DongwangcancleBtn setTitleColor:[UIColor colorWithHexString:@"#CB92FF"] forState:UIControlStateNormal];
        [DongwangcancleBtn addTarget:self action:@selector(DongwangcancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [deliverView addSubview:DongwangcancleBtn];
        
        UIButton * DongwangsureBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(deliverView.frame)/2, K(109), CGRectGetWidth(deliverView.frame)/2, K(45))];
        DongwangsureBtn.tag = 1;
        [DongwangsureBtn setTitle:@"确定" forState:UIControlStateNormal];
        DongwangsureBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        DongwangsureBtn.titleLabel.font = KSysFont(15);
        [DongwangsureBtn setTitleColor:[UIColor colorWithHexString:@"#CB92FF"] forState:UIControlStateNormal];
        [DongwangsureBtn addTarget:self action:@selector(DongwangsureBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [deliverView addSubview:DongwangsureBtn];

        
    }
    return self;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField == _NickTextField) {
    //这里的if时候为了获取删除操作,如果没有次if会造成当达到字数限制后删除键也不能使用的后果.
        if (range.length == 1 && string.length == 0) {
            return YES;
        }
        //so easy
        else if (_NickTextField.text.length >= 30) {
            _NickTextField.text = [textField.text substringToIndex:30];
            return NO;
        }
    }
    return YES;
}
-(void)DongwangcancleBtnClick{
    [self removeFromSuperview];
    [self.delegate DongwangNickViewWithContentIndex:0 ContentText:@""];

}
-(void)DongwangsureBtnClick{
    [self.delegate DongwangNickViewWithContentIndex:1 ContentText:_NickTextField.text];
    _NickTextField.text = nil;
    
}
-(void)exitClick{
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
@end
