//
//  DongwangHomeTuijianHeaderCollectionReusableView_V3.h
//  DongWang
//
//  Created by codehzx on 2021/1/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangHomeTuijianHeaderCollectionReusableView_V3Delegate <NSObject>

-(void)DongwangHomeTiuJinaHeaderBannarDidSeltecdWithBannarIndex:(NSInteger)BannarIndex;

@end
@interface DongwangHomeTuijianHeaderCollectionReusableView_V3 : UICollectionReusableView
@property(nonatomic,strong) NSMutableArray * ImgArr;
@property(nonatomic,strong) NSMutableArray * MsgArr;
@property(nonatomic,weak) id <DongwangHomeTuijianHeaderCollectionReusableView_V3Delegate>delegate;
@end

NS_ASSUME_NONNULL_END
