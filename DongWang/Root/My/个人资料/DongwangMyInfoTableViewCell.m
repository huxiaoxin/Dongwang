//
//  DongwangMyInfoTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/6.
//

#import "DongwangMyInfoTableViewCell.h"
@interface DongwangMyInfoTableViewCell ()
{
    UILabel * _DongwangLeftTitle;
    UILabel * _DongwangRightTitle;
    UIImageView * _DongwangRightIconImgView;
}
@end
@implementation DongwangMyInfoTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        
        UIView * lineview = [[UIView alloc]initWithFrame:CGRectMake(0, K(44), SCREEN_WIDTH-K(42), K(1))];
        lineview.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:lineview];
        
        
        UILabel * DongwangLeftTitle = [[UILabel alloc]initWithFrame:CGRectMake(K(22), K(12.5), K(200), K(20))];
        DongwangLeftTitle.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangLeftTitle.font = KSysFont(font(14));
        DongwangLeftTitle.text = @"昵称";
        [self.contentView addSubview:DongwangLeftTitle];
        _DongwangLeftTitle = DongwangLeftTitle;
        
        UIImageView * DongwangRightIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-K(42+22), K(17.5), K(6), K(10))];
        DongwangRightIconImgView.image = [UIImage imageNamed:@"Fill2"];
        [self.contentView addSubview:DongwangRightIconImgView];
        _DongwangRightIconImgView = DongwangRightIconImgView;
        
        
        UILabel * DongwangRightTitle = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-K(42+175), K(12.5), K(150), K(20))];
        DongwangRightTitle.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangRightTitle.font = KSysFont(font(14));
        DongwangRightTitle.text = @"156****7799";
        DongwangRightTitle.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:DongwangRightTitle];
        _DongwangRightTitle = DongwangRightTitle;
        
        
        

    }
    return self;
}
-(void)DongwangMyInfoTableViewCellConfigerData:(NSMutableArray *)leftData RightData:(NSMutableArray *)rightData indexPath:(NSIndexPath *)indexPath{
    _DongwangLeftTitle.text =  leftData[indexPath.row];
    _DongwangRightTitle.text =  rightData[indexPath.row];
    
    if (indexPath.row == 3) {
        _DongwangRightIconImgView.hidden = YES;
        _DongwangRightTitle.textColor = [UIColor colorWithHexString:@"#999999"];
    }else{
        _DongwangRightIconImgView.hidden = NO;
        _DongwangRightTitle.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    
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
