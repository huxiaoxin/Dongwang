//
//  DongwangMyJifenTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/18.
//

#import "DongwangMyJifenTableViewCell.h"
@interface DongwangMyJifenTableViewCell ()

@end
@implementation DongwangMyJifenTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        UIImageView * DongwangFirstImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(15), 0, K(165), K(81))];
        DongwangFirstImgView.image = [UIImage imageNamed:@"翻牌"];
        DongwangFirstImgView.userInteractionEnabled = YES;
        DongwangFirstImgView.tag = 0;
        [self.contentView addSubview:DongwangFirstImgView];
        [DongwangFirstImgView addSubview:[self DongwangImglbConfigerWithFrame:CGRectMake(K(10), K(10), K(200), K(21)) lbtext:@"积分翻牌"]];
        
        
        UITapGestureRecognizer * DongwantImgFirstTap  =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangImgCellTapClick:)];
        [DongwangFirstImgView addGestureRecognizer:DongwantImgFirstTap];
        
        UIImageView * DongwangSecondImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(15)+CGRectGetMaxX(DongwangFirstImgView.frame), 0, K(165), K(81))];
        DongwangSecondImgView.image = [UIImage imageNamed:@"兑换"];
        DongwangSecondImgView.userInteractionEnabled = YES;
        DongwangSecondImgView.tag = 1;
        [self.contentView addSubview:DongwangSecondImgView];
        [DongwangSecondImgView addSubview:[self DongwangImglbConfigerWithFrame:CGRectMake(K(10), K(10), K(200), K(21)) lbtext:@"积分兑换"]];

        
        UITapGestureRecognizer * DongwantImgSecondTap  =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangImgCellTapClick:)];
        [DongwangSecondImgView addGestureRecognizer:DongwantImgSecondTap];


        UIImageView * DongwangThreeImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(DongwangFirstImgView.frame)+K(15), K(165), K(81))];
        DongwangThreeImgView.userInteractionEnabled = YES;
        DongwangThreeImgView.image = [UIImage imageNamed:@"商城"];
        DongwangThreeImgView.tag = 2;
        [self.contentView addSubview:DongwangThreeImgView];
        
        [DongwangThreeImgView addSubview:[self DongwangImglbConfigerWithFrame:CGRectMake(K(10), K(10), K(200), K(21)) lbtext:@"积分商城"]];
        
        UITapGestureRecognizer * DongwantImgThreeTap  =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangImgCellTapClick:)];
        [DongwangThreeImgView addGestureRecognizer:DongwantImgThreeTap];


        UIImageView * DongwangFoureImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(15)+CGRectGetMaxX(DongwangThreeImgView.frame), CGRectGetMaxY(DongwangFirstImgView.frame)+K(15), K(165), K(81))];
        DongwangFoureImgView.userInteractionEnabled = YES;
        DongwangFoureImgView.image = [UIImage imageNamed:@"会员"];
        DongwangFoureImgView.tag = 3;
        [self.contentView addSubview:DongwangFoureImgView];
        
        [DongwangFoureImgView addSubview:[self DongwangImglbConfigerWithFrame:CGRectMake(K(10), K(10), K(200), K(21)) lbtext:@"积分特权"]];
        
        UITapGestureRecognizer * DongwantImgFoureTap  =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangImgCellTapClick:)];
        [DongwangFoureImgView addGestureRecognizer:DongwantImgFoureTap];

        
    }
    return self;
}
-(UILabel *)DongwangImglbConfigerWithFrame:(CGRect)lbFrame lbtext:(NSString *)lbStr{
    UILabel * Dongwanglb = [[UILabel alloc]initWithFrame:lbFrame];
    Dongwanglb.text = lbStr;
    Dongwanglb.font = KSysFont(font(15));
    Dongwanglb.textColor = [UIColor whiteColor];
    return Dongwanglb;
}
-(void)DongwangImgCellTapClick:(UITapGestureRecognizer *)ImgTap{
    UIImageView * ImgView =  (UIImageView *)[ImgTap view];
    [self.delegate DongwangMyJifenTableViewCellImgTapClickWithIndex:ImgView.tag];
}
@end
