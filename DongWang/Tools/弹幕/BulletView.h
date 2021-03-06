//
//  BulletView.h
//  CommentDemo
//
//  Created by feng jia on 16/2/20.
//  Copyright © 2016年 caishi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DongwangbulletChtaModel.h"
typedef NS_ENUM(NSInteger, CommentMoveStatus) {
    Start,
    Enter,
    End
    
};

typedef NS_ENUM(NSInteger, Trajectory) {
    Trajectory_1,
    Trajectory_2,
    Trajectory_3
};

@interface BulletView : UIView
@property (nonatomic, copy) void(^moveBlock)(CommentMoveStatus status);
@property Trajectory trajectory; //弹幕弹道定义
@property (nonatomic, strong) UILabel *lbComment;


- (instancetype)initWithContent:(DongwangbulletChtaModel *)chatModel;
- (void)startAnimation;
- (void)stopAnimation;

@end
