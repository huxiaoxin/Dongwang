//
//  UITableView+AddForPlaceholder.h
//  SYQuMinApp
//
//  Created by apple on 2018/4/26.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (AddForPlaceholder)
///  默认的无数据提示 View 的点击回调
@property (nonatomic, copy) void(^defaultNoDataViewDidClickBlock)(UIView *view);
/// 设置默认的提示文字
@property (nonatomic, copy) NSString *defaultNoDataText;
/// 设置默认的提示图片
@property (nonatomic, strong) UIImage *defaultNoDataImage;
/// 自定义无数据提示View
@property (nonatomic, strong) UIView *customNoDataView;
@end
