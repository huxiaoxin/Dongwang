//
//  DongwangDeleAccountView.h
//  DongWang
//
//  Created by codehzx on 2020/11/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangDeleAccountViewDelegate <NSObject>

-(void)DongwangDeleAccountViewDeleScuued;

@end
@interface DongwangDeleAccountView : UIView
@property(nonatomic,weak)id <DongwangDeleAccountViewDelegate>delegate;
-(void)show;
@end

NS_ASSUME_NONNULL_END
