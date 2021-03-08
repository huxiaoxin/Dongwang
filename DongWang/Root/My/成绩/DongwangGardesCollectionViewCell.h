//
//  DongwangGardesCollectionViewCell.h
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import <UIKit/UIKit.h>
#import "DongwangGradesModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol DongwangGardesCollectionViewCellDelegate <NSObject>

-(void)DongwangGardesCollectionViewCellDidSeltecd:(NSInteger)index;
@end
@interface DongwangGardesCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) DongwangGradesModel * gardModel;
@property(nonatomic,weak) id <DongwangGardesCollectionViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
