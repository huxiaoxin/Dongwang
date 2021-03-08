//
//  DongwangMyHeaderView.m
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import "DongwangMyHeaderView.h"
#import "DongwangMyCenterBtn.h"
@interface DongwangMyHeaderView ()
@property(nonatomic,strong) UIImageView *  DongwanguserImgView;
@property(nonatomic,strong) UIImageView * DongwangBackImgView;
@property(nonatomic,strong) UIButton *  DongwangClanderBtn;
@property(nonatomic,strong) UILabel * DongwangNamelb;
@property(nonatomic,strong) DongwangMyCenterBtn * dongwangmoneylb;
@property(nonatomic,strong) DongwangMyCenterBtn * dongwangjifenlb;
@property(nonatomic,strong) UIButton * DongwangautorStateBtn;
@end
@implementation DongwangMyHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView * DongwangTopBackImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,K(169+0)+StatuBar_Height)];
        DongwangTopBackImgView.userInteractionEnabled = YES;
        DongwangTopBackImgView.image = [UIImage imageNamed:kIs_iPhoneX ? @"huang" : @"huang"];
        [self addSubview:DongwangTopBackImgView];
        
        
        UIImageView * DongwangBackImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(10), K(79)+StatuBar_Height, K(341+15), K(158.5+0))];
        DongwangBackImgView.image = [UIImage imageNamed:@"区头背景"];
        DongwangBackImgView.userInteractionEnabled = YES;
        [self addSubview:DongwangBackImgView];
        _DongwangBackImgView = DongwangBackImgView;
        [DongwangBackImgView addSubview:self.DongwanguserImgView];
        [DongwangBackImgView addSubview:self.DongwangClanderBtn];
        [DongwangBackImgView addSubview:self.DongwangNamelb];
        
        UIButton * DongwangsetingBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-RealWidth(21+10), StatuBar_Height+RealWidth(10), RealWidth(21), RealWidth(21))];
        [DongwangsetingBtn setEnlargeEdgeWithTop:10 right:10 bottom:10 left:10];
        [DongwangsetingBtn setBackgroundImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
        [DongwangsetingBtn setBackgroundImage:[UIImage imageNamed:@"设置"] forState:UIControlStateHighlighted];
        [DongwangsetingBtn addTarget:self action:@selector(DongwangsetingBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [DongwangTopBackImgView addSubview:DongwangsetingBtn];
        
        UIButton * DongwangmsgBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(DongwangsetingBtn.frame)-RealWidth(21+18), StatuBar_Height+RealWidth(11), RealWidth(19), RealWidth(19))];
        [DongwangmsgBtn setEnlargeEdgeWithTop:10 right:10 bottom:10 left:10];
        [DongwangmsgBtn setBackgroundImage:[UIImage imageNamed:@"消息"] forState:UIControlStateNormal];
        [DongwangmsgBtn setBackgroundImage:[UIImage imageNamed:@"消息"] forState:UIControlStateHighlighted];
        [DongwangmsgBtn addTarget:self action:@selector(DongwangmsgBtnClicks) forControlEvents:UIControlEventTouchUpInside];
        [DongwangTopBackImgView addSubview:DongwangmsgBtn];
        
        UIButton * DongwangbackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [DongwangbackBtn sizeToFit];
        DongwangbackBtn.origin = CGPointMake(RealWidth(15), StatuBar_Height+RealWidth(3));
        [DongwangbackBtn setImage:[UIImage imageNamed:@"btn_back_white"] forState:UIControlStateNormal];
        [DongwangbackBtn setEnlargeEdgeWithTop:10 right:10 bottom:10 left:10];
        [DongwangbackBtn addTarget:self action:@selector(DongwangbackBtnClicks) forControlEvents:UIControlEventTouchUpInside];
        [DongwangTopBackImgView addSubview:DongwangbackBtn];


        
        // 未认证
        UIButton * DongwangautorStateBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_DongwanguserImgView.frame)+K(7), CGRectGetMaxY(_DongwangNamelb.frame)+K(7), K(66), K(18))];
        [DongwangautorStateBtn setImage:[UIImage imageNamed:@"已认证"] forState:UIControlStateNormal];
        [DongwangautorStateBtn addTarget:self action:@selector(DongwangautorStateBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [DongwangBackImgView addSubview:DongwangautorStateBtn];
        _DongwangautorStateBtn = DongwangautorStateBtn;


        [DongwangBackImgView addSubview:self.dongwangmoneylb];
        [DongwangBackImgView addSubview:self.dongwangjifenlb];

        UIView * Dongwangline = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangBackImgView.frame)/2, K(95), K(1), K(32))];
        Dongwangline.backgroundColor =  LGDLightGaryColor;
        [DongwangBackImgView addSubview:Dongwangline];

        self.MyHeaderHeight =  CGRectGetMaxY(DongwangBackImgView.frame)+K(25);
        
    }
    return self;
}
#pragma mark--返回
-(void)DongwangbackBtnClicks{
    [self.delegate DongwangMyHeaderVieback];
}
#pragma mark--设置
-(void)DongwangsetingBtnClick{
    [self.delegate DongwangMyHeaderViewpushtoSettingVc];
}
#pragma makr--消息
-(void)DongwangmsgBtnClicks{
    [self.delegate DongwangMyHeaderViewpushToMsgVc];
}
-(DongwangMyCenterBtn *)dongwangmoneylb{
    if (!_dongwangmoneylb) {
        _dongwangmoneylb = [[DongwangMyCenterBtn alloc]initWithFrame:CGRectMake(0, K(85), CGRectGetWidth(_DongwangBackImgView.frame)/2, K(50))];
        _dongwangmoneylb.DongwangBtomlb.text = @"我的余额(元)";
        _dongwangmoneylb.DongwangToplb.text = @"-.-";
        _dongwangmoneylb.tag = 0;
        [_dongwangmoneylb addTarget:self action:@selector(DongwangMyCenterBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dongwangmoneylb;
}
-(DongwangMyCenterBtn *)dongwangjifenlb{
    if (!_dongwangjifenlb) {
        _dongwangjifenlb= [[DongwangMyCenterBtn alloc]initWithFrame:CGRectMake(CGRectGetWidth(_DongwangBackImgView.frame)/2, K(85), CGRectGetWidth(_DongwangBackImgView.frame)/2, K(50))];
        _dongwangjifenlb.DongwangBtomlb.text = @"我的积分";
        _dongwangjifenlb.DongwangToplb.text =  @"-.-";
        _dongwangjifenlb.tag = 1;
        [_dongwangjifenlb addTarget:self action:@selector(DongwangMyCenterBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dongwangjifenlb;
}
-(void)DongwangMyCenterBtnClick:(DongwangMyCenterBtn *)dongwangBtn{
    [self.delegate DongwangMyHeaderViewMyCenterBtnClicksWithIndex:dongwangBtn.tag];
}
#pragma mark--认证状态
-(void)DongwangautorStateBtnClick{
    [self.delegate DongwangMyHeaderViewAutorClicks];
}
-(UILabel *)DongwangNamelb{
    if (!_DongwangNamelb) {
        _DongwangNamelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_DongwanguserImgView.frame)+K(7), CGRectGetMidY(_DongwanguserImgView.frame)-K(21), K(180), K(19.5))];
        _DongwangNamelb.lineBreakMode =  NSLineBreakByTruncatingMiddle;
        _DongwangNamelb.textColor = [UIColor  whiteColor];
        _DongwangNamelb.font =  KBlFont(font(20));
        _DongwangNamelb.userInteractionEnabled = YES;
        _DongwangNamelb.text = @"";
        
        UITapGestureRecognizer * DongwantnameTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangNamelbClick)];
        [_DongwangNamelb addGestureRecognizer:DongwantnameTap];
    }
    return _DongwangNamelb;
}
#pragma mark--签到
-(void)DongwangClanderBtnClick{
    [self.delegate DongwangMyHeaderViewSingQiandao];
}
-(UIButton *)DongwangClanderBtn{
    if (!_DongwangClanderBtn) {
        _DongwangClanderBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(_DongwangBackImgView.frame)-RealWidth(69), RealWidth(15), RealWidth(59), RealWidth(24))];
        [_DongwangClanderBtn setEnlargeEdgeWithTop:RealWidth(15) right:RealWidth(15) bottom:RealWidth(15) left:RealWidth(15)];
        [_DongwangClanderBtn setBackgroundImage:[UIImage imageNamed:@"签到"] forState:UIControlStateNormal];
        [_DongwangClanderBtn setBackgroundImage:[UIImage imageNamed:@"签到"] forState:UIControlStateHighlighted];
        _DongwangClanderBtn.adjustsImageWhenHighlighted = NO;
        [_DongwangClanderBtn addTarget:self action:@selector(DongwangClanderBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _DongwangClanderBtn;
}
-(UIImageView *)DongwanguserImgView{
    if (!_DongwanguserImgView) {
        _DongwanguserImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(30), K(15), K(60), K(60))];
        _DongwanguserImgView.layer.cornerRadius = K(30);
        _DongwanguserImgView.layer.masksToBounds = YES;
        _DongwanguserImgView.layer.borderColor= LGDLightGaryColor.CGColor;
        _DongwanguserImgView.layer.borderWidth = K(1);
        _DongwanguserImgView.image = [UIImage imageNamed:@"头像0"];
        _DongwanguserImgView.userInteractionEnabled = YES;
        UITapGestureRecognizer * DongwangInfoTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangInfoTapClicks)];
        [_DongwanguserImgView addGestureRecognizer:DongwangInfoTap];
    }
    return _DongwanguserImgView;
}
-(void)DongwangInfoTapClicks{
    [self.delegate DongwangMyHeaderViewPushInfoVc];
}
-(void)setInfo:(UserInfo *)info{
    _info = info;
    _dongwangmoneylb.DongwangToplb.text = [NSString stringWithFormat:@"%.2f",[info.currentBalance floatValue]];
    _dongwangjifenlb.DongwangToplb.text = [NSString stringWithFormat:@"%.f",[info.myIntegral floatValue]];
    if (info.nickName.length == 0) {
    _DongwangNamelb.text = [NSString numberPhoneSuitScanf:[NSString stringWithFormat:@"%@",info.phone] strRange:NSMakeRange(3, 4)];
    }else{
        _DongwangNamelb.text =  info.nickName;
    }
    NSString  * headeID = [NSString stringWithFormat:@"%@",info.headId];
    _DongwanguserImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"头像%@",headeID.length == 0 ? @"0" :headeID]];
    ////实名状态 0-未认证 1- 已认证 2-审核中 3- 未通过
    if ([[NSString stringWithFormat:@"%@",info.certification] isEqualToString:@"1"]) {
        //已认证
    [_DongwangautorStateBtn setImage:[UIImage imageNamed:@"已认证"] forState:UIControlStateNormal];
    }else{
    //未认证
    [_DongwangautorStateBtn setImage:[UIImage imageNamed:@"未认证"] forState:UIControlStateNormal];
    }
}
-(void)DongwangNamelbClick{
    [self.delegate DongwangMyHeaderViewPushInfoVc];

}
@end
