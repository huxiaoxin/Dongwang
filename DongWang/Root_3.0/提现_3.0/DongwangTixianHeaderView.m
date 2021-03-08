//
//  DongwangTixianHeaderView.m
//  DongWang
//
//  Created by codehzx on 2021/1/22.
//

#import "DongwangTixianHeaderView.h"
@interface DongwangTixianHeaderView ()
@property(nonatomic,strong) UIButton * selCurrentBtn;
@property(nonatomic,strong) UILabel * DongwangBtomlb;
@end
@implementation DongwangTixianHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       
        UIImageView * dongwangAccountImgView  =[[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(10), RealWidth(12), SCREEN_WIDTH-RealWidth(10), RealWidth(110))];
        dongwangAccountImgView.userInteractionEnabled = YES;
        dongwangAccountImgView.image =[UIImage imageNamed:@"accoutback"];
        [self addSubview:dongwangAccountImgView];
        
        
        UILabel * DongwangToplb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(21), RealWidth(23), RealWidth(91), RealWidth(19))];
        DongwangToplb.text = @"当前余额（元）";
        DongwangToplb.textColor = [UIColor blackColor];
        DongwangToplb.font =  PFR13Font;
        [dongwangAccountImgView addSubview:DongwangToplb];
        
        
        
        UILabel * DongwangBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(21), CGRectGetMaxY(DongwangToplb.frame)+RealWidth(10), RealWidth(250), RealWidth(25))];
        DongwangBtomlb.text = @"-.-";
        DongwangBtomlb.textColor = [UIColor blackColor];
        DongwangBtomlb.font =  PFS25Font;
        [dongwangAccountImgView addSubview:DongwangBtomlb];
        _DongwangBtomlb = DongwangBtomlb;
        
        
        UIButton * dongwnagDetailBtn  = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.frame)-RealWidth(25+86), RealWidth(35), RealWidth(86), RealWidth(39))];
        [dongwnagDetailBtn setBackgroundImage:[UIImage imageNamed:@"去完成"] forState:UIControlStateNormal];
        [dongwnagDetailBtn setTitle:@"现金明细" forState:UIControlStateNormal];
        [dongwnagDetailBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        dongwnagDetailBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        dongwnagDetailBtn.titleLabel.font = PFR12Font;
        [dongwnagDetailBtn addTarget:self action:@selector(DongwnagDetailBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [dongwangAccountImgView addSubview:dongwnagDetailBtn];
        
        
        
        UIImageView * dongwangAccountTypeImgView  =[[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(10), RealWidth(10)+CGRectGetMaxY(dongwangAccountImgView.frame), SCREEN_WIDTH-RealWidth(10), RealWidth(114))];
        dongwangAccountTypeImgView.userInteractionEnabled = YES;
        dongwangAccountTypeImgView.image =[UIImage imageNamed:@"tixiantypeback"];
        [self addSubview:dongwangAccountTypeImgView];
        
        
        UILabel * DongwangtypeTopelb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(21), RealWidth(15), RealWidth(91), RealWidth(19))];
        DongwangtypeTopelb.text = @"提现方式";
        DongwangtypeTopelb.textColor = [UIColor blackColor];
        DongwangtypeTopelb.font =  PFR13Font;
        [dongwangAccountTypeImgView addSubview:DongwangtypeTopelb];
        
        
        UIButton * alipayBtn = [[UIButton alloc]initWithFrame:CGRectMake(RealWidth(21), RealWidth(41), RealWidth(133), RealWidth(42))];
        alipayBtn.tag = 0;
        [alipayBtn setBackgroundImage:[UIImage imageNamed:@"alipayIcon_nomal"] forState:UIControlStateNormal];
        [alipayBtn setBackgroundImage:[UIImage imageNamed:@"alipayIcon_seltecd"] forState:UIControlStateSelected];
        [alipayBtn addTarget:self action:@selector(DongwangHeaderBtnClicks:) forControlEvents:UIControlEventTouchUpInside];
        [dongwangAccountTypeImgView addSubview:alipayBtn];
        alipayBtn.selected = YES;
        self.selCurrentBtn = alipayBtn;
        UIButton * wechatBtn = [[UIButton alloc]initWithFrame:CGRectMake(RealWidth(40)+CGRectGetMaxX(alipayBtn.frame), RealWidth(41), RealWidth(133), RealWidth(42))];
        wechatBtn.tag = 1;
        [wechatBtn setBackgroundImage:[UIImage imageNamed:@"wechat_nomal"] forState:UIControlStateNormal];
        [wechatBtn setBackgroundImage:[UIImage imageNamed:@"wechat_seltecd"] forState:UIControlStateSelected];
        [wechatBtn addTarget:self action:@selector(DongwangHeaderBtnClicks:) forControlEvents:UIControlEventTouchUpInside];
        [dongwangAccountTypeImgView addSubview:wechatBtn];
        [self DongwangHeaderBtnClicks:alipayBtn];

        
    }
    return self;
}
-(void)DongwangHeaderBtnClicks:(UIButton *)dongwangBtn{
    self.selCurrentBtn.selected = NO;
    dongwangBtn.selected = YES;
    self.selCurrentBtn = dongwangBtn;
    [self.delegate DongwangTixianHeaderViewWithtixianbtnIndex:dongwangBtn.tag];
}
#pragma mark--现金明细
-(void)DongwnagDetailBtnClick{
[self.delegate DongwangTixianHeaderViewWithDetailbtnClick];
}
-(void)setInfo:(UserInfo *)info{
    _info = info;
    CGFloat  balance  = [info.currentBalance floatValue];
    _DongwangBtomlb.text = [NSString stringWithFormat:@"%.2f",balance];
}
@end
