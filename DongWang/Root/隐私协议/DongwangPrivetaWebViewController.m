//
//  DongwangPrivetaWebViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/20.
//

#import "DongwangPrivetaWebViewController.h"
#import <WebKit/WebKit.h>
#import "DongwangMyPrizeViewController.h"
#import "DongwangCLLoginViewController.h"
#import "DongwangCodeLoginViewController.h"
#import "DongwangSigninQiandaoViewController.h"
#import "DongwangJifenChangViewController.h"
#import "DongwangMyjifenViewController.h"
#import "DongwangPropsViewController.h"
#import "DongwangMyInfoViewController.h"
#import "DongwangFenleiViewController.h"
@interface DongwangPrivetaWebViewController ()<WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler>
@property(nonatomic,strong) WKWebView * wkweb;
@property(nonatomic,strong) UIButton * backBtn;
@property(nonatomic,strong) UIView * backView;
@property(nonatomic,strong) UIView * rightbackView;
@property(nonatomic,strong)   UIButton * rightbackBtn;
@property(nonatomic,strong) UIImageView *  bakcNavImgView;
@property(nonatomic,strong) UILabel *  NavTitle;
@property(nonatomic,copy) NSString * callback; //跳转类型
@end

@implementation DongwangPrivetaWebViewController
-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(40), K(40))];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}
-(UIView *)rightbackView{
    if (!_rightbackView) {
        _rightbackView =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(40), K(40))];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _rightbackView;
}
-(UIButton *)rightbackBtn{
    if (!_rightbackBtn) {
        _rightbackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightbackBtn addTarget:self action:@selector(rightbackBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_rightbackBtn setBackgroundColor:[UIColor clearColor]];
        _rightbackBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _rightbackBtn.frame = CGRectMake(SCREEN_WIDTH-K(135), StatuBar_Height+K(0), K(120), NaviH-StatuBar_Height-K(0));
        _rightbackBtn.titleLabel.font = KSysFont(font(13));
    }
    return _rightbackBtn;
}
-(UIImageView *)bakcNavImgView{
    if (!_bakcNavImgView) {
        _bakcNavImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NaviH)];
        _bakcNavImgView.backgroundColor =  LGDMianColor;
        _bakcNavImgView.userInteractionEnabled = YES;

    }
    return _bakcNavImgView;
}
-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn addTarget:self action:@selector(ShuyunBackBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_backBtn setImage:[UIImage imageNamed:@"btn_back_white"] forState:UIControlStateNormal];
        [_backBtn sizeToFit];
        _backBtn.origin = CGPointMake(kLevelSpace(20), StatuBar_Height+K(6));
        [_backBtn setEnlargeEdgeWithTop:25 right:25 bottom:25 left:25];
        _backBtn.hidden = self.isActity;
    }
    return _backBtn;
}
#pragma mark--返回
-(void)ShuyunBackBtnClick{
    if (self.type == VCPressent) {
        if ([self.wkweb canGoBack]) {
            [self.wkweb goBack];
            return;
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        if ([self.wkweb canGoBack]) {
           [self.wkweb goBack];
            return;
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)webviewRealodRequest{
    NSURL * url = [NSURL URLWithString:self.protoclUrlText];
    [self.wkweb  loadRequest:[NSURLRequest requestWithURL:url]];
}
#pragma mark--前进
-(void)rightbackBtnClick{
    NSString *jsCode = [NSString stringWithFormat:@"%@()",self.callback];
    NSLog(@"js方法名：%@",self.callback);
    [_wkweb evaluateJavaScript:jsCode completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"result=%@",result);
//        [self.wkweb reload];
        if (error) {
     NSLog(@"错误信息:%@",error.localizedDescription);
        }
    }];
}

-(UILabel *)NavTitle{
    if (!_NavTitle) {
        _NavTitle = [[UILabel alloc]init];
        _NavTitle.textAlignment = NSTextAlignmentCenter;
        _NavTitle.textColor=  [UIColor whiteColor];
        _NavTitle.font = KBlFont(font(16));
        _NavTitle.frame = CGRectMake(0, StatuBar_Height+K(7.5), SCREEN_WIDTH, K(20));
        _NavTitle.text = @"加载中....";
        if (![NSString isBlankString:self.titleName]) {
            _NavTitle.text = _titleName;
        }

    }
    return _NavTitle;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = LGDMianColor;
    self.gk_navigationBar.hidden = YES;
    [self.view addSubview:self.bakcNavImgView];
    [_bakcNavImgView addSubview:self.backBtn];
    [_bakcNavImgView addSubview:self.NavTitle];
    [_bakcNavImgView addSubview:self.rightbackBtn];
    [self.view addSubview:self.wkweb];
    NSURL * url = [NSURL URLWithString:self.protoclUrlText];
    [_wkweb loadRequest:[NSURLRequest requestWithURL:url]];
    [CHShowMessageHud showHUDPlainText:@"" view:self.view];
    NSLog(@"链接：%@",self.protoclUrlText);
    //http://192.168.3.157/dongwang_h5/document/index.html?type=aboutUs
    if ([self.protoclUrlText isValidUrl] == NO) {
        [CHShowMessageHud dismissHideHUD:self.view];
        [CHShowMessageHud showMessageText:@"链接不合法"];
    }
    

}
-(WKWebView *)wkweb{
    if (!_wkweb) {
        WKWebViewConfiguration * wkconfiger = [[WKWebViewConfiguration alloc]init];
        wkconfiger.preferences = [[WKPreferences alloc] init];
        wkconfiger.preferences.minimumFontSize = 10;
        wkconfiger.preferences.javaScriptEnabled = YES;
        wkconfiger.preferences.javaScriptCanOpenWindowsAutomatically = NO;
        wkconfiger.userContentController = [[WKUserContentController alloc] init];
//        wkconfiger.processPool = [[WKProcessPool alloc] init];
        [wkconfiger.userContentController addScriptMessageHandler:self name:@"setHeader"];
//        [wkconfiger.userContentController addScriptMessageHandler:self name:@"scanClick"];
        [wkconfiger.userContentController addScriptMessageHandler:self name:@"getUserInfo"];
        [wkconfiger.userContentController addScriptMessageHandler:self name:@"openAppPage"];
        [wkconfiger.userContentController addScriptMessageHandler:self name:@"openWebView"];
        _wkweb = [[WKWebView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height) configuration:wkconfiger];
        _wkweb.backgroundColor = [UIColor clearColor];
        _wkweb.UIDelegate = self;
        _wkweb.navigationDelegate = self;
        _wkweb.scrollView.showsVerticalScrollIndicator = NO;
        _wkweb.scrollView.showsHorizontalScrollIndicator = NO;

    }
    return _wkweb;
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"加载失败:%@",error.localizedDescription);
}
#pragma mark - WKNavigationDelegate
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    NSDictionary * dic = message.body;
    NSLog(@"%@",dic);
    if ([message.name isEqualToString:@"openAppPage"]) {
        NSString * path = [dic objectForKey:@"path"];
        if ([path isEqualToString:@"myPrizes"]) {
          
        }else if ([path isEqualToString:@"Login"]){
            [UserManager userLoginout]; 
            NSString *shanyanLogin = [NSString stringWithFormat:@"%@", [NSUserDefaults ch_customObjectForKey:CHSYTagPhoneNumberBOOL]];
            [self DongwangLogoinConfigerType:shanyanLogin];
        }
        else if ([path isEqual:@"MyTask"]){
            //任务
//            self.tabBarController.selectedIndex = 1;
//            [self.navigationController popToRootViewControllerAnimated:NO];
            
            DongwangFenleiViewController * FenleiVc=  [[DongwangFenleiViewController alloc]init];
            FenleiVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:FenleiVc animated:YES];
        }else if ([path isEqual:@"MyFind"]){
            //发现
            BOOL ishaveActiyt = [[NSUserDefaults standardUserDefaults] boolForKey:AppisHaveactivity];
            self.tabBarController.selectedIndex = ishaveActiyt ? 3 : 2;
          [self.navigationController popToRootViewControllerAnimated:NO];
        }else if ([path isEqualToString:@"SignList"]){
            //签到
            DongwangSigninQiandaoViewController * qiandaoVc = [[DongwangSigninQiandaoViewController alloc]init];
            qiandaoVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:qiandaoVc animated:YES];
        }else if ([path isEqualToString:@"Exchange"]){
            //兑换
            DongwangJifenChangViewController * changeVc = [[DongwangJifenChangViewController alloc]init];
            changeVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:changeVc animated:YES];
        }else if ([path isEqualToString:@"MyScores"]){
            //积分
            DongwangMyjifenViewController * jifenVc = [[DongwangMyjifenViewController alloc]init];
            jifenVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:jifenVc animated:YES];
        }else if ([path isEqualToString:@"MyCenter"]){
            //个人中心
            BOOL ishaveActiyt = [[NSUserDefaults standardUserDefaults] boolForKey:AppisHaveactivity];
            self.tabBarController.selectedIndex = ishaveActiyt ? 4 : 3;
          [self.navigationController popToRootViewControllerAnimated:NO];
        }else if ([path isEqualToString:@"MyPrizes"]){
            //我的奖品
            DongwangMyPrizeViewController * MypirexVc = [[DongwangMyPrizeViewController alloc]init];
            [self.navigationController pushViewController:MypirexVc animated:YES];
        }else if ([path isEqualToString:@"MyProps"]){
            //我的道具
            DongwangPropsViewController * daojuVc = [[DongwangPropsViewController alloc]init];
            daojuVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:daojuVc animated:YES];
        }else if ([path isEqualToString:@"HomePage"]){
            //首页
            self.tabBarController.selectedIndex = 2;
            [self.navigationController popToRootViewControllerAnimated:NO];
        }else if ([path  isEqualToString:@"Profile"]){
            //个人资料
            DongwangMyInfoViewController * MyprizeVc = [[DongwangMyInfoViewController alloc]init];
            MyprizeVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:MyprizeVc animated:YES];
        }

        
        
        
    }else if ([message.name isEqualToString:@"setHeader"]){
        self.callback = [NSString stringWithFormat:@"%@",dic[@"right_btn"][@"callback"]];
        //标题
        NSString * titleText   = [NSString stringWithFormat:@"%@",dic[@"title"][@"name"]];
        self.NavTitle.text = titleText;
        if ([dic.allKeys containsObject:@"title"]) {
            //文字颜色
            NSString * text_color = [NSString stringWithFormat:@"%@",dic[@"title"][@"color"]];
            if ([NSString isBlankString:text_color]) {
                self.NavTitle.textColor = [UIColor whiteColor];

            }else{
                self.NavTitle.textColor = [UIColor colorWithHexString:text_color];

            }
        }
        if ([dic.allKeys containsObject:@"right_btn"]) {
            //右标题
            NSString * right_titletext =  [NSString stringWithFormat:@"%@",dic[@"right_btn"][@"content"]];
            //右标题颜色
            NSString * right_text_color = [NSString stringWithFormat:@"%@",dic[@"right_btn"][@"text_color"]];
            [self.rightbackBtn setTitle:right_titletext forState:UIControlStateNormal];
            [self.rightbackBtn setTitleColor:[UIColor colorWithHexString:right_text_color] forState:UIControlStateNormal];
            self.rightbackBtn.hidden = NO;
        }else{
            self.rightbackBtn.hidden = YES;
        }
    }else if ([message.name isEqualToString:@"openWebView"]){
        if ([dic.allKeys containsObject:@"url"]) {
            NSString * urlStr  =[NSString stringWithFormat:@"%@",dic[@"url"]];
//            NSURL * url = [NSURL URLWithString:urlStr];
//            [self.wkweb  loadRequest:[NSURLRequest requestWithURL:url]];
            DongwangPrivetaWebViewController * PrivateWebVc = [[DongwangPrivetaWebViewController alloc]init];
            PrivateWebVc.protoclUrlText =  urlStr;
            PrivateWebVc.type = VCPush;
            [self.navigationController pushViewController:PrivateWebVc animated:YES];
            
            
            
        }
        
    }else if ([message.name isEqualToString:@"getUserInfo"]){
        
        NSMutableDictionary * dic = [NSMutableDictionary dictionary];
        [dic setValue:[NSNumber numberWithInt:200] forKey:@"code"];
        [dic setValue:[UserManager userInfoTojsonStr] forKey:@"data"];
        NSString * jasonText  = [NSString dictionaryTurnJsonString:dic];
        NSLog(@"参数：%@",jasonText);
        NSString *getUserInfo = [NSString stringWithFormat:@"getUserInfo('%@')",jasonText];
        [self.wkweb evaluateJavaScript:getUserInfo completionHandler:^(id _Nullable result, NSError * _Nullable error) {
            //此处可以打印error.
            if (error) {
            NSLog(@"localizedDescription---%@",error.localizedDescription);
              }
        }];

    }
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
    NSLog(@"加载完成");
    [CHShowMessageHud dismissHideHUD:self.view];

    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setValue:[NSNumber numberWithInt:200] forKey:@"code"];
    [dic setValue:[UserManager token] forKey:@"data"];
    NSString * jasonText  = [NSString dictionaryTurnJsonString:dic];
    NSString *jsCode = [NSString stringWithFormat:@"getLoginToken('%@')",jasonText];
      // NSLog(@"个人信息:%@",[UserManager userInfoTojsonStr]);

    MJWeakSelf;
    dispatch_async(dispatch_get_main_queue(), ^{
    [(WKWebView*)webView evaluateJavaScript:jsCode completionHandler:^(id _Nullable result, NSError * _Nullable error) {
    //此处可以打印error.
    if (error) {
    NSLog(@"localizedDescription---%@",error.localizedDescription);
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
//    NSLog(@"拦截地址:%@",navigationResponse.response.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}
-(void)DongwangLogoinConfigerType:(NSString * )type{
    if ([type isEqualToString:@"1"]) {
    //闪验登录
     DongwangCLLoginViewController * DongwangClVc = [[DongwangCLLoginViewController alloc]init];
    UINavigationController * DongwangclNav = [UINavigationController rootVC:DongwangClVc translationScale:YES];
    [AppDelegate getAppDelegate].window.rootViewController = DongwangclNav;
    }else {
    //验证码登
    DongwangCodeLoginViewController * DongwangLoginVc = [[DongwangCodeLoginViewController alloc]init];
    UINavigationController * DongwangNav = [UINavigationController rootVC:DongwangLoginVc translationScale:YES];
    [AppDelegate getAppDelegate].window.rootViewController = DongwangNav;
    }
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (IS_IOS9_OR_LATER) {
        NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
        NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
        [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{

        }];
    }else{
        NSString *libraryDir = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
        NSString *bundleId  =  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];

        NSString *webkitFolderInLib = [NSString stringWithFormat:@"%@/WebKit",libraryDir];
        NSString *webKitFolderInCaches = [NSString stringWithFormat:@"%@/Caches/%@/WebKit",libraryDir,bundleId];

        NSError *error;
        [[NSFileManager defaultManager] removeItemAtPath:webKitFolderInCaches error:&error];
        [[NSFileManager defaultManager] removeItemAtPath:webkitFolderInLib error:nil];
    };

    [UserManager UserManagerRealoadinfomationSuuced:^{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Updateuserintgers" object:nil];
    } fairler:^{

    }];
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
