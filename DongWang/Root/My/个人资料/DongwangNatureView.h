//
//  DongwangNatureView.h
//  DongWang
//
//  Created by codehzx on 2020/11/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DongwangNatureViewDelegate <NSObject>

-(void)DongwangNatureViewDidChangeWithContent:(NSString *)text btnindex:(NSInteger)btnindex;

@end
@interface DongwangNatureView : UIView
@property(nonatomic,weak) id <DongwangNatureViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
