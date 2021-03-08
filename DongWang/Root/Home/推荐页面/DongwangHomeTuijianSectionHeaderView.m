//
//  DongwangHomeTuijianSectionHeaderView.m
//  DongWang
//
//  Created by codehzx on 2020/12/15.
//

#import "DongwangHomeTuijianSectionHeaderView.h"
#import "MyImgCollectionViewCell.h"
#import "DongwangMofangModel.h"
#import <XHWebImageAutoSize.h>
@interface DongwangHomeTuijianSectionHeaderView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView * DongwangActityCollectionView;

@end
@implementation DongwangHomeTuijianSectionHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    [self addSubview:self.DongwangActityCollectionView];

    }
    return self;
}
-(UICollectionView *)DongwangActityCollectionView{
    if (!_DongwangActityCollectionView) {
        UICollectionViewFlowLayout * DongwangActiytLayout = [[UICollectionViewFlowLayout alloc]init];
        DongwangActiytLayout.minimumLineSpacing = 0;
        DongwangActiytLayout.minimumInteritemSpacing = 0;
        _DongwangActityCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(15, K(17), SCREEN_WIDTH-30, K(0)) collectionViewLayout:DongwangActiytLayout];
        _DongwangActityCollectionView.delegate = self;
        _DongwangActityCollectionView.dataSource =self;
        _DongwangActityCollectionView.showsVerticalScrollIndicator = NO;
        _DongwangActityCollectionView.showsHorizontalScrollIndicator = NO;
        _DongwangActityCollectionView.backgroundColor = [UIColor clearColor];
        [_DongwangActityCollectionView registerClass:[MyImgCollectionViewCell class] forCellWithReuseIdentifier:@"MyImgCollectionViewCell"];
        


    }
    return _DongwangActityCollectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    DongwangMofangModel * mofangModle = self.DataArr[section];
    return mofangModle.magicList.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.DataArr.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangMofangModel * dongmodle = self.DataArr[indexPath.section];

    MyImgCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyImgCollectionViewCell" forIndexPath:indexPath];
    cell.myimgeView.backgroundColor = [UIColor clearColor];
        MagicList  * listobject  = dongmodle.magicList[indexPath.row];
    [cell.myimgeView sd_setImageWithURL:[NSURL URLWithString:listobject.imageUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            /** 缓存image size */
        [XHWebImageAutoSize storeImageSize:image forURL:[NSURL URLWithString:listobject.imageUrl] completed:^(BOOL result) {
        /** reload  */
        if(result)  [collectionView  xh_reloadDataForURL:[NSURL URLWithString:listobject.imageUrl]];
        }];
        }];
        return cell;

    
    return nil;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangMofangModel * mofangmodel = self.DataArr[indexPath.section];
    MagicList * listmodel = mofangmodel.magicList[indexPath.row];
//    NSLog(@"个数:%ld",listmodel.countNums);
    //指定了item的宽度
    CGFloat  imgWidth = (SCREEN_WIDTH-30)/listmodel.countNums;
    CGFloat imgheight =     [XHWebImageAutoSize imageHeightForURL:[NSURL URLWithString:listmodel.imageUrl] layoutWidth:imgWidth estimateHeight:100];
    
//    NSLog(@"图片的高度:%f",imgheight);
//    return CGSizeMake(imgrealWidth, imgheight);
    
    //控件宽度＊图片高度/图片宽度  =控件需要的高度
    return  CGSizeMake(imgWidth, imgheight);
}
-(void)setDataArr:(NSMutableArray *)DataArr{
    _DataArr = DataArr;
    NSLog(@"SET方法");
    NSLog(@"-=-=%ld",DataArr.count);
    [_DongwangActityCollectionView reloadData];
}
@end
