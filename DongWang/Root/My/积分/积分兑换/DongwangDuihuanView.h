//
//  DongwangDuihuanView.h
//  DongWang
//
//  Created by codehzx on 2020/12/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangDuihuanViewDelegate <NSObject>
-(void)DongwangDuihuanViewBtnDidSeltecdWithBtnIndex:(NSInteger)btnTag;
@end
@interface DongwangDuihuanView : UIView
@property(nonatomic,weak) id <DongwangDuihuanViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
