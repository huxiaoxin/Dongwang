//
//  MytestCollectionViewCell.h
//  DongWang
//
//  Created by codehzx on 2020/11/3.
//

#import <UIKit/UIKit.h>
#import "MyTestImgModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MytestCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) MyTestImgModel * imgModel;
@property(nonatomic,strong) NSDictionary * dic;
@property(nonatomic,strong) UIImageView * myimage;
@end

NS_ASSUME_NONNULL_END
