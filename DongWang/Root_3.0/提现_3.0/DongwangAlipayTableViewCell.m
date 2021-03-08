//
//  DongwangWechatTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2021/1/26.
//

#import "DongwangAlipayTableViewCell.h"
@interface DongwangAlipayTableViewCell ()
@property(nonatomic,strong) UILabel * rightToplb;
@property(nonatomic,strong) UILabel * rightBtomlb;
@property(nonatomic,strong) UIButton * TXBtn;
@end
@implementation DongwangAlipayTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        UIImageView * wechtabakcimgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(10), RealWidth(10), SCREEN_WIDTH-RealWidth(10), RealWidth(197))];
        wechtabakcimgView.userInteractionEnabled = YES;
        wechtabakcimgView.image = [UIImage imageNamed:@"wechatcell_icon"];
        [self.contentView addSubview:wechtabakcimgView];
        
        
        
        UILabel * leftToplb  =[[UILabel alloc]initWithFrame:CGRectMake(RealWidth(15), RealWidth(15), RealWidth(80), RealWidth(15))];
        leftToplb.text = @"真实姓名:";
        leftToplb.font = PFR15Font;
        leftToplb.textColor = [UIColor colorWithHexString:@"#333333"];
        [wechtabakcimgView addSubview:leftToplb];
        
        
        
        UILabel * leftBtomlb  =[[UILabel alloc]initWithFrame:CGRectMake(RealWidth(15), RealWidth(51)+CGRectGetMaxY(leftToplb.frame), RealWidth(80), RealWidth(15))];
        leftBtomlb.text = @"支付宝号:";
        leftBtomlb.font = PFR15Font;
        leftBtomlb.textColor = [UIColor colorWithHexString:@"#333333"];
        [wechtabakcimgView addSubview:leftBtomlb];

        
        [wechtabakcimgView addSubview:[self DongwangLines:CGRectMake(CGRectGetMaxX(leftToplb.frame), RealWidth(44), CGRectGetWidth(wechtabakcimgView.frame)-CGRectGetMaxX(leftToplb.frame)-RealWidth(10+10), RealWidth(1))]];
        
        
        
        
        [wechtabakcimgView addSubview:[self DongwangLines:CGRectMake(CGRectGetMaxX(leftToplb.frame), RealWidth(110), CGRectGetWidth(wechtabakcimgView.frame)-CGRectGetMaxX(leftToplb.frame)-RealWidth(10+10), RealWidth(1))]];
        
        
        UILabel * rightToplb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftToplb.frame), CGRectGetMidY(leftToplb.frame)-RealWidth(9), RealWidth(120), RealWidth(18))];
        rightToplb.font = PFR15Font;
        rightToplb.text = @"-.-";
        rightToplb.textColor = [UIColor colorWithHexString:@"#999999"];
        [wechtabakcimgView addSubview:rightToplb];
        _rightToplb = rightToplb;
        
        
        UILabel * rightBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftBtomlb.frame), CGRectGetMidY(leftBtomlb.frame)-RealWidth(9), RealWidth(120), RealWidth(18))];
        rightBtomlb.font = PFR15Font;
        rightBtomlb.text = @"-.-";
        rightBtomlb.textColor = [UIColor colorWithHexString:@"#999999"];
        [wechtabakcimgView addSubview:rightBtomlb];
        _rightBtomlb = rightBtomlb;
        
//
        
        UIButton * TXBtn =[[UIButton alloc]initWithFrame:CGRectMake(RealWidth(40), CGRectGetMaxY(rightBtomlb.frame)+RealWidth(37), CGRectGetWidth(wechtabakcimgView.frame)-RealWidth(80), RealWidth(40))];
        TXBtn.layer.cornerRadius = RealWidth(20);
        TXBtn.layer.masksToBounds = YES;
        [TXBtn addTarget:self action:@selector(TXBtnClick) forControlEvents:UIControlEventTouchUpInside];
        TXBtn.adjustsImageWhenHighlighted = NO;
        TXBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [TXBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        TXBtn.titleLabel.font = PFR12Font;
        [TXBtn setTitle:@"立即提现" forState:UIControlStateNormal];
        [TXBtn setBackgroundImage:[UIImage imageNamed:@"wechattx"] forState:UIControlStateNormal];
        [wechtabakcimgView addSubview:TXBtn];
        _TXBtn = TXBtn;
        
        
    }
    return self;
}

-(void)TXBtnClick{
    [self.delegate DongwangAlipayTableViewCellTXAction];
}
-(void)setInfo:(UserInfo *)info{
    _info = info;
    _rightToplb.text = info.payName;
//    [NSString replaceStringWithAsterisk:info.realName startLocation:0 lenght:info.realName.length == 2 ? 1 : 2];
    _rightBtomlb.text =  [NSString replaceStringWithAsterisk:[NSString stringWithFormat:@"%@",info.payAccount] startLocation:2 lenght:4];
    CGFloat  balance  = [info.currentBalance floatValue];
    if (balance >= 20) {
        [_TXBtn setBackgroundImage:[UIImage imageNamed:@"wechattx"] forState:UIControlStateNormal];
        _TXBtn.enabled = YES;
    }else{
        _TXBtn.enabled =NO;
        [_TXBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_TXBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];

    }
    
}
-(UIView * )DongwangLines:(CGRect)lineFrame{
    UIView * line =[[UIView alloc]initWithFrame:lineFrame];
    line.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    return line;
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

