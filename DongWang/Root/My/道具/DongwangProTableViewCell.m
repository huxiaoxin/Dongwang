//
//  DongwangProTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import "DongwangProTableViewCell.h"
@interface DongwangProTableViewCell ()

@end
@implementation DongwangProTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor colorWithHexString:@"#EDEDED"];
        UIView * DongwangContentView = [[UIView alloc]initWithFrame:CGRectMake(K(12), 0, SCREEN_WIDTH-K(24), K(110))];
        DongwangContentView.backgroundColor = [UIColor whiteColor];
        DongwangContentView.layer.cornerRadius = K(5);
        DongwangContentView.layer.masksToBounds = YES;
        [self.contentView addSubview:DongwangContentView];
        
        UIImageView * DongwangIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(23), K(28), K(43), K(48))];
        DongwangIconImgView.image = [UIImage imageNamed:@"免答卡"];
        [DongwangContentView addSubview:DongwangIconImgView];
        
        
        UILabel * DongwangTypelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangIconImgView.frame)+K(14.5), K(29.5), K(200), K(21))];
        DongwangTypelb.textColor = [UIColor colorWithHexString:@"#333330"];
        DongwangTypelb.font = KBlFont(font(15));
        DongwangTypelb.text = @"万能卡";
        [DongwangContentView addSubview:DongwangTypelb];

        
        UILabel * DongwangTpislb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangIconImgView.frame)+K(14.5), K(56.5), K(200), K(15))];
        DongwangTpislb.textColor = [UIColor colorWithHexString:@"#999999"];
        DongwangTpislb.font = KSysFont(font(11));
        DongwangTpislb.text = @"还没想好咋用，可能要兑换吧～";
        [DongwangContentView addSubview:DongwangTpislb];
        
        //边边
        
        UIImageView * DongwangRightIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangContentView.frame)-K(65), -K(4), K(69.5), K(66))];
        DongwangRightIconImgView.image = [UIImage imageNamed:@"边边"];
        [DongwangContentView addSubview:DongwangRightIconImgView];
        
        UILabel * DongwangNumslb = [[UILabel alloc]initWithFrame:CGRectMake(0, K(7), CGRectGetWidth(DongwangRightIconImgView.frame)-K(15), K(24))];
        DongwangNumslb.textColor = [UIColor whiteColor];
        DongwangNumslb.font = KSysFont(font(17));
        DongwangNumslb.text = @"X2";
        DongwangNumslb.textAlignment = NSTextAlignmentRight;
        [DongwangRightIconImgView addSubview:DongwangNumslb];

        
        UIButton * DongwangFindBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangContentView.frame)-K(26.5+65), K(36.5), K(65), K(28))];
        [DongwangFindBtn setBackgroundImage:[UIImage imageNamed:@"编组15"] forState:UIControlStateNormal];
        [DongwangContentView addSubview:DongwangFindBtn];

        
            
    }
    return self;
}
@end
