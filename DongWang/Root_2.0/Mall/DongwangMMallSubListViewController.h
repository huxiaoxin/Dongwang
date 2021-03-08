//
//  DongwangMMallSubListViewController.h
//  DongWang
//
//  Created by codehzx on 2021/1/6.
//

#import "DongwangBaseViewController.h"
#import "JXPagerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangMMallSubListViewController : DongwangBaseViewController<JXPagerViewListViewDelegate>
@property (nonatomic, strong) UICollectionView * mycollectionView;
@end

NS_ASSUME_NONNULL_END
