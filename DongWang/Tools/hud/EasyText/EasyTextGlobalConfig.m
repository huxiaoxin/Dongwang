//
//  EasyTextGlobalConfig.m
//  自定义小菊花无网络提示
//
//  Created by apple on 2018/3/28.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import "EasyTextGlobalConfig.h"

@implementation EasyTextGlobalConfig
easyShowView_singleton_implementation(EasyTextGlobalConfig)

- (instancetype)init
{
    if (self = [super init]) {
        
        _showOnWindow = YES ;
        _superReceiveEvent = YES ;
        
        _animationType = TextAnimationTypeBounce ;
        _statusType = TextStatusTypeMidden  ;
        
        _titleFont = [UIFont systemFontOfSize:15];
        _titleColor = [[UIColor whiteColor]colorWithAlphaComponent:1.7];
        _bgColor = [UIColor blackColor];
        _shadowColor = [UIColor blueColor];
        
    }
    return self ;
}

+ (BOOL)isUseTextGlobalConfig
{
    return _showInstance!=nil ? YES : NO ;
}
@end
