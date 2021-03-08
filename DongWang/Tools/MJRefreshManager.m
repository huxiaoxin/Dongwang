#import "MJRefreshManager.h"

@implementation MJRefreshManager

+ (MJRefreshNormalHeader *)defaultHeader:(MJRefreshComponentRefreshingBlock)refreshingBlock {
//    __weak typeof(self) weakSelf = self;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:refreshingBlock];
    
    [header setTitle:@"正在加载" forState:MJRefreshStateRefreshing];
    // 往下拉的时候文字
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    // 松手时候的文字
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 设置字体
    header.stateLabel.font = KSysFont(14);
    header.lastUpdatedTimeLabel.font = KSysFont(14);
    header.loadingView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    header.stateLabel.textColor = [UIColor whiteColor];
    header.lastUpdatedTimeLabel.textColor = [UIColor whiteColor];
    return header;
}

+ (MJRefreshAutoNormalFooter *)defaultFooter:(MJRefreshComponentRefreshingBlock)refreshingBlock {
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:refreshingBlock];
    [footer setTitle:@"" forState:MJRefreshStateIdle];
    [footer setTitle:@"正在加载" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"DUANG~已经到底了哦~" forState:MJRefreshStateNoMoreData];
    footer.stateLabel.font = KSysFont(14);
    footer.loadingView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    footer.stateLabel.textColor = [UIColor colorWithHexString:@"B0A2F5"];
    return footer;
}

+ (MJRefreshAutoNormalFooter *)loadingDataNoTextFooter:(MJRefreshComponentRefreshingBlock)refreshingBlock {
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:refreshingBlock];
    [footer setTitle:@"加载失败，点击重新加载" forState:MJRefreshStateIdle];
    [footer setTitle:@"正在加载" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"DUANG~已经到底了哦~" forState:MJRefreshStateNoMoreData];
    footer.stateLabel.font = KSysFont(14);
    footer.loadingView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    footer.stateLabel.textColor = [UIColor colorWithHexString:@"B0A2F5"];

    return footer;
}

@end


