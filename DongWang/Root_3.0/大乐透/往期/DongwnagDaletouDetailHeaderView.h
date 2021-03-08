//
//  DongwnagDaletouDetailHeaderView.h
//  DongWang
//
//  Created by sycm on 2021/2/23.
//

#import <UIKit/UIKit.h>
#import "DongwangDaletouHistoryModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DongwnagDaletouDetailHeaderView : UIView
@property(nonatomic,assign) CGFloat HeaderHeight;
@property(nonatomic,strong) NSArray * PrizeResponsesArr;
@property(nonatomic,strong) NSDictionary * responeDic;
@end

NS_ASSUME_NONNULL_END
