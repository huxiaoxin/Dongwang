//
//  CHImageView.h
//  SYQuMinApp
//
//  Created by apple on 2018/5/2.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHImageView : UIImageView
- (instancetype)initWithFrame:(CGRect)textFrame userEnabled:(BOOL)enabled;
- (instancetype)initWithFrame:(CGRect)textFrame cornerRadius:(CGFloat)cornerRadius borderColor:(CGColorRef)borderColor borderWidth:(CGFloat)borderWidth userEnabled:(BOOL)enabled;
+ (CHImageView *)createImageViewWithFrame:(CGRect)frame tag:(NSInteger)tag named:(NSString *)name;
@end
