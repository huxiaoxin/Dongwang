//
//  DongwangQuesitonnGroupDetailViewController.m
//  DongWang
//
//  Created by codehzx on 2020/12/6.
//

#import "DongwangQuesitonnGroupDetailViewController.h"
#import <WebKit/WebKit.h>
#import "DongwangMyPrizeViewController.h"
@interface DongwangQuesitonnGroupDetailViewController ()<WKNavigationDelegate,WKScriptMessageHandler>
@property(nonatomic,strong) WKWebView * wkweb;
@end

@implementation DongwangQuesitonnGroupDetailViewController
- (void)backItemClick:(id)sender{
    if ([self.wkweb canGoBack]) {
        [self.wkweb goBack];
        return;
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.gk_popDelegate = self;
    self.gk_navTitle = _titleName;
    [self.view addSubview:self.wkweb];

}
-(WKWebView *)wkweb{
    if (!_wkweb) {
        WKWebViewConfiguration * confifgers = [[WKWebViewConfiguration alloc]init];
        [confifgers.userContentController addScriptMessageHandler:self name:@"getLoginToken"];
        [confifgers.userContentController addScriptMessageHandler:self name:@"openAppPage"];
        _wkweb = [[WKWebView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height) configuration:confifgers];
        _wkweb.navigationDelegate = self;
        _wkweb.opaque = NO;
        _wkweb.backgroundColor = [UIColor clearColor];
        NSURL  * url  =[NSURL URLWithString:self.questionurl];
        [_wkweb loadRequest:[NSURLRequest requestWithURL:url]];
    }
    return _wkweb;
}
#pragma mark--WKNavigationDelegate
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    NSDictionary *  parmterdic = message.body;
    if ([message.name isEqualToString:@"openAppPage"]) {
        NSString * path = [parmterdic objectForKey:@"path"];
        if ([path isEqualToString:@"myPrizes"]) {
            DongwangMyPrizeViewController * MypirexVc = [[DongwangMyPrizeViewController alloc]init];
            
            [self.navigationController pushViewController:MypirexVc animated:YES];
            
        }
    }
    
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setValue:[NSNumber numberWithInt:200] forKey:@"code"];
    [dic setValue:[UserManager token] forKey:@"data"];
    NSString * jasonText  = [NSString dictionaryTurnJsonString:dic];
    NSString *jsCode = [NSString stringWithFormat:@"getLoginToken('%@')",jasonText];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
