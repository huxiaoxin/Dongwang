//
//  DongwangDaletouLingquFooterCollectionReusableView.h
//  DongWang
//
//  Created by sycm on 2021/2/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangDaletouLingquFooterCollectionReusableViewDelegate <NSObject>

-(void)DongwangDaletouLingquFooterCollectionReusableViewlingqu;

@end
@interface DongwangDaletouLingquFooterCollectionReusableView : UICollectionReusableView

@property(nonatomic,strong) NSString * exprineStr; //过期时间
@property(nonatomic,assign) BOOL  isLingequ;  //是否领取奖项
@property(nonatomic,assign) BOOL  iszhongjiang; //是否中奖
@property(nonatomic,weak) id <DongwangDaletouLingquFooterCollectionReusableViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
