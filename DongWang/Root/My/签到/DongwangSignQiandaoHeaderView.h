//
//  DongwangSignQiandaoHeaderView.h
//  DongWang
//
//  Created by codehzx on 2020/11/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol  DongwangSignQiandaoHeaderViewDelegate<NSObject>

-(void)DongwangSignQiandaoHeaderViewDidSeltecdQiandaoActoin;

@end
@interface DongwangSignQiandaoHeaderView : UIView
@property(nonatomic,assign) CGFloat QianheaderHeight;
@property(nonatomic,strong) NSMutableArray  * HeaderDataArr;
@property(nonatomic,strong) NSDictionary * headerDic;
@property(nonatomic,weak) id <DongwangSignQiandaoHeaderViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
