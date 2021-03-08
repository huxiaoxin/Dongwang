//
//  DongwangThreeCollectionViewCell.h
//  DongWang
//
//  Created by codehzx on 2020/12/9.
//

#import <UIKit/UIKit.h>
#import "DongwangMofangModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangMofangThreeCollectionViewCellDelegate <NSObject>

-(void)DongwangMofangThreeCollectionViewCellImgIndex:(NSInteger)imgIndex CellIndex:(NSInteger)cellindex;

@end
@interface DongwangMofangThreeCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) NSArray * listMsgic;
@property(nonatomic,strong) DongwangMofangImgView * DongwangMofangImgView1;
@property(nonatomic,strong) DongwangMofangImgView * DongwangMofangImgView2;
@property(nonatomic,strong) DongwangMofangImgView * DongwangMofangImgView3;
@property(nonatomic,weak) id <DongwangMofangThreeCollectionViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
