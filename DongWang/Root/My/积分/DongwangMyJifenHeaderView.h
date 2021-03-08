//
//  DongwangMyJifenHeaderView.h
//  DongWang
//
//  Created by codehzx on 2020/11/17.
//

#import <UIKit/UIKit.h>
#import "TreeView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangMyJifenHeaderView : UIView
-(instancetype)initWithFrame:(CGRect)frame withCurrentVc:(DongwangBaseViewController *)Vc;
@property(nonatomic,strong) NSArray * treeModelArr;
@property(nonatomic,assign) CGFloat JifenHeaderHeight;
@property(nonatomic,strong) TreeView * DongwangTreeView;

@end

NS_ASSUME_NONNULL_END
