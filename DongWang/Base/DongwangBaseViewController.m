//
//  DongwangBaseViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/20.
//

#import "DongwangBaseViewController.h"
#import "DongwangBandingViewController.h"
#import "DongwangLogoinViewModel.h"
#import "DongwangBaseTabBarViewController.h"
#import <MFSIdentifier-umbrella.h>
#import "userActionModels.h"
#import "DongwangCLLoginViewController.h"
#import "DongwangCodeLoginViewController.h"
@interface DongwangBaseViewController ()
@property(nonatomic,strong)  UIImageView * DongwangBtomImgView;
@property(nonatomic,strong) userActionModels * enterModel;
@end
//

@implementation DongwangBaseViewController

-(userActionModels *)enterModel{
    if (!_enterModel) {
        _enterModel = [[userActionModels alloc]init];
    }
    return _enterModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navLineHidden = YES;
    self.view.backgroundColor = LGDMianColor;
    [self.view addSubview:self.DongwangBtomImgView];
    [_DongwangBtomImgView bringSubviewToFront:self.view];
    
    
    
}


-(void)setIsShowBtomImgView:(BOOL)isShowBtomImgView{
    _isShowBtomImgView = isShowBtomImgView;
    self.DongwangBtomImgView.hidden = isShowBtomImgView;
}
-(UIImageView *)DongwangBtomImgView{
    if (!_DongwangBtomImgView) {
        _DongwangBtomImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-K(280), SCREEN_HEIGHT-SafeAreaBottom_Height-K(103), K(280), K(103))];
        _DongwangBtomImgView.image = [UIImage imageNamed:@"个人底部背景"];
        _DongwangBtomImgView.hidden = YES;
    }
    return _DongwangBtomImgView;
}
#pragma mark--微信登录回调
- (void)chWxCodeNotification:(NSNotification *)notification {
    //    NSLog(@"%s",__func__);
    NSLog(@"DongwangBaseViewController");
    NSDictionary *notificatDictionary = notification.userInfo;
    NSString * wxCode= [notificatDictionary objectForKey:@"wxCode"];
    NSString *deviceID = [MFSIdentifier deviceID];
//    NSLog(@"deviceId: %@", deviceID);
    [DongwangLogoinViewModel CLShanyanLogoinWithParmters:@{@"code":wxCode,@"type":@"2",@"deviceId":deviceID}.mutableCopy RequestCuurentControlers:self logoinSuuced:^(id  _Nonnull object) {
        NSDictionary * responeDic= (NSDictionary *)object;
        NSString * wxSmsTip =  [NSString stringWithFormat:@"%@",[[responeDic objectForKey:@"data"] objectForKey:@"wxSmsTip"]];
        NSString * openid =  [NSString stringWithFormat:@"%@",[[responeDic objectForKey:@"data"] objectForKey:@"openid"]];
        //如果为1微信未绑定
        if ([wxSmsTip isEqualToString:@"1"]) {
            //那么去绑定
            DongwangBandingViewController * dongwangBangVc =[[DongwangBandingViewController alloc]init];
            dongwangBangVc.hidesBottomBarWhenPushed = YES;
            dongwangBangVc.wxSmsTip = wxSmsTip;
            dongwangBangVc.Mytype = @"2";
            dongwangBangVc.openid = openid;
            [self.navigationController pushViewController:dongwangBangVc animated:YES];
        }else{
            [UserManager userLoginSucced];
            [self BaseTabarRequest];
            
        }

    } logoinfairler:^{

    }];
    
}
//加载动态tabar
-(void)BaseTabarRequest{
//    [DongwangLogoinViewModel DongwangRequestTabbarWithParmtersw:@{}.mutableCopy RequestCuurentControlers:self logoinSuuced:^(DongwangTabbarModel * _Nonnull tabbarModel) {
//        DongwangBaseTabBarViewController * dongwangTabbarVc = [[DongwangBaseTabBarViewController alloc]init];
//        dongwangTabbarVc.tabbarModel = tabbarModel;
//        [AppDelegate getAppDelegate].window.rootViewController = dongwangTabbarVc;
//    } logoinfairler:^(DongwangTabbarModel * _Nonnull tabbarModel) {
//        DongwangBaseTabBarViewController * dongwangTabbarVc = [[DongwangBaseTabBarViewController alloc]init];
//        dongwangTabbarVc.tabbarModel = tabbarModel;
//        [AppDelegate getAppDelegate].window.rootViewController = dongwangTabbarVc;
//    }];
//
    //2.0 不再调用接口
    
    UIWindow * window = [AppDelegate getAppDelegate].window;
    
    if (window.rootViewController) {
        window.rootViewController = nil;
    }
    
    DongwangBaseTabBarViewController * dongwangTabbarVc = [[DongwangBaseTabBarViewController alloc]init];
    dongwangTabbarVc.tabbarModel = [DongwangTabbarModel new];
    window.rootViewController = dongwangTabbarVc;
}
// 自动隐藏iphonex的底部横条
- (BOOL)prefersHomeIndicatorAutoHidden {
    return NO;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.enterModel.timeIn = [NSString currentTimeStr];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.enterModel.timeOut =  [NSString currentTimeStr];
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
