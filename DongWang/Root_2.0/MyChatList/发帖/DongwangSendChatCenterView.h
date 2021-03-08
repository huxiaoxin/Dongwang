//
//  DongwangSendChatCenterView.h
//  DongWang
//
//  Created by sycm on 2021/3/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangSendChatCenterViewDelegate <NSObject>
-(void)DongwangSendChatCenterViewUpdateFrame;
@end
@interface DongwangSendChatCenterView : UIView
@property(nonatomic,assign) CGFloat CenterHeight;
@property(nonatomic,strong)UITextField * TopTextField;
@property(nonatomic,strong) UITextView * ContentTextView;
@property(nonatomic,weak) id <DongwangSendChatCenterViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
