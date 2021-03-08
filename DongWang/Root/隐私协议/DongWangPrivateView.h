//
//  DongWangPrivateView.h
//  DongWang
//
//  Created by codehzx on 2020/10/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongWangPrivateViewDelegate <NSObject>

-(void)DongWangPrivateViewDidSeltecdWithBtnIndex:(NSInteger)btnIndex;
-(void)DongWangPrivateViewPushToWeb;
@end
@interface DongWangPrivateView : UIView
@property(nonatomic,weak) id <DongWangPrivateViewDelegate>delegate;
-(void)removeViews;
-(void)show:(DongwangBaseViewController *)Vc;
@end

NS_ASSUME_NONNULL_END
