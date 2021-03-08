//
//  DongwangTieziBianJiView.h
//  DongWang
//
//  Created by codehzx on 2021/3/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangTieziBianJiViewDelegate <NSObject>
-(void)DongwangTieziBianJiViewhiden;
-(void)DongwangTieziBianJiViewWithBtnIndex:(NSInteger)btnIndex;
@end
@interface DongwangTieziBianJiView : UIView
@property(nonatomic,weak) id <DongwangTieziBianJiViewDelegate>delegate;
-(void)ShowView;
@end

NS_ASSUME_NONNULL_END
