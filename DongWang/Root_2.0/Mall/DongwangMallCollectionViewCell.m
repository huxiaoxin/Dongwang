//
//  DongwangMallCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2021/1/6.
//

#import "DongwangMallCollectionViewCell.h"
@interface DongwangMallCollectionViewCell ()
{
    UIImageView * _DonwgangQuestionImgView;
    UILabel * _DongwangQuestionTitle;
    UILabel * _DongwangDesclb;
    UIImageView * _DongwangBjImgView;
    UILabel * _DongwangNumslb;
    UILabel * _DongwangToplb;
}
@end
@implementation DongwangMallCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView * DongwangBjImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, RealWidth(156), RealWidth(229))];
        DongwangBjImgView.image = [UIImage imageNamed:@"cellback"];
        DongwangBjImgView.userInteractionEnabled = YES;
        DongwangBjImgView.layer.cornerRadius = RealWidth(5);
        DongwangBjImgView.layer.borderColor = [UIColor colorWithHexString:@"#E26E2B"].CGColor;
        DongwangBjImgView.layer.borderWidth = RealWidth(1);
        [self addSubview:DongwangBjImgView];
        _DongwangBjImgView = DongwangBjImgView;
        
        DongwangBjImgView.layer.shadowColor = [UIColor colorWithHexString:@"#40CAFF"].CGColor;//阴影颜色
        DongwangBjImgView.layer.shadowOffset = CGSizeMake(3, 3);//偏移距离
        DongwangBjImgView.layer.shadowOpacity = 1;//不透明度
        DongwangBjImgView.layer.shadowRadius = 3.0;//半径

        
        
        UIImageView * DongwangjianbianImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(20), RealWidth(11), RealWidth(116), RealWidth(116))];
        DongwangjianbianImgView.image = [UIImage imageNamed:@"外边框"];
        [DongwangBjImgView addSubview:DongwangjianbianImgView];
        
        
        UIImageView * DonwgangQuestionImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(22), RealWidth(13), RealWidth(112), RealWidth(112))];
        DonwgangQuestionImgView.image = [UIImage imageNamed:@"beijintu"];
        DonwgangQuestionImgView.layer.cornerRadius = RealWidth(3);
        DonwgangQuestionImgView.layer.masksToBounds = YES;
        DonwgangQuestionImgView.contentMode = UIViewContentModeScaleAspectFill;
        [DongwangBjImgView addSubview:DonwgangQuestionImgView];
        _DonwgangQuestionImgView = DonwgangQuestionImgView;
        
        
        UILabel * DongwangToplb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(15), CGRectGetMaxY(DonwgangQuestionImgView.frame)+RealWidth(10), RealWidth(28), RealWidth(14))];
        DongwangToplb.text = @"推荐";
        DongwangToplb.font = PFR11Font;
        DongwangToplb.textAlignment = NSTextAlignmentCenter;
        DongwangToplb.textColor = [UIColor whiteColor];
        [DongwangToplb setBackgroundColor:[UIColor colorWithHexString:@"#CC4C91"]];
        [DongwangBjImgView addSubview:DongwangToplb];
        _DongwangToplb = DongwangToplb;
        
        
        UILabel * DongwangQuestionTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DonwgangQuestionImgView.frame)+RealWidth(7), CGRectGetWidth(DongwangBjImgView.frame), RealWidth(21))];
        DongwangQuestionTitle.textAlignment = NSTextAlignmentCenter;
        DongwangQuestionTitle.textColor = [UIColor colorWithHexString:@"#FFE269"];
        DongwangQuestionTitle.font = PFS15Font;
        DongwangQuestionTitle.text = @"「每日一习话」";
        [DongwangBjImgView addSubview:DongwangQuestionTitle];
        _DongwangQuestionTitle = DongwangQuestionTitle;
        
        
        
        
        
        UILabel * DongwangDesclb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(9), CGRectGetMaxY(DongwangQuestionTitle.frame)+RealWidth(5), CGRectGetWidth(DongwangBjImgView.frame)-RealWidth(18), RealWidth(40))];
//        DongwangDesclb.backgroundColor = [UIColor redColor];
        DongwangDesclb.textColor = [UIColor whiteColor];
        DongwangDesclb.font = PFR12Font;
//        DongwangDesclb.textAlignment = NSTextAlignmentLeft;
        DongwangDesclb.numberOfLines = 2;
//        DongwangDesclb.backgroundColor = [UIColor redColor];
        [DongwangBjImgView addSubview:DongwangDesclb];
        _DongwangDesclb = DongwangDesclb;
        
        
        
        UIImageView * DongwanghuoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(9), CGRectGetMaxY(DongwangDesclb.frame)+RealWidth(5), RealWidth(17), RealWidth(17))];
        DongwanghuoImgView.image = [UIImage imageNamed:@"huo"];
        [DongwangBjImgView addSubview:DongwanghuoImgView];

        
        UILabel * DongwangNumslb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwanghuoImgView.frame)+RealWidth(5), CGRectGetMidY(DongwanghuoImgView.frame)-RealWidth(7), RealWidth(120), RealWidth(14))];
        DongwangNumslb.textColor = [UIColor colorWithHexString:@"#A4A4A4"];
        DongwangNumslb.font = PFR10Font;
        DongwangNumslb.text = @"3w人答过";
        [DongwangBjImgView addSubview:DongwangNumslb];
        _DongwangNumslb = DongwangNumslb;
        

    }
    return self;
}
-(void)setTizuModel:(DongwangHotTizuModel *)TizuModel{
    _TizuModel = TizuModel;
    [_DonwgangQuestionImgView sd_setImageWithURL:[NSURL URLWithString:TizuModel.picture] placeholderImage:[UIImage imageNamed:@"zw02"] options:SDWebImageRefreshCached];
    _DongwangQuestionTitle.text =  TizuModel.name;

    
//   NSString *  Temp1  = [TizuModel.Dongwangdescription stringByReplacingOccurrencesOfString:@"\r" withString:@""];

//    NSString *  TempStr = [Temp1 stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSString * TempStr = [TizuModel.Dongwangdescription stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
  [_DongwangDesclb setText:TempStr lineSpacing:RealWidth(3)];
    _DongwangNumslb.text = [NSString stringWithFormat:@"%@",TizuModel.thermal];

    if ([TizuModel.top integerValue] == 0) {
        //置顶
        _DongwangToplb.hidden = NO;
        _DongwangQuestionTitle.textAlignment = NSTextAlignmentNatural;
        _DongwangQuestionTitle.x = CGRectGetMaxX(_DongwangToplb.frame)+RealWidth(15);
        _DongwangQuestionTitle.width = CGRectGetWidth(_DongwangBjImgView.frame)-CGRectGetMaxX(_DongwangToplb.frame)-RealWidth(5);
    }else{
        _DongwangToplb.hidden = YES;
        _DongwangQuestionTitle.textAlignment = NSTextAlignmentCenter;
        _DongwangQuestionTitle.x = 0;
        _DongwangQuestionTitle.width = CGRectGetWidth(_DongwangBjImgView.frame);

    }
    
    
    
    
}
@end
