//
//  DongwangMyHeaderView.h
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangMyHeaderViewDelegate <NSObject>

-(void)DongwangMyHeaderViewPushInfoVc;
-(void)DongwangMyHeaderViewMyCenterBtnClicksWithIndex:(NSInteger)btnIndex;
-(void)DongwangMyHeaderViewSingQiandao;
-(void)DongwangMyHeaderViewAutorClicks;
-(void)DongwangMyHeaderViewpushtoSettingVc;
-(void)DongwangMyHeaderViewpushToMsgVc;
-(void)DongwangMyHeaderVieback;
@end
@interface DongwangMyHeaderView : UIView
@property(nonatomic,strong) UserInfo * info;
@property(nonatomic,assign) CGFloat MyHeaderHeight;
@property(nonatomic,weak) id <DongwangMyHeaderViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
