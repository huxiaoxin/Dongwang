//
//  DongwangCireSubCenterlistTableViewCell.m
//  DongWang
//
//  Created by sycm on 2021/3/9.
//

#import "DongwangCireSubCenterlistTableViewCell.h"
#import "DongwangCenterListToolView.h"
#import "DongwangChatPhotoCollectionViewCell.h"
#import "DongwangCenterListToolView.h"
@interface DongwangCireSubCenterlistTableViewCell  ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UIView * backBjView;
@property(nonatomic,strong) UIImageView * userIconImgView;
@property(nonatomic,strong) UILabel * userNameLb;
@property(nonatomic,strong) UILabel * topTitle;
@property(nonatomic,strong) UILabel * conTentlb;
@property(nonatomic,strong) UICollectionView * DongwangPhotoCollectionView;
@property(nonatomic,strong) DongwangCenterListToolView * toolView;
@end
@implementation DongwangCireSubCenterlistTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        [self addSubview:self.backBjView];
        [_backBjView addSubview:self.userIconImgView];
        [_backBjView addSubview:self.userNameLb];
        [_backBjView addSubview:self.topTitle];
        [_backBjView addSubview:self.conTentlb];
        [_backBjView addSubview:self.DongwangPhotoCollectionView];
        [_backBjView addSubview:self.toolView];
    }
    return self;
}
-(UIView *)backBjView{
    if (!_backBjView) {
        _backBjView = [[UIView alloc]initWithFrame:CGRectMake(RealWidth(5), RealWidth(10), SCREEN_WIDTH-RealWidth(30), RealWidth(60+220))];
        _backBjView.layer.borderColor = [UIColor colorWithHexString:@"#FF9E67"].CGColor;
        _backBjView.layer.borderWidth= RealWidth(1);
        _backBjView.layer.cornerRadius = RealWidth(5);
        _backBjView.layer.masksToBounds =YES;
    }
    return _backBjView;
}
-(UIImageView *)userIconImgView{
    if (!_userIconImgView) {
        _userIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(16), RealWidth(15), RealWidth(35), RealWidth(35))];
        _userIconImgView.layer.cornerRadius = RealWidth(17.5);
        _userIconImgView.layer.masksToBounds = YES;
        _userIconImgView.backgroundColor = [UIColor redColor];
    }
    return _userIconImgView;
}
-(UILabel *)userNameLb{
    if (!_userNameLb) {
        _userNameLb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_userIconImgView.frame)+RealWidth(10), CGRectGetMidY(_userIconImgView.frame)-RealWidth(8), RealWidth(200), RealWidth(16))];
        _userNameLb.textColor = [UIColor whiteColor];
        _userNameLb.font = PFR12Font;
        _userNameLb.text = @"-迷迭香-";
    }
    return _userNameLb;
}
-(UILabel *)topTitle{
    if (!_topTitle) {
        _topTitle = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(16), CGRectGetMaxY(_userIconImgView.frame)+RealWidth(10), SCREEN_WIDTH-RealWidth(30), RealWidth(20))];
        _topTitle.textColor = [UIColor whiteColor];
        _topTitle.font = PFR13Font;
        _topTitle.text = @"直播贴";
    }
    return _topTitle;
}
-(UILabel *)conTentlb{
    if (!_conTentlb) {
        _conTentlb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(16), CGRectGetMaxY(_topTitle.frame)+RealWidth(10), SCREEN_WIDTH-RealWidth(30), RealWidth(20))];
        _conTentlb.textColor = [UIColor whiteColor];
        _conTentlb.font = PFR13Font;
        _conTentlb.text = @"倾家荡产大战大白虎，快来氵";
    }
    return _conTentlb;
}
-(UICollectionView *)DongwangPhotoCollectionView{
    if (!_DongwangPhotoCollectionView) {
        UICollectionViewFlowLayout * DongwnagLayout = [[UICollectionViewFlowLayout alloc]init];
        DongwnagLayout.sectionInset = UIEdgeInsetsMake(0, RealWidth(10), 0, RealWidth(10));
        DongwnagLayout.minimumLineSpacing = RealWidth(10);
        DongwnagLayout.minimumInteritemSpacing = RealWidth(10);
        DongwnagLayout.itemSize = CGSizeMake(RealWidth(95), RealWidth(95));
        _DongwangPhotoCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_conTentlb.frame)+RealWidth(10), SCREEN_WIDTH-RealWidth(50), RealWidth(100)) collectionViewLayout:DongwnagLayout];
        _DongwangPhotoCollectionView.delegate = self;
        _DongwangPhotoCollectionView.dataSource = self;
        _DongwangPhotoCollectionView.showsVerticalScrollIndicator = NO;
        _DongwangPhotoCollectionView.showsHorizontalScrollIndicator = NO;
        _DongwangPhotoCollectionView.backgroundColor = [UIColor clearColor];
        [_DongwangPhotoCollectionView registerClass:[DongwangChatPhotoCollectionViewCell class] forCellWithReuseIdentifier:@"DongwangChatPhotoCollectionViewCell"];
    }
    return _DongwangPhotoCollectionView;
}
-(DongwangCenterListToolView *)toolView{
    if (!_toolView) {
        _toolView  = [[DongwangCenterListToolView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_DongwangPhotoCollectionView.frame)+RealWidth(10), SCREEN_WIDTH, RealWidth(20))];
        
    }
    return _toolView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangChatPhotoCollectionViewCell * PhotoCell =[collectionView dequeueReusableCellWithReuseIdentifier:@"DongwangChatPhotoCollectionViewCell" forIndexPath:indexPath];
    return PhotoCell;
}

@end
