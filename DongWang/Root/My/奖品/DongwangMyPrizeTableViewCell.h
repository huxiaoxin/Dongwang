//
//  DongwangMyPrizeTableViewCell.h
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import <UIKit/UIKit.h>
#import "DongwangMyPrizeModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol DongwangMyPrizeTableViewCellDelegate <NSObject>

-(void)DongwangMyPrizeTableViewCellDidSeltecdWithCellIndex:(NSInteger)CellIndex;

@end
@interface DongwangMyPrizeTableViewCell : UITableViewCell
@property(nonatomic,weak) id<DongwangMyPrizeTableViewCellDelegate>delegate;
@property(nonatomic,strong) DongwangMyPrizeModel  * MyPrizeModel;
@end

NS_ASSUME_NONNULL_END
