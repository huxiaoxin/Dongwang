//
//  CHShowMessageHud.h
//  SYQuMinApp
//
//  Created by apple on 2018/5/3.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHShowMessageHud : NSObject
+ (void)showMessageText:(NSString *)text; // 下方错误提示
+ (void)showMessageText:(NSString *)text textBgColor:(UIColor *)color statusType:(int)statusType;
- (void)showLodingImage;
//+ (void)dismissMessageHud;
//- (void)chDismissImageHud;

#pragma mark -- 小菊花
// 小菊花文字菊花提示
+ (void)showHUDPlainText:(NSString *)text view:(UIView *)view;
+ (void)dismissHideHUD:(UIView *)view;
@end
