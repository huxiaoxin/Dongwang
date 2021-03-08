//
//  DongwangHomeHeaderView.m
//  DongWang
//
//  Created by codehzx on 2020/11/30.
//

#import "DongwangHomeHeaderView.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
#import "DongwangChildHomeBtnsView.h"
#import "DongwangHomeActityCollectionViewCell.h"
#import "textcollectionCell.h"
#import "EqualSpaceFlowLayoutEvolve.h"


#import "DongwangMofangFirstCollectionViewCell.h"
#import "DongwangMofangSecondCollectionViewCell.h"
#import "DongwangMofangThreeCollectionViewCell.h"
#import "DongwangMofangFoureCollectionViewCell.h"
#import "DongwangMofangFiveCollectionViewCell.h"

#import "DongwangMofangStyeTwoCollectionViewCell.h"

#import "DongwangMofangModel.h"

#import <XHWebImageAutoSize.h>
#import "DongwangbannarCollectionViewCell.h"
#import "MofangEqualSpaceFlowLayoutEvolve.h"
#import "EqualSpaceFlowLayoutEvolveSecond.h"
#import "MyImgCollectionViewCell.h"
@interface DongwangHomeHeaderView ()<DongwangChildHomeBtnsViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,SDCycleScrollViewDelegate,DongwangMofangStyeTwoCollectionViewCellDelegate>
@property(nonatomic,strong) SDCycleScrollView * DongwangSDC;
@property(nonatomic,strong) DongwangChildHomeBtnsView * HomeBtnView;
@property(nonatomic,strong) UICollectionView * DongwangActityCollectionView;
@property(nonatomic,strong) NSMutableArray * ActityDataArr;
@end
@implementation DongwangHomeHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        UIImageView * DongwangBjimgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(119.5))];
        DongwangBjimgView.image = [UIImage imageNamed:@"形状结合"];
        [self addSubview:DongwangBjimgView];
        [self addSubview:self.DongwangSDC];
       //[self addSubview:self.HomeBtnView];
        [self addSubview:self.DongwangActityCollectionView];
        
    }
    return self;
}
-(UICollectionView *)DongwangActityCollectionView{
    if (!_DongwangActityCollectionView) {
        UICollectionViewFlowLayout * DongwangActiytLayout = [[UICollectionViewFlowLayout alloc]init];
        DongwangActiytLayout.minimumLineSpacing = 0;
        DongwangActiytLayout.minimumInteritemSpacing = 0;
        _DongwangActityCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_DongwangSDC.frame)+K(17), SCREEN_WIDTH-30, K(0)) collectionViewLayout:DongwangActiytLayout];
        _DongwangActityCollectionView.delegate = self;
        _DongwangActityCollectionView.dataSource =self;
        _DongwangActityCollectionView.showsVerticalScrollIndicator = NO;
        _DongwangActityCollectionView.showsHorizontalScrollIndicator = NO;
        _DongwangActityCollectionView.backgroundColor = [UIColor clearColor];
        [_DongwangActityCollectionView registerClass:[MyImgCollectionViewCell class] forCellWithReuseIdentifier:@"MyImgCollectionViewCell"];

    }
    return _DongwangActityCollectionView;
}
-(DongwangChildHomeBtnsView *)HomeBtnView{
    if (!_HomeBtnView) {
        _HomeBtnView = [[DongwangChildHomeBtnsView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_DongwangSDC.frame)+K(20), SCREEN_WIDTH, K(85))];
        _HomeBtnView.delegate = self;
    }
    return _HomeBtnView;
}
-(SDCycleScrollView *)DongwangSDC{
    if (!_DongwangSDC) {
        _DongwangSDC = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(K(0), K(0), SCREEN_WIDTH-K(0), K(143))];
        _DongwangSDC.delegate = self;
        _DongwangSDC.backgroundColor = [UIColor clearColor];
        _DongwangSDC.currentPageDotImage = [UIImage imageNamed:@"选中_indictor"];
        _DongwangSDC.pageDotImage = [UIImage imageNamed:@"未选中_indictor"];
        
    }
    return _DongwangSDC;
}
- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view{
    return [DongwangbannarCollectionViewCell class];
}
- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view{
    DongwangbannarCollectionViewCell *myCell = (DongwangbannarCollectionViewCell *)cell;
    [myCell.ThubImgView sd_setImageWithURL:[NSURL URLWithString:self.ImgArr[index]]];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    DongwangMofangModel * mofangModle = self.DongwangChunMofangData[section];
    return mofangModle.magicList.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.DongwangChunMofangData.count;
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    MagicList  * listObject = self.DongwangChunMofangData[indexPath.row];
    [self.delegate DongwangHomeHeaderViewWithMofangDidSeltecd:listObject];
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangMofangModel * dongmodle = self.DongwangChunMofangData[indexPath.section];
    MyImgCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyImgCollectionViewCell" forIndexPath:indexPath];
    cell.myimgeView.backgroundColor = [UIColor clearColor];
        MagicList  * listobject  = dongmodle.magicList[indexPath.row];
        [cell.myimgeView sd_setImageWithURL:[NSURL URLWithString:listobject.imageUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            /** 缓存image size */
        [XHWebImageAutoSize storeImageSize:image forURL:[NSURL URLWithString:listobject.imageUrl] completed:^(BOOL result) {
        /** reload  */
        if(result){
        [collectionView  xh_reloadDataForURL:[NSURL URLWithString:listobject.imageUrl]];
        }
        }];
        }];
        return cell;

}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangMofangModel * mofangmodel = self.DongwangChunMofangData[indexPath.section];
    MagicList * listmodel = mofangmodel.magicList[indexPath.row];
//    NSLog(@"个数:%ld",listmodel.countNums);
    //指定了item的宽度
    CGFloat  imgWidth = (SCREEN_WIDTH-30)/listmodel.countNums;
    
    
    
//    NSLog(@"imgWidth=%f SCREEN_WIDTH= %f ",imgWidth,SCREEN_WIDTH);
//    CGSize imgSize = [XHWebImageAutoSize imageSizeFromCacheForURL:[NSURL URLWithString:listmodel.imageUrl]];
    
    CGFloat imgheight =    [XHWebImageAutoSize imageHeightForURL:[NSURL URLWithString:listmodel.imageUrl] layoutWidth:imgWidth estimateHeight:100];
    
//    NSLog(@"图片的高度:%f",imgheight);
//    return CGSizeMake(imgrealWidth, imgheight);
    //控件宽度＊图片高度/图片宽度  =控件需要的高度
    return  CGSizeMake(imgWidth, imgheight);
}
 #pragma mark--DongwangChildHomeBtnsViewDelegate
-(void)DongwangChildHomeBtnsViewCellDidSeltecdWithItemIndex:(NSInteger)itemIndex{
    [self.delegate DongwangHomeHeaderViewWithItmeDidSeltecd:itemIndex];
}
#pragma mark--SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    [self.delegate DongwangHomeHeaderViewWithBanarDidSeltecd:index];
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{

}
-(void)setImgArr:(NSMutableArray *)ImgArr{
    _ImgArr = ImgArr;
    _DongwangSDC.imageURLStringsGroup = [ImgArr copy];
}
-(void)setDongwangMofangData:(NSMutableArray *)DongwangMofangData{
    _DongwangMofangData = DongwangMofangData;
    [_DongwangActityCollectionView reloadData];
    self.DongwangActityCollectionView.size =  self.DongwangActityCollectionView.collectionViewLayout.collectionViewContentSize;
//    self.DongwangActityCollectionView.height =   self.DongwangActityCollectionView.collectionViewLayout.collectionViewContentSize.height;
    self.HeaderViewHeight = CGRectGetMaxY(_DongwangActityCollectionView.frame)+K(15);
}

-(void)setDongwangChunMofangData:(NSMutableArray *)DongwangChunMofangData{
    _DongwangChunMofangData  = DongwangChunMofangData;
    [self DongwangCaculayeCollectionHeight];
}
-(void)DongwangCaculayeCollectionHeight{
    [_DongwangActityCollectionView reloadData];
    self.DongwangActityCollectionView.height =   self.DongwangActityCollectionView.collectionViewLayout.collectionViewContentSize.height;
    NSLog(@"高度：%f",self.DongwangActityCollectionView.height);
    self.HeaderViewHeight = CGRectGetMaxY(_DongwangActityCollectionView.frame)+K(15);
}
#pragma mark--DongwangMofangStyeTwoCollectionViewCellDelegate
-(void)DongwangMofangStyeTwoCollectionViewCellDidSeltecdWithCellIndex:(NSInteger)CellIndex ModelSoureIndex:(NSInteger)SoureIndex{
    
    DongwangMofangModel * mofangModle = self.DongwangMofangData[SoureIndex];
    MagicList * listobject = mofangModle.magicList[CellIndex];
    NSLog(@"%@",listobject.imageUrl);
    [self.delegate DongwangHomeHeaderViewWithMofangDidSeltecd:listobject];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
