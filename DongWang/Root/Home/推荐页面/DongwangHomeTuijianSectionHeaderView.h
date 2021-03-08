//
//  DongwangHomeTuijianSectionHeaderView.h
//  DongWang
//
//  Created by codehzx on 2020/12/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^DongwangHomeTuijianSectionHeaderBlock)(CGFloat sectionHeight);
@interface DongwangHomeTuijianSectionHeaderView : UIView
@property(nonatomic,strong) NSMutableArray * DataArr;
@property(nonatomic,copy) DongwangHomeTuijianSectionHeaderBlock  headerBlock;
@end

NS_ASSUME_NONNULL_END
