//
//  DongwangMyCenterTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import "DongwangMyCenterTableViewCell.h"
@interface DongwangMyCenterTableViewCell ()
@property(nonatomic,strong) UIImageView * DongwangIconImgView;
@property(nonatomic,strong) UILabel * DongwangTitle;
@end
@implementation DongwangMyCenterTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        
        UIImageView * DongwangIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(25), K(12), K(25), K(25))];
//        DongwangIconImgView.backgroundColor = LGDMianColor;
        [self.contentView addSubview:DongwangIconImgView];
        _DongwangIconImgView = DongwangIconImgView;
        
        
        
        
        
        UILabel * DongwangTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangIconImgView.frame)+K(10.5), K(14), K(200), K(21))];
//        DongwangTitle.text = @"测试一下";
        DongwangTitle.font =    [UIFont systemFontOfSize:font(15)];
        DongwangTitle.textColor = [UIColor colorWithHexString:@"#333333"];
        [self.contentView addSubview:DongwangTitle];
        _DongwangTitle = DongwangTitle;
        
        UIView * Dongwangline = [[UIView alloc]initWithFrame:CGRectMake(K(25), K(48), SCREEN_WIDTH-K(50), K(0.5))];
        Dongwangline.backgroundColor = [UIColor colorWithHexString:@"#ECECEC"];
        [self.contentView addSubview:Dongwangline];
        
        
        UIImageView * DongwangRightIcon = [[UIImageView alloc]initWithFrame:CGRectMake(K(343), K(18.25), kWidth(7), K(12))];
        DongwangRightIcon.backgroundColor = LGDBLackColor;
//        DongwangRightIcon.image = [UIImage imageNamed:@""];
        [self.contentView addSubview:DongwangRightIcon];
        
        
    }
    return self;
}
-(void)setNameText:(NSString *)NameText{
    _NameText = NameText;
    _DongwangIconImgView.image = [UIImage imageNamed:NameText];
    _DongwangTitle.text = NameText;
    
}
@end
