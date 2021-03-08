//
//  DongwangShangpinDetialViewController.m
//  DongWang
//
//  Created by codehzx on 2021/1/15.
//

#import "DongwangShangpinDetialViewController.h"

@interface DongwangShangpinDetialViewController ()

@end

@implementation DongwangShangpinDetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"商品详情";
    NSString * imgName;
    if (self.indexs == 0) {
        imgName = @"mall01_detial";
    }else if (self.indexs == 1){
        imgName = @"mall02_detial";
    }else if (self.indexs == 2){
        imgName = @"sc03";
    }else if (self.indexs == 3){
        imgName = @"sc04";
    }
    UIImageView * DongwangBiImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH)];
    DongwangBiImgView.image = [UIImage imageNamed:imgName];
    [self.view addSubview:DongwangBiImgView];
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
