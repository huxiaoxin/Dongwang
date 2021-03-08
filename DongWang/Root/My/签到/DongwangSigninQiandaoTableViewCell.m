//
//  DongwangSigninQiandaoTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/13.
//

#import "DongwangSigninQiandaoTableViewCell.h"
#import <WebKit/WebKit.h>
@interface DongwangSigninQiandaoTableViewCell ()<WKNavigationDelegate>
{
    WKWebView * _webView;
}
@end
@implementation DongwangSigninQiandaoTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        
        WKWebViewConfiguration * webConfiger = [[WKWebViewConfiguration alloc]init];
        WKWebView * webView =[[WKWebView alloc]initWithFrame:CGRectMake(K(15), 0, SCREEN_Width-K(30), K(100)) configuration:webConfiger];
        webView.navigationDelegate =self;
        [self.contentView addSubview:webView];
        _webView = webView;
        
        
    }
    return self;
}
-(void)setQiandaourl:(NSString *)Qiandaourl{
    _Qiandaourl = Qiandaourl;
    if ([NSString isBlankString:Qiandaourl]) {
        return;
    }
    [_webView loadHTMLString:Qiandaourl baseURL:nil];
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    //修改字体大小 300%
    [ webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '250%'" completionHandler:nil];
//    //修改字体颜色
    [ webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= '#333333'" completionHandler:nil];
    
    CGSize size = [webView sizeThatFits:CGSizeZero];
    CGFloat height = size.height;
    _VC.CellHeight = height;
    [_VC.DongwangSignTableView reloadData];
//    [_VC.DongwangSignTableView reloadRowsAtIndexPaths:@[0] withRowAnimation:UITableViewRowAnimationNone];
    _webView.scrollView.scrollEnabled = NO;//如果需要webview本身的滚动可以不设置成NO
}

@end
