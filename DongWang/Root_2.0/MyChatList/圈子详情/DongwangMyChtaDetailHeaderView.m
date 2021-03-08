//
//  DongwangMyChtaDetailHeaderView.m
//  DongWang
//
//  Created by sycm on 2021/3/5.
//

#import "DongwangMyChtaDetailHeaderView.h"
#import "DongwangChatPhotoCollectionViewCell.h"
@interface DongwangMyChtaDetailHeaderView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UIImageView * DongwanguserImgView;
@property(nonatomic,strong) UILabel * DongwangNamelb;
@property(nonatomic,strong) UILabel * DongwangContentlb;
@property(nonatomic,strong) UICollectionView * DongwangCollectionView;
@property(nonatomic,strong) UILabel * DongwangTimelb;
@property(nonatomic,strong) UIView * Dongwangline;

@end
@implementation DongwangMyChtaDetailHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.DongwanguserImgView];
        [self addSubview:self.DongwangNamelb];
        [self addSubview:self.DongwangContentlb];
        [self addSubview:self.DongwangCollectionView];
        [_DongwangCollectionView reloadData];
        _DongwangCollectionView.height = _DongwangCollectionView.collectionViewLayout.collectionViewContentSize.height;
        [self addSubview:self.DongwangTimelb];
        [self addSubview:self.Dongwangline];
        self.DetailHeaderHeight = CGRectGetMaxY(_Dongwangline.frame);
        NSLog(@"====%f",self.DetailHeaderHeight);
    }
    return self;
}
-(UIImageView *)DongwanguserImgView{
    if (!_DongwanguserImgView) {
        _DongwanguserImgView =[[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(15), RealWidth(15), RealWidth(35), RealWidth(35))] ;
        _DongwanguserImgView.backgroundColor = LGDRedColor;
        _DongwanguserImgView.layer.cornerRadius = RealWidth(17.5);
        _DongwanguserImgView.layer.masksToBounds = YES;
    }
    return _DongwanguserImgView;
}
-(UILabel *)DongwangNamelb{
    if (!_DongwangNamelb) {
        _DongwangNamelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_DongwanguserImgView.frame)+RealWidth(10), CGRectGetMidY(_DongwanguserImgView.frame)-RealWidth(8), RealWidth(100), RealWidth(16))];
        _DongwangNamelb.textColor = [UIColor whiteColor];
        _DongwangNamelb.font = PFR12Font;
        _DongwangNamelb.text = @"-迷迭香-";
    }
    return _DongwangNamelb;
}
-(UILabel *)DongwangContentlb{
    if (!_DongwangContentlb) {
        _DongwangContentlb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(15), CGRectGetMaxY(_DongwanguserImgView.frame)+RealWidth(5), SCREEN_WIDTH-RealWidth(60), RealWidth(40))];
        _DongwangContentlb.textColor =[UIColor whiteColor];
        _DongwangContentlb.numberOfLines = 0;
        _DongwangContentlb.font =  PFR13Font;
        _DongwangContentlb.text = @"塞煌羊三人炼铜塞煌羊三人炼铜塞煌羊三人炼铜塞煌羊三人炼铜塞煌羊三人炼铜塞煌羊三人炼铜塞煌羊三人炼铜塞煌羊三人炼铜塞煌羊三人炼铜";
    }
    return _DongwangContentlb;
}
-(UICollectionView *)DongwangCollectionView{
    if (!_DongwangCollectionView) {
        UICollectionViewFlowLayout * Layout = [[UICollectionViewFlowLayout alloc]init];
        Layout.sectionInset = UIEdgeInsetsMake(0, RealWidth(15), 0, RealWidth(15));
        Layout.itemSize = CGSizeMake(RealWidth(95), RealWidth(95));
        _DongwangCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_DongwangContentlb.frame)+RealWidth(10), SCREEN_WIDTH-RealWidth(30), RealWidth(50)) collectionViewLayout:Layout];
        _DongwangCollectionView.delegate = self;
        _DongwangCollectionView.dataSource = self;
        _DongwangCollectionView.showsVerticalScrollIndicator = NO;
        _DongwangCollectionView.showsHorizontalScrollIndicator = NO;
        _DongwangCollectionView.backgroundColor = [UIColor clearColor];
        [_DongwangCollectionView registerClass:[DongwangChatPhotoCollectionViewCell class] forCellWithReuseIdentifier:@"DongwangChatPhotoCollectionViewCell"];
    }
    return _DongwangCollectionView;
}
-(UILabel *)DongwangTimelb{
    if (!_DongwangTimelb) {
        _DongwangTimelb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(15), CGRectGetMaxY(_DongwangCollectionView.frame)+RealWidth(10), RealWidth(200), RealWidth(13))];
        _DongwangTimelb.text = @"14分钟";
        _DongwangTimelb.font = PFR13Font;
        _DongwangTimelb.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    }
    return _DongwangTimelb;
}
-(UIView *)Dongwangline{
    if (!_Dongwangline) {
        _Dongwangline = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_DongwangTimelb.frame)+RealWidth(15), SCREEN_WIDTH-RealWidth(30), RealWidth(1))];
        _Dongwangline.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF" Alpha:0.5];
    }
    return _Dongwangline;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangChatPhotoCollectionViewCell * PhotoCell =[collectionView dequeueReusableCellWithReuseIdentifier:@"DongwangChatPhotoCollectionViewCell" forIndexPath:indexPath];
    return PhotoCell;
}

@end
