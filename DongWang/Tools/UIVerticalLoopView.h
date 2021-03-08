//
//  UIVerticalLoopView.h
//  SYQuMinApp
//
//  Created by apple on 2018/4/24.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol VerticalLoopDelegate<NSObject>

- (void)didClickContentAtIndex:(NSInteger)index;

@end
typedef enum
{
    VerticalLoopDirectionBottom,
    VerticalLoopDirectionDown,
    
}VerticalLoopDirection;
@interface UIVerticalLoopView : UIView
// 创建两个label循环滚动
@property (nonatomic, strong)UILabel *firstContentLabel;
@property (nonatomic, strong)UILabel *secondContentLabel;
@property (nonatomic, assign)int currentIndex; // 记录
/** 动画方向默认往上
 *  跑马灯动画时间
 */
@property(nonatomic) float verticalLoopAnimationDuration;
/**
 *  显示的内容(支持多条数据)
 */
@property(nonatomic, retain) NSArray *verticalLoopContentArr;
/**
 * loop方向(上下/右)
 */
@property(nonatomic) VerticalLoopDirection Direction;
@property (nonatomic)id<VerticalLoopDelegate> loopDelegate;
/**
 *  开启
 */
-(void)start;
@end
