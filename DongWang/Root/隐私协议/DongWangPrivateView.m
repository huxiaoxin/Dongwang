//
//  DongWangPrivateView.m
//  DongWang
//
//  Created by codehzx on 2020/10/20.
//

#import "DongWangPrivateView.h"
#import <POP.h>
#import "YYText.h"

@interface DongWangPrivateView ()
@property(nonatomic,strong) UIView * WhiteView;
@property(nonatomic,strong) UIView * bjView;
@property (nonatomic , strong)   YYLabel *yyLabel;

@end
@implementation DongWangPrivateView
-(void)show:(DongwangBaseViewController *)Vc{
    self.backgroundColor = [UIColor clearColor];
    [Vc.view addSubview:self];
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    self.WhiteView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.2,0.2);
    self.WhiteView.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.4f];
        self.WhiteView.transform = transform;
        self.WhiteView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];

}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    
        UIView * bjView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        bjView.backgroundColor = LGDBLackColor;
        bjView.userInteractionEnabled = NO;
        [self addSubview:bjView];
        _bjView = bjView;
        
        [UIView animateWithDuration:0.3f animations:^{
            bjView.alpha = 0.25f;
        }];

        UIView * WhiteView = [[UIView alloc]initWithFrame:CGRectMake(K(50),kHeight(126)+StatuBar_Height, kWidth(279), K(320))];
        WhiteView.backgroundColor = [UIColor whiteColor];
        WhiteView.layer.cornerRadius =  K(12);
        WhiteView.userInteractionEnabled = YES;
        WhiteView.layer.masksToBounds = YES;
        [self addSubview:WhiteView];
        _WhiteView = WhiteView;
        
        
        UILabel * PrviteTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, kHeight(24  ), CGRectGetWidth(WhiteView.frame), kHeight(28))];
        PrviteTitle.textAlignment = NSTextAlignmentCenter;
        PrviteTitle.textColor = LGDBLackColor;
        PrviteTitle.font = KBlFont(20);
        PrviteTitle.text = @"懂王隐私政策";
        [WhiteView addSubview:PrviteTitle];
        
    NSString  * PrviteText = @"感谢您下载并使用懂王！我们非常重视您的个人信息和隐私保护。为了更好的保护您的权益，请您认真阅读《隐私政策》的全部内容，如您同意并接受全部条款，请点击下方”同意“按钮并开始使用我们的产品和服务。";
        _yyLabel = [[YYLabel alloc]initWithFrame:CGRectMake(kWidth(16), CGRectGetMaxY(PrviteTitle.frame)+kHeight(22), CGRectGetWidth(WhiteView.frame)-kWidth(32), kHeight(0))];
        _yyLabel.font   = KSysFont(16);
        _yyLabel.numberOfLines = 0;
        
        [WhiteView addSubview:_yyLabel];
        _yyLabel.height = [self getMessageHeight:PrviteText andLabel:_yyLabel];
        [self protocolIsSelect:NO];


        
//         POPBasicAnimation  *alpha = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
//         alpha.toValue             = @(1.f);
//         alpha.duration            = 0.3f;
//         [WhiteView pop_addAnimation:alpha forKey:nil];
//
//        POPSpringAnimation *scale = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
//         scale.fromValue           = [NSValue valueWithCGSize:CGSizeMake(1.25f, 1.25f)];
//         scale.toValue             = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
//         scale.dynamicsTension     = 1000;
//         scale.dynamicsMass        = 1.3;
//         scale.dynamicsFriction    = 10.3;
//         scale.springSpeed         = 20;
//         scale.springBounciness    = 15.64;
//         scale.delegate            = self;
//         [WhiteView.layer pop_addAnimation:scale forKey:nil];
        
        UIView * botmline = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_yyLabel.frame)+kHeight(43), CGRectGetWidth(WhiteView.frame), K(0.5))];
        botmline.backgroundColor = [UIColor colorWithHexString:@"#DEDEDE"];
        [WhiteView addSubview:botmline];
        
        UIView * verbotmline = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(WhiteView.frame)/2, CGRectGetMaxY(botmline.frame)+K(0), K(1), kHeight(62))];
        verbotmline.backgroundColor = [UIColor colorWithHexString:@"#DEDEDE"];
        [WhiteView addSubview:verbotmline];
        WhiteView.height = CGRectGetMaxY(verbotmline.frame)+K(0);
        
        
        UIButton * RejrectBtn  =[[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(botmline.frame), CGRectGetWidth(WhiteView.frame)/2, kHeight(62))];
        [RejrectBtn setTitle:@"拒绝" forState:UIControlStateNormal];
        [RejrectBtn setTitleColor:LGDLightBLackColor forState:UIControlStateNormal];
        RejrectBtn.titleLabel.textAlignment =  NSTextAlignmentCenter;
        RejrectBtn.tag = 0;
        [RejrectBtn addTarget:self action:@selector(TypeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        RejrectBtn addTarget:self action:@selector(RejrectBtn) forControlEvents:/
        RejrectBtn.titleLabel.font = KBlFont(16);
        RejrectBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [WhiteView addSubview:RejrectBtn];

        
        UIButton * AgreeBtn  =[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(WhiteView.frame)/2, CGRectGetMaxY(botmline.frame), CGRectGetWidth(WhiteView.frame)/2, kHeight(62))];
        [AgreeBtn setTitle:@"同意" forState:UIControlStateNormal];
        AgreeBtn.tag = 1;
        [AgreeBtn addTarget:self action:@selector(TypeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [AgreeBtn setTitleColor:[UIColor colorWithHexString:@"#FFB400"] forState:UIControlStateNormal];
        AgreeBtn.titleLabel.textAlignment =  NSTextAlignmentCenter;
        AgreeBtn.titleLabel.font = KBlFont(16);
        AgreeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [WhiteView addSubview:AgreeBtn];


        
        
    }
    return self;
}
/**
 *  获取lb的高度（默认字体13，行间距8，lb宽ScreenWidth-100）
 *  @param mess lb.text
 *  @param lb (YYLabel *)label
 *  @return lb的高度
 */
-(CGFloat)getMessageHeight:(NSString *)mess andLabel:(YYLabel *)lb
{
    NSMutableAttributedString *introText = [[NSMutableAttributedString alloc] initWithString:mess];
    introText.yy_font = KSysFont(16);
    introText.yy_lineSpacing = K(8);
    lb.attributedText = introText;
    CGSize introSize = CGSizeMake(CGRectGetWidth(_WhiteView.frame)-kWidth(32), CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:introSize text:introText];
    lb.textLayout = layout;
    CGFloat introHeight = layout.textBoundingSize.height;
    return introHeight;
}
- (void)protocolIsSelect:(BOOL)isSelect{
    NSString  * PrviteText = @"感谢您下载并使用懂王！我们非常重视您的个人信息和隐私保护。为了更好的保护您的权益，请您认真阅读《隐私政策》的全部内容，如您同意并接受全部条款，请点击下方”同意“按钮并开始使用我们的产品和服务。";
    //设置整段字符串的颜色
    NSDictionary *attributes = @{NSFontAttributeName:KSysFont(16), NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#333333"]};
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:PrviteText attributes:attributes];
    //设置高亮色和点击事件
    MJWeakSelf;
    [text yy_setTextHighlightRange:[[text string] rangeOfString:@"《隐私政策》"] color:[UIColor colorWithHexString:@"#047FFE"] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        
        [weakSelf.delegate DongWangPrivateViewPushToWeb];
    }];
    text.yy_lineSpacing = K(8);
    _yyLabel.attributedText = text;
    //居中显示一定要放在这里，放在viewDidLoad不起作用
    _yyLabel.textAlignment = NSTextAlignmentCenter;

}

-(void)TypeBtnClick:(UIButton *)typeBtn{
    [self.delegate DongWangPrivateViewDidSeltecdWithBtnIndex:typeBtn.tag];
}



- (void)removeViews {
    MJWeakSelf;
    [UIView animateWithDuration:0.2f animations:^{
        weakSelf.bjView.alpha       = 0.f;
        weakSelf.WhiteView.alpha     = 0.f;
        weakSelf.WhiteView.transform = CGAffineTransformMakeScale(0.75f, 0.75f);
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
        exit(0);
    }];
}


@end
