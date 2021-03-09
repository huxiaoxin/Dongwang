//
//  DongwangCireCenterInfoTableViewCell.m
//  DongWang
//
//  Created by sycm on 2021/3/9.
//

#import "DongwangCireCenterInfoTableViewCell.h"
@interface DongwangCireCenterInfoTableViewCell ()
@property(nonatomic,strong) UILabel * toplb;
@property(nonatomic,strong) UILabel * DongwangContentlb;

@end
@implementation DongwangCireCenterInfoTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.toplb];
        [self addSubview:self.DongwangContentlb];
    }
    return self;
}
-(UILabel *)toplb{
    if (!_toplb) {
        _toplb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(15), 0, RealWidth(45), RealWidth(20))];
        _toplb.layer.borderColor = [UIColor colorWithHexString:@"#FFBA3E"].CGColor;
        _toplb.layer.borderWidth = RealWidth(1);
        _toplb.layer.cornerRadius = RealWidth(5);
        _toplb.layer.masksToBounds=  YES;
        _toplb.textAlignment = NSTextAlignmentCenter;
        _toplb.text = @"置顶";
        _toplb.font = PFR13Font;
        _toplb.textColor = [UIColor colorWithHexString:@"#FFBA3E"];
    }
    return _toplb;
}
-(UILabel *)DongwangContentlb{
    if (!_DongwangContentlb) {
        _DongwangContentlb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(15)+CGRectGetMaxX(_toplb.frame), CGRectGetMidY(_toplb.frame)-RealWidth(15), SCREEN_WIDTH-RealWidth(30), RealWidth(30))];
        _DongwangContentlb.textColor = [UIColor whiteColor];
        _DongwangContentlb.font = PFR13Font;
        _DongwangContentlb.text = @"【标准寻访】【自由的囚徒】出货庆祝集中贴";
        _DongwangContentlb.numberOfLines  = 0 ;
    }
    return _DongwangContentlb;
}
@end
