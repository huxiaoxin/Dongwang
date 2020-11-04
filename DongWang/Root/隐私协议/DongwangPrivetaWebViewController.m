//
//  DongwangPrivetaWebViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/20.
//

#import "DongwangPrivetaWebViewController.h"
#import <WebKit/WebKit.h>

@interface DongwangPrivetaWebViewController ()<WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler>
@property(nonatomic,strong) WKWebView * wkweb;
@property(nonatomic,strong) UIButton * backBtn;
@property(nonatomic,strong) UIView * backView;
@end

@implementation DongwangPrivetaWebViewController
-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(40), K(40))];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}

-(UIButton *)backBtn{
    if (!_backBtn) {
        
//        UIView * backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(40), K(40))];
        
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn addTarget:self action:@selector(ShuyunBackBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_backBtn setImage:[UIImage imageNamed:@"btn_back_black"] forState:UIControlStateNormal];
        [_backBtn setEnlargeEdgeWithTop:25 right:25 bottom:25 left:25];
//        [_backBtn setBackgroundColor:[UIColor whiteColor]];
    }
    return _backBtn;
}
#pragma mark--返回
-(void)ShuyunBackBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"加载中...";
    [self.view addSubview:self.wkweb];
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",Protocl_Url,self.protoclUrlText]];
    [_wkweb loadRequest:[NSURLRequest requestWithURL:url]];
    [CHShowMessageHud showHUDPlainText:@"" view:self.view];

}
-(WKWebView *)wkweb{
    if (!_wkweb) {
        WKWebViewConfiguration * wkconfiger = [[WKWebViewConfiguration alloc]init];
        
        wkconfiger.preferences = [[WKPreferences alloc] init];
        wkconfiger.preferences.minimumFontSize = 10;
        wkconfiger.preferences.javaScriptEnabled = YES;
        wkconfiger.preferences.javaScriptCanOpenWindowsAutomatically = NO;
        wkconfiger.userContentController = [[WKUserContentController alloc] init];
        wkconfiger.processPool = [[WKProcessPool alloc] init];
        [wkconfiger.userContentController addScriptMessageHandler:self name:@"setHeader"];
        _wkweb = [[WKWebView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height) configuration:wkconfiger];
        _wkweb.UIDelegate = self;
        _wkweb.navigationDelegate = self;
        _wkweb.scrollView.showsVerticalScrollIndicator = NO;
        _wkweb.scrollView.showsHorizontalScrollIndicator = NO;
        
    }
    return _wkweb;
}
#pragma mark - WKNavigationDelegate
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    NSDictionary * dic = message.body;
    NSLog(@"body----%@    name=%@",message.body,message.name);
    NSString * titleText   = [NSString stringWithFormat:@"%@",dic[@"title"][@"name"]];
    self.gk_navTitle =  titleText;
    NSString * text_color = [NSString stringWithFormat:@"%@",dic[@"title"][@"text_color"]];
//    self.gk_navBackgroundColor = [UIColor colorWithHexString:text_color];
    self.gk_navLeftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
    self.gk_navItemLeftSpace =  K(20);
    

}
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{

}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
#pragma mark -- 取消小菊花
    [CHShowMessageHud dismissHideHUD:self.view];
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setValue:[NSNumber numberWithInt:200] forKey:@"code"];
    NSString * jasonText  = [NSString dictionaryTurnJsonString:dic];
    NSString *jsCode = [NSString stringWithFormat:@"setHeader('%@')",jasonText];
    MJWeakSelf;
    dispatch_async(dispatch_get_main_queue(), ^{
        [(WKWebView*)webView evaluateJavaScript:jsCode completionHandler:^(id _Nullable result, NSError * _Nullable error) {
            //此处可以打印error.
            if (error) {
            NSLog(@"localizedDescription---%@",error.localizedDescription);
            weakSelf.gk_navTitle = @"加载失败";
            }
        }];
    });

    
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    [CHShowMessageHud dismissHideHUD:self.view];
}
// 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    
}
// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    
    NSLog(@"%@",navigationResponse.response.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}

-(void)WindwounLoginBackBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
