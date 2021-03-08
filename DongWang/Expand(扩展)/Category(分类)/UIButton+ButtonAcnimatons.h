//
//  UIButton+ButtonAcnimatons.h
//  DongWang
//
//  Created by codehzx on 2020/11/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (ButtonAcnimatons)
- (void)animationStartPoint:(CGPoint)start endPoint:(CGPoint)end didStopAnimation:(void (^)(void))event;
@end

NS_ASSUME_NONNULL_END
