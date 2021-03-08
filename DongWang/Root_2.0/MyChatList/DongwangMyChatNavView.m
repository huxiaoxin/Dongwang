//
//  DongwangMyChatNavView.m
//  DongWang
//
//  Created by sycm on 2021/3/1.
//

#import "DongwangMyChatNavView.h"

@implementation DongwangMyChatNavView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithHexString:@"#410093"];
        UIView * DongwnagSeachingVIew = [[UIView alloc]initWithFrame:CGRectMake(RealWidth(15), StatuBar_Height+RealWidth(5), RealWidth(275), RealWidth(25))];
        DongwnagSeachingVIew.backgroundColor = [UIColor colorWithHexString:@"#DEDEDE" Alpha:0.6];
        DongwnagSeachingVIew.layer.cornerRadius = RealWidth(12.5);
        DongwnagSeachingVIew.layer.masksToBounds =YES;
        [self addSubview:DongwnagSeachingVIew];
        
        UIImageView * DongwnagSeachImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(53), RealWidth(5), RealWidth(16), RealWidth(16))];
        DongwnagSeachImgView.image = [UIImage imageNamed:@"sousuo"];
        [DongwnagSeachingVIew addSubview:DongwnagSeachImgView];
        
        UILabel * DongwangSeachlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwnagSeachImgView.frame)+RealWidth(10), CGRectGetMidY(DongwnagSeachImgView.frame)-RealWidth(7), RealWidth(200), RealWidth(14))];
        DongwangSeachlb.text = @"搜索圈子、圈友或内容";
        DongwangSeachlb.textColor = [UIColor colorWithHexString:@"#DEDEDE"];
        DongwangSeachlb.font = PFR13Font;
        [DongwnagSeachingVIew addSubview:DongwangSeachlb];
        //fatie
        
        UIButton * DongwnagSendBtn =  [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwnagSeachingVIew.frame)+RealWidth(10), CGRectGetMidY(DongwnagSeachingVIew.frame)-RealWidth(12), RealWidth(55), RealWidth(25))];
        [DongwnagSendBtn setBackgroundImage:[UIImage imageNamed:@"fatie"] forState:UIControlStateNormal];
        DongwnagSendBtn.adjustsImageWhenHighlighted = NO;
        DongwnagSendBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [DongwnagSendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [DongwnagSendBtn setTitle:@"发帖" forState:UIControlStateNormal];
        DongwnagSendBtn.titleLabel.font = PFR13Font;
        [DongwnagSendBtn addTarget:self action:@selector(DongwangSendBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:DongwnagSendBtn];
        
            
        
    }
    return self;
}
#pragma mark--发帖
-(void)DongwangSendBtnClick{
    [self.Delegate DongwangMyChatNavViewDelegateSendChatAction];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
