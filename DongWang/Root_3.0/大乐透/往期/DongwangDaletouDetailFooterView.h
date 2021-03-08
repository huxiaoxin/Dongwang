//
//  DongwangDaletouDetailFooterView.h
//  DongWang
//
//  Created by sycm on 2021/2/23.
//

#import <UIKit/UIKit.h>
#import "DongwangMyHistoryModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol DongwangDaletouDetailFooterViewDelegate <NSObject>

-(void)DongwangDaletouDetailFooterViewCellDidlseltWith:(DongwangMyHistoryModel * )mdoels;

@end
@interface DongwangDaletouDetailFooterView : UIView
@property(nonatomic,strong) NSArray * dataArr;
@property(nonatomic,assign) CGFloat FooterHeight;
@property(nonatomic,strong) NSDictionary * responeDic;
@property(nonatomic,weak) id <DongwangDaletouDetailFooterViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
