//
//  DongwangHomeAllTypeView.m
//  DongWang
//
//  Created by codehzx on 2020/11/30.
//

#import "DongwangHomeAllTypeView.h"
#import "DongwangHomeTypeCollectionViewCell.h"
@interface DongwangHomeAllTypeView ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong) UIView * BGView;
@property(nonatomic,strong) UICollectionView * TypeCollectionView;
@property(nonatomic,strong) NSArray * selDataArr;
@end
@implementation DongwangHomeAllTypeView
-(instancetype)initWithFrame:(CGRect)frame TypeData:(NSArray *)types{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        UIView * BGView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH)];
        BGView.backgroundColor = [UIColor clearColor];
        [self addSubview:BGView];
        
        _BGView = BGView;
        self.selDataArr = types;
        [BGView addSubview:self.TypeCollectionView];
        
        [_TypeCollectionView reloadData];
        _TypeCollectionView.height = _TypeCollectionView.collectionViewLayout.collectionViewContentSize.height+K(15);
                
        UIView * ViewgesuteView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_TypeCollectionView.frame), SCREEN_WIDTH, SCREEN_Height-CGRectGetMaxY(_TypeCollectionView.frame))];
        ViewgesuteView.backgroundColor = [UIColor clearColor];
        [BGView addSubview:ViewgesuteView];
        
        UITapGestureRecognizer   * ViewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangViewgestureTapClicks)];
        [ViewgesuteView addGestureRecognizer:ViewTap];
        
        
    }
    return self;
}
-(void)DongwangViewgestureTapClicks{
    [self.delegate DongwangHomeAllTypeViewViewTapAction];
}
-(UICollectionView *)TypeCollectionView{
    if (!_TypeCollectionView) {
        UICollectionViewFlowLayout * TypeLayout = [[UICollectionViewFlowLayout alloc]init];
        TypeLayout.sectionInset =  UIEdgeInsetsMake(K(15), K(15), K(0), K(15));
        TypeLayout.itemSize = CGSizeMake(K(69), K(23));
        _TypeCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(0)) collectionViewLayout:TypeLayout];
        _TypeCollectionView.delegate = self;
        _TypeCollectionView.dataSource = self;
        _TypeCollectionView.showsVerticalScrollIndicator = NO;
        _TypeCollectionView.showsHorizontalScrollIndicator = NO;
        _TypeCollectionView.backgroundColor = [UIColor whiteColor];
        [_TypeCollectionView registerClass:[DongwangHomeTypeCollectionViewCell class] forCellWithReuseIdentifier:@"DongwangHomeTypeCollectionViewCell"];
        
        [_TypeCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionReusableView"];
    }
    return _TypeCollectionView;
}
//组头高度
-(CGSize )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
return CGSizeMake(SCREEN_WIDTH, K(26));
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
    UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionReusableView" forIndexPath:indexPath];
    UILabel * DongwangMsglb = [[UILabel alloc]initWithFrame:CGRectMake(K(15), K(11), K(200), K(15))];
    DongwangMsglb.text = @"全部分类";
    DongwangMsglb.font = KSysFont(font(15));
    DongwangMsglb.textColor = [UIColor colorWithHexString:@"#666666"];
    [header addSubview:DongwangMsglb];
     return header;
} else {
return nil;
}

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.selDataArr.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangHomeTypeCollectionViewCell * TypeCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DongwangHomeTypeCollectionViewCell" forIndexPath:indexPath];
    TypeCell.tagModel = self.selDataArr[indexPath.row];
    return TypeCell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate DongwangHomeAllTypeViewTagDidSeltecdWithIndex:indexPath.row];
}
-(void)Show{
    self.BGView.backgroundColor = [UIColor clearColor];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.TypeCollectionView.y = 0;
    self.BGView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.4f];

//    self.TypeCollectionView.y = - self.TypeCollectionView.height;
//    MJWeakSelf;
//    [UIView animateWithDuration:0.2 animations:^{
//        weakSelf.BGView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.4f];
//        weakSelf.TypeCollectionView.y = 0;
//    }];
}
-(void)hiden{
    [self removeFromSuperview];
    
//    MJWeakSelf;
//    [UIView animateWithDuration:0.2 animations:^{
//    weakSelf.TypeCollectionView.y = -weakSelf.TypeCollectionView.height;
//    } completion:^(BOOL finished) {
//    [weakSelf removeFromSuperview];
//    }];

}
@end
