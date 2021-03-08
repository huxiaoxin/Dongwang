//
//  EqualSpaceFlowLayoutEvolve.m
//  test
//
//  Created by codehzx on 2020/12/1.
//

#import "EqualSpaceFlowLayoutEvolveSecond.h"
@interface EqualSpaceFlowLayoutEvolveSecond(){
    //在居中对齐的时候需要知道这行所有cell的宽度总和
    CGFloat _sumWidth ;
}
@end
@implementation EqualSpaceFlowLayoutEvolveSecond
-(instancetype)init{
    self = [super init];
    if (self){
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.minimumLineSpacing = 0;
        self.minimumInteritemSpacing = 0;
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _betweenOfCell = 0;
        _cellType = SecondAlignWithCenter;
    }
    return self;
}

-(instancetype)initWthType:(SecondAlignType)cellType{
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
    
    //存放同一行的
    NSMutableArray * tharray = [[NSMutableArray alloc]init];
    
    for (NSUInteger index = 0; index < layoutAttributes.count ; index++) {
        if(index == 0){
//            // 当前cell的位置信息
//            UICollectionViewLayoutAttributes *currentAttr = layoutAttributes[index];
//            [layoutAttributesTemp addObject:currentAttr];
//            [tharray addObject:currentAttr];
            
            // 当前cell的位置信息
                        UICollectionViewLayoutAttributes *currentAttr = layoutAttributes[index];
                        currentAttr.frame = CGRectMake(0, 0, currentAttr.frame.size.width, currentAttr.frame.size.height);
                        [layoutAttributesTemp addObject:currentAttr];
                        [tharray addObject:currentAttr];
        }else{
            // 当前cell的位置信息
            UICollectionViewLayoutAttributes *currentAttr = layoutAttributes[index];
            UICollectionViewLayoutAttributes *previousAttr = layoutAttributes[index-1];
            
            //判断宽度是否能显示下
            if(previousAttr.frame.origin.x + previousAttr.frame.size.width + currentAttr.frame.size.width <= 414){
                //能显示下
                currentAttr.frame = CGRectMake(previousAttr.frame.origin.x + previousAttr.frame.size.width, previousAttr.frame.origin.y, currentAttr.frame.size.width, currentAttr.frame.size.height);
                [tharray addObject:currentAttr];
            }else{
                //不能显示下，拿到同行最高的高度
                //获取最高的高度
                UICollectionViewLayoutAttributes * thheight = tharray[0];
                for (int a = 0; a < tharray.count; a++) {
                    UICollectionViewLayoutAttributes * th = tharray[a];
                    if(th.frame.size.height > thheight.frame.size.height){
                        thheight = tharray[a];
                    }
                }
                //清空临时存储
                [tharray removeAllObjects];
            
                currentAttr.frame = CGRectMake(0, thheight.frame.origin.y+thheight.frame.size.height, currentAttr.frame.size.width, currentAttr.frame.size.height);
            }
            [layoutAttributesTemp addObject:currentAttr];
        }
    }
    return layoutAttributesTemp;
}

@end
