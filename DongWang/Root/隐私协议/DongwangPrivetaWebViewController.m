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
@property(nonatomic,strong) UIImageView *  bakcNavImgView;
@property(nonatomic,strong) UILabel *  NavTitle;
@end

@implementation DongwangPrivetaWebViewController
-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(40), K(40))];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}
-(UIImageView *)bakcNavImgView{
    if (!_bakcNavImgView) {
        _bakcNavImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NaviH)];
        _bakcNavImgView.backgroundColor =  [UIColor whiteColor];
        _bakcNavImgView.userInteractionEnabled = YES;
        
    }
    return _bakcNavImgView;
}
-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn addTarget:self action:@selector(ShuyunBackBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_backBtn sizeToFit];
        _backBtn.origin = CGPointMake(kLevelSpace(20), kVertiSpace(25));
        [_backBtn setEnlargeEdgeWithTop:25 right:25 bottom:25 left:25];
    }
    return _backBtn;
}
#pragma mark--返回
-(void)ShuyunBackBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UILabel *)NavTitle{
    if (!_NavTitle) {
        _NavTitle = [[UILabel alloc]init];
        _NavTitle.textAlignment = NSTextAlignmentCenter;
        _NavTitle.textColor=  [UIColor whiteColor];
        _NavTitle.font = KSysFont(font(17));
        _NavTitle.frame = CGRectMake(0, StatuBar_Height+K(6), SCREEN_WIDTH, K(20));
//        [_NavTitle sizeToFit];
//        _NavTitle.text = @"加载中....";
    }
    return _NavTitle;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navigationBar.hidden = YES;
    [self.view addSubview:self.bakcNavImgView];
    [_bakcNavImgView addSubview:self.backBtn];
    [_bakcNavImgView addSubview:self.NavTitle];
    [self.view addSubview:self.wkweb];

    
//    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",Protocl_Url,self.protoclUrlText]];
        NSURL * url = [NSURL URLWithString:@"http://192.168.3.157/dongwang_h5/answer_default"];

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
    //标题
    NSString * titleText   = [NSString stringWithFormat:@"%@",dic[@"title"][@"name"]];
    //文字颜色
    NSString * text_color = [NSString stringWithFormat:@"%@",dic[@"title"][@"text_color"]];
    NSString * imageText = [NSString stringWithFormat:@"%@",dic[@"backgroud"][@"image"]];
    //背景色
    NSString * imgebackColor = [NSString stringWithFormat:@"%@",dic[@"backgroud"][@"color"]];
    //按钮
    NSString * left_btn  = [NSString stringWithFormat:@"%@",dic[@"left_btn"][@"type"]];
    NSLog(@"------%@",left_btn);
    if ([left_btn isEqualToString:@"light"]) {
    [_backBtn setImage:[UIImage imageNamed:@"btn_back_white"] forState:UIControlStateNormal];
    }else{
    [_backBtn setImage:[UIImage imageNamed:@"btn_back_black"] forState:UIControlStateNormal];
    }
    if ([[dic allKeys] containsObject:@"image"]) {
        [self.bakcNavImgView sd_setImageWithURL:[NSURL URLWithString:imageText]];
    }else{
    self.bakcNavImgView.backgroundColor = [UIColor colorWithHexString:imgebackColor];
    }
    self.NavTitle.text = titleText;
    self.NavTitle.textColor = [UIColor colorWithHexString:text_color];
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
