//
//  DongwangSigninSuccedView.m
//  DongWang
//
//  Created by codehzx on 2020/11/30.
//

#import "DongwangSigninSuccedView.h"
#import <WebKit/WebKit.h>
@interface DongwangSigninSuccedView ()
@property (nonatomic ,strong) UIImageView *deliverView; //底部View
@property(nonatomic,assign) NSInteger type;
@end
@implementation DongwangSigninSuccedView
-(instancetype)initWithFrame:(CGRect)frame QiandaoWithDic:(NSDictionary *)dic{
    if (self = [super initWithFrame:frame]) {

        UIImageView  * deliverView                 = [[UIImageView alloc] init];
        deliverView.frame           = CGRectMake(K(47.5), K(170.5)+StatuBar_Height, SCREEN_WIDTH-K(85), K(279));
        deliverView.image = [UIImage imageNamed:@"签到成功-1"];
        deliverView.userInteractionEnabled = YES;
        [self addSubview:deliverView];
        self.deliverView = deliverView;
        
        NSString  * singSuccessMsg = [dic objectForKey:@"singSuccessMsg"];
        UILabel * DongwangToplb = [[UILabel alloc]initWithFrame:CGRectMake(0, K(100), CGRectGetWidth(deliverView.frame), K(15))];
        DongwangToplb.textAlignment = NSTextAlignmentCenter;
        DongwangToplb.font = KBlFont(font(15));
        DongwangToplb.textColor =  LGDBLackColor;
        DongwangToplb.text = singSuccessMsg.length == 0 ? @"签到成功" : singSuccessMsg;
//        [deliverView addSubview:DongwangToplb];
                
        UILabel * ContentLb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangToplb.frame)+K(55), CGRectGetWidth(deliverView.frame), K(0))];
        ContentLb.numberOfLines = 0;
//        ContentLb.backgroundColor = LGDMianColor;
        ContentLb.font = KSysFont(font(13));
        ContentLb.textColor =  LGDBLackColor;
        [deliverView addSubview:ContentLb];
        NSString  * singSuccessText = [dic objectForKey:@"singSuccessText"];
        
//        NSLog(@"-----%@",singSuccessText);
//       NSString * singSuccessText = @"<p style=\"text-align:center;\">\n\t连续签到3天,积分+2 \n</p>\n<p style\"text-align:center;\">\n\t可额外获得一次翻牌机会\n</p>";
        
        
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.alignment = NSTextAlignmentCenter;
        [paragraph setLineSpacing:K(10)];
        NSMutableAttributedString * attrString = [[NSMutableAttributedString alloc] initWithData:[singSuccessText dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
        [attrString addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, attrString.string.length)];
        ContentLb.attributedText = attrString;
        
        NSMutableAttributedString *htmlString =[[NSMutableAttributedString alloc] initWithData:[singSuccessText dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute:[NSNumber numberWithInt:NSUTF8StringEncoding]} documentAttributes:NULL error:nil];
        [htmlString addAttributes:@{NSFontAttributeName:KSysFont(font(13))} range:NSMakeRange(0, htmlString.length)];
        CGSize textSize = [htmlString boundingRectWithSize:(CGSize){CGRectGetWidth(deliverView.frame), CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
        ContentLb.height = textSize.height;
        
        


        // "flipCard": "0",//是否翻牌,0代表不翻牌,1代表翻牌
        NSString * flipCard = [dic objectForKey:@"flipCard"];
        self.type = [flipCard integerValue];
        UIButton * DongwangBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(deliverView.frame)/2-K(85), CGRectGetMaxY(ContentLb.frame), K(170), K(40))];
        DongwangBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [DongwangBtn setTitleColor:[UIColor colorWithHexString:@"#FF7240"] forState:UIControlStateNormal];
        DongwangBtn.layer.cornerRadius = K(20);
        DongwangBtn.layer.masksToBounds = YES;
        [DongwangBtn addTarget:self action:@selector(DongwangBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [DongwangBtn setTitle:[flipCard intValue] == 0 ? @"确定" : @"去翻牌" forState:UIControlStateNormal];
        [DongwangBtn setBackgroundImage:[UIImage imageNamed:@"确定"] forState:UIControlStateNormal];
//        [DongwangBtn setBackgroundColor:[UIColor colorWithHexString:@"#FFDB00"]];
        [deliverView addSubview:DongwangBtn];
        deliverView.height = CGRectGetMaxY(DongwangBtn.frame)+K(15+15);
        
    }
    return self;
}
-(void)DongwangBtnClick{
    [self removeFromSuperview];
    [self.delegate DongwangSigninSuccedViewBtnDidSeltecdWithtype:self.type];
}
-(void)show{
    self.backgroundColor = [UIColor clearColor];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    self.deliverView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.2,0.2);
    self.deliverView.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.8f];
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

