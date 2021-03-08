//
//  DongwangTuijianFooterCollectionReusableView.h
//  DongWang
//
//  Created by codehzx on 2020/12/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangTuijianFooterCollectionReusableViewDelegate <NSObject>

-(void)DongwangHomeTuijianDidSeltecdWithCellindex:(NSInteger)index;

@end
@interface DongwangTuijianFooterCollectionReusableView : UICollectionReusableView
@property(nonatomic,strong) NSMutableArray *DongwangHomeDataArr;
@property(nonatomic,weak) id <DongwangTuijianFooterCollectionReusableViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
