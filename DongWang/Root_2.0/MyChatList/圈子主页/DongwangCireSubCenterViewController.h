//
//  DongwangCireSubCenterViewController.h
//  DongWang
//
//  Created by sycm on 2021/3/9.
//

#import "DongwangBaseViewController.h"
#import "JXPagerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangCireSubCenterViewController : DongwangBaseViewController<JXPagerViewListViewDelegate>
@property(nonatomic,strong) UITableView * DongwangTableView;

@end

NS_ASSUME_NONNULL_END
