//
//  DongwangBaseViewController.h
//  DongWang
//
//  Created by codehzx on 2020/10/20.
//

#import <GKNavigationBarViewController/GKNavigationBarViewController.h>

NS_ASSUME_NONNULL_BEGIN

@interface DongwangBaseViewController : GKNavigationBarViewController
@property(nonatomic,assign) BOOL isShowBtomImgView;
@property(nonatomic,assign) NSInteger  indictorIndex;
-(void)BaseTabarRequest;
@end

NS_ASSUME_NONNULL_END
