//
//  DongwangCirleListView.h
//  DongWang
//
//  Created by sycm on 2021/3/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangCirleListViewDelegate <NSObject>

-(void)DongwangCirleListViewHiden;

@end
@interface DongwangCirleListView : UIView
@property(nonatomic,weak) id <DongwangCirleListViewDelegate>delegate;
-(void)ShowView;
@end

NS_ASSUME_NONNULL_END
