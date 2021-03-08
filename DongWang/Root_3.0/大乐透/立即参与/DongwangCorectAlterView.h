//
//  DongwangCorectAlterView.h
//  DongWang
//
//  Created by codehzx on 2021/2/20.
//

#import <UIKit/UIKit.h>
#import "DongwangAnswerResultModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol DongwangCorectAlterViewDelegate <NSObject>

-(void)DongwangCorectAlterViewDismiss;

@end
@interface DongwangCorectAlterView : UIView
@property(nonatomic,strong) DongwangAnswerResultModel *  resultModel;
@property(nonatomic,weak) id <DongwangCorectAlterViewDelegate>delegate;
-(void)Show;
@end

NS_ASSUME_NONNULL_END
