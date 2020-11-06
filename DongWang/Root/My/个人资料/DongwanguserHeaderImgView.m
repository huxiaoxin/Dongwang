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

@end
@implementation DongwanguserHeaderImgView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        NSLog(@"111");
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
        deliverView.frame           = CGRectMake(0, SCREEN_WIDTH, SCREEN_WIDTH, K(1));
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
        
//         ------View出现动画
        self.deliverView.transform = CGAffineTransformMakeTranslation(0.01, SCREEN_Height);
        MJWeakSelf;
        [UIView animateWithDuration:0.3 animations:^{

            weakSelf.deliverView.transform = CGAffineTransformMakeTranslation(0.01, 0.01);

        }];
        
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwanguserHeaderCollectionViewCell * DongwangCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DongwanguserHeaderCollectionViewCell" forIndexPath:indexPath];
    return DongwangCell;
}

- (void)exitClick {
    
    NSLog(@"====");
//    MJWeakSelf;
//    [UIView animateWithDuration:0.3 animations:^{
//        weakSelf.deliverView.transform = CGAffineTransformMakeTranslation(0, 0);
//        kStrongSelf(self);
//        weakSelf.deliverView.alpha = 0.f;
//        weakSelf.BGView.alpha = 0.f;
//    } completion:^(BOOL finished) {
//        kStrongSelf(self);
//        [weakSelf.BGView removeFromSuperview];
//        [weakSelf.deliverView removeFromSuperview];
//        [weakSelf  removeFromSuperview];
//
//    }];
    
    [self removeFromSuperview];
    
}
-(void)dealloc{
    NSLog(@"%s",__func__);
}
@end
