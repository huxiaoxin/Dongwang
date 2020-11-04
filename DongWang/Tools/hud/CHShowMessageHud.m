//
//  CHShowMessageHud.m
//  SYQuMinApp
//
//  Created by apple on 2018/5/3.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import "CHShowMessageHud.h"
#import "EasyLodingView.h"
#import "EasyTextView.h"
#import "EasyLodingGlobalConfig.h"
#import <MBProgressHUD-umbrella.h>
#ifndef MB_INSTANCETYPE
#if __has_feature(objc_instancetype)
#define MB_INSTANCETYPE instancetype
#else
#define MB_INSTANCETYPE id
#endif
#endif
@interface CHShowMessageHud ()
@property (nonatomic, strong) EasyLodingView *hudView;

@end

@implementation CHShowMessageHud
//{
//    EasyLodingView *hudView;
//}
// 成功消息
+ (void)showMessageText:(NSString *)text {
    [EasyTextView showText:text config:^EasyTextConfig *{
        //（这三种方法都是一样的，根据使用习惯选择一种就行。|| 不传的参数就会使用EasyTextGlobalConfig全局配置的属性）
        //方法一
        //return [EasyTextConfig configWithSuperView:self.view superReceiveEvent:ShowTextEventUndefine animationType:TextAnimationTypeNone textStatusType:TextStatusTypeBottom];
        //方法二
        //return [EasyTextConfig shared].setBgColor([UIColor lightGrayColor]).setShadowColor([UIColor clearColor]).setStatusType(TextStatusTypeBottom);
        //方法三
        EasyTextConfig *config = [EasyTextConfig shared];
        config.bgColor = [UIColor lightGrayColor] ;
        config.shadowColor = [UIColor clearColor] ;
        config.animationType = TextAnimationTypeFade;
        config.statusType = TextStatusTypeBottom ;
        config.superReceiveEvent = NO;
        return config ;
    }];
}
+ (void)showMessageText:(NSString *)text textBgColor:(UIColor *)color statusType:(int)statusType {
    [EasyTextView showText:text config:^EasyTextConfig *{
        //方法三
        EasyTextConfig *config = [EasyTextConfig shared];
        config.bgColor = color ;
        config.shadowColor = [UIColor clearColor] ;
        config.animationType = TextAnimationTypeFade;
        config.statusType = statusType ;
        config.superReceiveEvent = NO;
        return config ;
    }];
}
// 自定义图片加载框
- (void)showLodingImage {
    EasyLodingGlobalConfig *lodingConfig = [EasyLodingGlobalConfig shared];
    lodingConfig.lodingType = LodingAnimationTypeFade ;
    lodingConfig.bgColor = [UIColor clearColor];
    NSMutableArray *tempArr = [NSMutableArray arrayWithCapacity:8];
    for (int i = 0; i < 5; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"quan%d",5 - i]];
        [tempArr addObject:img] ;
    }
    lodingConfig.playImagesArray = tempArr ;
//    EasyLodingView *hudView;
    self.hudView = [EasyLodingView showLodingText:@"" config:^EasyLodingConfig *{
       
        int type =  LodingShowTypePlayImages ;
        return [EasyLodingConfig shared].setLodingType(type).setSuperReceiveEvent(NO).setShowOnWindow(YES);
    }];
    kWeakSelf(self);
    dispatch_queue_after_S(2, ^{
        [EasyLodingView hidenLoding:weakself.hudView];
    });
}

+ (void)showHUDPlainText:(NSString *)text view:(UIView *)view {
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.backgroundColor = Color34;
    hud.contentColor = Color1;
    if ([NSString isBlankString:text] == NO) {
        hud.label.text = text;
    }
    hud.removeFromSuperViewOnHide = YES;
}
+ (void)dismissHideHUD:(UIView *)view {
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    MBProgressHUD *hud = [CHShowMessageHud HUDForView:view];
    if (hud != nil) {
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:YES];
    }
}

+ (MBProgressHUD *)HUDForView:(UIView *)view {
    NSArray *subviewsEnum = view.subviews;
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:[MBProgressHUD class]]) {
            return (MBProgressHUD *)subview;
        }
    }
    return nil;
}

@end
