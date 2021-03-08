//
//  DongwangAdressTableViewCell.h
//  DongWang
//
//  Created by codehzx on 2020/11/9.
//

#import <UIKit/UIKit.h>
#import "ShippingAddressListModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol DongwangAdressTableViewCellDelegate <NSObject>

-(void)DongwangAdressTableViewCellChangeAdressWithCellIndex:(NSInteger)cellIndex;

@end
@interface DongwangAdressTableViewCell : UITableViewCell
@property(nonatomic,weak) id <DongwangAdressTableViewCellDelegate>delegate;
@property(nonatomic,strong) ShippingAddressListModel * ShipingModel;
@end

NS_ASSUME_NONNULL_END
