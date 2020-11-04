//
//  AFManagerTool.h
//  SYQuMinApp
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import "AFHTTPSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface AFManagerTool : AFHTTPSessionManager
+(AFHTTPSessionManager *)shareManager;
@end

NS_ASSUME_NONNULL_END
