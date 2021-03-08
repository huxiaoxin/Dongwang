//
//  DongwangMofangStyeTwoCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/12/9.
//

#import "DongwangMofangStyeTwoCollectionViewCell.h"
#import "EqualSpaceFlowLayoutEvolve.h"
#import "DongwangStyeTwoMofangCollectionViewCell.h"
@interface DongwangMofangStyeTwoCollectionViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView * DongwangActityCollectionView;

@end
@implementation DongwangMofangStyeTwoCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
   [self addSubview:self.DongwangActityCollectionView];
    }
    return self;
}
-(UICollectionView *)DongwangActityCollectionView{
    if (!_DongwangActityCollectionView) {
        EqualSpaceFlowLayoutEvolve * DongwangActiytLayout =[[EqualSpaceFlowLayoutEvolve alloc]initWthType:AlignWithLeft];
//        DongwangActiytLayout.cellType = AlignWithCenter;
//        DongwangActiytLayout.betweenOfCell = K(15);
//        DongwangActiytLayout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
        _DongwangActityCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(K(0), 0, SCREEN_WIDTH-K(30), K(0)) collectionViewLayout:DongwangActiytLayout];
        _DongwangActityCollectionView.delegate = self;
        _DongwangActityCollectionView.dataSource =self;
        _DongwangActityCollectionView.showsVerticalScrollIndicator = NO;
        _DongwangActityCollectionView.showsHorizontalScrollIndicator = NO;
        _DongwangActityCollectionView.backgroundColor = [UIColor clearColor];
        [_DongwangActityCollectionView registerClass:[DongwangStyeTwoMofangCollectionViewCell class] forCellWithReuseIdentifier:@"DongwangStyeTwoMofangCollectionViewCell"];
    }
    return _DongwangActityCollectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _listMsgic.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangStyeTwoMofangCollectionViewCell * DongwangCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DongwangStyeTwoMofangCollectionViewCell" forIndexPath:indexPath];
    DongwangCell.listmodel = _listMsgic[indexPath.row];
    return DongwangCell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((SCREEN_WIDTH-K(30))/2, K(85));
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"===-=-=-%ld",indexPath.row);
    [self.delegate DongwangMofangStyeTwoCollectionViewCellDidSeltecdWithCellIndex:indexPath.row ModelSoureIndex:self.tag];
}
-(void)setListMsgic:(NSArray *)listMsgic{
    _listMsgic = listMsgic;
    [_DongwangActityCollectionView reloadData];
    _DongwangActityCollectionView.height = _DongwangActityCollectionView.collectionViewLayout.collectionViewContentSize.height;
    
}
@end
