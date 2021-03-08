//
//  DongwangDaletouDetailCollectionViewCell.h
//  DongWang
//
//  Created by sycm on 2021/2/23.
//

#import <UIKit/UIKit.h>
#import "DongwangMyHistoryModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol DongwangDaletouDetailCollectionViewCellDelegate <NSObject>

-(void)DongwangDaletouDetailCollectionViewCellWithClickIndex:(NSInteger)cellIndex;

@end
@interface DongwangDaletouDetailCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) DongwangMyHistoryModel * historyModel;
@property(nonatomic,weak) id <DongwangDaletouDetailCollectionViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
