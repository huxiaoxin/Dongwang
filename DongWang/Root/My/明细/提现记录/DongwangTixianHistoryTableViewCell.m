//
//  DongwangTixianHistoryTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/11.
//

#import "DongwangTixianHistoryTableViewCell.h"
@interface DongwangTixianHistoryTableViewCell  ()
@property(nonatomic,strong) UIImageView * DongwnagLeftIconImgView;
@property(nonatomic,strong) UILabel * DongwangLeftToplb;
@property(nonatomic,strong) UILabel * DongwangTimmeBtomlb;
@property(nonatomic,strong) UILabel * DongwangRightToplb;
@property(nonatomic,strong) UILabel * DongwangRightBtomlb;
@end
@implementation DongwangTixianHistoryTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];

        UIView * dongwangline = [[UIView alloc]initWithFrame:CGRectMake(K(15), K(69), SCREEN_WIDTH-K(30), K(1))];
        dongwangline.backgroundColor =  LGDLightGaryColor;
        [self.contentView addSubview:dongwangline];
        
        UIImageView * DongwnagLeftIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(15), RealWidth(20), RealWidth(30), RealWidth(30))];
        
        [self.contentView addSubview:DongwnagLeftIconImgView];
        _DongwnagLeftIconImgView =DongwnagLeftIconImgView;
        
        
        UILabel * DongwangLeftToplb = [[UILabel alloc]initWithFrame:CGRectMake(K(10)+CGRectGetMaxX(DongwnagLeftIconImgView.frame), K(15), K(300), K(21))];
        DongwangLeftToplb.font = KSysFont(font(13));
        DongwangLeftToplb.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangLeftToplb.text = @"答题奖励";
        [self.contentView addSubview:DongwangLeftToplb];
        _DongwangLeftToplb = DongwangLeftToplb;
        

       
        
        
        UILabel * DongwangTimmeBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(K(10.5)+CGRectGetMaxX(DongwnagLeftIconImgView.frame), K(41.5), K(300), K(15))];
        DongwangTimmeBtomlb.font = KSysFont(font(11));
        DongwangTimmeBtomlb.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangTimmeBtomlb.text = @"2020-10-26 17:38:13";
        [self.contentView addSubview:DongwangTimmeBtomlb];
        _DongwangTimmeBtomlb = DongwangTimmeBtomlb;
        
        
        UILabel * DongwangRightToplb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-K(200+29.5), K(15), K(200), K(18.5))];
        DongwangRightToplb.textAlignment = NSTextAlignmentRight;
        DongwangRightToplb.font = KSysFont(font(13));
        DongwangRightToplb.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangRightToplb.text = @"发放成功";
        [self.contentView addSubview:DongwangRightToplb];
        _DongwangRightToplb = DongwangRightToplb;
        
        
        UILabel * DongwangRightBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-K(200+29.5), K(41.5), K(200), K(18.5))];
        DongwangRightBtomlb.textAlignment = NSTextAlignmentRight;
        DongwangRightBtomlb.font = KSysFont(font(13));
        DongwangRightBtomlb.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangRightBtomlb.text = @"2020-10-26 17:38:13";
        [self.contentView addSubview:DongwangRightBtomlb];
        _DongwangRightBtomlb = DongwangRightBtomlb;
        
        
        
        
    }
    return self;
}
-(void)setTixianModel:(DongwangtixianModel *)tixianModel{
    _tixianModel = tixianModel;
    NSString * FirstStr = @"提现金额：";
    NSString * SecondStr = [NSString stringWithFormat:@"%@",tixianModel.amount];
    NSMutableAttributedString  * DongwangTopAttrbue = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",FirstStr,SecondStr]];
    [DongwangTopAttrbue addAttribute:NSFontAttributeName value:KSysFont(font(13)) range:NSMakeRange(0, FirstStr.length)];
    [DongwangTopAttrbue addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#333333"] range:NSMakeRange(FirstStr.length, SecondStr.length)];
    [DongwangTopAttrbue addAttribute:NSFontAttributeName value:KBlFont(font(15)) range:NSMakeRange(FirstStr.length, SecondStr.length)];
    [DongwangTopAttrbue addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#FF2D2D"] range:NSMakeRange(FirstStr.length, SecondStr.length)];
    _DongwangLeftToplb.attributedText = DongwangTopAttrbue;
    _DongwangTimmeBtomlb.text =  tixianModel.applyTimeStr;
    _DongwangRightToplb.text  = tixianModel.withdrawStatus;
    _DongwangRightBtomlb.text = tixianModel.opinion;
    ////渠道 0-支付宝 1-微信
    if ([tixianModel.channel integerValue] == 0) {
        _DongwnagLeftIconImgView.image = [UIImage imageNamed:@"alipay_icon"];
    }else{
        _DongwnagLeftIconImgView.image = [UIImage imageNamed:@"wechat_icon"];
    }
}
@end
