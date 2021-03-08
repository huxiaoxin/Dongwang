//
//  DongwangFoureCollectionViewCell.h
//  DongWang
//
//  Created by codehzx on 2020/12/9.
//

#import <UIKit/UIKit.h>
#import "DongwangMofangModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangMofangFoureCollectionViewCellDelegate <NSObject>
-(void)DongwangMofangFoureCollectionViewCellImgIndex:(NSInteger)imgIndex CellIndex:(NSInteger)cellindex;
@end
@interface DongwangMofangFoureCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) NSArray * listMsgic;
@property(nonatomic,weak) id <DongwangMofangFoureCollectionViewCellDelegate>delegate;
@property(nonatomic,strong) DongwangMofangImgView * DongwangMofangImgView1;
@property(nonatomic,strong) DongwangMofangImgView * DongwangMofangImgView2;
@property(nonatomic,strong) DongwangMofangImgView * DongwangMofangImgView3;
@property(nonatomic,strong) DongwangMofangImgView * DongwangMofangImgView4;

@end

NS_ASSUME_NONNULL_END
