//
//  DongwangMofangSecondCollectionViewCell.h
//  DongWang
//
//  Created by codehzx on 2020/12/9.
//

#import <UIKit/UIKit.h>
#import "DongwangMofangModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangMofangSecondCollectionViewCellDelegate <NSObject>

-(void)DongwangMofangSecondCollectionViewCellDidSeltecdWithImgIndex:(NSInteger)ImgIndex  CellIndex:(NSInteger)cellIndex;

@end
@interface DongwangMofangSecondCollectionViewCell : UICollectionViewCell
@property(nonatomic,weak) id <DongwangMofangSecondCollectionViewCellDelegate>delegate;
@property(nonatomic,strong) NSArray * listMsgic;
@property(nonatomic,strong) DongwangMofangImgView * DongwangMofangImgView1;
@property(nonatomic,strong) DongwangMofangImgView * DongwangMofangImgView2;
@end

NS_ASSUME_NONNULL_END
