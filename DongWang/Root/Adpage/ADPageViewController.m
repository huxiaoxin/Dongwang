//
//  ADPageViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/20.
//

#import "ADPageViewController.h"
#import "ProcessLaunchImageView.h"
#import "DongwangCodeLoginViewController.h"
#import "DongwangCLLoginViewController.h"
#import "DongwangAdpageWebViewController.h"
#import "DongwangLogoinViewModel.h"
#import "DongwangAdpageModel.h"
#import "DongwangBaseTabBarViewController.h"
#import "DongwangTabbarModel.h"
#import "DongwangLottieAnimationVc.h"
@interface ADPageViewController ()
@property(nonatomic,strong) ProcessLaunchImageView * AdpageView;
@property(nonatomic,strong) DongwangAdpageModel * CuurentpageModel;
@property(nonatomic,strong) UIImageView *  DongwangImgView;
@property(nonatomic,strong) DongwangTabbarModel * SeltecdModel;
@property(nonatomic,assign) BOOL  isTapImg;
@end
@implementation ADPageViewController
-(void)DongwnagInitLogin{
    if ([UserManager userisLogoin] == NO) {
        self.isTapImg = YES;
        NSString *shanyanLogin = [NSString stringWithFormat:@"%@", [NSUserDefaults ch_customObjectForKey:CHSYTagPhoneNumberBOOL]];
        [self DongwangLogoinConfigerType:shanyanLogin];
        return;
     }

}
-(ProcessLaunchImageView *)AdpageView{
    if (!_AdpageView) {
        MJWeakSelf;
        _AdpageView = [ProcessLaunchImageView initShareView:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-kHeight(120)) bgImageName:self.CuurentpageModel.imageUrl ShowType:ButtonTitleTimeShowType Time:[self.CuurentpageModel.times floatValue] ResultBlock:^{
           //如果未登录，去登录
            [weakSelf DongwnagInitLogin];
            //如果action=0 跳转
            if ([weakSelf.CuurentpageModel.action integerValue] == 0) {
            [weakSelf BaseTabarRequest];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:AppTabbarActitytapNotiCation object:nil userInfo:@{@"action":[NSString stringWithFormat:@"%@",weakSelf.CuurentpageModel.action],@"type":[NSString stringWithFormat:@"%@",weakSelf.CuurentpageModel.type],@"url":[NSString stringWithFormat:@"%@",weakSelf.CuurentpageModel.url]}];
            });
            }else{
             // 不跳转，加载动效
            weakSelf.isTapImg = YES;
            [weakSelf DongwangloadAnmationVc];
            }
        } btnClickBlock:^{
            //如果未登录，去登录
            [weakSelf DongwnagInitLogin];
            if (weakSelf.isTapImg == NO) {
            [weakSelf DongwangloadAnmationVc];
            }
            
        }];
    }
    return _AdpageView;
}
-(void)DongwangloadAnmationVc{
    
    MJWeakSelf;
    [DongwangLogoinViewModel DongwangRequesteffectWithParmtersw:@{}.mutableCopy RequestCuurentControlers:self logoinSuuced:^(DongwangLottieModel * _Nonnull lottieModel) {
        NSLog(@"动效地址:%@",lottieModel.actionUrl);
        DongwangLottieModel * lottiModel = lottieModel;
        DongwangLottieAnimationVc * LottieVc = [[DongwangLottieAnimationVc alloc]init];
        LottieVc.lottiemodel = lottiModel;
        [weakSelf presentViewController:LottieVc animated:NO completion:nil];
    } logoinfairler:^(DongwangLottieModel * _Nonnull lottieModel) {

    }];

}
-(UIImageView *)DongwangImgView{
    if (!_DongwangImgView) {
        _DongwangImgView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _DongwangImgView.image = [UIImage imageNamed:@"Myqidongye"];
    }
    return _DongwangImgView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.isTapImg = NO;
    self.gk_navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    //广告页
    CGSize DWLogoTitleSize=  [@"懂王更懂你" cxl_sizeWithString:KBlFont(20)];
    UIImageView * DWLogoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-K(35)-DWLogoTitleSize.width/2,SCREEN_HEIGHT-K(70+30), K(70), K(70))];
    DWLogoImgView.image = [UIImage imageNamed:@"applogo"];
    [self.view addSubview:DWLogoImgView];
    
    
    UILabel * DWLogoTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DWLogoImgView.frame)+K(10), CGRectGetMidY(DWLogoImgView.frame)-K(10), DWLogoTitleSize.width, K(20))];
    DWLogoTitle.textColor = LGDMianColor;
    DWLogoTitle.font = KBlFont(20);
    DWLogoTitle.text = @"懂王更懂你";
    [self.view addSubview:DWLogoTitle];
    
    [self.view addSubview:self.DongwangImgView];
    MJWeakSelf;
    [DongwangLogoinViewModel AdpageRequestWithParmters:@{@"type":@"2"}.mutableCopy RequestCuurentControlers:self AdpageModel:^(DongwangAdpageModel * AdPageModel) {
        if (AdPageModel.isexsit) {
            weakSelf.CuurentpageModel = AdPageModel;
            NSLog(@"存在:%@",weakSelf.CuurentpageModel.url);
            [UIView animateWithDuration:0.5 animations:^{
                weakSelf.DongwangImgView.alpha=0.0;
            } completion:^(BOOL finished) {
                [weakSelf.DongwangImgView removeFromSuperview];
                [weakSelf.view addSubview:weakSelf.AdpageView];
            }];
        }else{
            [UIView animateWithDuration:0.5 animations:^{
                weakSelf.DongwangImgView.alpha=0.0;
            } completion:^(BOOL finished) {
//                [weakSelf.DongwangImgView removeFromSuperview];
                //请求失败 直接判断是否登录过
                if ([UserManager userisLogoin]) {
//                [weakSelf BaseTabarRequest];
                    [weakSelf DongwangloadAnmationVc];
                }else{
            NSString *shanyanLogin = [NSString stringWithFormat:@"%@", [NSUserDefaults ch_customObjectForKey:CHSYTagPhoneNumberBOOL]];
            [weakSelf DongwangLogoinConfigerType:shanyanLogin];
            }
            }];
        }
    }];
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
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
