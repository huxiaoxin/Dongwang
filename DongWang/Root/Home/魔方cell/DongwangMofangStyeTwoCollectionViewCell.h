//
//  DongwangMofangStyeTwoCollectionViewCell.h
//  DongWang
//
//  Created by codehzx on 2020/12/9.
//

#import <UIKit/UIKit.h>
#import "DongwangMofangModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangMofangStyeTwoCollectionViewCellDelegate <NSObject>

-(void)DongwangMofangStyeTwoCollectionViewCellDidSeltecdWithCellIndex:(NSInteger)CellIndex ModelSoureIndex:(NSInteger)SoureIndex;
@end
@interface DongwangMofangStyeTwoCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) NSArray * listMsgic;
@property(nonatomic,weak) id <DongwangMofangStyeTwoCollectionViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
