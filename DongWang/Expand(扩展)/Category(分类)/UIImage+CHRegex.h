//
//  UIImage+CHRegex.h
//  SY全民共进
//
//  Created by apple on 2018/4/13.
//  Copyright © 2018年 gch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CHRegex)
/**
 *  生成一张高斯模糊的图片
 *
 *  @param image 原图
 *  @param blur  模糊程度 (0~1)
 *
 *  @return 高斯模糊图片
 */
+ (UIImage *)blurImage:(UIImage *)image blur:(CGFloat)blur;

// 通过url生成二维码
+ (UIImage *)getImageThroughUrl:(NSString *)url imageWidth:(NSInteger)imageWidth;

// 通过view生成图片
+ (UIImage *)getImageThroughView:(UIView *)whiteView;
// 根据url获取图片
+ (UIImage *)getImageFromURL:(NSString *)fileURL;
+ (UIImage *)imageResize:(UIImage*)img andResizeTo:(CGSize)newSize;
@end
