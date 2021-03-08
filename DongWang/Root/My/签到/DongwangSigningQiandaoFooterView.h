//
//  DongwangSigningQiandaoFooterView.h
//  DongWang
//
//  Created by codehzx on 2020/11/30.
//

#import <UIKit/UIKit.h>
#import "DongwangSigninQiandaoViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^QiandaoFooterHeightBlock)(CGFloat footerHeight);
@interface DongwangSigningQiandaoFooterView : UIView
@property(nonatomic,copy) QiandaoFooterHeightBlock footerBlock;
@property(nonatomic,copy) NSString * urlText;
@property(nonatomic,assign) CGFloat FooterHeight;
@end

NS_ASSUME_NONNULL_END
