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
    UIView * _lineview;
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
        _lineview  =lineview;
        
        
        UILabel * DongwangLeftTitle = [[UILabel alloc]initWithFrame:CGRectMake(K(22), K(12.5), K(200), K(20))];
        DongwangLeftTitle.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangLeftTitle.font = KSysFont(font(14));
        DongwangLeftTitle.text = @"昵称";
        [self.contentView addSubview:DongwangLeftTitle];
        _DongwangLeftTitle = DongwangLeftTitle;
        
        UIImageView * DongwangRightIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-K(42+22), K(17.5), K(6), K(10))];
        DongwangRightIconImgView.image = [UIImage imageNamed:@"Fill2_black"];
        [self.contentView addSubview:DongwangRightIconImgView];
        _DongwangRightIconImgView = DongwangRightIconImgView;
        
        
        UILabel * DongwangRightTitle = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-K(42+175+50), K(12.5), K(150+50), K(20))];
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
    if ([[NSString stringWithFormat:@"%@",[UserManager userInfo].displayStatus] isEqualToString:@"1"]) {
        if (indexPath.row == 4) {
            _lineview.hidden = YES;
        }else{
            _lineview.hidden = NO;
        }
        //QQ登录 苹果 微信登录（直接隐藏微信那一栏目）
    }else{
        //非 QQ登录 苹果 微信登录
        if (indexPath.row == 5) {
            _lineview.hidden = YES;
        }else{
            _lineview.hidden = NO;
        }
    }
    
    if (indexPath.row == 0) {
        _DongwangRightTitle.textColor = [UIColor colorWithHexString:@"#333333"];
        _DongwangRightIconImgView.hidden = NO;
        _DongwangRightTitle.x = SCREEN_WIDTH-K(42+175+50);
        
    }else if (indexPath.row == 1){
        _DongwangRightTitle.textColor = [UIColor colorWithHexString:@"#333333"];
        _DongwangRightIconImgView.hidden = NO;
        _DongwangRightTitle.x = SCREEN_WIDTH-K(42+175+50);
        
    }else if (indexPath.row == 2){
        NSString * phone = [NSString stringWithFormat:@"%@",[UserManager userInfo].phone];
        if (phone.length > 0) {
            _DongwangRightTitle.textColor = [UIColor colorWithHexString:@"#999999"];
            _DongwangRightIconImgView.hidden = YES;
            _DongwangRightTitle.x = SCREEN_WIDTH-K(42+175+40);
            
        }else{
            _DongwangRightTitle.textColor = [UIColor colorWithHexString:@"#333333"];
            _DongwangRightIconImgView.hidden = NO;
            _DongwangRightTitle.x = SCREEN_WIDTH-K(42+175+50);
        }
        
    }else if (indexPath.row == 3){
        if ([[NSString stringWithFormat:@"%@",[UserManager userInfo].displayStatus] isEqualToString:@"1"]) {
            //QQ登录 微信登录 （这一栏为收货地址）
            NSString * addressStatusStr;
            addressStatusStr = [NSString isBlankString:[NSString stringWithFormat:@"%@",[UserManager userInfo].addressStatus]] ? @"0" : [NSString stringWithFormat:@"%@",[UserManager userInfo].addressStatus];
            if ([addressStatusStr isEqualToString:@"0"]) {
                _DongwangRightTitle.textColor = [UIColor colorWithHexString:@"#333333"];
                _DongwangRightIconImgView.hidden = NO;
                _DongwangRightTitle.x = SCREEN_WIDTH-K(42+175+50);
            }else{
                _DongwangRightTitle.textColor = [UIColor colorWithHexString:@"#999999"];
                _DongwangRightIconImgView.hidden = YES;
                _DongwangRightTitle.x = SCREEN_WIDTH-K(42+175+40);
            }
            
            
        }else{
            //显示微信绑定
            
            NSString *  wxStatusStr = [NSString isBlankString:[NSString stringWithFormat:@"%@",[UserManager userInfo].wxStatus]] ? @"0" : [NSString stringWithFormat:@"%@",[UserManager userInfo].wxStatus];
            if ([wxStatusStr isEqualToString:@"0"]) {
                //未绑定
                _DongwangRightTitle.textColor = [UIColor colorWithHexString:@"#333333"];
                _DongwangRightIconImgView.hidden = NO;
                _DongwangRightTitle.x = SCREEN_WIDTH-K(42+175+50);
                
            }else{
                //已绑定
                _DongwangRightTitle.textColor = [UIColor colorWithHexString:@"#999999"];
                _DongwangRightIconImgView.hidden = YES;
                _DongwangRightTitle.x = SCREEN_WIDTH-K(42+175+40);
                
            }
            
        }
        
    }else if (indexPath.row == 4){
        _DongwangRightTitle.textColor = [UIColor colorWithHexString:@"#333333"];
        _DongwangRightIconImgView.hidden = NO;
        _DongwangRightTitle.x = SCREEN_WIDTH-K(42+175+50);
        
    }else if (indexPath.row == 5){
        NSString * certificationStr = [NSString isBlankString:[NSString stringWithFormat:@"%@",[UserManager userInfo].certification]] ? @"0" : [NSString stringWithFormat:@"%@",[UserManager userInfo].certification];
        if ([certificationStr isEqualToString:@"1"]) {
            _DongwangRightTitle.textColor = [UIColor colorWithHexString:@"#999999"];
            _DongwangRightIconImgView.hidden = YES;
            _DongwangRightTitle.x = SCREEN_WIDTH-K(42+175+40);
        }else{
            _DongwangRightTitle.x = SCREEN_WIDTH-K(42+175+50);
            _DongwangRightTitle.textColor = [UIColor colorWithHexString:@"#333333"];
            _DongwangRightIconImgView.hidden = NO;
        }
        
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
