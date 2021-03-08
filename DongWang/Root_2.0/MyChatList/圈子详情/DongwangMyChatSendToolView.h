//
//  DongwangMyChatSendToolView.h
//  DongWang
//
//  Created by sycm on 2021/3/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangMyChatSendToolViewDelegate <NSObject>

-(void)DongwangMyChatSendToolViewUpdateFrame;

@end
@interface DongwangMyChatSendToolView : UIView
@property(nonatomic,assign) CGFloat ToolViewHeight;
@property(nonatomic,strong) UITextView * ContentTextView;
@property(nonatomic,weak) id <DongwangMyChatSendToolViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
