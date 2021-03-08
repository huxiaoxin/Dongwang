//
//  DongwangHomeViewController_V2.m
//  DongWang
//
//  Created by codehzx on 2021/1/6.
//

#import "DongwangHomeViewController_V2.h"
#import "DongwangShangpinDetialViewController.h"
@interface DongwangHomeViewController_V2 ()
@property(nonatomic,strong) UITableView * DongwnagMyTableView;
@end

@implementation DongwangHomeViewController_V2

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.gk_navTitle =  @"积分商城";
    self.gk_navigationBar.hidden = YES;
    [self.view addSubview:self.DongwnagMyTableView];
    self.view.backgroundColor =  LGDMianColor;
    
    UIView * DongwangTableHaderView= [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RealWidth(900))];
    _DongwnagMyTableView.tableHeaderView = DongwangTableHaderView;
    
    
    UIImageView * DongwangFirstImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, StatuBar_Height, SCREEN_WIDTH, K(493.5))];
    DongwangFirstImgView.image = [UIImage imageNamed:@"shouyebj"];
    [DongwangTableHaderView addSubview:DongwangFirstImgView];
    
    
    UIImageView * DongwangSecondImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangFirstImgView.frame), SCREEN_WIDTH/2, K(185))];
    DongwangSecondImgView.tag = 0;
    DongwangSecondImgView.image = [UIImage imageNamed:@"mall01"];
    DongwangSecondImgView.backgroundColor = [UIColor clearColor];
    DongwangSecondImgView.userInteractionEnabled = YES;
    [DongwangTableHaderView addSubview:DongwangSecondImgView];
    UITapGestureRecognizer  * DongwanSecondTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwanGSeocndTapCLic:)];
    [DongwangSecondImgView addGestureRecognizer:DongwanSecondTap];
    
    UIImageView * DongwangThreeImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, CGRectGetMaxY(DongwangFirstImgView.frame), SCREEN_WIDTH/2, K(185))];
    DongwangThreeImgView.image = [UIImage imageNamed:@"mall02"];
    DongwangThreeImgView.tag = 1;
    DongwangThreeImgView.userInteractionEnabled = YES;
    [DongwangTableHaderView addSubview:DongwangThreeImgView];
    UITapGestureRecognizer  * DongwanThreeTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwanGSeocndTapCLic:)];
    [DongwangThreeImgView addGestureRecognizer:DongwanThreeTap];
    
    
    
    
    
    
    
    
    
    
//    UIImageView * DongwangFoureImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangSecondImgView.frame), SCREEN_WIDTH/2, K(185))];
//    DongwangFoureImgView.image = [UIImage imageNamed:@"youlechang3"];
//    DongwangFoureImgView.tag = 2;
//    DongwangFoureImgView.backgroundColor = [UIColor redColor];
//    DongwangFoureImgView.userInteractionEnabled = YES;
//    [DongwangTableHaderView addSubview:DongwangFoureImgView];
//    UITapGestureRecognizer  * DongwanFoureTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwanGSeocndTapCLic:)];
//    [DongwangFoureImgView addGestureRecognizer:DongwanFoureTap];

    
//    UIImageView * DongwangFiveImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, CGRectGetMaxY(DongwangSecondImgView.frame), SCREEN_WIDTH/2, K(185))];
//    DongwangFiveImgView.image = [UIImage imageNamed:@"youlechang4"];
//    DongwangFiveImgView.tag = 3;
//    DongwangFiveImgView.userInteractionEnabled = YES;
//    [DongwangTableHaderView addSubview:DongwangFiveImgView];
//    UITapGestureRecognizer  * DongwanFiveTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwanGSeocndTapCLic:)];
//    [DongwangFiveImgView addGestureRecognizer:DongwanFiveTap];
    
}
-(void)DongwanGSeocndTapCLic:(UITapGestureRecognizer *)ImgRap{
    UIImageView * imgs = (UIImageView *)[ImgRap view];
    NSLog(@"=======%d",imgs.tag);

    DongwangShangpinDetialViewController * DetiaVc= [[DongwangShangpinDetialViewController alloc]init];
    DetiaVc.indexs = imgs.tag;
    DetiaVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:DetiaVc animated:YES];
    
}
-(UITableView *)DongwnagMyTableView{
    if (!_DongwnagMyTableView) {
        _DongwnagMyTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-kTabBarHeight) style:UITableViewStylePlain];
        _DongwnagMyTableView.showsVerticalScrollIndicator = NO;
        _DongwnagMyTableView.showsHorizontalScrollIndicator = NO;
        _DongwnagMyTableView.backgroundColor = LGDMianColor;
    }
    return _DongwnagMyTableView;
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
