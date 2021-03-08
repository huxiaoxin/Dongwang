//
//  DongwangHomeTuijianViewControllerChild_V3.m
//  DongWang
//
//  Created by codehzx on 2021/1/17.
//

#import "DongwangHomeTuijianViewControllerChild_V3.h"
#import "DongwangPrivetaWebViewController.h"
@interface DongwangHomeTuijianViewControllerChild_V3 ()

@end

@implementation DongwangHomeTuijianViewControllerChild_V3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navigationBar.hidden = YES;
    UIImageView * dongwangbjImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH)];
    dongwangbjImgView.image =[UIImage imageNamed:@"标签背景图"];
    dongwangbjImgView.userInteractionEnabled = YES;
    [self.view addSubview:dongwangbjImgView];
    
    UITapGestureRecognizer * imgtap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ImgTapActions)];
    
    [dongwangbjImgView addGestureRecognizer:imgtap];
    // Do any additional setup after loading the view.
}
-(void)ImgTapActions{
    DongwangPrivetaWebViewController * dongwVc = [[DongwangPrivetaWebViewController alloc]init];
    dongwVc.protoclUrlText = @"http://47.101.168.243:91/preview/dongwang_h5/answer_default/index.html?groupId=4";
    dongwVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dongwVc animated:YES];
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
