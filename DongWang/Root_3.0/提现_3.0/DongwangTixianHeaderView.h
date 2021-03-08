//
//  DongwangTixianHeaderView.h
//  DongWang
//
//  Created by codehzx on 2021/1/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangTixianHeaderViewDelegate <NSObject>

-(void)DongwangTixianHeaderViewWithDetailbtnClick;
-(void)DongwangTixianHeaderViewWithtixianbtnIndex:(NSInteger)btnIndex;
@end
@interface DongwangTixianHeaderView : UIView
@property(nonatomic,strong) UserInfo * info;
@property(nonatomic,weak) id <DongwangTixianHeaderViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
