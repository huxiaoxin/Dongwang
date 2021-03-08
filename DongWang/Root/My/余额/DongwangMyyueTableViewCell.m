//
//  DongwangMyyueTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/11.
//

#import "DongwangMyyueTableViewCell.h"
@interface DongwangMyyueTableViewCell ()
{
    UILabel * _Dongwangleftlb;
}
@end
@implementation DongwangMyyueTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        UIView * Dongwangline = [[UIView alloc]initWithFrame:CGRectMake(K(102), K(55.5), SCREEN_WIDTH-K(122), K(1))];
        Dongwangline.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:Dongwangline];
        
        UILabel * Dongwangleftlb = [[UILabel alloc]initWithFrame:CGRectMake(K(28.5), K(29), K(100), K(18.5))];
        Dongwangleftlb.text =  @"真实姓名：";
        Dongwangleftlb.font = KSysFont(font(13));
        Dongwangleftlb.textColor = [UIColor colorWithHexString:@"#333333"];
        [self.contentView addSubview:Dongwangleftlb];
        _Dongwangleftlb = Dongwangleftlb;
        
        UILabel * Dongwangrightlb = [[UILabel alloc]initWithFrame:CGRectMake(K(101.5), K(29), K(100), K(18.5))];
        Dongwangrightlb.text =  @"张默默 ";
        Dongwangrightlb.font = KSysFont(font(13));
        Dongwangrightlb.textColor = [UIColor colorWithHexString:@"#333333"];
        [self.contentView addSubview:Dongwangrightlb];
        
    }
    return self;
}
-(void)setLeftText:(NSString *)leftText{
    _leftText = leftText;
    _Dongwangleftlb.text = [NSString stringWithFormat:@"%@:",leftText];
}
@end
