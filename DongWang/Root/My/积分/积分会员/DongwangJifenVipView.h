//
//  DongwangJifenVipView.h
//  DongWang
//
//  Created by codehzx on 2020/12/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangJifenVipViewDelegate <NSObject>

-(void)DongwangJifenVipViewRemoveFromeActions;

@end
@interface DongwangJifenVipView : UIView
@property(nonatomic,weak) id <DongwangJifenVipViewDelegate>delegate;
-(void)show;
@end

NS_ASSUME_NONNULL_END
