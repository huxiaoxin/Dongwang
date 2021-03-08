//
//  DongwangMyLetouView.h
//  DongWang
//
//  Created by codehzx on 2021/1/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangMyLetouViewDelefare <NSObject>

-(void)DongwangMyLetouViewremoView;

@end
@interface DongwangMyLetouView : UIView
@property(nonatomic,weak) id <DongwangMyLetouViewDelefare>delegate;
-(void)ShowView;
-(void)DongwangConfigerLetouWith:(NSArray *)dataArr  openTime:(NSString *)openTimeStr;
@end

NS_ASSUME_NONNULL_END
