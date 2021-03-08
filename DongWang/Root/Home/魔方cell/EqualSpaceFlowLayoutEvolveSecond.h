//
//  EqualSpaceFlowLayoutEvolve.h
//  test
//
//  Created by codehzx on 2020/12/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,SecondAlignType){
    SecondAlignWithLeft,
    SecondAlignWithCenter,
    SecondAlignWithRight
};

@interface EqualSpaceFlowLayoutEvolveSecond : UICollectionViewFlowLayout
//两个Cell之间的距离
@property (nonatomic,assign)CGFloat betweenOfCell;
//cell对齐方式
@property (nonatomic,assign)SecondAlignType cellType;

-(instancetype)initWthType : (SecondAlignType)cellType;
@end

NS_ASSUME_NONNULL_END
