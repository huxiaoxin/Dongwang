//
//  DongwangHomeActityCollectionViewCell.h
//  DongWang
//
//  Created by codehzx on 2020/11/30.
//

#import <UIKit/UIKit.h>
#import "DongwangMofangModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangHomeActityCollectionViewCellDelegate <NSObject>
-(void)DongwangHomeActityCollectionViewCellRealodWithCellIndex:(NSInteger)CellIndex;
@end
@interface DongwangHomeActityCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) NSDictionary * dic;
@property(nonatomic,strong) MagicList * mofangModel;
@property(nonatomic,weak) id <DongwangHomeActityCollectionViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
