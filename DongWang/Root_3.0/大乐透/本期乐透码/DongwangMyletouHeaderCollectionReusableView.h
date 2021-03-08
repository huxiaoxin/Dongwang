//
//  DongwangMyletouHeaderCollectionReusableView.h
//  DongWang
//
//  Created by codehzx on 2021/2/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangMyletouHeaderCollectionReusableViewDelegate <NSObject>
-(void)DongwangMyletouHeaderCollectionReusableViewWithClouesdAction;
@end
@interface DongwangMyletouHeaderCollectionReusableView : UICollectionReusableView
@property(nonatomic,weak) id <DongwangMyletouHeaderCollectionReusableViewDelegate>delegate;
@property(nonatomic,copy) NSString * topStr;
@end

NS_ASSUME_NONNULL_END
