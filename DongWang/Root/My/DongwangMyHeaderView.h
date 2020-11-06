//
//  DongwangMyHeaderView.h
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangMyHeaderViewDelegate <NSObject>

-(void)DongwangMyHeaderViewPushInfoVc;

@end
@interface DongwangMyHeaderView : UIView
@property(nonatomic,weak) id <DongwangMyHeaderViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
