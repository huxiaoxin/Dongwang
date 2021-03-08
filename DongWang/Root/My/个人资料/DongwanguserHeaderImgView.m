//
//  DongwanguserHeaderImgView.m
//  DongWang
//
//  Created by codehzx on 2020/11/6.
//

#import "DongwanguserHeaderImgView.h"
#import "DongwanguserHeaderCollectionViewCell.h"
@interface DongwanguserHeaderImgView  ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic ,strong) UIView *deliverView; //底部View
@property (nonatomic ,strong) UIView *BGView; //遮罩
@property(nonatomic,strong) UICollectionView * DongwangCollectionView;
@property(nonatomic,strong) NSMutableArray * DongwangImgDataArr;

@end
@implementation DongwanguserHeaderImgView
-(NSMutableArray *)DongwangImgDataArr{
    if (!_DongwangImgDataArr) {
        _DongwangImgDataArr = [[NSMutableArray alloc]initWithArray:@[@"头像1",@"头像2",@"头像3",@"头像4",@"头像5",@"头像6"]];
    }
    return _DongwangImgDataArr;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIView* BGView                 = [[UIView alloc] init];
        BGView.frame           = [[UIScreen mainScreen] bounds];
        BGView.userInteractionEnabled = YES;
        BGView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        BGView.opaque = NO;
        [self addSubview:BGView];
        self.BGView = BGView;
        
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(exitClick)];
        gesture.numberOfTapsRequired = 1;
        gesture.cancelsTouchesInView = NO;
        [self.BGView addGestureRecognizer:gesture];
        
        UIView  * deliverView                 = [[UIView alloc] init];
        deliverView.frame           = CGRectMake(0, SCREEN_Height-K(191)-SafeAreaBottom_Height, SCREEN_WIDTH, K(191)+SafeAreaBottom_Height);
           deliverView.backgroundColor = [UIColor colorWithHexString:@"#EBEBEB"];
        [self addSubview:deliverView];
        self.deliverView = deliverView;
        
        UICollectionViewFlowLayout * DongwangLayout = [[UICollectionViewFlowLayout alloc]init];
        DongwangLayout.minimumLineSpacing = K(27);
        DongwangLayout.minimumInteritemSpacing = K(27);
        DongwangLayout.sectionInset =  UIEdgeInsetsMake(K(18.5), K(51), K(18.5),K(51));
        DongwangLayout.itemSize = CGSizeMake(K(73), K(73));
        UICollectionView * DongwangCollectionview = [[UICollectionView alloc]initWithFrame:deliverView.bounds collectionViewLayout:DongwangLayout];
        DongwangCollectionview.delegate = self;
        DongwangCollectionview.dataSource = self;
        DongwangCollectionview.showsVerticalScrollIndicator = NO;
        DongwangCollectionview.showsHorizontalScrollIndicator = NO;
        DongwangCollectionview.backgroundColor = [UIColor clearColor];
        [deliverView addSubview:DongwangCollectionview];
        [DongwangCollectionview registerClass:[DongwanguserHeaderCollectionViewCell class] forCellWithReuseIdentifier:@"DongwanguserHeaderCollectionViewCell"];
        [DongwangCollectionview reloadData];
        DongwangCollectionview.height = DongwangCollectionview.collectionViewLayout.collectionViewContentSize.height;
        deliverView.frame = CGRectMake(0, SCREEN_Height-DongwangCollectionview.size.height-SafeAreaBottom_Height, SCREEN_WIDTH, DongwangCollectionview.size.height+SafeAreaBottom_Height);
        
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.DongwangImgDataArr.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwanguserHeaderCollectionViewCell * DongwangCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DongwanguserHeaderCollectionViewCell" forIndexPath:indexPath];
    DongwangCell.imgStrName = self.DongwangImgDataArr[indexPath.row];
    return DongwangCell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate DongwanguserHeaderImgViewDidSeltecdWithName:[NSString stringWithFormat:@"%ld",(long)indexPath.row+1]];
    [self exitClick];
}
- (void)exitClick {
[self removeFromSuperview];
}
-(void)dealloc{
    NSLog(@"%s",__func__);
}
@end
