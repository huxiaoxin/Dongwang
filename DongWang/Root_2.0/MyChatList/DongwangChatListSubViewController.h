//
//  DongwangChatListSubViewController.h
//  DongWang
//
//  Created by sycm on 2021/3/1.
//

#import "DongwangBaseViewController.h"
#import "JXPagerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangChatListSubViewController : DongwangBaseViewController<JXPagerViewListViewDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property(nonatomic,strong) NSArray  * dataSoure;
@property(nonatomic,assign) NSInteger  Index;

@end

NS_ASSUME_NONNULL_END
