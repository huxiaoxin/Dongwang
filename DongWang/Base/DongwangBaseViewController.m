//
//  DongwangBaseViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/20.
//

#import "DongwangBaseViewController.h"

@interface DongwangBaseViewController ()

@end

@implementation DongwangBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navLineHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    // 标题栏
    
    self.gk_navBackgroundImage = [UIImage imageNamed:@"标题栏"];
    
    // Do any additional setup after loading the view.
}
//// 自动隐藏iphonex的底部横条
- (BOOL)prefersHomeIndicatorAutoHidden {
    return YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
