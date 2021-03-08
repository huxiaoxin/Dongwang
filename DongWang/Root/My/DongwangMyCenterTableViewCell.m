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
        self.backgroundColor = [UIColor clearColor];
//        ;

        
        UIView  * MyContentView = [[UIView alloc]initWithFrame:CGRectMake(RealWidth(16), 0, SCREEN_WIDTH-RealWidth(32), RealWidth(49))];
        MyContentView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:MyContentView];
        _MyContentView = MyContentView;
        
        
        UIImageView * DongwangIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(25), K(12), K(25), K(25))];
//        DongwangIconImgView.backgroundColor = LGDMianColor;
        [self.contentView addSubview:DongwangIconImgView];
        _DongwangIconImgView = DongwangIconImgView;
        
        
        
        
        
        UILabel * DongwangTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangIconImgView.frame)+K(10.5), K(14), K(200), K(21))];
//        DongwangTitle.text = @"测试一下";
        DongwangTitle.font =    [UIFont systemFontOfSize:font(15)];
        DongwangTitle.textColor = [UIColor whiteColor];
        [self.contentView addSubview:DongwangTitle];
        _DongwangTitle = DongwangTitle;
        
        UIView * Dongwangline = [[UIView alloc]initWithFrame:CGRectMake(RealWidth(8), K(49), CGRectGetWidth(MyContentView.frame)-RealWidth(16), K(1))];
        Dongwangline.backgroundColor = [UIColor colorWithHexString:@"#302179"];
        [MyContentView addSubview:Dongwangline];
        _Dongwangline = Dongwangline;
        
        
        UIImageView * DongwangRightIcon = [[UIImageView alloc]initWithFrame:CGRectMake(K(343), K(18.25), kWidth(7), K(12))];
        DongwangRightIcon.image = [UIImage imageNamed:@"Fill2"];
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
