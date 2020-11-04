//
//  EasyLodingView.h
//  自定义小菊花无网络提示
//
//  Created by apple on 2018/3/29.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EasyLodingConfig.h"
@interface EasyLodingView : UIView
/**
 * 显示一个加载框（config：显示属性设置）
 */
+ (EasyLodingView *)showLoding ;
+ (EasyLodingView *)showLodingText:(NSString *)text ;
+ (EasyLodingView *)showLodingText:(NSString *)text
                            config:(EasyLodingConfig *(^)(void))config ;

/**
 * 显示一个带图片的加载框 （config：显示属性设置）
 */
+ (EasyLodingView *)showLodingText:(NSString *)text
                         imageName:(NSString *)imageName ;
+ (EasyLodingView *)showLodingText:(NSString *)text
                         imageName:(NSString *)imageName
                            config:(EasyLodingConfig *(^)(void))config ;

/**
 * 移除一个加载框
 * superview:加载框所在的父视图。(如果show没指定父视图。那么隐藏也不用)
 */
+ (void)hidenLoding ;
+ (void)hidenLoingInView:(UIView *)superView ;
+ (void)hidenLoding:(EasyLodingView *)lodingView ;
@end
