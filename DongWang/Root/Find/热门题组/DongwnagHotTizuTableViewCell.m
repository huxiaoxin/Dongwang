//
//  DongwnagHotTizuTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/25.
//

#import "DongwnagHotTizuTableViewCell.h"
@interface DongwnagHotTizuTableViewCell ()
{
    UIImageView * _DongwangThubImgView;
    UILabel * _DongwangTitle;
    UILabel * _DongwangDetial;
    UIImageView * _DongwangThubTagImgView;
}
@end
@implementation DongwnagHotTizuTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = LGDMianColor;
        UIView * DongwangContentView = [[UIView alloc]initWithFrame:CGRectMake(K(15), 0, SCREEN_WIDTH-K(30), K(129.5))];
        DongwangContentView.backgroundColor = [UIColor colorWithHexString:@"#453593"];
        [self.contentView addSubview:DongwangContentView];
        _DongwangContentView = DongwangContentView;
        
        
        UIView * dongwangline = [[UIView alloc]initWithFrame:CGRectMake(0, K(128.5), K(345), K(1))];
        dongwangline.backgroundColor = LGDMianColor;
        [DongwangContentView addSubview:dongwangline];


        UIImageView * DongwangThubImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(12), K(13.5), K(154), K(104))];
        DongwangThubImgView.backgroundColor = [UIColor clearColor];
        DongwangThubImgView.layer.cornerRadius = RealWidth(5);
        DongwangThubImgView.layer.masksToBounds = YES;
        DongwangThubImgView.contentMode = UIViewContentModeScaleAspectFill;
        [DongwangContentView addSubview:DongwangThubImgView];
        _DongwangThubImgView = DongwangThubImgView;

        UIImageView * DongwangThubTagImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, K(49), K(35))];
        DongwangThubTagImgView.hidden = YES;
        DongwangThubTagImgView.image = [UIImage imageNamed:@"新"];
        DongwangThubTagImgView.backgroundColor = [UIColor clearColor];
        [DongwangThubImgView addSubview:DongwangThubTagImgView];
        _DongwangThubTagImgView = DongwangThubTagImgView;

        UILabel * DongwangTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangThubImgView.frame)+K(11), K(13.5), K(200), K(15))];
        DongwangTitle.font = KBlFont(font(15));
        DongwangTitle.text = @"题组名称";
        DongwangTitle.textColor = [UIColor colorWithHexString:@"#FFDE47"];
        [DongwangContentView addSubview:DongwangTitle];
        _DongwangTitle = DongwangTitle;


        UILabel * DongwangDetial = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangThubImgView.frame)+K(11), K(12)+CGRectGetMaxY(DongwangTitle.frame), K(156), K(45))];
        DongwangDetial.numberOfLines = 0;
        DongwangDetial.font = KSysFont(font(13));
        DongwangDetial.text = @"题组介绍：元代的戏剧，有杂剧和南戏两种类型。世所谓元曲……";
        DongwangDetial.textColor = [UIColor whiteColor];
        [DongwangContentView addSubview:DongwangDetial];
        _DongwangDetial = DongwangDetial;


        UIButton * DongwangansureBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangThubImgView.frame)+K(95), CGRectGetMaxY(DongwangDetial.frame)+K(13), K(71), K(20))];
        DongwangansureBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [DongwangansureBtn addTarget:self action:@selector(DongwangansureBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [DongwangansureBtn setBackgroundImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
        DongwangansureBtn.titleLabel.font = KSysFont(font(13));
        [DongwangansureBtn setTitle:@"立即答题" forState:UIControlStateNormal];
       // [DongwangContentView addSubview:DongwangansureBtn];
      
        
    }
    return self;
}
-(void)setTuziModel:(DongwangHotTizuModel *)tuziModel{
    _tuziModel = tuziModel;
    [_DongwangThubImgView sd_setImageWithURL:[NSURL URLWithString:tuziModel.picture] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self->_DongwangThubTagImgView.hidden = ![tuziModel.DongwangnewGroup integerValue];
    }];
    _DongwangTitle.text = tuziModel.name;
    _DongwangDetial.text = tuziModel.Dongwangdescription;   
    
}
-(void)DongwangansureBtnClick{
    [self.delegate DongwnagHotTizuTableViewCellBtnClickWithCellIndex:self.tag];
}
@end
