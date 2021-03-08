//
//  StartPageCell.h
//  引导启动页
//
//  Created by 顾成辉 on 2017/8/14.
//  Copyright © 2017年 zimo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DongwangMyStartPageCell : UICollectionViewCell

/** 跳过回调 */
//@property (nonatomic,copy) dispatch_block_t skipBlock;

/** 定时消失回调*/
//@property (nonatomic,copy) dispatch_block_t timeBlock;

/**
 * @describe 设置图片资源
 * @param    imageNames : 图片数组
 * @param    indexPath  : indexPath
 */
- (void)cellDataWithImageNames:(NSArray *)imageNames indexPath:(NSIndexPath *)indexPath;

@end
