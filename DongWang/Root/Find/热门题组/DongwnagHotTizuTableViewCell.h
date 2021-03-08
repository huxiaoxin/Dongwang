//
//  DongwnagHotTizuTableViewCell.h
//  DongWang
//
//  Created by codehzx on 2020/11/25.
//

#import <UIKit/UIKit.h>
#import "DongwangHotTizuModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol DongwnagHotTizuTableViewCellDelegate <NSObject>

-(void)DongwnagHotTizuTableViewCellBtnClickWithCellIndex:(NSInteger)CellIndex;

@end
@interface DongwnagHotTizuTableViewCell : UITableViewCell
@property(nonatomic,strong) DongwangHotTizuModel * tuziModel;
@property(nonatomic,strong) UIView * DongwangContentView;
@property(nonatomic,weak) id <DongwnagHotTizuTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
