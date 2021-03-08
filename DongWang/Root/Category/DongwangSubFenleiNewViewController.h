//
//  DongwangSubFenleiNewViewController.h
//  DongWang
//
//  Created by codehzx on 2020/12/3.
//

#import "DongwangBaseViewController.h"
#import "JXPagerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangSubFenleiNewViewController : DongwangBaseViewController<JXPagerViewListViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property(nonatomic,strong) NSArray  * dataSoure;

@end

NS_ASSUME_NONNULL_END
