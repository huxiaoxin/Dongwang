//
//  DongwangDeleteaAdressAlterView.h
//  DongWang
//
//  Created by codehzx on 2020/11/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangDeleteaAdressAlterViewDelegate <NSObject>
-(void)DongwangDeleteaAdressAlterViewActions;
@end
@interface DongwangDeleteaAdressAlterView : UIView
@property(nonatomic,weak)id <DongwangDeleteaAdressAlterViewDelegate>delegate;
-(void)show;
@end

NS_ASSUME_NONNULL_END
