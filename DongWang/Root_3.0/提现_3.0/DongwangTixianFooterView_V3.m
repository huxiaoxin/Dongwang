//
//  DongwangTixianFooterView_V3.m
//  DongWang
//
//  Created by codehzx on 2021/1/22.
//

#import "DongwangTixianFooterView_V3.h"
#import <WebKit/WebKit.h>
@interface DongwangTixianFooterView_V3 ()<WKNavigationDelegate>

@end
@implementation DongwangTixianFooterView_V3
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView * dongwangAccountImgView  =[[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(10), RealWidth(15+15), SCREEN_WIDTH-RealWidth(10), RealWidth(100))];
        dongwangAccountImgView.userInteractionEnabled = YES;
        dongwangAccountImgView.image =[UIImage imageNamed:@"accountpisIcon"];
        [self addSubview:dongwangAccountImgView];
                
        NSString * htmldwStr = [UserManager userInfo].withdrawTips;
        
//        NSAttributedString *attStr = [[NSAttributedString alloc] initWithData:[htmldwStr dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
//        UILabel * DongwangContentlb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(10), RealWidth(10), CGRectGetWidth(dongwangAccountImgView.frame)-RealWidth(15), CGRectGetHeight(dongwangAccountImgView.frame))];
//        [dongwangAccountImgView addSubview:DongwangContentlb];
//        DongwangContentlb.attributedText = attStr;
        
        
       
        WKWebViewConfiguration * configer = [[WKWebViewConfiguration alloc]init];
        WKWebView * webView = [[WKWebView alloc]initWithFrame:CGRectMake(RealWidth(15), K(15+15), CGRectGetWidth(dongwangAccountImgView.frame)-RealWidth(15), RealWidth(100)) configuration:configer];
        webView.navigationDelegate =  self;
        webView.backgroundColor = [UIColor clearColor];
        webView.opaque =  NO;
        [self addSubview:webView];
        [webView loadHTMLString:[UserManager userInfo].withdrawTips baseURL:nil];
        
        
        
    }
    return self;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
