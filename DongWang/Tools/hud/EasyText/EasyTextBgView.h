//
//  EasyTextBgView.h
//  自定义小菊花无网络提示
//
//  Created by apple on 2018/3/28.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EasyTextConfig.h"
#import "UIView+EasyShowExt.h"
@interface EasyTextBgView : UIView
- (instancetype)initWithFrame:(CGRect)frame status:(ShowTextStatus)status text:(NSString *)text imageName:(NSString *)imageName config:(EasyTextConfig *)config ;

- (void)showWindowYToPoint:(CGFloat)toPoint ;

- (void)showStartAnimationWithDuration:(CGFloat)duration ;
- (void)showEndAnimationWithDuration:(CGFloat)duration  ;

@end
