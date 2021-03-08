//
//  DongwangSignQiandaoHeaderView.m
//  DongWang
//
//  Created by codehzx on 2020/11/13.
//

#import "DongwangSignQiandaoHeaderView.h"
#import "DongwangSigningQiandaoCollectionViewCell.h"
#import "DongwangSigninQiandaoFrameModel.h"
@interface DongwangSignQiandaoHeaderView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UIImageView * DongwanguserImgView;
@property(nonatomic,strong) UILabel * DongwangToplb;
@property(nonatomic,strong) UILabel * DongwangBtomlb;
@property(nonatomic,strong) UICollectionView * DongwangCollectoinView;
@property(nonatomic,strong) UILabel *  DongwangMsglb;
@property(nonatomic,strong) UIView * DongwangContentView ;
@property(nonatomic,strong) NSMutableArray * DonwgangDataArr;
@property(nonatomic,strong) UIButton * AddBtn;
@end
@implementation DongwangSignQiandaoHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView * DongwangBjImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(251)+StatuBar_Height)];
        DongwangBjImgView.image = [UIImage imageNamed:@"签到背景"];
        [self addSubview:DongwangBjImgView];
        
        [self addSubview:self.DongwanguserImgView];
        [self addSubview:self.DongwangToplb];
        [self addSubview:self.DongwangBtomlb];
        
        
        
        UIImageView * DongwangContentView = [[UIImageView alloc]initWithFrame:CGRectMake(K(10), K(141)+StatuBar_Height, SCREEN_WIDTH-K(10), K(316))];
        DongwangContentView.userInteractionEnabled = YES;
       // DongwangContentView.backgroundColor = [UIColor colorWithHexString:@"#876BBC"];
//        DongwangContentView.layer.masksToBounds = YES;
//        DongwangContentView.userInteractionEnabled = YES;
        DongwangContentView.image = [UIImage imageNamed:@"签到cell背景"];
        [self addSubview:DongwangContentView];
        _DongwangContentView = DongwangContentView;
        
        
//        DongwangContentView.layer.shadowColor = [UIColor colorWithHexString:@"#40FF63"].CGColor;//阴影颜色
//        DongwangContentView.layer.shadowOffset = CGSizeMake(5, 5);//偏移距离
//        DongwangContentView.layer.shadowOpacity = 1;//不透明度
//        DongwangContentView.layer.shadowRadius = 5.0;//半径
        
        UILabel *  DongwangMsglb = [[UILabel alloc]initWithFrame:CGRectMake(K(11), K(18), K(200), K(21))];
        DongwangMsglb.textColor =  [UIColor whiteColor];
        DongwangMsglb.font = KBlFont(font(15));
        DongwangMsglb.text = @"连续签到领好礼";
        [DongwangContentView addSubview:DongwangMsglb];
        _DongwangMsglb = DongwangMsglb;
        [DongwangContentView addSubview:self.DongwangCollectoinView];
        
        UIButton * AddBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(56.5), K(257), CGRectGetWidth(DongwangContentView.frame)-K(56.5)*2, K(39))];
        [AddBtn setBackgroundImage:[UIImage imageNamed:@"立即签到"] forState:UIControlStateNormal];
        AddBtn.layer.cornerRadius = K(19.5);
        AddBtn.layer.masksToBounds = YES;
        [AddBtn addTarget:self action:@selector(AddBtnClick) forControlEvents:UIControlEventTouchUpInside];
        AddBtn.titleLabel.font = KBlFont(font(15));
        [AddBtn setTitle:@"立即签到" forState:UIControlStateNormal];
        AddBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [AddBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        AddBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [DongwangContentView addSubview:AddBtn];
        _AddBtn = AddBtn;
        
        
        self.QianheaderHeight = CGRectGetMaxY(DongwangContentView.frame)+K(14);
        
        
        
    }
    return self;
}
-(void)AddBtnClick{
    [self.delegate DongwangSignQiandaoHeaderViewDidSeltecdQiandaoActoin];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _HeaderDataArr.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangSigniIdentifer = @"DongwangSigningQiandaoCollectionViewCell";
    DongwangSigningQiandaoCollectionViewCell * DongwnagCell = [collectionView dequeueReusableCellWithReuseIdentifier:DongwangSigniIdentifer forIndexPath:indexPath];
    DongwnagCell.dongwnagFrameModel = _HeaderDataArr[indexPath.row];
    return DongwnagCell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangSigninQiandaoFrameModel * dongwangFraModel = _HeaderDataArr[indexPath.row];
    DongwangSignQiandaoModel * qiandoaModle = dongwangFraModel.qiandaoModel;
    if ([qiandoaModle.todayStatus integerValue] == 2) {
        [self AddBtnClick];
    }
    
}
-(void)setHeaderDataArr:(NSMutableArray *)HeaderDataArr{
    _HeaderDataArr = HeaderDataArr;
    [_DongwangCollectoinView reloadData];
}
-(void)setHeaderDic:(NSDictionary *)headerDic{
    _headerDic = headerDic;
    _DongwangToplb.text = [[headerDic objectForKey:@"data"] objectForKey:@"signTotal"];
    //
    _DongwangBtomlb.text = [[headerDic objectForKey:@"data"] objectForKey:@"signTips"];
    NSString  * signStatus  =[[headerDic objectForKey:@"data"] objectForKey:@"signStatus"];
    if ([signStatus integerValue] == 1 ){
        //今日已签到
        [_AddBtn setTitle:@"今日已签到,明日再来" forState:UIControlStateNormal];
        _AddBtn.enabled = NO;
        [_AddBtn setBackgroundColor:[UIColor colorWithHexString:@"#DEDEDE"]];
        [_AddBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [_AddBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];

    }else{
        
        [_AddBtn setTitle:@"立即签到" forState:UIControlStateNormal];
        [_AddBtn setBackgroundImage:[UIImage imageNamed:@"立即签到"] forState:UIControlStateNormal];
        [_AddBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _AddBtn.enabled = YES;
    }
}
-(UICollectionView *)DongwangCollectoinView{
    if (!_DongwangCollectoinView) {
        UICollectionViewFlowLayout * Dongwanglayout = [[UICollectionViewFlowLayout alloc]init];
        Dongwanglayout.sectionInset =  UIEdgeInsetsMake(0, K(10), 0,  K(10));
        
        Dongwanglayout.minimumLineSpacing = K(10);
        Dongwanglayout.minimumInteritemSpacing =  K(12);
        _DongwangCollectoinView = [[ UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_DongwangMsglb.frame)+K(10), CGRectGetWidth(_DongwangContentView.frame)-RealWidth(10), CGRectGetHeight(_DongwangContentView.frame)-CGRectGetMaxY(_DongwangMsglb.frame)-RealWidth(10)) collectionViewLayout:Dongwanglayout];
        _DongwangCollectoinView.delegate = self;
        _DongwangCollectoinView.dataSource = self;
        _DongwangCollectoinView.showsVerticalScrollIndicator = NO;
        _DongwangCollectoinView.showsHorizontalScrollIndicator = NO;
        _DongwangCollectoinView.backgroundColor = [UIColor clearColor];
        [_DongwangCollectoinView registerClass:[DongwangSigningQiandaoCollectionViewCell class] forCellWithReuseIdentifier:@"DongwangSigningQiandaoCollectionViewCell"];
    }
    return _DongwangCollectoinView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangSigninQiandaoFrameModel * mdoel = self.HeaderDataArr[indexPath.row];
    return mdoel.ViewFrame.size;
}
-(UILabel *)DongwangToplb{
    if (!_DongwangToplb) {
        _DongwangToplb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_DongwanguserImgView.frame)+K(12), K(75)+StatuBar_Height, K(250), K(21))];
        _DongwangToplb.textColor = [UIColor whiteColor];
        _DongwangToplb.font = KBlFont(font(15));
//        _DongwangToplb.text = @"已连签到1天";
    }
    return _DongwangToplb;
}
-(UILabel *)DongwangBtomlb{
    if (!_DongwangBtomlb) {
        _DongwangBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_DongwanguserImgView.frame)+K(12), CGRectGetMaxY(_DongwangToplb.frame)+K(9), K(250), K(18.5))];
        _DongwangBtomlb.textColor = [UIColor whiteColor];
        _DongwangBtomlb.font = KSysFont(font(13));
//        _DongwangBtomlb.text = @"明日签到可获得2积分";
    }
    return _DongwangBtomlb;
}
-(UIImageView *)DongwanguserImgView{
    if (!_DongwanguserImgView) {
        _DongwanguserImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(15), K(70.5)+StatuBar_Height, K(60), K(60))];
        _DongwanguserImgView.layer.cornerRadius = K(30);
        _DongwanguserImgView.layer.masksToBounds = YES;        
        NSString  * headeID = [NSString stringWithFormat:@"%@",[UserManager userInfo].headId];
        _DongwanguserImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"头像%@",headeID.length == 0 ? @"0" :headeID]];
    }
    return _DongwanguserImgView;
}
@end
