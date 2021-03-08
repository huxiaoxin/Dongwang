//
//  DongwangMallSectionheaderView.m
//  DongWang
//
//  Created by codehzx on 2021/1/6.
//

#import "DongwangMallSectionheaderView.h"
#import "DongwangMallMsgScrollView.h"
#import "MyImgCollectionViewCell.h"
#import <XHWebImageAutoSize.h>
#import "DongwangMofangModel.h"
@interface DongwangMallSectionheaderView ()<UICollectionViewDelegate,UICollectionViewDataSource,SDCycleScrollViewDelegate>
@property(nonatomic,strong) DongwangMallMsgScrollView * MsgScrollView;
@property(nonatomic,strong) UICollectionView * DongwangActityCollectionView;
@property(nonatomic,strong) UIButton * msgbtn;
@end
@implementation DongwangMallSectionheaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.SDCView];
        [self addSubview:self.msgbtn];
        [self addSubview:self.MsgScrollView];
        [self addSubview:self.DongwangActityCollectionView];
        
    }
    return self;
}
-(void)DongwangMsgbtnClick{
    [self.delegate DongwangMallSectionheaderViewMsgAction];
}
-(UIButton *)msgbtn{
    if (!_msgbtn) {
        _msgbtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-RealWidth(33), RealWidth(15), RealWidth(23), RealWidth(28))];
        [_msgbtn setBackgroundImage:[UIImage imageNamed:@"msgIcon"] forState:UIControlStateNormal];
        _msgbtn.adjustsImageWhenHighlighted = NO;
        [_msgbtn addTarget:self action:@selector(DongwangMsgbtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_msgbtn setEnlargeEdgeWithTop:RealWidth(15) right:RealWidth(15) bottom:RealWidth(15) left:RealWidth(15)];
    }
    return _msgbtn;
}
-(UICollectionView *)DongwangActityCollectionView{
    if (!_DongwangActityCollectionView) {
    UICollectionViewFlowLayout * DongwangActiytLayout = [[UICollectionViewFlowLayout alloc]init];
    DongwangActiytLayout.sectionInset =  UIEdgeInsetsMake(0, RealWidth(10), 0, RealWidth(10));
    DongwangActiytLayout.minimumLineSpacing = 0;
    DongwangActiytLayout.minimumInteritemSpacing = 0;
    _DongwangActityCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_MsgScrollView.frame)+RealWidth(0), SCREEN_WIDTH-0, 0) collectionViewLayout:DongwangActiytLayout];
    _DongwangActityCollectionView.delegate = self;
    _DongwangActityCollectionView.dataSource =self;
    _DongwangActityCollectionView.showsVerticalScrollIndicator = NO;
    _DongwangActityCollectionView.showsHorizontalScrollIndicator = NO;
    _DongwangActityCollectionView.backgroundColor = [UIColor clearColor];
    [_DongwangActityCollectionView registerClass:[MyImgCollectionViewCell class] forCellWithReuseIdentifier:@"MyImgCollectionViewCell"];
        
    }
    return _DongwangActityCollectionView;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return  CGSizeMake(0, 0);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    DongwangMofangModel * mofangModle = _mofangDataArr[section];
    return mofangModle.magicList.count;

}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return _mofangDataArr.count;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate DongwangMallSectionheaderViewDidSeltecdWithIndexPath:indexPath];
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangMofangModel * dongmodle = self.mofangDataArr[indexPath.section];
    MyImgCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyImgCollectionViewCell" forIndexPath:indexPath];
    cell.myimgeView.backgroundColor = [UIColor clearColor];
    MagicList  * listobject  = dongmodle.magicList[indexPath.row];
    [cell.myimgeView sd_setImageWithURL:[NSURL URLWithString:listobject.imageUrl] placeholderImage:[UIImage imageNamed:@"zw01"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        /** 缓存image size */
    [XHWebImageAutoSize storeImageSize:image forURL:[NSURL URLWithString:listobject.imageUrl] completed:^(BOOL result) {
    /** reload  */
    if(result)  [collectionView  xh_reloadDataForURL:[NSURL URLWithString:listobject.imageUrl]];
    }];
    }];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangMofangModel * mofangmodel = self.mofangDataArr[indexPath.section];
    MagicList * listmodel = mofangmodel.magicList[indexPath.row];
    //指定了item的宽度
    CGFloat  imgWidth = (SCREEN_WIDTH-RealWidth(20))/listmodel.countNums;
    CGFloat imgheight =     [XHWebImageAutoSize imageHeightForURL:[NSURL URLWithString:listmodel.imageUrl] layoutWidth:imgWidth estimateHeight:RealWidth(150)];
    //控件宽度＊图片高度/图片宽度  =控件需要的高度
    return  CGSizeMake(imgWidth, imgheight);
}

-(void)setMofangDataArr:(NSMutableArray *)mofangDataArr{
    _mofangDataArr = mofangDataArr;
    [_DongwangActityCollectionView reloadData];
    _DongwangActityCollectionView.size = _DongwangActityCollectionView.collectionViewLayout.collectionViewContentSize;
    CGFloat SectionHeight  = CGRectGetMaxY(_DongwangActityCollectionView.frame)+RealWidth(10);
    if (self.HeaderHeight != nil) {
        self.HeaderHeight(SectionHeight);
    }
}
-(void)setImgArr:(NSMutableArray *)ImgArr{
    _ImgArr = ImgArr;
    
    _SDCView.imageURLStringsGroup =  [ImgArr copy];
}
-(void)setMsgArr:(NSMutableArray *)MsgArr{
    _MsgArr  = MsgArr;
    _MsgScrollView.MsgArr = MsgArr;
}
-(DongwangMallMsgScrollView *)MsgScrollView{
    if (!_MsgScrollView) {
_MsgScrollView = [[DongwangMallMsgScrollView alloc]initWithFrame:CGRectMake(RealWidth(10), CGRectGetMaxY(_SDCView.frame)+RealWidth(10), SCREEN_WIDTH-RealWidth(20), RealWidth(40))];
        _MsgScrollView.layer.cornerRadius = RealWidth(5);
        _MsgScrollView.layer.masksToBounds = YES;
    }
    return _MsgScrollView;
}
-(SDCycleScrollView *)SDCView{
    if (!_SDCView) {
        _SDCView = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RealWidth(255))];
        _SDCView.backgroundColor = [UIColor clearColor];
//        _SDCView.imageURLStringsGroup = @[@"bannaremty",@"bannaremty"];
        _SDCView.delegate  =self;
    }
    return _SDCView;
}
#pragma mark--SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    [self.delegate DongwangMallSectionheaderViewDidSeltecdBannarWithIndex:index];
}
@end
