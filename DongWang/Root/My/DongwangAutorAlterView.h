//
//  DongwangAutorAlterView.h
//  DongWang
//
//  Created by codehzx on 2020/11/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangAutorAlterViewDelegate <NSObject>

-(void)DongwangAutorAlterViewSureAction;

@end
@interface DongwangAutorAlterView : UIView
@property(nonatomic,weak) id <DongwangAutorAlterViewDelegate>delegate;
-(void)show;
@end

NS_ASSUME_NONNULL_END
