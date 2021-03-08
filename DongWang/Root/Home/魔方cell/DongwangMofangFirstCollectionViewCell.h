//
//  DongwangMofangFirstCollectionViewCell.h
//  DongWang
//
//  Created by codehzx on 2020/12/9.
//

#import <UIKit/UIKit.h>
#import "DongwangMofangModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol DongwangMofangFirstCollectionViewCellDelegate <NSObject>

-(void)DongwangMofangFirstCollectionViewCellInfoTapClick:(NSInteger)Imgindex CellIndex:(NSInteger)CellIndex;

@end
@interface DongwangMofangFirstCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) NSArray * listMsgic;
@property(nonatomic,strong) DongwangMofangImgView * mofangImgView;

@property(nonatomic,weak) id <DongwangMofangFirstCollectionViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
