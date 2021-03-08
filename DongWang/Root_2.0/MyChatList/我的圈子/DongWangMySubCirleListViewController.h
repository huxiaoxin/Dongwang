//
//  DongWangMySubCirleListViewController.h
//  DongWang
//
//  Created by sycm on 2021/3/5.
//

#import "DongwangBaseViewController.h"
#import "JXPagerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongWangMySubCirleListViewController : DongwangBaseViewController<JXPagerViewListViewDelegate>
@property(nonatomic,strong) UITableView * DongwangTableView;
@end

NS_ASSUME_NONNULL_END
