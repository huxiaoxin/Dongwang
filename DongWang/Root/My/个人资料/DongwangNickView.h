//
//  DongwangNickView.h
//  DongWang
//
//  Created by codehzx on 2020/11/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangNickViewDelegate <NSObject>

-(void)DongwangNickViewWithContentIndex:(NSInteger)btnindex ContentText:(NSString *)text;

@end
@interface DongwangNickView : UIView
@property(nonatomic,weak) id <DongwangNickViewDelegate>delegate;
-(void)show;
@end

NS_ASSUME_NONNULL_END
