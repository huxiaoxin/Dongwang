//
//  DongwangAlipayAlterView.h
//  DongWang
//
//  Created by codehzx on 2020/11/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangAlipayAlterViewDelegate <NSObject>

-(void)DongwangAlipayAlterViewSucced;

@end
@interface DongwangAlipayAlterView : UIView
@property(nonatomic,weak) id <DongwangAlipayAlterViewDelegate>delegate;
-(void)show;
@end

NS_ASSUME_NONNULL_END
