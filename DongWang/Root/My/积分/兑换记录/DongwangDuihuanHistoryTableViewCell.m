//
//  DongwangDuihuanHistoryTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/18.
//

#import "DongwangDuihuanHistoryTableViewCell.h"
@interface DongwangDuihuanHistoryTableViewCell ()
{
    UIImageView * _DongwangImgViews;
    UILabel * _DongwangNamelb;
    UILabel * _DongwangTimelb;
}
@end
@implementation DongwangDuihuanHistoryTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle =   UITableViewCellSelectionStyleNone;
        
        UIImageView * DongwangImgViews = [[UIImageView alloc]initWithFrame:CGRectMake(K(17), K(13), K(30), K(30))];
//        DongwangImgViews.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:DongwangImgViews];
        _DongwangImgViews  =DongwangImgViews;
        
        
        UIView * Donwgangline = [[UIView alloc]initWithFrame:CGRectMake(K(5), K(55), SCREEN_WIDTH-K(20+19), K(1))];
        Donwgangline.backgroundColor = [UIColor colorWithHexString:@"#FF9E67"];
        [self.contentView addSubview:Donwgangline];
        
        UILabel * DongwangNamelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangImgViews.frame)+K(15), K(21), K(250), K(14))];
        DongwangNamelb.font = KSysFont(font(13));
        DongwangNamelb.text = @"加时卡  X1";
        DongwangNamelb.textColor = [UIColor colorWithHexString:@"#333333"];
        [self.contentView addSubview:DongwangNamelb];
        _DongwangNamelb = DongwangNamelb;
        
        
        
        UILabel * DongwangTimelb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-K(30)-K(170), K(22), K(140), K(12))];
        DongwangTimelb.textAlignment = NSTextAlignmentRight;
        DongwangTimelb.font = KSysFont(font(11));
        DongwangTimelb.text = @"2020-10-26 17:38:13";
        DongwangTimelb.textColor = [UIColor colorWithHexString:@"#999999"];
        [self.contentView addSubview:DongwangTimelb];
        _DongwangTimelb = DongwangTimelb;
        
        
    }
    return self;
}
-(void)setDuihuanModel:(DongwangDuihuanModel *)duihuanModel{
    _duihuanModel = duihuanModel;
    [_DongwangImgViews sd_setImageWithURL:[NSURL URLWithString:duihuanModel.logo]];
    _DongwangNamelb.text = duihuanModel.exchangeCardValue;
    _DongwangTimelb.text =  duihuanModel.useTimeStr;
    
    
}
@end
