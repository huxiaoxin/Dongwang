//
//  DongwangSigningQiandaoFooterView.m
//  DongWang
//
//  Created by codehzx on 2020/11/30.
//

#import "DongwangSigningQiandaoFooterView.h"
#import <WebKit/WebKit.h>
@interface DongwangSigningQiandaoFooterView ()<WKNavigationDelegate>
{
    WKWebView * _webView;
    UILabel * _ContentLb;
    UIView * _DongwangContenView;
}
@end
@implementation DongwangSigningQiandaoFooterView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

        
        UIImageView * DongwangContenView = [[UIImageView alloc]initWithFrame:CGRectMake(K(12), 0, SCREEN_Width-K(10), K(0))];
        DongwangContenView.image = [UIImage imageNamed:@"签到规则背景"];
//        DongwangContenView.backgroundColor = [UIColor colorWithHexString:@"#876BBC"];
//        DongwangContenView.layer.cornerRadius = K(10);
//        DongwangContenView.layer.masksToBounds = YES;
        [self addSubview:DongwangContenView];
        
        _DongwangContenView = DongwangContenView;
      
        
        WKWebViewConfiguration * webConfiger = [[WKWebViewConfiguration alloc]init];
        WKWebView * webView = [[WKWebView alloc]initWithFrame:CGRectMake(K(5), K(10), CGRectGetWidth(DongwangContenView.frame)-K(10), K(0)) configuration:webConfiger];
        
        webView.scrollView.scrollEnabled = NO;
        webView.navigationDelegate = self;
        webView.opaque = NO;
        [DongwangContenView addSubview:webView];
        _webView = webView;
    }
    return self;
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
[webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '200%'" completionHandler:nil];
    [ webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= '#FFFFFF'"completionHandler:nil];

}
-(void)setUrlText:(NSString *)urlText{
    _urlText = urlText;
    [_webView loadHTMLString:urlText baseURL:nil];
    NSMutableAttributedString *htmlString =[[NSMutableAttributedString alloc] initWithData:[urlText dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute:[NSNumber numberWithInt:NSUTF8StringEncoding]} documentAttributes:NULL error:nil];
    [htmlString addAttributes:@{NSFontAttributeName:KSysFont(font(12))} range:NSMakeRange(0, htmlString.length)];
    CGSize textSize = [htmlString boundingRectWithSize:(CGSize){CGRectGetWidth(_DongwangContenView.frame), CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    _webView.height = textSize.height;
    _DongwangContenView.height = CGRectGetMaxY(_webView.frame)+K(10);
    self.FooterHeight = CGRectGetMaxY(_DongwangContenView.frame);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
