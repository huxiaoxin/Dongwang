//
//  DongwangAlipaygodrawSuccedView.h
//  DongWang
//
//  Created by codehzx on 2020/11/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangAlipaygodrawSuccedViewDelegate <NSObject>

-(void)DongwangAlipaygodrawSuccedViewSured;

@end
@interface DongwangAlipaygodrawSuccedView : UIView
@property(nonatomic,weak) id <DongwangAlipaygodrawSuccedViewDelegate>deleate;
-(instancetype)initWithFrame:(CGRect)frame message:(NSDictionary *)msgDic;
-(void)show;
@end

NS_ASSUME_NONNULL_END
