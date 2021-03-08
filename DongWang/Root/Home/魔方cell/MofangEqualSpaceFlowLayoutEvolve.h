//
//  EqualSpaceFlowLayoutEvolve.h
//  test
//
//  Created by codehzx on 2020/12/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,MofangAlignType){
    MofangAlignWithLeft,
    MofangAlignWithCenter,
    MofangAlignWithRight
};

@interface MofangEqualSpaceFlowLayoutEvolve : UICollectionViewFlowLayout
//两个Cell之间的距离
@property (nonatomic,assign)CGFloat betweenOfCell;
//cell对齐方式
@property (nonatomic,assign)MofangAlignType cellType;

-(instancetype)initWthType : (MofangAlignType)cellType;
@end

NS_ASSUME_NONNULL_END
