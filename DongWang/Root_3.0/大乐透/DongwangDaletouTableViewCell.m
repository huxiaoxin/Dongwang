//
//  DongwangDaletouTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2021/1/27.
//

#import "DongwangDaletouTableViewCell.h"

@implementation DongwangDaletouTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView * DongwangImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(7), K(9.5), RealWidth(34), RealWidth(52))];
        [self.contentView addSubview:DongwangImgView];
        _DongwangImgView = DongwangImgView;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor =[UIColor clearColor];
        
        
        
    }
    return self;
}
@end
