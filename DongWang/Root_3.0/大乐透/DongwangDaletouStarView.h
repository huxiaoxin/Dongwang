//
//  DongwangDaletouStarView.h
//  DongWang
//
//  Created by codehzx on 2021/1/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangDaletouStarViewDelegate <NSObject>

-(void)DongwangDaletouStarViewAction;

@end
@interface DongwangDaletouStarView : UIView
@property(nonatomic,copy) NSString *  timeStr;
@property(nonatomic,weak)  id <DongwangDaletouStarViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
