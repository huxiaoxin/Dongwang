//
//  DongwangMyletouHeaderCollectionReusableView.m
//  DongWang
//
//  Created by codehzx on 2021/2/1.
//

#import "DongwangMyletouHeaderCollectionReusableView.h"
@interface DongwangMyletouHeaderCollectionReusableView ()
@property(nonatomic,strong) UILabel * Btomlb;
@end
@implementation DongwangMyletouHeaderCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIView * contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RealWidth(70))];
        contentView.backgroundColor =[UIColor colorWithHexString:@"#804AB7"];
        [self addSubview:contentView];
        
        UILabel * Toplb = [[UILabel alloc]initWithFrame:CGRectMake(0, RealWidth(10), SCREEN_WIDTH, RealWidth(24))];
        Toplb.textAlignment = NSTextAlignmentCenter;
        Toplb.font = PFS17Font;
        Toplb.textColor = [UIColor whiteColor];
        Toplb.text = @"本期我的乐透码";
        [contentView addSubview:Toplb];
        
        UILabel * Btomlb = [[UILabel alloc]initWithFrame:CGRectMake(0, RealWidth(12)+CGRectGetMaxY(Toplb.frame), SCREEN_WIDTH, RealWidth(14))];
        Btomlb.textAlignment = NSTextAlignmentCenter;
        Btomlb.font = PFR14Font;
        Btomlb.textColor = [UIColor whiteColor];
        Btomlb.text = @"（今⽇20:00开奖）";
        [contentView addSubview:Btomlb];
        _Btomlb = Btomlb;
        
        
        UIButton * clousedBtn = [[UIButton alloc]initWithFrame:CGRectMake(RealWidth(345), RealWidth(15), RealWidth(15), RealWidth(15))];
        [clousedBtn addTarget:self action:@selector(clousedBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [clousedBtn setEnlargeEdgeWithTop:15 right:15 bottom:15 left:15];
        [clousedBtn setBackgroundImage:[UIImage imageNamed:@"cloesd_icon"] forState:UIControlStateNormal];
        [clousedBtn setBackgroundImage:[UIImage imageNamed:@"cloesd_icon"] forState:UIControlStateHighlighted];
        clousedBtn.adjustsImageWhenHighlighted = NO;
        [contentView addSubview:clousedBtn];

    }
    return self;
}
-(void)setTopStr:(NSString *)topStr{
    _topStr = topStr;
    _Btomlb.text  =[NSString stringWithFormat:@"(今日%@开奖)",topStr];
    
}
-(void)clousedBtnClick{
    [self.delegate DongwangMyletouHeaderCollectionReusableViewWithClouesdAction];
}
@end
