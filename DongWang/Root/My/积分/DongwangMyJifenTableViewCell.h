//
//  DongwangMyJifenTableViewCell.h
//  DongWang
//
//  Created by codehzx on 2020/11/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangMyJifenTableViewCellDelegate <NSObject>

-(void)DongwangMyJifenTableViewCellImgTapClickWithIndex:(NSInteger)index;

@end
@interface DongwangMyJifenTableViewCell : UITableViewCell
@property(nonatomic,weak) id <DongwangMyJifenTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
