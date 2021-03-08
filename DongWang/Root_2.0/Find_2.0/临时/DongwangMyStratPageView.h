//
//  StratPageView.h
//  引导启动页
//
//  Created by 顾成辉 on 2017/8/14.
//  Copyright © 2017年 zimo. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^CurrentSelctBlock)(NSInteger curretnPageNumber);


@interface DongwangMyStratPageView : UIView

/**
 * @describe 当前图片点击的回调
 * @param    selectBlock 回调
 */
- (void)addSlectBlock:(CurrentSelctBlock)selectBlock;


/**
 * @describe 设置引导页回调
 * @param    images 图片资源
 */
- (void)guideViewDataWithImages:(NSArray *)images;

/**
 * @describe 构造方法
 * @param    frame frame
 * @param    pageAliment 对齐方式
 */
//- (instancetype)initWithFrame:(CGRect)frame andPageAliment:(CurrentPageAlignment)pageAliment;

@end
