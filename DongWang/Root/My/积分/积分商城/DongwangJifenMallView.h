//
//  DongwangJifenMallView.h
//  DongWang
//
//  Created by codehzx on 2020/12/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangJifenMallViewDelegate <NSObject>

-(void)DongwangJifenMallViewRemove;

@end
@interface DongwangJifenMallView : UIView
@property(nonatomic,weak) id <DongwangJifenMallViewDelegate>delegate;
-(void)show;
@end

NS_ASSUME_NONNULL_END
