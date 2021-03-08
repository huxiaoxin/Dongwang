//
//  DongwangChatListSubTableViewCell.m
//  DongWang
//
//  Created by sycm on 2021/3/1.
//

#import "DongwangChatListSubTableViewCell.h"
#import "DongwangChatPhotoCollectionViewCell.h"
#import "DongwangChatBtn.h"
@interface DongwangChatListSubTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UIView * DongwangContetnView;
@property(nonatomic,strong) UIImageView * DongwangUserImgView;
@property(nonatomic,strong) UILabel * DongwangUserNamelb;
@property(nonatomic,strong) UILabel * DongwangDeslb;
@property(nonatomic,strong) UILabel * DongwangContentlb;
@property(nonatomic,strong) UIButton * DongwangAllbtn;
@property(nonatomic,strong) UICollectionView * DongwangPhotoCollectionView;
@property(nonatomic,strong) DongwangChatBtn * comentBtn;
@property(nonatomic,strong) DongwangChatBtn * ZanBtn;

@end
@implementation DongwangChatListSubTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"#410093"];
        
        UIView * DongwangContetnView = [[UIView alloc]initWithFrame:CGRectMake(RealWidth(10), RealWidth(10), SCREEN_WIDTH-RealWidth(50), RealWidth(350))];
        DongwangContetnView.layer.borderColor = [UIColor colorWithHexString:@"#FF9E67"].CGColor;
        DongwangContetnView.layer.borderWidth = RealWidth(1);
        DongwangContetnView.layer.cornerRadius = RealWidth(5);
        DongwangContetnView.layer.masksToBounds = YES;
        [self.contentView addSubview:DongwangContetnView];
        _DongwangContetnView = DongwangContetnView;
       
        
        [DongwangContetnView addSubview:self.DongwangUserImgView];
        [DongwangContetnView addSubview:self.DongwangUserNamelb];
        [DongwangContetnView addSubview:self.DongwangDeslb];
        [DongwangContetnView addSubview:self.DongwangContentlb];
        [DongwangContetnView addSubview:self.DongwangAllbtn];
        [DongwangContetnView addSubview:self.DongwangPhotoCollectionView];
        [DongwangContetnView addSubview:self.ZanBtn];
        [DongwangContetnView addSubview:self.comentBtn];

        
        
    }
    return self;
}
-(UIImageView *)DongwangUserImgView{
    if (!_DongwangUserImgView) {
        _DongwangUserImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(13), RealWidth(15), RealWidth(35), RealWidth(35))];
        _DongwangUserImgView.backgroundColor = LGDRedColor;
        _DongwangUserImgView.layer.cornerRadius = RealWidth(17.5);
        _DongwangUserImgView.layer.masksToBounds = YES;
    }
    return _DongwangUserImgView;
}
-(UILabel *)DongwangUserNamelb{
    if (!_DongwangUserNamelb) {
        _DongwangUserNamelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_DongwangUserImgView.frame)+RealWidth(10), CGRectGetMinY(_DongwangUserImgView.frame), RealWidth(200), RealWidth(16))];
        _DongwangUserNamelb.textColor =[UIColor whiteColor];
        _DongwangUserNamelb.font = PFR12Font;
        _DongwangUserNamelb.text = @"足球圈";
    }
    return _DongwangUserNamelb;
}
-(UILabel *)DongwangDeslb{
    if (!_DongwangDeslb) {
        _DongwangDeslb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_DongwangUserImgView.frame)+RealWidth(10), CGRectGetMaxY(_DongwangUserNamelb.frame)+RealWidth(4), RealWidth(200), RealWidth(15))];
        _DongwangDeslb.textColor =[UIColor colorWithHexString:@"#DEDEDE"];
        _DongwangDeslb.font = PFR11Font;
        _DongwangDeslb.text = @"关注2w 帖子102";

    }
    return _DongwangDeslb;
}
-(UILabel *)DongwangContentlb{
    if (!_DongwangContentlb) {
        _DongwangContentlb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(13), CGRectGetMaxY(_DongwangUserImgView.frame)+RealWidth(5), SCREEN_WIDTH-RealWidth(50+26), RealWidth(60))];
        _DongwangContentlb.numberOfLines = 0;
        _DongwangContentlb.textColor = [UIColor whiteColor];
        _DongwangContentlb.font = PFR13Font;
        [_DongwangContentlb setText:@"智利国内目前新冠疫情反弹，导致多场智利甲和智利乙比赛被推迟，未来几周时间，全国联赛都可能暂时停止到年智利国内目前新冠疫情反弹，导致多场智利甲和智利乙比赛被推迟，未来几周时间，全国联赛都可能暂时停止到年" lineSpacing:RealWidth(4)];
        _DongwangContentlb.size = [_DongwangContentlb getSpaceLabelHeight:@"智利国内目前新冠疫情反弹，导致多场智利甲和智利乙比赛被推迟，未来几周时间，全国联赛都可能暂时停止到年智利国内目前新冠疫情反弹，导致多场智利甲和智利乙比赛被推迟，未来几周时间，全国联赛都可能暂时停止到年" withFont:PFR13Font withWidth:SCREEN_WIDTH-RealWidth(50+26) lineSpacing:RealWidth(4)];
        
    }
    return _DongwangContentlb;
}
-(UIButton *)DongwangAllbtn{
    if (!_DongwangAllbtn) {
        
        _DongwangAllbtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-RealWidth(50+26)-RealWidth(40), CGRectGetMaxY(_DongwangContentlb.frame)+RealWidth(5), RealWidth(50), RealWidth(15))];
        _DongwangAllbtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        NSMutableAttributedString* tncString = [[NSMutableAttributedString alloc] initWithString:@"全文"];
        [tncString addAttribute:NSUnderlineStyleAttributeName
                          value:@(NSUnderlineStyleSingle)
                          range:(NSRange){0,[tncString length]}];
        [tncString addAttribute:NSFontAttributeName value:PFR13Font range:NSMakeRange(0, tncString.length)];
        //此时如果设置字体颜色要这样
        [tncString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#FFE13E"]  range:NSMakeRange(0,[tncString length])];
        //设置下划线颜色...
        [tncString addAttribute:NSUnderlineColorAttributeName value:[UIColor colorWithHexString:@"#FFE13E"] range:(NSRange){0,[tncString length]}];
        [_DongwangAllbtn setAttributedTitle:tncString forState:UIControlStateNormal];
    }
    return _DongwangAllbtn;
}
-(UICollectionView *)DongwangPhotoCollectionView{
    if (!_DongwangPhotoCollectionView) {
        UICollectionViewFlowLayout * DongwnagLayout = [[UICollectionViewFlowLayout alloc]init];
        DongwnagLayout.sectionInset = UIEdgeInsetsMake(0, RealWidth(10), 0, RealWidth(10));
        DongwnagLayout.minimumLineSpacing = RealWidth(10);
        DongwnagLayout.minimumInteritemSpacing = RealWidth(10);
        DongwnagLayout.itemSize = CGSizeMake(RealWidth(95), RealWidth(95));
        _DongwangPhotoCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_DongwangAllbtn.frame)+RealWidth(20), SCREEN_WIDTH-RealWidth(50), RealWidth(100)) collectionViewLayout:DongwnagLayout];
        _DongwangPhotoCollectionView.delegate = self;
        _DongwangPhotoCollectionView.dataSource = self;
        _DongwangPhotoCollectionView.showsVerticalScrollIndicator = NO;
        _DongwangPhotoCollectionView.showsHorizontalScrollIndicator = NO;
        _DongwangPhotoCollectionView.backgroundColor = [UIColor clearColor];
        [_DongwangPhotoCollectionView registerClass:[DongwangChatPhotoCollectionViewCell class] forCellWithReuseIdentifier:@"DongwangChatPhotoCollectionViewCell"];
    }
    return _DongwangPhotoCollectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangChatPhotoCollectionViewCell * PhotoCell =[collectionView dequeueReusableCellWithReuseIdentifier:@"DongwangChatPhotoCollectionViewCell" forIndexPath:indexPath];
    return PhotoCell;
}
- (DongwangChatBtn *)ZanBtn{
    if (!_ZanBtn) {
        _ZanBtn = [[DongwangChatBtn alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-RealWidth(50+60), CGRectGetMaxY(_DongwangPhotoCollectionView.frame)+RealWidth(15), RealWidth(60), RealWidth(20))];
        _ZanBtn.leftImgView.image = [UIImage imageNamed:@"zan_btn"];
        _ZanBtn.rightlb.text = @"12";
    }
    return _ZanBtn;
}
- (DongwangChatBtn *)comentBtn{
    if (!_comentBtn) {
        _comentBtn =[[DongwangChatBtn alloc]initWithFrame:CGRectMake(CGRectGetMinX(_ZanBtn.frame)-RealWidth(70), CGRectGetMaxY(_DongwangPhotoCollectionView.frame)+RealWidth(15), RealWidth(60), RealWidth(20))];
        _comentBtn.leftImgView.image =[UIImage imageNamed:@"coment_btn"];
        _comentBtn.rightlb.text = @"12";
    }
    return _comentBtn;
}
@end

