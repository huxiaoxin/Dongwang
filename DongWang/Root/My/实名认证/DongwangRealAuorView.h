//
//  DongwangRealAuorView.h
//  DongWang
//
//  Created by codehzx on 2020/11/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangRealAuorViewDelegate <NSObject>

-(void)DongwangRealAuorViewSucced;

@end
@interface DongwangRealAuorView : UIView
@property(nonatomic,weak) id <DongwangRealAuorViewDelegate>delegate;
-(void)show;
@end

NS_ASSUME_NONNULL_END
