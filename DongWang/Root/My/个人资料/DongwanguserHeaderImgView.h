//
//  DongwanguserHeaderImgView.h
//  DongWang
//
//  Created by codehzx on 2020/11/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwanguserHeaderImgViewDelegate <NSObject>

-(void)DongwanguserHeaderImgViewDidSeltecdWithName:(NSString *)ImgName;

@end
@interface DongwanguserHeaderImgView : UIView
@property(nonatomic,weak) id <DongwanguserHeaderImgViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
