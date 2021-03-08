//
//  DongwangBaseTabBarViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/20.
//

#import "DongwangBaseTabBarViewController.h"
#import "AppDelegate.h"
#import "CHTabBar.h"
#import "DongwangHomeViewController.h"
#import "DongwangFenleiViewController.h"
#import "DongwangFindViewController.h"
#import "DongwangHotTizuViewController.h"
#import "DongFangMyCenterViewController.h"
#import "DongwangActityViewController.h"
#import "CoreAnimationEffect.h"
#import "UIView+CHFrame.h"
#import "DongwangPrivetaWebViewController.h"




#import "DongwangHomeViewController_V2.h"
#import "DongwangMallViewController.h"
#import "DongwangFindViewController_V2.h"
#import "DongwangHomeViewController_V3.h"
#import "DongwangDaletouViewController.h"
#import "DongwangMyChatListViewController.h"
#import "DongwangyouleChangViewController.h"
#import "DongwangHomeTuijianViewController_V3.h"
@interface DongwangBaseTabBarViewController ()<UITabBarControllerDelegate>
@property (nonatomic, strong)UITabBarItem *lastItem; // 标记上一次点击的TabBarItem
@property (nonatomic, assign)BOOL lastBOOL;
@property (strong, nonatomic) NSDate *lastDate;

@end

@implementation DongwangBaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
    CHTabBar *tabbar = [[CHTabBar alloc] init];
    tabbar.translucent = NO;
    tabbar.barTintColor = LGDTabarColor;
    [self setValue:tabbar forKeyPath:@"tabBar"];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    
    

    
    
}
-(void)setTabbarModel:(DongwangTabbarModel *)tabbarModel{
    _tabbarModel = tabbarModel;
    
//    NSMutableArray *titleArr;
//    NSMutableArray *imageNormalArr;
//    NSMutableArray *imageSelectedArr;
//    NSArray *controArray;
//    if ([NSString isBlankString:tabbarModel.imageUrl] == NO) {
//
//        [[NSUserDefaults standardUserDefaults] setBool:[NSNumber numberWithBool:YES] forKey:AppisHaveactivity];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//
//        NSString * name  = [NSString isBlankString:tabbarModel.name] ? @"" : tabbarModel.name;
//        //显示活动
//        titleArr = [NSMutableArray arrayWithObjects:@"首页",@"任务", name,@"发现",@"我的", nil];
//        imageNormalArr = [NSMutableArray arrayWithObjects:@"shouye",@"fenlei", tabbarModel.imageUrl,@"faxian",@"wode", nil];
//        imageSelectedArr = [NSMutableArray arrayWithObjects:@"shouyesel",@"fenleisel", tabbarModel.imageUrl,@"faxiansel",@"wodesel", nil];
//        NSString *tempH5Url = [NSString stringWithFormat:@"%@", tabbarModel.action];
//        DongwangPrivetaWebViewController *invitedShareVC = [[DongwangPrivetaWebViewController alloc] init];
//        invitedShareVC.protoclUrlText = tempH5Url;
//        invitedShareVC.titleName =  tabbarModel.name;
//        invitedShareVC.type =  VCPressent;
//        invitedShareVC.isActity = YES;
//        controArray = @[[DongwangMallViewController new], [DongwangFenleiViewController new], invitedShareVC,[DongwangHotTizuViewController new], [DongFangMyCenterViewController new]];
//    }else{
//        [[NSUserDefaults standardUserDefaults] setBool:[NSNumber numberWithBool:NO] forKey:AppisHaveactivity];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//        //不显示活动
//        titleArr = [NSMutableArray arrayWithObjects:@"首页",@"任务",@"发现",@"我的", nil];
//        imageNormalArr = [NSMutableArray arrayWithObjects:@"shouye",@"fenlei",@"faxian",@"wode", nil];
//        imageSelectedArr = [NSMutableArray arrayWithObjects:@"shouyesel",@"fenleisel",@"faxiansel",@"wodesel", nil];
//       controArray = @[[DongwangMallViewController new], [DongwangFenleiViewController new], [DongwangHotTizuViewController new], [DongFangMyCenterViewController new]];
//    }
    
    
    
    
    
    
    
//    //初始化标题数组, 未选择图片数组, 选择图片数组, 控制器数组
    NSMutableArray *titleArr;
    NSMutableArray *imageNormalArr;
    NSMutableArray *imageSelectedArr;
    NSArray *controArray;
        //显示活动
        titleArr = [NSMutableArray arrayWithObjects:@"",@"", @"",@"",@"", nil];
        imageNormalArr = [NSMutableArray arrayWithObjects:@"youle_nomal",@"quanzi_nomal", @"dati_nomal",@"shangcheng_nomal",@"daletou_nomal", nil];
        imageSelectedArr = [NSMutableArray arrayWithObjects:@"youle_sel",@"quanzi_sel", @"dati_sel",@"shangcheng_sel",@"daletou_sel", nil];

    //DongwangMallViewController
    //DongwangyouleChangViewController
controArray = @[[DongwangyouleChangViewController new], [DongwangMyChatListViewController new], [DongwangHomeViewController_V3 new],[DongwangHomeViewController_V2 new], [DongwangDaletouViewController new]];
//
    for (int i = 0; i < titleArr.count; i++) {
    UINavigationController *nav = [UINavigationController rootVC:controArray[i] translationScale:YES];
    [self addChildViewController:nav andTitle:titleArr[i] image:imageNormalArr[i] selectImage:imageSelectedArr[i]];
    }
    
    self.selectedIndex= 2;
}
-(void)addChildViewController:(UIViewController *)vc andTitle:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage{
//    //设置title和图片
//    NSString *tempMode = [NSString stringWithFormat:@"%@",_tabbarModel.mode];
//    NSString *tempColor = @"#9F9FA0";
//    NSString *tempTitle = @"";  //接口返回为空没有title，key
    CGFloat tabbarIItemMakeFloat = [NSString isBlankString:title] ? 0: 0;
//    CGFloat btnH = 50;
//    CGFloat btnW = 50;
//    if ([NSString isBlankString:title] == YES) {
//        if ([tempMode isEqualToString:@"2"] && [NSString isBlankString:tempTitle] == YES) {
//            title = @"";
//            tabbarIItemMakeFloat = 5;
//        } else if ([tempMode isEqualToString:@"1"] && [NSString isBlankString:tempTitle] == NO) {
//            title = tempTitle;
//        }
//    }
//
    
 
    vc.tabBarItem.title = title;
    UIImage *rootNotImage;
    UIImage *rootSelectImage;
//    if ([image rangeOfString:@"actityicon"].location !=NSNotFound || [image rangeOfString:@"actityicon"].location !=NSNotFound) {
//       rootNotImage = [UIImage imageResize:[UIImage getImageFromURL:image] andResizeTo:CGSizeMake(btnW, btnH)];
//        rootSelectImage = [UIImage imageResize:[UIImage getImageFromURL:selectImage] andResizeTo:CGSizeMake(btnW, btnH)];
//      #pragma mark -- 改变中间字体颜色
//        NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
//        textAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:tempColor];
//        textAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:tempColor];
//        [vc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
//        [vc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateSelected];
//    } else {
        rootNotImage = [UIImage imageNamed:image];
        rootSelectImage = [UIImage imageNamed:selectImage];
//    }

    vc.tabBarItem.image = [rootNotImage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    vc.tabBarItem.selectedImage = [rootSelectImage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    vc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -4.5);
    //    //设置文字位置，在有文字时用于调整文字的位置
    //    [vc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2.5)];
    //设置图片位置  注意：图片 上下 or 左右 的间距要一样，否侧有些手机上会变形
//    [vc.tabBarItem setImageInsets:UIEdgeInsetsMake(-(tabbarIItemMakeFloat), 0, 0, 0)]; //
    
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(-tabbarIItemMakeFloat, 0, tabbarIItemMakeFloat, 0);
    //添加到
    [self addChildViewController:vc];

}
#pragma mark - 控制器跳转拦截
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return YES;
}

//监听状态栏的点击
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    if ([touches.anyObject locationInView:nil].y <= 20)
//    {
//        BDJLog(@"点击了状态栏");
//    }
//}

#pragma mark - 禁止屏幕旋转
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;//只支持这一个方向(正常的方向)
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if (self.lastItem != item && self.lastItem) {
        self.lastBOOL = YES;
    } else {
        self.lastBOOL = NO;
    }
    self.lastItem = item;
}
#pragma mark - <UITabBarControllerDelegate>
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    //点击tabBarItem动画
    [self tabBarButtonClick:[self getTabBarButton]];
    DongwangBaseViewController *vc = tabBarController.selectedViewController;
    NSDate *date = [[NSDate alloc] init];
    if ([vc isEqual:viewController]) {
    if (date.timeIntervalSince1970 - _lastDate.timeIntervalSince1970 < 0.4) {
    [[NSNotificationCenter defaultCenter]  postNotificationName:@"DongwangChangetuijianVCOfferset" object:nil];
    }
    _lastDate = date;
    }
    
}
- (UIControl *)getTabBarButton{
    NSMutableArray *tabBarButtons = [[NSMutableArray alloc]initWithCapacity:0];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [tabBarButtons addObject:tabBarButton];
        }
    }
    UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.selectedIndex];
    return tabBarButton;
}
#pragma mark - 点击动画
- (void)tabBarButtonClick:(UIControl *)tabBarButton {
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            [CoreAnimationEffect showCAKeyframeAnimationsForView:imageView keyPath:@"transform.scale" values1:1 values2:1.1 values3:.9 values4:1 duration:.3 repatCount:1];
        }
    }
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
