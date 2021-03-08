//
//  DongwangMyyueHeaderView.m
//  DongWang
//
//  Created by codehzx on 2020/11/11.
//

#import "DongwangMyyueHeaderView.h"
#import <UICountingLabel.h>
@interface DongwangMyyueHeaderView ()
@property(nonatomic,strong) UICountingLabel * DongwangMoneylb;
@end
@implementation DongwangMyyueHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    

        UIImageView * DongwangbjImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(110.5))];
        DongwangbjImgView.userInteractionEnabled = YES;
        DongwangbjImgView.image = [UIImage imageNamed:@"beijtixian"];
        [self addSubview:DongwangbjImgView];
        
        UILabel * DongwangCurrentToplb = [[UILabel alloc]initWithFrame:CGRectMake(0, K(23), SCREEN_WIDTH, K(15))];
        DongwangCurrentToplb.textAlignment = NSTextAlignmentCenter;
        DongwangCurrentToplb.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangCurrentToplb.font = KSysFont(font(13));
        DongwangCurrentToplb.text = @"当前余额(元)";
        [DongwangbjImgView addSubview:DongwangCurrentToplb];
        
        
        UICountingLabel * DongwangMoneylb = [[UICountingLabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangCurrentToplb.frame)+K(2), SCREEN_WIDTH, K(29.5))];
        DongwangMoneylb.format = @"%.2f";
        DongwangMoneylb.textAlignment = NSTextAlignmentCenter;
        DongwangMoneylb.font = KBlFont(font(21));
        DongwangMoneylb.textColor = LGDBLackColor;
        DongwangMoneylb.method = UILabelCountingMethodEaseOut;
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = kCFNumberFormatterDecimalStyle;
//        DongwangMoneylb.formatBlock = ^NSString* (CGFloat value)
//        {
//            NSString* formatted = [formatter stringFromNumber:@((CGFloat)value)];
//            return [NSString stringWithFormat:@"%@",formatted];
//        };
        [DongwangbjImgView addSubview:DongwangMoneylb];
        _DongwangMoneylb = DongwangMoneylb;
        
        CGFloat  balance  = [[UserManager userInfo].currentBalance floatValue];
        [DongwangMoneylb countFrom:0 to:balance withDuration:0.5];

        
        UIImageView * DongwangWhiteImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(40.5), K(83.5), SCREEN_WIDTH-K(81), K(100.5))];
        DongwangWhiteImgView.layer.cornerRadius = K(5);
        DongwangWhiteImgView.layer.masksToBounds = YES;
        [DongwangWhiteImgView setBackgroundColor:[UIColor colorWithHexString:@"#804AB7"]];
        DongwangWhiteImgView.userInteractionEnabled = YES;
        [self addSubview:DongwangWhiteImgView];
        [DongwangWhiteImgView viewShadowPathWithColor:LGDLightBLackColor shadowOpacity:0.2 shadowRadius:K(5) shadowPathType:LeShadowPathAround shadowPathWidth:K(5)];
        
        
        
        UIImageView * DongwangLogomgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(38.5), K(24.5), K(53.5), K(53.5))];
        DongwangLogomgView.userInteractionEnabled = YES;
        DongwangLogomgView.image = [UIImage imageNamed:@"头像0"];
        [DongwangWhiteImgView addSubview:DongwangLogomgView];
        

        UIImageView * DongwangJiaobiaoView = [[UIImageView alloc]initWithFrame:CGRectMake(K(100), K(44.5), K(104), K(19))];
        DongwangJiaobiaoView.userInteractionEnabled = YES;
        DongwangJiaobiaoView.image = [UIImage imageNamed:@"jiaotixian"];
        [DongwangWhiteImgView addSubview:DongwangJiaobiaoView];
        
        UIImageView * DongwangRightimgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(210.5), K(26), K(53.5), K(53.5))];
        DongwangRightimgView.userInteractionEnabled = YES;
        DongwangRightimgView.image = [UIImage imageNamed:@"zhifubao"];
        [DongwangWhiteImgView addSubview:DongwangRightimgView];
        

    }
    return self;
}
-(void)setInfo:(UserInfo *)info{
    _info = info;
    CGFloat  balance  = [info.currentBalance floatValue];
    [_DongwangMoneylb countFrom:0 to:balance withDuration:2.5];
}
@end
