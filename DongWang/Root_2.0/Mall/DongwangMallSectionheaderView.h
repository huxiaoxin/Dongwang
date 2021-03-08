//
//  DongwangMallSectionheaderView.h
//  DongWang
//
//  Created by codehzx on 2021/1/6.
//

#import <UIKit/UIKit.h>
#import <SDCycleScrollView.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangMallSectionheaderViewDelegate <NSObject>

-(void)DongwangMallSectionheaderViewDidSeltecdWithIndexPath:(NSIndexPath *)indexPath;
-(void)DongwangMallSectionheaderViewDidSeltecdBannarWithIndex:(NSInteger)index;
-(void)DongwangMallSectionheaderViewMsgAction;
@end
@interface DongwangMallSectionheaderView : UIView
@property(nonatomic,strong) SDCycleScrollView * SDCView;
@property(nonatomic,strong) NSMutableArray * mofangDataArr;
@property(nonatomic,strong) NSMutableArray * ImgArr;
@property(nonatomic,strong) NSMutableArray * MsgArr;
@property(nonatomic,weak) id <DongwangMallSectionheaderViewDelegate>delegate;
@property(nonatomic, copy) void(^HeaderHeight)(CGFloat);
@end

NS_ASSUME_NONNULL_END
