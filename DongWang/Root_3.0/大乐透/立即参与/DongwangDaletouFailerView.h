//
//  DongwangDaletouFailerView.h
//  DongWang
//
//  Created by codehzx on 2021/2/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangDaletouFailerViewDelegate <NSObject>

-(void)DongwangDaletouFailerViewhideAction;

@end
@interface DongwangDaletouFailerView : UIView
@property(nonatomic,weak) id <DongwangDaletouFailerViewDelegate>delegate;
-(void)FailerShow;
@end

NS_ASSUME_NONNULL_END
