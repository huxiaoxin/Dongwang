//
//  DongwangDuihuanAlterView.h
//  DongWang
//
//  Created by codehzx on 2020/12/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangDuihuanAlterViewDelegate <NSObject>

-(void)DongwangDuihuanAlterViewBtnAcctionWithBtnIndex:(NSInteger)btnIndex AlterType:(NSString *)type;

@end
@interface DongwangDuihuanAlterView : UIView
@property(nonatomic,weak) id <DongwangDuihuanAlterViewDelegate>delegate;
-(void)show;
-(instancetype)initWithFrame:(CGRect)frame withinfoMsg:(NSString *)infoStr ViewType:(NSString *)type;

@end

NS_ASSUME_NONNULL_END
