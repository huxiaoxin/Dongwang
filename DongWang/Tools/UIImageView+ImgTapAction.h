//
//  UIImageView+ImgTapAction.h
//  DongWang
//
//  Created by sycm on 2021/3/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^imgViewTapblock)(id object);
@interface UIImageView (ImgTapAction)
-(void)ImgTapActionWith:(imgViewTapblock)imgBlock;
@end

NS_ASSUME_NONNULL_END
