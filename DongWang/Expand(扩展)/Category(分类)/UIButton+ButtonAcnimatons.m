//
//  UIButton+ButtonAcnimatons.m
//  DongWang
//
//  Created by codehzx on 2020/11/18.
//

#import "UIButton+ButtonAcnimatons.h"

@implementation UIButton (ButtonAcnimatons)
- (void)animationStartPoint:(CGPoint)start endPoint:(CGPoint)end didStopAnimation:(void (^)(void))event{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:start];
    //设置控制点
    CGPoint point1 = CGPointZero;
    CGPoint point2 = CGPointZero;
    
    if (start.x > end.x) {
        point1 = CGPointMake((start.x - end.x) / 4 * 3 + end.x, start.y - 40);
        point2 = CGPointMake((start.x - end.x) / 4 + end.x, (end.y - start.y) / 2 + start.y);
    }else {
        point1 = CGPointMake((end.x - start.x) / 4 + start.x , start.y - 40);
        point2 = CGPointMake((end.x - start.x) / 4 * 3 + start.x, (end.y - start.y) / 2 + start.y);
    }
    [path addCurveToPoint:end controlPoint1:point1 controlPoint2:point2];
    //路径
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
//    animation.rotationMode = kCAAnimationRotateAuto;
    //缩放
    CABasicAnimation *baAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //控制缩放的倍数，根据项目自定
    baAnimation.fromValue = @1;
    baAnimation.toValue = @(0.5);
    baAnimation.autoreverses = NO;
    
    //动画组合
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[animation,baAnimation];
    groups.duration = 1;
    groups.removedOnCompletion = NO;
    groups.fillMode = kCAFillModeForwards;
    groups.delegate = self;
    [groups setValue:@"groupsAnimation" forKey:@"animationName"];
    [self.layer addAnimation:groups forKey:nil];
    self.animStop = event;
}
#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.animStop();
}
- (void)setAnimStop:(void (^)(void))animStop {
    objc_setAssociatedObject(self, @"animStop", animStop, OBJC_ASSOCIATION_COPY);
}
- (void (^)(void))animStop {
    return objc_getAssociatedObject(self, @"animStop");
}


@end
