//
//  DongwangFenleiTableViewCell.h
//  DongWang
//
//  Created by codehzx on 2020/11/27.
//

#import <UIKit/UIKit.h>
#import "DongwangPersonaltaskModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol DongwangFenleiTableViewCellDelegate <NSObject>

-(void)DongwangFenleiTableViewCellDidSeltecdWithCellIndex:(NSInteger)CellIndex;

@end
@interface DongwangFenleiTableViewCell : UITableViewCell
@property(nonatomic,strong) DongwangPersonaltaskModel * taskModel;
@property(nonatomic,weak) id <DongwangFenleiTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
