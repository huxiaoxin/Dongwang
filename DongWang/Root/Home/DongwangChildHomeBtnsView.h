//
//  DongwangChildHomeBtnsView.h
//  DongWang
//
//  Created by codehzx on 2020/11/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangChildHomeBtnsViewDelegate <NSObject>
-(void)DongwangChildHomeBtnsViewCellDidSeltecdWithItemIndex:(NSInteger)itemIndex;
@end
@interface DongwangChildHomeBtnsView : UIView
@property(nonatomic,weak) id <DongwangChildHomeBtnsViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
