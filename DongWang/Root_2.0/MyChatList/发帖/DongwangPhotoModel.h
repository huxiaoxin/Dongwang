//
//  DongwangPhotoModel.h
//  DongWang
//
//  Created by sycm on 2021/3/2.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwangPhotoModel : DongWangBaseModel
@property(nonatomic,assign) BOOL islast;
@property(nonatomic, strong)  UIImage * imgName;

@end

NS_ASSUME_NONNULL_END
