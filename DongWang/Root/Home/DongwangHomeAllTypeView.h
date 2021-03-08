//
//  DongwangHomeAllTypeView.h
//  DongWang
//
//  Created by codehzx on 2020/11/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangHomeAllTypeViewDelegate <NSObject>

-(void)DongwangHomeAllTypeViewTagDidSeltecdWithIndex:(NSInteger)index;
-(void)DongwangHomeAllTypeViewViewTapAction;
@end
@interface DongwangHomeAllTypeView : UIView
@property(nonatomic,weak) id <DongwangHomeAllTypeViewDelegate>delegate;
-(instancetype)initWithFrame:(CGRect)frame TypeData:(NSArray *)types;
-(void)Show;
-(void)hiden;
@end

NS_ASSUME_NONNULL_END
