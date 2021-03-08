//
//  StratViewController.m
//  引导启动页
//
//  Created by 顾成辉 on 2017/8/14.
//  Copyright © 2017年 zimo. All rights reserved.
//

#import "DongwangMyStratViewController.h"
#import "DongwangMyStratPageView.h"
#import "ViewController.h"
#import "DongwangCodeLoginViewController.h"
#import "DongwangCLLoginViewController.h"
#import "DongwangTabbarModel.h"
#import "DongwangBaseTabBarViewController.h"
#define kTimeInterval 3.0
@interface DongwangMyStratViewController ()

/** <#des#> */
@property (nonatomic,strong) DongwangMyStratPageView * guideView;

/** <#des#> */
@property (nonatomic,strong) NSArray * images;
@property (nonatomic, strong)NSArray *imagesX;

@property (nonatomic, strong)NSArray *stratImageArray;

@end

@implementation DongwangMyStratViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = Color1;
    if (ISIPHONE_X) {
        _stratImageArray = self.images;
    } else {
        _stratImageArray = self.images;
    }
    [self.guideView guideViewDataWithImages:_stratImageArray];
}

- (DongwangMyStratPageView *)guideView
{
    if(!_guideView){
        _guideView = [[DongwangMyStratPageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        kWeakSelf(self);
        [_guideView addSlectBlock:^(NSInteger curretnPageNumber) {
            if (curretnPageNumber == weakself.images.count - 1) {
                [NSUserDefaults ch_setCustomObject:@"1" forKey:CHUserEntersFirstTime];
                weakself.guideView.backgroundColor = Color1;
                [UIView animateWithDuration:.2 animations:^{
                    weakself.guideView.alpha = 0;
                    if ([UserManager userisLogoin]) {
                        [weakself tabarRequest];
                    }else{
                        //直接拉取闪验 拉取失败 直接进验证码登录页面
                        NSString *shanyanLogin = [NSString stringWithFormat:@"%@", [NSUserDefaults ch_customObjectForKey:CHSYTagPhoneNumberBOOL]];
                        [weakself DongwangLogoinConfigerType:shanyanLogin];
                    }
                }];
            }
        }];
        [self.view addSubview:_guideView];
    }
    return _guideView;
}
-(void)tabarRequest{
    NSDictionary *postHeader = [EncryptionTool getSignatureTimestamp];
    NSString *url = [NSString stringWithFormat:@"%@/rest/home/tab", BASE_IPURL];
    kWeakSelf(self);
    [CHShowMessageHud showHUDPlainText:@"" view:self.view];
    [AFNetworkTool GET:url HttpHeader:postHeader Parameters:nil Success:^(id responseObject) {
        [CHShowMessageHud dismissHideHUD:self.view];
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSLog(@"动态：%@",dic);
        if ([dic[@"err"] isEqualToString:@"00000"]) {
            NSDictionary *tempData = (NSDictionary *)dic[@"dat"];
            DongwangTabbarModel * model = [DongwangTabbarModel BaseinitWithDic:tempData];
            [weakself loadHomeTabbarWithTabbarModel:model];
        } else {
            [weakself loadHomeTabbarWithTabbarModel:nil];
        }
    } Failure:^(id failure) {
        [CHShowMessageHud dismissHideHUD:self.view];
        [weakself loadHomeTabbarWithTabbarModel:nil];
    }];
    

}
-(void)loadHomeTabbarWithTabbarModel:(DongwangTabbarModel *)tabbarModel{
    DongwangBaseTabBarViewController * dongwangTabbarVc = [[DongwangBaseTabBarViewController alloc]init];
    if (tabbarModel) {
        dongwangTabbarVc.tabbarModel = tabbarModel;
    }else{
        dongwangTabbarVc.tabbarModel = [DongwangTabbarModel new];
    }
    [AppDelegate getAppDelegate].window.rootViewController = dongwangTabbarVc;
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
        UINavigationController * DongwangclNav = [UINavigationController rootVC:DongwangLoginVc translationScale:YES];
        [self presentViewController:DongwangclNav animated:NO completion:nil];
    }
    
}
- (NSArray *)images
{
    if(!_images){
        _images = @[@"adshow1", @"adshow2", @"adshow3"];
    }
    return _images;
}
- (NSArray *)imagesX {
    if (!_imagesX) {
        _imagesX = @[@"一屏x.jpg", @"二屏x.jpg", @"三屏x.jpg"];
    }
    return _imagesX;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
