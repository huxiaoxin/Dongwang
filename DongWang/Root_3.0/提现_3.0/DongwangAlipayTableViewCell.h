//
//  DongwangAlipayTableViewCell.h
//  DongWang
//
//  Created by codehzx on 2021/1/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangAlipayTableViewCellDelegate <NSObject>

-(void)DongwangAlipayTableViewCellTXAction;

@end
@interface DongwangAlipayTableViewCell : UITableViewCell
@property(nonatomic,strong) UserInfo * info;
@property(nonatomic,weak) id <DongwangAlipayTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
