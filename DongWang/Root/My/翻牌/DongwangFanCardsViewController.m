//
//  DongwangFanCardsViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/30.
//

#import "DongwangFanCardsViewController.h"
#import <WebKit/WebKit.h>
@interface DongwangFanCardsViewController ()<WKNavigationDelegate>
@property(nonatomic,strong) WKWebView * webViews;
@end

@implementation DongwangFanCardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle  = @"积分翻牌";
    
    [self.view addSubview:self.webViews];
    [_webViews loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@""]]]];
    // Do any additional setup after loading the view.
}
-(WKWebView *)webViews{
    if (!_webViews) {
        WKWebViewConfiguration * configers = [[WKWebViewConfiguration alloc]init];
        _webViews  =[[WKWebView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_Height) configuration:configers];
        _webViews.navigationDelegate = self;
        _webViews.backgroundColor = [UIColor clearColor];
    }
    return _webViews;
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
