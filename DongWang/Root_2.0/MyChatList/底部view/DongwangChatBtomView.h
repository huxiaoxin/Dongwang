//
//  DongwangChatBtomView.h
//  DongWang
//
//  Created by sycm on 2021/3/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangChatBtomViewDelegate <NSObject>

-(void)DongwangChatBtomViewWithBtnClickIndex:(NSInteger)btnindex;

@end
@interface DongwangChatBtomView : UIView
@property(nonatomic,weak)id <DongwangChatBtomViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
