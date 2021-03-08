//
//  userActionModels.h
//  DongWang
//
//  Created by codehzx on 2020/12/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface userActionModels : NSObject
/** 当前一条数据的序号 */
@property (nonatomic, assign) NSInteger index;// 本地记录序号，可扩展查询哪些数据
/** 页面进入时间 */
@property (nonatomic, copy) NSString *timeIn;
/** 页面离开时间 */
@property (nonatomic, copy) NSString *timeOut;
@end

NS_ASSUME_NONNULL_END
