//
//  DongwangDuihuanSuccedView.h
//  DongWang
//
//  Created by codehzx on 2020/12/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangDuihuanSuccedViewDelegate <NSObject>

-(void)DongwangDuihuanSuccedViewDidSeltecdWithBtnIndex:(NSInteger)btnindex;

@end
@interface DongwangDuihuanSuccedView : UIView
@property(nonatomic,weak) id <DongwangDuihuanSuccedViewDelegate>delegate;
-(instancetype)initWithFrame:(CGRect)frame withinfoMsg:(NSString *)infoStr;
-(void)show;
@end

NS_ASSUME_NONNULL_END
