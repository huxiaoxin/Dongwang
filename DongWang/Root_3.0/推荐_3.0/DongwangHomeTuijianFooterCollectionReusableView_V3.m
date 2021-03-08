//
//  DongwangHomeTuijianFooterCollectionReusableView_V3.m
//  DongWang
//
//  Created by codehzx on 2021/1/17.
//

#import "DongwangHomeTuijianFooterCollectionReusableView_V3.h"
#import "DongwangMallCollectionViewCell.h"
@interface DongwangHomeTuijianFooterCollectionReusableView_V3 ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView * mycollectionView;
@end
@implementation DongwangHomeTuijianFooterCollectionReusableView_V3
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.mycollectionView];
    }
    return self;
}
-(void)layoutSubviews{
    _mycollectionView.frame = CGRectMake(RealWidth(10), RealWidth(10), SCREEN_WIDTH-RealWidth(20), self.bounds.size.height);
}
-(UICollectionView *)mycollectionView{
    if (!_mycollectionView) {
        UICollectionViewFlowLayout * DongwangLayout = [[UICollectionViewFlowLayout alloc]init];
        DongwangLayout.sectionInset = UIEdgeInsetsMake(RealWidth(11), RealWidth(11), RealWidth(11), RealWidth(11));
        DongwangLayout.itemSize = CGSizeMake(RealWidth(156), RealWidth(229));
        DongwangLayout.minimumLineSpacing = RealWidth(14.5);
        _mycollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:DongwangLayout];
        _mycollectionView.delegate = self;
        _mycollectionView.dataSource = self;
        _mycollectionView.showsVerticalScrollIndicator =  NO;
        _mycollectionView.showsHorizontalScrollIndicator = NO;
        _mycollectionView.backgroundColor = [UIColor colorWithHexString:@"#341E7B"];
        _mycollectionView.scrollEnabled = NO;
        _mycollectionView.layer.borderColor = [UIColor colorWithHexString:@"#51D5E8"].CGColor;
        _mycollectionView.layer.borderWidth = RealWidth(1);
        _mycollectionView.layer.cornerRadius = RealWidth(5);
        _mycollectionView.layer.masksToBounds = YES;
        [_mycollectionView registerClass:[DongwangMallCollectionViewCell class] forCellWithReuseIdentifier:@"DongwangMallCollectionViewCell"];
        
    }
    return _mycollectionView;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _DongwangDataArr.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangMallCollectionViewCell * MallCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DongwangMallCollectionViewCell" forIndexPath:indexPath];
    MallCell.TizuModel = _DongwangDataArr[indexPath.row];
    return MallCell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangHotTizuModel * tizuModel = _DongwangDataArr[indexPath.row];
    [self.delegate DongwangHomeTuijianFooterCollectionReusableView_V3ItemDidSeltecdWithModels:tizuModel];
}
-(void)setDongwangDataArr:(NSMutableArray *)DongwangDataArr{
    _DongwangDataArr = DongwangDataArr;
    [_mycollectionView reloadData];
    _mycollectionView.size = _mycollectionView.collectionViewLayout.collectionViewContentSize;
    if (DongwangDataArr.count == 0) {
        NSLog(@"--------0");
        _mycollectionView.layer.borderWidth = 0;
    }else{
        NSLog(@"============0");
        _mycollectionView.layer.borderWidth = RealWidth(1);
    }
    CGFloat SectionHeight  = CGRectGetMaxY(_mycollectionView.frame)+RealWidth(10);
    if (self.HeaderHeight != nil) {
        self.HeaderHeight(SectionHeight);
    }
}
@end
