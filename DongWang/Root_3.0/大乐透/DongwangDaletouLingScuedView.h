//
//  DongwangDaletouLingScuedView.h
//  DongWang
//
//  Created by sycm on 2021/2/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangDaletouLingScuedViewDelegate <NSObject>

-(void)DongwangDaletouLingClouseView;
-(void)DongwangDaletouLingScuedViewLingequ;

@end
@interface DongwangDaletouLingScuedView : UIView
@property(nonatomic,weak) id <DongwangDaletouLingScuedViewDelegate>delegate;
-(instancetype)initWithFrame:(CGRect)frame WithExprieStr:(NSString *)exprStr;
-(void)Show;
@end

NS_ASSUME_NONNULL_END
