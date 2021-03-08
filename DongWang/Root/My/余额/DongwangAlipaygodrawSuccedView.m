//
//  DongwangAlipaygodrawSuccedView.m
//  DongWang
//
//  Created by codehzx on 2020/11/24.
//

#import "DongwangAlipaygodrawSuccedView.h"
#import <WebKit/WebKit.h>
@interface DongwangAlipaygodrawSuccedView ()<WKNavigationDelegate>
@property (nonatomic ,strong) UIImageView *deliverView; //底部View
@property(nonatomic,assign) CGFloat scrollWidth;
@property(nonatomic,assign) WKWebView * wkweb;
@property(nonatomic,assign) CGFloat webHeightNum;
@property (nonatomic, assign) CGFloat webHeight;

@property (nonatomic, strong)UILabel * DongwangToplb;
@property (nonatomic, strong) UIImageView * dongwangBtomImgView;
@end
@implementation DongwangAlipaygodrawSuccedView
-(instancetype)initWithFrame:(CGRect)frame message:(NSDictionary *)msgDic{
    if (self = [super initWithFrame:frame]) {
        _webHeight = 100;
      //提现支付宝弹窗
        UIImageView  * deliverView                 = [[UIImageView alloc] init];
        deliverView.frame           = CGRectMake(K(39), K(65.5)+kStatusBarHeight, SCREEN_WIDTH-K(78), K(287.5+67));
        deliverView.userInteractionEnabled = YES;
        [self addSubview:deliverView];
        self.deliverView = deliverView;
        
        UIImageView * dongwangBtomImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, K(60), K(297), K(287.5))];
        dongwangBtomImgView.image = [UIImage imageNamed:@"提现支付宝弹窗"];
        dongwangBtomImgView.userInteractionEnabled = YES;
        [deliverView addSubview:dongwangBtomImgView];
        _dongwangBtomImgView = dongwangBtomImgView;
        
        
        UIImageView * dongwangTopImgView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(deliverView.frame)/2-K(71.425), 0, K(142.85), K(111.53))];
        dongwangTopImgView.image = [UIImage imageNamed:@"提现顶部背景"];
        [deliverView addSubview:dongwangTopImgView];
        
        NSString * tip = [msgDic objectForKey:@"tip"];
        
        NSString * message = [msgDic objectForKey:@"message"];
        

        
        UILabel * DongwangToplb = [[UILabel alloc]initWithFrame:CGRectMake(0, K(106), CGRectGetWidth(dongwangBtomImgView.frame), K(28))];
        DongwangToplb.textAlignment = NSTextAlignmentCenter;
        DongwangToplb.textColor = [UIColor colorWithHexString:@"#FF920D"];
        DongwangToplb.font = KBlFont(font(20));
        DongwangToplb.text =  tip;
        [dongwangBtomImgView addSubview:DongwangToplb];
        _DongwangToplb = DongwangToplb;
        
        NSAttributedString *attStr = [[NSAttributedString alloc] initWithData:[message dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
        UILabel * DongwangContentlb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(10), RealWidth(0)+CGRectGetMaxY(DongwangToplb.frame), CGRectGetWidth(dongwangBtomImgView.frame)-RealWidth(15), RealWidth(60))];
        DongwangContentlb.numberOfLines = 0;
        DongwangContentlb.font = PFR11Font;
        DongwangContentlb.textColor = [UIColor colorWithHexString:@"#333333"];
        [dongwangBtomImgView addSubview:DongwangContentlb];
        DongwangContentlb.attributedText = attStr;
        DongwangContentlb.textAlignment = NSTextAlignmentCenter;
        UIButton * DongwangSureBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(84), K(219), K(129), K(36))];
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

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    //修改字体大小 300%
    [ webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '250%'" completionHandler:nil];
//    //修改字体颜色
    [ webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= '#333333'" completionHandler:nil];
    
}
-(void)DongwangSureBtnClick{
    
    MJWeakSelf;
    [UIView animateWithDuration:0.4 animations:^{
        weakSelf.deliverView.alpha = 0.01;
        [weakSelf removeFromSuperview];
    }];
    [self.deleate DongwangAlipaygodrawSuccedViewSured];
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
