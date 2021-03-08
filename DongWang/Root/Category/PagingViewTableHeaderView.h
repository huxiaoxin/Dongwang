//
//  PagingViewTableHeaderView.h
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/27.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PagingViewTableHeaderViewDelegate <NSObject>
-(void)PagingViewTableHeaderViewbackActon;
@end
@interface PagingViewTableHeaderView : UIView
@property(nonatomic,weak) id <PagingViewTableHeaderViewDelegate>delegate;
- (void)scrollViewDidScroll:(CGFloat)contentOffsetY;

@end
