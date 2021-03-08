//
//  DongwangMyChatHeaderView.m
//  DongWang
//
//  Created by sycm on 2021/3/1.
//

#import "DongwangMyChatHeaderView.h"
#import "DongwangMyChatTopCollectionViewCell.h"
@interface DongwangMyChatHeaderView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView * DongwangTopCollectionView;
@end
@implementation DongwangMyChatHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [self addSubview:self.chatNavView];
        UIImageView * quanziTopImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(15), RealWidth(5)+NaviH, SCREEN_WIDTH-RealWidth(25), RealWidth(101))];
        quanziTopImgView.image = [UIImage imageNamed:@"quanziTop"];
        quanziTopImgView.userInteractionEnabled = YES;
        [self addSubview:quanziTopImgView];
        _quanziTopImgView = quanziTopImgView;
        [quanziTopImgView addSubview:self.DongwangTopCollectionView];
    }
    return self;
}
-(UICollectionView *)DongwangTopCollectionView{
    if (!_DongwangTopCollectionView) {
        UICollectionViewFlowLayout * Layout = [[UICollectionViewFlowLayout alloc]init];
        Layout.minimumLineSpacing = RealWidth(20);
        Layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        Layout.itemSize = CGSizeMake(RealWidth(55), RealWidth(55));
        Layout.sectionInset =  UIEdgeInsetsMake(0, RealWidth(15), 0, RealWidth(30));
        _DongwangTopCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_quanziTopImgView.frame)-RealWidth(20), CGRectGetHeight(_quanziTopImgView.frame)) collectionViewLayout:Layout];
        _DongwangTopCollectionView.delegate = self;
        _DongwangTopCollectionView.dataSource = self;
        _DongwangTopCollectionView.showsVerticalScrollIndicator = NO;
        _DongwangTopCollectionView.showsHorizontalScrollIndicator = NO;
        _DongwangTopCollectionView.backgroundColor = [UIColor clearColor];
        [_DongwangTopCollectionView registerClass:[DongwangMyChatTopCollectionViewCell class] forCellWithReuseIdentifier:@"DongwangMyChatTopCollectionViewCell"];
    }
    return _DongwangTopCollectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangMyChatTopCollectionViewCell * Cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DongwangMyChatTopCollectionViewCell" forIndexPath:indexPath];
    return Cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate DongwangMyChatHeaderViewDidSeltecdWithIndex:indexPath.row];
}
-(DongwangMyChatNavView *)chatNavView{
    if (!_chatNavView) {
        _chatNavView =[[DongwangMyChatNavView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NaviH)];
    }
    return _chatNavView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
