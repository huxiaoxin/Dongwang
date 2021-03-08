//
//  DongwangMyChatNavView.h
//  DongWang
//
//  Created by sycm on 2021/3/1.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol DongwangMyChatNavViewDelegate <NSObject>
-(void)DongwangMyChatNavViewDelegateSendChatAction;

@end
@interface DongwangMyChatNavView : UIView
@property(nonatomic,weak) id <DongwangMyChatNavViewDelegate>Delegate;
@end

NS_ASSUME_NONNULL_END
