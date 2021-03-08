//
//  DongwangSubFenleiViewController.h
//  DongWang
//
//  Created by codehzx on 2020/11/26.
//

#import "DongwangBaseViewController.h"
#import "JXPagerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangSubFenleiViewController : DongwangBaseViewController<JXPagerViewListViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property(nonatomic,strong) NSArray  * dataSoure;
@property(nonatomic,assign) NSInteger  Index;
@end

NS_ASSUME_NONNULL_END
