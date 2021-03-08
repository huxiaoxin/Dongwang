//
//  textcollectionCell.h
//  FruitLib
//
//  Created by ZY_ZMB on 2020/11/3.
//  Copyright © 2020 FruitAI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DongwangMofangModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface textcollectionCell : UICollectionViewCell
@property(nonatomic,strong) MagicList * gicModel;
@property (weak, nonatomic) IBOutlet UIImageView *myimage;
@end

NS_ASSUME_NONNULL_END
