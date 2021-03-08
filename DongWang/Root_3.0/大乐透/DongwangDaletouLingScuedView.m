//
//  DongwangDaletouLingScuedView.m
//  DongWang
//
//  Created by sycm on 2021/2/24.
//

#import "DongwangDaletouLingScuedView.h"

@interface DongwangDaletouLingScuedView ()

@property (nonatomic ,strong) UIView *deliverView; //底部View

@end
@implementation DongwangDaletouLingScuedView
-(instancetype)initWithFrame:(CGRect)frame WithExprieStr:(NSString *)exprStr{
    if (self = [super initWithFrame:frame]) {
        //lingquhongbao
        //lijilingwubtn
        //quxiao
        //dalroubeij
        
        UIImageView  * deliverView                 = [[UIImageView alloc] init];
        deliverView.frame           = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        deliverView.userInteractionEnabled = YES;
        deliverView.backgroundColor = [UIColor clearColor];
        deliverView.image = [UIImage imageNamed:@"dalroubeij"];
        [self addSubview:deliverView];
        self.deliverView = deliverView;
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0,RealWidth(131)+StatuBar_Height,SCREEN_WIDTH,RealWidth(49));
        label.numberOfLines = 0;
        [deliverView addSubview:label];

        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"恭喜您"attributes: @{NSFontAttributeName: PFS40Font,NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:1/255.0 blue:59/255.0 alpha:1.0], NSStrokeWidthAttributeName:@-5,NSStrokeColorAttributeName: [UIColor colorWithRed:255/255.0 green:192/255.0 blue:158/255.0 alpha:1.0]}];

        label.attributedText = string;
        label.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.alpha = 1.0;

        
        UIImage * imgNames = [UIImage imageNamed:@"lingquhongbao"];
        UIImageView * gongxiImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-imgNames.size.width/2, StatuBar_Height+RealWidth(40), imgNames.size.width, imgNames.size.height)];
        
        gongxiImgView.image = imgNames;
        [deliverView addSubview:gongxiImgView];
        
        
        UIButton * lingquBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-RealWidth(191/2), CGRectGetMaxY(gongxiImgView.frame)+RealWidth(10), RealWidth(191), RealWidth(48))];
        [lingquBtn addTarget:self action:@selector(lingquBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [lingquBtn setBackgroundImage:[UIImage imageNamed:@"lijilingwubtn"] forState:UIControlStateNormal];
        [deliverView addSubview:lingquBtn];
        
        UIButton * chaBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-RealWidth(47/2), CGRectGetMaxY(lingquBtn.frame)+RealWidth(42), RealWidth(47), RealWidth(47))];
        [chaBtn addTarget:self action:@selector(quxiaobtnClicks) forControlEvents:UIControlEventTouchUpInside];
        [chaBtn setBackgroundImage:[UIImage imageNamed:@"quxiao"] forState:UIControlStateNormal];
        [deliverView addSubview:chaBtn];

        
        UILabel * deeplb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.frame)-SafeAreaBottom_Height-RealWidth(20), SCREEN_WIDTH, RealWidth(15))];
        deeplb.textAlignment = NSTextAlignmentCenter;
        deeplb.textColor = [UIColor colorWithHexString:@"#666666"];
        deeplb.font =PFS13Font;
        [deliverView addSubview:deeplb];
        deeplb.text = [NSString stringWithFormat:@"%@天领取有效",exprStr];
        
        
    }
    return self;
}
//立即领取
-(void)lingquBtnClick{
    [self removeFromSuperview];
    [self.delegate DongwangDaletouLingScuedViewLingequ];
}
#pragma mar--关闭
-(void)quxiaobtnClicks{
    [self removeFromSuperview];
    [self.delegate DongwangDaletouLingClouseView];
}
-(void)Show{
    self.backgroundColor = [UIColor clearColor];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    self.deliverView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.2,0.2);
    self.deliverView.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
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
