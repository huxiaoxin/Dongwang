//
//  DongwangDaletouDetailFooterView.m
//  DongWang
//
//  Created by sycm on 2021/2/23.
//

#import "DongwangDaletouDetailFooterView.h"
#import "DongwangDaletouDetailCollectionViewCell.h"
#import "DongwangDaletouLingquFooterCollectionReusableView.h"
@interface DongwangDaletouDetailFooterView ()<UICollectionViewDelegate,UICollectionViewDataSource,DongwangDaletouDetailCollectionViewCellDelegate,DongwangDaletouLingquFooterCollectionReusableViewDelegate>
@property(nonatomic,strong) UIImageView  * daletoubackImgView;
@property(nonatomic,strong) UICollectionView * collectionViews;
@property(nonatomic,strong) UILabel * DongwangTplb;
@property(nonatomic,strong) NSString * expireStr;
@end
@implementation DongwangDaletouDetailFooterView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    [self addSubview:self.daletoubackImgView];
        
        UILabel * DongwangTplb = [[UILabel alloc]initWithFrame:CGRectMake(0, RealWidth(15), CGRectGetWidth(_daletoubackImgView.frame), RealWidth(18))];
        DongwangTplb.textAlignment = NSTextAlignmentCenter;
        DongwangTplb.font =  PFS18Font;
        DongwangTplb.textColor = [UIColor colorWithHexString:@"#430095"];
        DongwangTplb.text = @"我的乐透码";
        [_daletoubackImgView addSubview:DongwangTplb];
        _DongwangTplb = DongwangTplb;
        [_daletoubackImgView addSubview:self.collectionViews];
    }
    return self;
}
-(UICollectionView *)collectionViews{
    if (!_collectionViews) {
        UICollectionViewFlowLayout  * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.sectionInset = UIEdgeInsetsMake(RealWidth(10), RealWidth(22), RealWidth(10), RealWidth(22));
        layout.itemSize = CGSizeMake(RealWidth(149), RealWidth(82));
        _collectionViews = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_DongwangTplb.frame)+RealWidth(10), CGRectGetWidth(_daletoubackImgView.frame)-RealWidth(6), CGRectGetHeight(_daletoubackImgView.frame)-RealWidth(30)) collectionViewLayout:layout];
        _collectionViews.delegate = self;
        _collectionViews.dataSource = self;
        _collectionViews.showsVerticalScrollIndicator = NO;
        _collectionViews.showsHorizontalScrollIndicator = NO;
        _collectionViews.backgroundColor = [UIColor clearColor];
        [_collectionViews registerClass:[DongwangDaletouDetailCollectionViewCell class] forCellWithReuseIdentifier:@"DongwangDaletouDetailCollectionViewCell"];
        [_collectionViews registerClass:[DongwangDaletouLingquFooterCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"DongwangDaletouLingquFooterCollectionReusableView"];
    }
    return _collectionViews;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangDaletouDetailCollectionViewCell * Cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DongwangDaletouDetailCollectionViewCell" forIndexPath:indexPath];
    Cell.tag = indexPath.row;
    Cell.delegate = self;
    Cell.historyModel = _dataArr[indexPath.row];
    return Cell;
}
#pragma mark--查看当前用户的奖项是否领取(已中奖的)
-(BOOL)userisHuojian:(NSMutableArray * )lotteryResponsesArr{
    //receive  是否领取 0-未领取 1-已领取 默认0
    //status    是否中奖 0-不中奖 1-中奖 2-过期 默认0
    BOOL  isSucced = NO;
    for (DongwangMyHistoryModel * moel in lotteryResponsesArr) {
        if (moel.receive == 0  && moel.status == 1) {
            isSucced = YES;
            break;
        }
    }
    
    return  isSucced ;
}

-(void)setDataArr:(NSArray *)dataArr{
    _dataArr =  dataArr;
    if (dataArr.count == 0) {
        LYEmptyView * emtyView = [LYEmptyView emptyViewWithImage:nil titleStr:@"您未参与本期活动" detailStr:nil];
        emtyView.titleLabFont = PFS18Font;
        emtyView.titleLabMargin = 10;
        emtyView.titleLabTextColor = [UIColor colorWithHexString:@"#999999"];
        _collectionViews.ly_emptyView = emtyView;
    }
    [_collectionViews reloadData];
    if (dataArr.count == 0) {
        _collectionViews.height =CGRectGetHeight(_daletoubackImgView.frame)-RealWidth(30);
        _FooterHeight =  CGRectGetHeight(_daletoubackImgView.frame);
    }else{
        _collectionViews.height = _collectionViews.collectionViewLayout.collectionViewContentSize.height;
        _daletoubackImgView.height = _collectionViews.collectionViewLayout.collectionViewContentSize.height+RealWidth(70);
        _FooterHeight =  CGRectGetHeight(_daletoubackImgView.frame);
    }

}
-(void)setResponeDic:(NSDictionary *)responeDic{
    _responeDic = responeDic;
    NSString *  expire = [NSString stringWithFormat:@"%@",[[responeDic objectForKey:@"data"] objectForKey:@"expire"]];
    self.expireStr = expire;
    [self.collectionViews reloadData];
}
-(UIImageView *)daletoubackImgView{
    if (!_daletoubackImgView) {
        _daletoubackImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(13), RealWidth(10), SCREEN_Width-RealWidth(13), RealWidth(286))];
        _daletoubackImgView.userInteractionEnabled = YES;
        _daletoubackImgView.image = [UIImage imageNamed:@"daletoufooter"];
    }
    return _daletoubackImgView;
}
// 设置区尾尺寸高度
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    CGSize size = CGSizeMake(SCREEN_WIDTH, self.dataArr.count == 0 ? 0 : RealWidth(40+20));
    
    return size;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableView = nil;
    // 区尾
    if (kind == UICollectionElementKindSectionFooter) {
DongwangDaletouLingquFooterCollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"DongwangDaletouLingquFooterCollectionReusableView" forIndexPath:indexPath];
        //过期时间
    footerView.exprineStr = self.expireStr;
    //判断用户是否领取奖项
    footerView.isLingequ = [self userisHuojian:[self.dataArr mutableCopy]];
    //判断是否中奖
    footerView.iszhongjiang = [self findCurrensueriszhongjiang];
    footerView.delegate = self;
    reusableView = footerView;
    }
    return reusableView;
}
#pragma mark--DongwangDaletouDetailCollectionViewCellDelegate
-(void)DongwangDaletouDetailCollectionViewCellWithClickIndex:(NSInteger)cellIndex{
    DongwangMyHistoryModel * histModel = self.dataArr[cellIndex];
    [self.delegate DongwangDaletouDetailFooterViewCellDidlseltWith:histModel];
}
#pragma mark--DongwangDaletouLingquFooterCollectionReusableViewDelegate
-(void)DongwangDaletouLingquFooterCollectionReusableViewlingqu{
    DongwangMyHistoryModel * findModel = [self findCanLineuq];
//    NSLog(@"中奖id:%@",findModel.id);
    [self.delegate DongwangDaletouDetailFooterViewCellDidlseltWith:findModel];
}
#pragma mark--查看当前用户是否中奖
-(BOOL)findCurrensueriszhongjiang{
    //receive  是否领取 0-未领取 1-已领取 默认0
    //status    是否中奖 0-不中奖 1-中奖 2-过期 默认0
    BOOL  isSucced = NO;
    for (DongwangMyHistoryModel * moel in self.dataArr) {
        if ( moel.status == 1) {
            isSucced = YES;
            break;
        }
    }
    
    return  isSucced ;

}
#pragma mark--查找当前用户获奖的乐透码
-(DongwangMyHistoryModel *)findCanLineuq{
    //receive  是否领取 0-未领取 1-已领取 默认0
    //status    是否中奖 0-不中奖 1-中奖 2-过期 默认0
    DongwangMyHistoryModel * currentModel;
    for (DongwangMyHistoryModel * moel in self.dataArr) {
    if (moel.receive == 0  && moel.status == 1) {
    currentModel = moel;
    break;
    }
    }
    return currentModel;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
