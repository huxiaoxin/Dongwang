//
//  EqualSpaceFlowLayoutEvolve.m
//  test
//
//  Created by codehzx on 2020/12/1.
//

#import "MofangEqualSpaceFlowLayoutEvolve.h"
@interface MofangEqualSpaceFlowLayoutEvolve(){
    //在居中对齐的时候需要知道这行所有cell的宽度总和
    CGFloat _sumWidth ;
}
@end
@implementation MofangEqualSpaceFlowLayoutEvolve
-(instancetype)init{
    self = [super init];
    if (self){
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.minimumLineSpacing = 0;
        self.minimumInteritemSpacing = 0;
        self.sectionInset = UIEdgeInsetsMake(0, K(0), 0, 0);
        _betweenOfCell = 0;
        _cellType = MofangAlignWithCenter;
        
        
        
    }
    return self;
}

-(instancetype)initWthType:(MofangAlignType)cellType{
    self = [super init];
    if (self){
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.minimumLineSpacing = 0;
        self.minimumInteritemSpacing = 0;
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _betweenOfCell = 0;
        _cellType = cellType;
    }
    return self;
}
-(void)setBetweenOfCell:(CGFloat)betweenOfCell{
    _betweenOfCell = betweenOfCell;
    self.minimumInteritemSpacing = betweenOfCell;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray * layoutAttributes_t = [super layoutAttributesForElementsInRect:rect];
    NSArray * layoutAttributes = [[NSArray alloc]initWithArray:layoutAttributes_t copyItems:YES];
    //用来临时存放一行的Cell数组
    NSMutableArray * layoutAttributesTemp = [[NSMutableArray alloc]init];
    for (NSUInteger index = 0; index < layoutAttributes.count ; index++) {
        //上一个cell
        UICollectionViewLayoutAttributes *previousAttr = index == 0 ? nil : layoutAttributes[index-1];
        //当前cell
        UICollectionViewLayoutAttributes *currentAttr = layoutAttributes[index];
        if (index == 0) {
        currentAttr.frame = CGRectMake(0, 0, currentAttr.frame.size.width, currentAttr.frame.size.height);
        }else{
            currentAttr.frame = CGRectMake(CGRectGetMaxX(previousAttr.frame), CGRectGetMaxY(previousAttr.frame), currentAttr.frame.size.width, currentAttr.frame.size.height);

        }
     
        [layoutAttributesTemp addObject:currentAttr];
        
        
    }
    return layoutAttributesTemp;
        
        
        
        
    //        [layoutAttributesTemp addObject:currentAttr];
        
//    }
        
        
//        // 当前cell的位置信息
//        UICollectionViewLayoutAttributes *currentAttr = layoutAttributes[index];
//        UICollectionViewLayoutAttributes *previousAttr = index == 0 ? nil : layoutAttributes[index-1];
//
//        //如果当前cell跟上一个cell高度相同
//        if(currentAttr.frame.size.height == previousAttr.frame.size.height){
//            if((previousAttr.frame.origin.x + previousAttr.frame.size.width) + currentAttr.frame.size.width > self.collectionView.frame.size.width){
//                currentAttr.frame = CGRectMake(0, previousAttr.frame.origin.y + previousAttr.frame.size.height, currentAttr.frame.size.width, currentAttr.frame.size.height);
//            }else{
//                currentAttr.frame = CGRectMake(previousAttr.frame.origin.x + previousAttr.frame.size.width, previousAttr.frame.origin.y, currentAttr.frame.size.width, currentAttr.frame.size.height);
//            }
//        }else{
//
//
//    //如果不同 还要判断当前cell是否跟上一个cell是在同一行上 是同一行上 y不改，不在同一列上改变y值
//            currentAttr.frame = CGRectMake(0, previousAttr.frame.origin.y + previousAttr.frame.size.height, currentAttr.frame.size.width, currentAttr.frame.size.height);
//        }
//        [layoutAttributesTemp addObject:currentAttr];
//    }
//    return layoutAttributesTemp;
}

@end
