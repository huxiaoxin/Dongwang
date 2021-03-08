//
//  DongwangChildHomeBtnsView.m
//  DongWang
//
//  Created by codehzx on 2020/11/30.
//

#import "DongwangChildHomeBtnsView.h"
#import "DongwangHomeBtnCollectionViewCell.h"
@interface DongwangChildHomeBtnsView ()<UICollectionViewDataSource,UICollectionViewDelegate>


@end
@implementation DongwangChildHomeBtnsView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self  = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        UICollectionViewFlowLayout * Layout = [[UICollectionViewFlowLayout alloc]init];
        Layout.sectionInset =  UIEdgeInsetsMake(K(8), K(18), 0, K(18));
        Layout.itemSize = CGSizeMake(K(51), K(51+18));
        Layout.minimumInteritemSpacing = K(20);
        UICollectionView * DongwangCollectionView  = [[UICollectionView alloc]initWithFrame:CGRectMake(K(15), 0, SCREEN_WIDTH-K(30), K(85)) collectionViewLayout:Layout];
        DongwangCollectionView.delegate = self;
        DongwangCollectionView.dataSource = self;
        DongwangCollectionView.backgroundColor = [UIColor whiteColor];
        DongwangCollectionView.layer.cornerRadius = K(10);
        DongwangCollectionView.layer.masksToBounds = YES;
        [self addSubview:DongwangCollectionView];
        [DongwangCollectionView registerClass:[DongwangHomeBtnCollectionViewCell class] forCellWithReuseIdentifier:@"DongwangHomeBtnCollectionViewCell"];
        
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangHomeBtnCollectionViewCell * DongwangCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DongwangHomeBtnCollectionViewCell" forIndexPath:indexPath];
    return DongwangCell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate DongwangChildHomeBtnsViewCellDidSeltecdWithItemIndex:indexPath.row];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
