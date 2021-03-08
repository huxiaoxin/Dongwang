//
//  DongwangWechatTableViewCell.h
//  DongWang
//
//  Created by codehzx on 2021/1/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangWechatTableViewCellDelegate <NSObject>

-(void)DongwangWechatTableViewCellBtnTXAction;

@end
@interface DongwangWechatTableViewCell : UITableViewCell
@property(nonatomic,strong) UserInfo * info;
@property(nonatomic,weak) id <DongwangWechatTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
