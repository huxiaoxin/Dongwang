//
//  MJRefreshManager.h
//  DongWang
//
//  Created by codehzx on 2020/12/13.
//

#import <Foundation/Foundation.h>
#import <MJRefresh/MJRefresh.h>

@interface MJRefreshManager : NSObject

+ (MJRefreshNormalHeader *)defaultHeader:(MJRefreshComponentRefreshingBlock)refreshingBlock;

+ (MJRefreshAutoNormalFooter *)defaultFooter:(MJRefreshComponentRefreshingBlock)refreshingBlock;

+ (MJRefreshAutoNormalFooter *)loadingDataNoTextFooter:(MJRefreshComponentRefreshingBlock)refreshingBlock;

@end



