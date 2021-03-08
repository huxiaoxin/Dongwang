//
//  DongwangHomeTuijianFooterCollectionReusableView_V3.h
//  DongWang
//
//  Created by codehzx on 2021/1/17.
//

#import <UIKit/UIKit.h>
#import "DongwangHotTizuModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol DongwangHomeTuijianFooterCollectionReusableView_V3Delegate <NSObject>
-(void)DongwangHomeTuijianFooterCollectionReusableView_V3ItemDidSeltecdWithModels:(DongwangHotTizuModel *)tizuModel;
@end
@interface DongwangHomeTuijianFooterCollectionReusableView_V3 : UICollectionReusableView
@property(nonatomic,strong) NSMutableArray  * DongwangDataArr;
@property(nonatomic, copy) void(^HeaderHeight)(CGFloat);
@property(nonatomic,weak) id <DongwangHomeTuijianFooterCollectionReusableView_V3Delegate>delegate;
@end

NS_ASSUME_NONNULL_END
