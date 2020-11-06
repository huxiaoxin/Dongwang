//
//  DongwangMyInfoHeaderView.h
//  DongWang
//
//  Created by codehzx on 2020/11/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangMyInfoHeaderViewDelegate <NSObject>

-(void)DongwangMyInfoHeaderViewChangeuserinfoImg;

@end
@interface DongwangMyInfoHeaderView : UIView
@property(nonatomic,weak) id <DongwangMyInfoHeaderViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
