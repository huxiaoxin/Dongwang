//
//  DongwangMyChatHeaderView.h
//  DongWang
//
//  Created by sycm on 2021/3/1.
//

#import <UIKit/UIKit.h>
#import "DongwangMyChatNavView.h"

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangMyChatHeaderViewDelegate <NSObject>

-(void)DongwangMyChatHeaderViewDidSeltecdWithIndex:(NSInteger)CellIndex;

@end
@interface DongwangMyChatHeaderView : UIView
@property(nonatomic,strong) DongwangMyChatNavView  * chatNavView;
@property(nonatomic,strong) UIImageView * quanziTopImgView;
@property(nonatomic,weak) id <DongwangMyChatHeaderViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
