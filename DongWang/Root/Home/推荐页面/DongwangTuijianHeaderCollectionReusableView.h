//
//  DongwangTuijianHeaderCollectionReusableView.h
//  DongWang
//
//  Created by codehzx on 2020/12/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangTuijianHeaderCollectionReusableViewDelegate <NSObject>

-(void)DongwangTuijianHeaderCollectionReusableViewDidSeltecdWithBannarIndex:(NSInteger)banaIndex;

@end
@interface DongwangTuijianHeaderCollectionReusableView : UICollectionReusableView
@property(nonatomic,strong) NSMutableArray * ImgArr;
@property(nonatomic,weak) id <DongwangTuijianHeaderCollectionReusableViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
