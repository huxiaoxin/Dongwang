//
//  DongwangChildHomeViewController.h
//  DongWang
//
//  Created by codehzx on 2020/11/30.
//

#import "DongwangBaseViewController.h"
#import "DongwangHomeTagModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DongwangChildHomeViewController : DongwangBaseViewController
@property(nonatomic,assign) NSInteger  pageIndex;
@property(nonatomic,strong) DongwangHomeTagModel * TagModel;
@end

NS_ASSUME_NONNULL_END
