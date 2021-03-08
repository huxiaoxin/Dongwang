//
//  DongwangAboutusViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/10.
//

#import "DongwangAboutusViewController.h"
#import <WebKit/WebKit.h>
@interface DongwangAboutusViewController ()

@end

@implementation DongwangAboutusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"关于我们";
    self.isShowBtomImgView = NO;
    WKWebViewConfiguration * confifger =[[WKWebViewConfiguration alloc]init];
    WKWebView * webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_Height-NaviH-SafeAreaBottom_Height) configuration:confifger];
    webView.opaque = NO;
    webView.backgroundColor = [UIColor clearColor];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",Protocl_Url,@"/dongwang_h5/document/index.html?type=aboutUs"]]]];
    [self.view addSubview:webView];

//    self.isShowBtomImgView = NO;
//    UIImageView * DongwanglogoImgView  = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-K(42.5), K(50)+NaviH, K(85), K(85))];
//    DongwanglogoImgView.image = [UIImage imageNamed:@"applogo"];
//    [self.view addSubview:DongwanglogoImgView];
//
//    UILabel * DongwangVersionlb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwanglogoImgView.frame)+K(10), SCREEN_WIDTH, K(20))];
//    DongwangVersionlb.textAlignment = NSTextAlignmentCenter;
//    DongwangVersionlb.font = KSysFont(font(14));
//    DongwangVersionlb.textColor = [UIColor colorWithHexString:@"#333333"];
//    DongwangVersionlb.text  = @"V 1.0.0";
//    [self.view addSubview:DongwangVersionlb];
//
//
//    NSString * DongwangDetailText = @"懂王是一款利用碎片化时间以及移动场景，用     新颖的展现模式和简便的操作方式，内容聚焦热点、涵盖个人兴趣爱好的APP。玩法多样，除了常规答题模式，还有对战模式、夺宝模式等等，是居家、出行途中首选的娱乐方式。";
//    UILabel * DongwangDetailb = [[UILabel alloc]initWithFrame:CGRectMake(K(25.5), CGRectGetMaxY(DongwangVersionlb.frame)+K(29.5), SCREEN_WIDTH-K(51), 0)];
//    DongwangDetailb.textAlignment = NSTextAlignmentCenter;
//    DongwangDetailb.font = KSysFont(font(13));
//    DongwangDetailb.numberOfLines =  0;
//    DongwangDetailb.textColor = [UIColor colorWithHexString:@"#333333"];
//    [self.view addSubview:DongwangDetailb];
//    [DongwangDetailb setText:DongwangDetailText lineSpacing:K(6)];
//    DongwangDetailb.height = [DongwangDetailb getSpaceLabelHeight:DongwangDetailText withFont:KSysFont(font(13)) withWidth:SCREEN_WIDTH-K(51) lineSpacing:K(6)].height;
//
//
//    UILabel * DongwangCompanylb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame)-K(20+14.5)-SafeAreaBottom_Height, SCREEN_WIDTH, K(20))];
//    DongwangCompanylb.textAlignment = NSTextAlignmentCenter;
//    DongwangCompanylb.font = KSysFont(font(14));
//    DongwangCompanylb.textColor = [UIColor colorWithHexString:@"#333333"];
//    DongwangCompanylb.text  = @"浙江舒云互联网科技有限公司";
//    [self.view addSubview:DongwangCompanylb];

    
    // Do any additional setup after loading the view.
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
