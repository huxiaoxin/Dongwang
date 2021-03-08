//
//  DongwangProTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import "DongwangProTableViewCell.h"
@interface DongwangProTableViewCell ()
{
    UIImageView * _DongwangIconImgView;
    UILabel * _DongwangTypelb;
    UILabel * _DongwangTpislb;
    UILabel * _DongwangNumslb;
}
@end
@implementation DongwangProTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        UIImageView * DongwangContentView = [[UIImageView alloc]initWithFrame:CGRectMake(K(12), 0, SCREEN_WIDTH-K(24), K(110))];
        DongwangContentView.userInteractionEnabled = YES;
        DongwangContentView.image = [UIImage imageNamed:@"wodejiangpin"];
        DongwangContentView.backgroundColor = [UIColor clearColor];
//        DongwangContentView.layer.cornerRadius = K(5);
//        DongwangContentView.layer.masksToBounds = YES;
        [self.contentView addSubview:DongwangContentView];
        
        UIImageView * DongwangIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(23), K(28), K(43), K(48))];
        DongwangIconImgView.image = [UIImage imageNamed:@"免答卡"];
        [DongwangContentView addSubview:DongwangIconImgView];
        _DongwangIconImgView = DongwangIconImgView;
        
        
        UILabel * DongwangTypelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangIconImgView.frame)+K(14.5), K(29.5), K(200), K(21))];
        DongwangTypelb.textColor = [UIColor colorWithHexString:@"#333330"];
        DongwangTypelb.font = KBlFont(font(15));
        DongwangTypelb.text = @"万能卡";
        [DongwangContentView addSubview:DongwangTypelb];
        _DongwangTypelb = DongwangTypelb;
        
        
        UILabel * DongwangTpislb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangIconImgView.frame)+K(14.5), K(56.5), K(250), K(15))];
        DongwangTpislb.textColor = [UIColor colorWithHexString:@"#999999"];
        DongwangTpislb.font = KSysFont(font(11));
//        DongwangTpislb.backgroundColor = LGDMianColor;
        DongwangTpislb.text = @"还没想好咋用，可能要兑换吧～";
        [DongwangContentView addSubview:DongwangTpislb];
        _DongwangTpislb = DongwangTpislb;
        
        //边边
        
        UIImageView * DongwangRightIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangContentView.frame)-K(65+15), -K(0), K(69.5), K(66))];
        DongwangRightIconImgView.image = [UIImage imageNamed:@"三角形"];
        [DongwangContentView addSubview:DongwangRightIconImgView];
        
        UILabel * DongwangNumslb = [[UILabel alloc]initWithFrame:CGRectMake(K(15), K(7), CGRectGetWidth(DongwangRightIconImgView.frame)-K(15), K(24))];
        DongwangNumslb.textColor = [UIColor whiteColor];
        DongwangNumslb.font = KSysFont(font(15));
        DongwangNumslb.text = @"X2";
        DongwangNumslb.textAlignment = NSTextAlignmentCenter;
        [DongwangRightIconImgView addSubview:DongwangNumslb];
//        DongwangNumslb.backgroundColor = LGDRedColor;
        _DongwangNumslb =DongwangNumslb;
        
        UIButton * DongwangFindBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangContentView.frame)-K(26.5+65), K(36.5), K(65), K(28))];
        DongwangFindBtn.titleLabel.font= KBlFont(font(11));
        [DongwangFindBtn setTitle:@"去兑换" forState:UIControlStateNormal];
        DongwangFindBtn.adjustsImageWhenHighlighted = NO;
        [DongwangFindBtn setBackgroundImage:[UIImage imageNamed:@"蒙版"] forState:UIControlStateNormal];
//        [DongwangContentView addSubview:DongwangFindBtn];

        
            
    }
    return self;
}
-(void)setDaojuModel:(DongwangDaojuModel *)daojuModel{
    _daojuModel = daojuModel;
    [_DongwangIconImgView sd_setImageWithURL:[NSURL URLWithString:daojuModel.logo]];
    _DongwangTypelb.text = daojuModel.name;
    _DongwangTpislb.text = daojuModel.content;
    _DongwangNumslb.text = [NSString stringWithFormat:@"%@",daojuModel.num];
}
@end
