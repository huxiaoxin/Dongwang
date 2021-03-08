//
//  DataBuried.h
//  DongWang
//
//  Created by codehzx on 2020/12/14.
//

#import <Foundation/Foundation.h>
#import "userActionModels.h"
NS_ASSUME_NONNULL_BEGIN

@interface DataBuried : NSObject
+(instancetype)ShareManager;
//插入一条数据
- (void)insetDataWithActionListModel:(userActionModels *)actionListModel;


-(void)CLLogoninWithParmesWithShowTimeStr:(NSString *)ShowTimeStr LeaveTimeStr:(NSString *)LeaveTimeStr ViewPageName:(int)PageName;
@end

NS_ASSUME_NONNULL_END
