//
//  DongwangQidonyeViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/20.
//

#import "DongwangQidonyeViewController.h"
#import "DongWangPrivateView.h"
#import "DongwangPrivetaWebViewController.h"
#import "StratViewController.h"

@interface DongwangQidonyeViewController ()<DongWangPrivateViewDelegate>
@property(nonatomic,strong) DongWangPrivateView * priveView;
@end

@implementation DongwangQidonyeViewController

-(DongWangPrivateView *)priveView{
    if (!_priveView) {
        _priveView = [[DongWangPrivateView alloc]initWithFrame:self.view.bounds];
        _priveView.delegate = self;

    }
    return _priveView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navigationBar.hidden  =YES;
    UIImageView * DongwangImgView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    DongwangImgView.image = [UIImage LaunchImgNameSize];
    DongwangImgView.userInteractionEnabled = YES;
    [self.view addSubview:DongwangImgView];
    
    [self.view addSubview:self.priveView];
    
    // Do any additional setup after loading the view.
}

#pragma mark--DongWangPrivateViewDelegate
-(void)DongWangPrivateViewDidSeltecdWithBtnIndex:(NSInteger)btnIndex{
    if (btnIndex == 0) {
        [self.priveView removeViews];
    }else{
        //确定就去引导页
        StratViewController * StarVc = [[StratViewController alloc]init];
        [self.navigationController pushViewController:StarVc animated:YES];
    }
}
-(void)dealloc{
    NSLog(@"====%s",__func__);
}
-(void)DongWangPrivateViewPushToWeb{
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        DongwangPrivetaWebViewController * webVc = [[DongwangPrivetaWebViewController alloc]init];
        webVc.protoclUrlText = @"dongwang_h5/document/index.html?type=policy";
        UINavigationController * Dongwangav = [UINavigationController rootVC:webVc translationScale:YES];
        [weakSelf presentViewController:Dongwangav animated:YES completion:nil];
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
