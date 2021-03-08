//
//  DongwangBindingZhifubaoFooterView.h
//  DongWang
//
//  Created by codehzx on 2020/11/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangBindingZhifubaoFooterViewDelegate <NSObject>
-(void)DongwangBindingZhifubaoFooterViewBingdingZhifubao;
-(void)DongwangBindingZhifubaoFooterViewTextFieldexdingWithText:(NSString *)TextStr;
-(void)DongwangBindingZhifubaoFooterViewgetmsgCode;
@end
@interface DongwangBindingZhifubaoFooterView : UIView
@property(nonatomic,strong) UITextField * DongwangCodeTextField;
@property(nonatomic,strong) UIButton *  DongwangTixianBtn;
@property(nonatomic,strong) UIButton *  DongwangCodeBtn;
@property(nonatomic,weak) id <DongwangBindingZhifubaoFooterViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
