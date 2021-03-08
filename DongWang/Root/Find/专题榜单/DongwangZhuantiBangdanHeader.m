//
//  DongwangZhuantiBangdanHeader.m
//  DongWang
//
//  Created by codehzx on 2020/11/26.
//

#import "DongwangZhuantiBangdanHeader.h"
#import "DongwangZhuantiBangdanCollectionViewCell.h"
#import "DongwangZhuantiBangdanCollectionReusableView.h"
@interface DongwangZhuantiBangdanHeader ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end
@implementation DongwangZhuantiBangdanHeader
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    
        self.backgroundColor = [UIColor clearColor];
        UIImageView * DongwangBannarImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(206.5))];
        DongwangBannarImgView.image = [UIImage imageNamed:@"发现背景"];
        [self addSubview:DongwangBannarImgView];
       
        
        UIView * DongwangTopContentView = [[UIView alloc]initWithFrame:CGRectMake(K(15.5), K(180), SCREEN_WIDTH-K(31), K(215))];
        DongwangTopContentView.backgroundColor = [UIColor whiteColor];
        DongwangTopContentView.layer.cornerRadius = K(5);
        DongwangTopContentView.layer.masksToBounds = YES;
        [self addSubview:DongwangTopContentView];
        
        
        UIButton * DongwangTopBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(49), K(21.5), CGRectGetWidth(DongwangTopContentView.frame)-K(98), K(31))];
        [DongwangTopBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        DongwangTopBtn.titleLabel.font = KBlFont(font(16));
        DongwangTopBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [DongwangTopBtn setTitle:@"本期冲榜榜单:《题组名称》" forState:UIControlStateNormal];
        [DongwangTopBtn setBackgroundImage:[UIImage imageNamed:@"发现背景模块"] forState:UIControlStateNormal];
        [DongwangTopContentView addSubview:DongwangTopBtn];
        
        
        UILabel * DongwangMsglb = [[UILabel alloc]initWithFrame:CGRectMake(K(28.5), CGRectGetMaxY(DongwangTopBtn.frame)+K(17), CGRectGetWidth(DongwangTopContentView.frame)-K(57), K(10))];
        DongwangMsglb.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangMsglb.font = KSysFont(font(13));
        DongwangMsglb.numberOfLines = 0;
        DongwangMsglb.textAlignment = NSTextAlignmentCenter;
        [DongwangTopContentView addSubview:DongwangMsglb];
        [DongwangMsglb setText:@"冲榜规则：活动期间，参与本期冲榜题组答题，获得相应积分奖励，获得积分越高，排名越高，排名前3名的用户可获得奖品一份。" lineSpacing:K(3)];
        DongwangMsglb.height = [DongwangMsglb  getSpaceLabelHeight:@"冲榜规则：活动期间，参与本期冲榜题组答题，获得相应积分奖励，获得积分越高，排名越高，排名前3名的用户可获得奖品一份。" withFont:KSysFont(font(13)) withWidth:CGRectGetWidth(DongwangTopContentView.frame)-K(57) lineSpacing:K(3)].height;
        
        
        
        UILabel * DongwangBtomMsglb = [[UILabel alloc]initWithFrame:CGRectMake(K(28.5), CGRectGetMaxY(DongwangMsglb.frame)+K(45), CGRectGetWidth(DongwangTopContentView.frame)-K(57), K(15))];
        DongwangBtomMsglb.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangBtomMsglb.font = KSysFont(font(13));
        DongwangBtomMsglb.numberOfLines = 0;
        DongwangBtomMsglb.text = @"本期活动时间：2021年1月1日-2021年1月3日";
        DongwangBtomMsglb.textAlignment = NSTextAlignmentCenter;
        [DongwangTopContentView addSubview:DongwangBtomMsglb];
        
        
        UICollectionViewFlowLayout * DongwangLayout = [[UICollectionViewFlowLayout alloc]init];
        DongwangLayout.itemSize = CGSizeMake(K(77), K(109));
        DongwangLayout.sectionInset = UIEdgeInsetsMake(K(10), K(24), 0, K(24));
        UICollectionView * DongwangCollectionView= [[UICollectionView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(DongwangTopContentView.frame)+K(20.5), SCREEN_WIDTH-K(30), K(160)) collectionViewLayout:DongwangLayout];
        DongwangCollectionView.delegate = self;
        DongwangCollectionView.dataSource = self;
        DongwangCollectionView.showsVerticalScrollIndicator = NO;
        DongwangCollectionView.showsHorizontalScrollIndicator = NO;
        DongwangCollectionView.backgroundColor = [UIColor whiteColor];
        [self addSubview:DongwangCollectionView];
        [DongwangCollectionView registerClass:[DongwangZhuantiBangdanCollectionViewCell class] forCellWithReuseIdentifier:@"DongwangZhuantiBangdanCollectionViewCell"];
        [DongwangCollectionView registerClass:[DongwangZhuantiBangdanCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DongwangZhuantiBangdanCollectionReusableView"];
        
        
        self.HeaderViewHeight = CGRectGetMaxY(DongwangCollectionView.frame)+K(10);
        
        
    }
    return self;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableView = nil;
    // 区头
    if (kind == UICollectionElementKindSectionHeader) {
        DongwangZhuantiBangdanCollectionReusableView *headerView = (DongwangZhuantiBangdanCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DongwangZhuantiBangdanCollectionReusableView" forIndexPath:indexPath];
        reusableView = headerView;
    }
    return reusableView;
}
// 设置区头尺寸高度
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size = CGSizeMake(SCREEN_WIDTH, K(20));
    return size;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangZhuantiBangdanCollectionViewCell * DongwangCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DongwangZhuantiBangdanCollectionViewCell" forIndexPath:indexPath];
    return DongwangCell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
