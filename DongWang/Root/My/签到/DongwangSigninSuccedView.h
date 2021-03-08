//
//  DongwangSigninSuccedView.h
//  DongWang
//
//  Created by codehzx on 2020/11/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangSigninSuccedViewDelegate <NSObject>

-(void)DongwangSigninSuccedViewBtnDidSeltecdWithtype:(NSInteger)type;

@end
@interface DongwangSigninSuccedView : UIView
@property(nonatomic,weak) id <DongwangSigninSuccedViewDelegate>delegate;
-(instancetype)initWithFrame:(CGRect)frame QiandaoWithDic:(NSDictionary *)dic;
-(void)show;
@end

NS_ASSUME_NONNULL_END
