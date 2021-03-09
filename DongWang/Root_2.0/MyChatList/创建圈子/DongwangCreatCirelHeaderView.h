//
//  DongwangCreatCirelHeaderView.h
//  DongWang
//
//  Created by sycm on 2021/3/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangCreatCirelHeaderViewDelegate <NSObject>

-(void)DongwangCreatCirelHeaderViewupdateFrame:(CGFloat)HeaderHeight;
-(void)DongwangCreatCirelHeaderViewTosSeltecdCirle:(UITextField *)cirleTextField;
@end
@interface DongwangCreatCirelHeaderView : UIView
@property(nonatomic,assign) CGFloat cirleHeaderHeight;
@property(nonatomic,weak) id <DongwangCreatCirelHeaderViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
