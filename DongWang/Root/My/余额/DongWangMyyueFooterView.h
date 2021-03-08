//
//  DongWangMyyueFooterView.h
//  DongWang
//
//  Created by codehzx on 2020/11/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongWangMyyueFooterViewDelegate <NSObject>

-(void)DongWangMyyueFooterViewgetmsgCode;
-(void)DongWangMyyueFooterViewgoWithdrawWith:(UITextField *)codeTextField;
@end
@interface DongWangMyyueFooterView : UIView
@property(nonatomic,weak) id <DongWangMyyueFooterViewDelegate>delegate;
@property(nonatomic,assign) CGFloat FooterHeight;
@property(nonatomic,assign) UIButton *  DongwangCodeBtn;
@property(nonatomic,strong) UIButton *  DongwangTixianBtn;

@end

NS_ASSUME_NONNULL_END
