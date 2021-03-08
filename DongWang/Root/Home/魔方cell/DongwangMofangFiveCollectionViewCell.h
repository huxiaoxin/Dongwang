//
//  DongwangMofangFiveCollectionViewCell.h
//  DongWang
//
//  Created by codehzx on 2020/12/9.
//

#import <UIKit/UIKit.h>
#import "DongwangMofangModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangMofangFiveCollectionViewCellDelegate <NSObject>

-(void)DongwangMofangFiveCollectionViewCellImgIndex:(NSInteger)imgIndex CellIndex:(NSInteger)cellindex;

@end
@interface DongwangMofangFiveCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) NSArray * listMsgic;
@property(nonatomic,strong) DongwangMofangImgView * DongwangMofangImgView1;
@property(nonatomic,strong) DongwangMofangImgView * DongwangMofangImgView2;
@property(nonatomic,strong) DongwangMofangImgView * DongwangMofangImgView3;
@property(nonatomic,strong) DongwangMofangImgView * DongwangMofangImgView4;
@property(nonatomic,strong) DongwangMofangImgView * DongwangMofangImgView5;
@property(nonatomic,weak) id <DongwangMofangFiveCollectionViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
