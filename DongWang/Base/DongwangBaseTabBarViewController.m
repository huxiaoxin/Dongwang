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
#import "DongFangMyCenterViewController.h"
#import "DongwangActityViewController.h"
#import "CoreAnimationEffect.h"
#import "UIView+CHFrame.h"
@interface DongwangBaseTabBarViewController ()<UITabBarControllerDelegate>
@property (nonatomic, strong)UITabBarItem *lastItem; // 标记上一次点击的TabBarItem
@property (nonatomic, assign)BOOL lastBOOL;
@end

@implementation DongwangBaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
    CHTabBar *tabbar = [[CHTabBar alloc] init];
    [self setValue:tabbar forKeyPath:@"tabBar"];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#9F9FA0"]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:LGDMianColor} forState:UIControlStateNormal];
//    [self.tabBar showBadgeOnItemIndex:3 AllItemIndex:5];
    
}
-(void)setTabbarModel:(DongwangTabbarModel *)tabbarModel{
    _tabbarModel = tabbarModel;
    //初始化标题数组, 未选择图片数组, 选择图片数组, 控制器数组
    NSMutableArray *titleArr;
    NSMutableArray *imageNormalArr;
    NSMutableArray *imageSelectedArr;
    NSArray *controArray;
    if ([tabbarModel.status integerValue] == 1) {
        //显示活动
        
        titleArr = [NSMutableArray arrayWithObjects:@"首页",@"任务", @"",@"发现",@"我的", nil];
        imageNormalArr = [NSMutableArray arrayWithObjects:@"shouyeweixuanzhong",@"fenleiweixuanzhong", tabbarModel.picture,@"PathFill",@"wodeweixuanzhong", nil];
        imageSelectedArr = [NSMutableArray arrayWithObjects:@"shouyexuanzhong",@"fenleixuanzhong", tabbarModel.picture,@"PathXuanFill",@"wodexuanzhong", nil];
        NSString *tempH5Url = [NSString stringWithFormat:@"%@", tabbarModel.h5Url];
        DongwangActityViewController *invitedShareVC = [[DongwangActityViewController alloc] init];
//        invitedShareVC.homeInvitedShareType = CHHomeInvitedShareViewControllerTabbar;
        invitedShareVC.htmlUrl = tempH5Url;
        controArray = @[[DongwangHomeViewController new], [DongwangFenleiViewController new], invitedShareVC,[DongwangFindViewController new], [DongFangMyCenterViewController new]];
    }else{
        //不显示活动
        titleArr = [NSMutableArray arrayWithObjects:@"首页",@"任务",@"发现",@"我的", nil];
        imageNormalArr = [NSMutableArray arrayWithObjects:@"shouyeweixuanzhong",@"fenleiweixuanzhong",@"PathFill",@"wodeweixuanzhong", nil];
        imageSelectedArr = [NSMutableArray arrayWithObjects:@"shouyexuanzhong",@"fenleixuanzhong",@"PathXuanFill",@"wodexuanzhong", nil];
    controArray = @[[DongwangHomeViewController new], [DongwangFenleiViewController new], [DongwangFindViewController new], [DongFangMyCenterViewController new]];
    }
    for (int i = 0; i < titleArr.count; i++) {
    UINavigationController *nav = [UINavigationController rootVC:controArray[i] translationScale:YES];
    [self addChildViewController:nav andTitle:titleArr[i] image:imageNormalArr[i] selectImage:imageSelectedArr[i]];
    }
    
}
-(void)addChildViewController:(UIViewController *)vc andTitle:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage{
    //设置title和图片
    NSString *tempMode = [NSString stringWithFormat:@"%@",_tabbarModel.mode];
    NSString *tempColor =[NSString stringWithFormat:@"%@", _tabbarModel.color];
    NSString *tempTitle = @"";  //接口返回为空没有title，key
    CGFloat tabbarIItemMakeFloat = 2;
    CGFloat btnH = [_tabbarModel.height floatValue]; // 高度
    CGFloat btnW = [_tabbarModel.width floatValue]; // 宽度
    if ([NSString isBlankString:title] == YES) {
        if ([tempMode isEqualToString:@"2"] && [NSString isBlankString:tempTitle] == YES) {
            title = @"";
            tabbarIItemMakeFloat = 5;
        } else if ([tempMode isEqualToString:@"1"] && [NSString isBlankString:tempTitle] == NO) {
            title = tempTitle;
        }
    }
    vc.tabBarItem.title = title;
    UIImage *rootNotImage;
    UIImage *rootSelectImage;
    if ([image rangeOfString:@"http://"].location !=NSNotFound || [image rangeOfString:@"https://"].location !=NSNotFound) {
       rootNotImage = [UIImage imageResize:[UIImage getImageFromURL:image] andResizeTo:CGSizeMake(btnW, btnH)];
        rootSelectImage = [UIImage imageResize:[UIImage getImageFromURL:selectImage] andResizeTo:CGSizeMake(btnW, btnH)];
#pragma mark -- 改变中间字体颜色
        NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
        textAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:tempColor];
        [vc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
        [vc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateSelected];
    } else {
        rootNotImage = [UIImage imageNamed:image];
        rootSelectImage = [UIImage imageNamed:selectImage];
    }

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
