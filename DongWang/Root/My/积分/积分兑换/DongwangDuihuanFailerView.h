//
//  DongwangDuihuanFailerView.h
//  DongWang
//
//  Created by codehzx on 2020/12/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangDuihuanFailerViewDelegate <NSObject>

-(void)DongwangDuihuanFailerViewgosoureActionWithIndex:(NSInteger)index;

@end
@interface DongwangDuihuanFailerView : UIView
@property(nonatomic,weak) id <DongwangDuihuanFailerViewDelegate>delegate;
-(instancetype)initWithFrame:(CGRect)frame withinfoMsg:(NSString *)infoStr;
-(void)show;
@end

NS_ASSUME_NONNULL_END
