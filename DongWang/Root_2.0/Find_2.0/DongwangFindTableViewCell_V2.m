//
//  DongwangFindTableViewCell_V2.m
//  DongWang
//
//  Created by codehzx on 2021/1/15.
//

#import "DongwangFindTableViewCell_V2.h"
@interface DongwangFindTableViewCell_V2 ()


@end
@implementation DongwangFindTableViewCell_V2
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        UIView * DongwangContentView = [[UIView alloc]initWithFrame:CGRectMake(RealWidth(8), 0, SCREEN_WIDTH-RealWidth(16), RealWidth(174))];
        DongwangContentView.backgroundColor  = [UIColor colorWithHexString:@"#341E7B"];
        [self addSubview:DongwangContentView];
        
        UIImageView  * DongwangThubImgView =  [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(21), RealWidth(9), RealWidth(316), RealWidth(156))];
        DongwangThubImgView.layer.cornerRadius = RealWidth(5);
        DongwangThubImgView.layer.masksToBounds = YES;
        DongwangThubImgView.backgroundColor = [UIColor redColor];
        [DongwangContentView addSubview:DongwangThubImgView];
        
        UIView * Dongwangleftline = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0.5, RealWidth(174))];
        Dongwangleftline.backgroundColor = [UIColor colorWithHexString:@"#50B7FF"];
        [DongwangContentView addSubview:Dongwangleftline];
        
        UIView * Dongwangrightline = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangContentView.frame)-0.4, 0, 0.5, RealWidth(174))];
        Dongwangrightline.backgroundColor = [UIColor colorWithHexString:@"#50B7FF"];
        [DongwangContentView addSubview:Dongwangrightline];
        
        
        
        
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
