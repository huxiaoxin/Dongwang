//
//  DongwangJifenTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/17.
//

#import "DongwangJifenTableViewCell.h"
@interface DongwangJifenTableViewCell ()
{
    UILabel * _DongwangToplb;
    UILabel * _DongwangBtomlb;
    UILabel * _DongwangPricelb;
}
@end
@implementation DongwangJifenTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];

        self.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView * dongwangline = [[UIView alloc]initWithFrame:CGRectMake(RealWidth(1), K(51.5), SCREEN_WIDTH-K(28+12), K(0.5))];
        dongwangline.backgroundColor = [UIColor colorWithHexString:@"#FF9E67"];
        [self.contentView addSubview:dongwangline];
        
        
        UILabel * DongwangToplb = [[UILabel alloc]initWithFrame:CGRectMake(K(17), K(14), K(250), K(13))];
        DongwangToplb.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangToplb.font = KSysFont(font(13));
        DongwangToplb.text = @"绑定支付宝";
        [self.contentView addSubview:DongwangToplb];
        _DongwangToplb = DongwangToplb;
        
        UILabel * DongwangBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(K(17), K(33), K(350), K(11))];
        DongwangBtomlb.textColor = [UIColor colorWithHexString:@"#999999"];
        DongwangBtomlb.font = KSysFont(font(11));
        DongwangBtomlb.text = @"2020-10-26 17:38:13";
        [self.contentView addSubview:DongwangBtomlb];
        _DongwangBtomlb = DongwangBtomlb;
        
        
        UILabel * DongwangPricelb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-K(28+15)-K(150), K(17.5), K(140), K(17))];
        DongwangPricelb.textAlignment = NSTextAlignmentRight;
        DongwangPricelb.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangPricelb.font = KSysFont(font(17));
        DongwangPricelb.text = @"+10";
        [self.contentView addSubview:DongwangPricelb];
        _DongwangPricelb = DongwangPricelb;
        
        
    }
    return self;
}
-(void)setDetailMode:(DongwangJifenDetailModel *)detailMode{
    _detailMode = detailMode;
    //                "sourceType": null,//获取积分的途径:0代表答题,1表示签到,2表示参与今日答题(日常任务),3表示答题过程中使用道具(日常任务),4表示积分翻牌(日常任务),5表示积分兑换(日常任务),6表示完善个人资料(新手任务),7表示完成一次签到(新手任务),8表示完成一次答题(新手任务),9表示绑定微信账号(新手任务),10表示完成实名认证(新手任务),11表示活跃奖励(新手任务)
//    NSString * soureTypeStr;
//    if ([detailMode.sourceType integerValue] == 0 ) {
//        soureTypeStr = @"答题";
//    }else if ([detailMode.sourceType integerValue] == 1){
//        soureTypeStr = @"签到";
//    }else if ([detailMode.sourceType integerValue] == 2){
//        soureTypeStr = @"今日答题";
//    }else if ([detailMode.sourceType integerValue] == 3){
//        soureTypeStr = @"使用道具";
//    }else if ([detailMode.sourceType integerValue] == 4){
//        soureTypeStr = @"积分翻牌";
//    }else if ([detailMode.sourceType integerValue] == 5){
//        soureTypeStr = @"积分兑换";
//    }else if ([detailMode.sourceType integerValue] == 6){
//        soureTypeStr = @"完善个人资料";
//    }else if ([detailMode.sourceType integerValue] == 7){
//        soureTypeStr = @"签到";
//    }else if ([detailMode.sourceType integerValue] == 8){
//        soureTypeStr = @"答题";
//    }else if ([detailMode.sourceType integerValue] == 9){
//        soureTypeStr = @"绑定微信账号";
//    }else if ([detailMode.sourceType integerValue] == 10){
//        soureTypeStr = @"实名认证";
//    }else if ([detailMode.sourceType integerValue] == 11){
//        soureTypeStr = @"活跃奖励";
//    }
    _DongwangToplb.text = [NSString stringWithFormat:@"%@",detailMode.sourceTypeValue];
    _DongwangBtomlb.text =  [NSString stringWithFormat:@"%@",detailMode.useTimeStr];
    _DongwangPricelb.text  = [NSString stringWithFormat:@"%@",detailMode.useIntegral];
    
    
    
    
}
@end
