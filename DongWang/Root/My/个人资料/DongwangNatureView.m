//
//  DongwangNatureView.m
//  DongWang
//
//  Created by codehzx on 2020/11/9.
//

#import "DongwangNatureView.h"
#import <UITextView+ZWPlaceHolder.h>
#import <UITextView+ZWLimitCounter.h>
@interface DongwangNatureView ()<UITextFieldDelegate>
@property (nonatomic ,strong) UIImageView *deliverView; //底部View
@property (nonatomic ,strong) UIView *BGView; //遮罩
@property (nonatomic ,strong) UITextField * NickTextField;
@property (nonatomic ,strong) UITextView * NickTextView;
@end
@implementation DongwangNatureView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIView* BGView                 = [[UIView alloc] init];
        BGView.frame           = [[UIScreen mainScreen] bounds];
        BGView.userInteractionEnabled = YES;
        BGView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        BGView.opaque = NO;
        [self addSubview:BGView];
        self.BGView = BGView;
        
        
//        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(exitClick)];
//        gesture.numberOfTapsRequired = 1;
//        gesture.cancelsTouchesInView = NO;
//        [self.BGView addGestureRecognizer:gesture];
        
        UIImageView  * deliverView                 = [[UIImageView alloc] init];
        deliverView.frame           = CGRectMake(K(39), K(174), SCREEN_WIDTH-K(78), K(250));
        deliverView.image = [UIImage imageNamed:@"签名背景"];
        deliverView.userInteractionEnabled = YES;
        [self addSubview:deliverView];
        self.deliverView = deliverView;
        
        UILabel * DongwangTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, K(7), CGRectGetWidth(deliverView.frame), K(28))];
        DongwangTitle.textAlignment = NSTextAlignmentCenter;
        DongwangTitle.textColor  = [UIColor colorWithHexString:@"#FF8C0D"];
        DongwangTitle.text =  @"修改简介";
        DongwangTitle.font = KBlFont(font(20));
        [deliverView addSubview:DongwangTitle];
        
        
//        UITextField * NickTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(14), K(51), CGRectGetWidth(deliverView.frame)-K(27), K(141))];
//        NickTextField.layer.cornerRadius = K(5);
//        NickTextField.font = KSysFont(font(13));
//        NickTextField.delegate = self;
//        NickTextField.clearButtonMode =  UITextFieldViewModeAlways;
//        NickTextField.layer.masksToBounds = YES;
//        NickTextField.attributedPlaceholder =  [[NSAttributedString alloc] initWithString:@"一句话介绍您自己，70个字以内…" attributes:@{NSFontAttributeName:KSysFont(font(12)),NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#999999"]}];
//        [NickTextField setBackgroundColor:[UIColor colorWithHexString:@"#EDEDED"]];
//        [deliverView addSubview:NickTextField];
//        _NickTextField = NickTextField;
        
        
        UIView * textViews = [[UIView alloc]initWithFrame:CGRectMake(K(14), K(51), CGRectGetWidth(deliverView.frame)-K(27), K(141))];
        textViews.backgroundColor = [UIColor colorWithHexString:@"#EDEDED"];
        textViews.layer.cornerRadius = K(5);
        textViews.layer.masksToBounds = YES;
        [deliverView addSubview:textViews];
        
        UITextView * NickTextView = [[UITextView alloc]initWithFrame:CGRectMake(K(5), K(0), CGRectGetWidth(textViews.frame)-K(10), CGRectGetHeight(textViews.frame)-K(0))];
        NickTextView.placeholder = @"一句话介绍您自己，70个字以内…";
        NickTextView.zw_placeHolderColor = [UIColor colorWithHexString:@"一句话介绍您自己，70个字以内…"];
        NickTextView.font = KSysFont(font(12));
        NickTextView.showsVerticalScrollIndicator = NO;
        NickTextView.showsHorizontalScrollIndicator = NO;
        NickTextView.backgroundColor = [UIColor colorWithHexString:@"#EDEDED"];
        [textViews addSubview:NickTextView];
        _NickTextView = NickTextView;
        
        
        UIButton * DongwangcancleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, K(205), CGRectGetWidth(deliverView.frame)/2, K(45))];
        DongwangcancleBtn.tag = 0;
        [DongwangcancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        DongwangcancleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        DongwangcancleBtn.titleLabel.font = KSysFont(15);
        [DongwangcancleBtn setTitleColor:[UIColor colorWithHexString:@"#FF9200"] forState:UIControlStateNormal];
        [DongwangcancleBtn addTarget:self action:@selector(DongwangcancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [deliverView addSubview:DongwangcancleBtn];
        
        UIButton * DongwangsureBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(deliverView.frame)/2, K(205), CGRectGetWidth(deliverView.frame)/2, K(45))];
        DongwangsureBtn.tag = 1;
        [DongwangsureBtn setTitle:@"确定" forState:UIControlStateNormal];
        DongwangsureBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        DongwangsureBtn.titleLabel.font = KSysFont(15);
        [DongwangsureBtn setTitleColor:[UIColor colorWithHexString:@"#FF9200"] forState:UIControlStateNormal];
        [DongwangsureBtn addTarget:self action:@selector(DongwangsureBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [deliverView addSubview:DongwangsureBtn];
    }
    return self;
}
-(void)DongwangcancleBtnClick{
    [self removeFromSuperview];
    [self.delegate DongwangNatureViewDidChangeWithContent:@"" btnindex:0];
}
-(void)DongwangsureBtnClick{
    [self.delegate DongwangNatureViewDidChangeWithContent:_NickTextView.text btnindex:1];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
