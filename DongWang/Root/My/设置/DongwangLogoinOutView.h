//
//  DongwangLogoinOutView.h
//  DongWang
//
//  Created by codehzx on 2020/11/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangLogoinOutViewDelegate <NSObject>

-(void)DongwangLogoinOutViewlogintouViewWithBtnIndex:(NSInteger)index;

@end
@interface DongwangLogoinOutView : UIView
@property(nonatomic,weak) id <DongwangLogoinOutViewDelegate>delegate;
-(void)show;
@end

NS_ASSUME_NONNULL_END
