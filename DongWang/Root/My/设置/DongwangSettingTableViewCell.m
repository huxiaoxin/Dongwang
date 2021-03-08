//
//  DongwangSettingTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/10.
//

#import "DongwangSettingTableViewCell.h"
@interface DongwangSettingTableViewCell ()
{
    UILabel * _DongwangTitle;
}
@end
@implementation DongwangSettingTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];

        UIView * DongwanglineView = [[UIView alloc]initWithFrame:CGRectMake(K(27), K(49.5), SCREEN_WIDTH-K(54), K(1))];
        DongwanglineView.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:DongwanglineView];
        
        UILabel * DongwangTitle = [[UILabel alloc]initWithFrame:CGRectMake(K(25.5), K(14.75), K(250), K(21))];
        DongwangTitle.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangTitle.font = KSysFont(font(15));
        DongwangTitle.text = @"我的动态";
        [self.contentView addSubview:DongwangTitle];
        _DongwangTitle = DongwangTitle;
        
        UIImageView * DongwangRightIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-K(5+27), K(20.25), K(6), K(10))];
        DongwangRightIconImgView.image = [UIImage imageNamed:@"Fill2_black"];
        [self.contentView addSubview:DongwangRightIconImgView];

        UILabel * DongwangRightTitle = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-K(42+145), K(15.25), K(150), K(20))];
        DongwangRightTitle.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangRightTitle.font = KSysFont(font(14));
        DongwangRightTitle.text = @"156****7799";
        DongwangRightTitle.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:DongwangRightTitle];
        _DongwangRightTitle = DongwangRightTitle;
        
    }
    return self;
}
-(void)setContentText:(NSString *)ContentText{
    _ContentText = ContentText;
    _DongwangTitle.text = ContentText;
    
}
@end
