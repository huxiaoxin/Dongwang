//
//  DongwangHomeHeaderView.h
//  DongWang
//
//  Created by codehzx on 2020/11/30.
//

#import <UIKit/UIKit.h>
#import "DongwangMofangModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol DongwangHomeHeaderViewDelegate <NSObject>
-(void)DongwangHomeHeaderViewWithItmeDidSeltecd:(NSInteger)itemIndex;
-(void)DongwangHomeHeaderViewWithBanarDidSeltecd:(NSInteger)itemIndex;
-(void)DongwangHomeHeaderViewWithMofangDidSeltecd:(MagicList * )listModel;
@end
@interface DongwangHomeHeaderView : UIView
@property(nonatomic,strong) NSMutableArray * DongwangMofangData;
@property(nonatomic,strong) NSMutableArray * DongwangChunMofangData;
@property(nonatomic,strong) NSMutableArray * ImgArr;
@property(nonatomic,assign) CGFloat HeaderViewHeight;
@property(nonatomic,weak) id <DongwangHomeHeaderViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
