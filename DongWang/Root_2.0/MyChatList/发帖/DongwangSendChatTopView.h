//
//  DongwangSendChatTopView.h
//  DongWang
//
//  Created by sycm on 2021/3/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangSendChatTopViewDelegate <NSObject>

-(void)DongwangSendChatTopViewDidTap;

@end
@interface DongwangSendChatTopView : UIView
@property(nonatomic,weak) id <DongwangSendChatTopViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
