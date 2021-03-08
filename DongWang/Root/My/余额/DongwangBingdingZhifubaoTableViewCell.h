//
//  DongwangBingdingZhifubaoTableViewCell.h
//  DongWang
//
//  Created by codehzx on 2020/11/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DongwangBingdingZhifubaoTableViewCell : UITableViewCell
@property(nonatomic,strong)     UITextField * DongwangCodeTextField;
-(void)DongwangBingdingZhifubaoTableViewCellConfigerleftArr:(NSMutableArray *)leftdata rightDataList:(NSMutableArray *)rightData  holderTextList:(NSMutableArray *)holderData indexPath:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
