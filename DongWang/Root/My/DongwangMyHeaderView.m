//
//  DongwangMyHeaderView.m
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import "DongwangMyHeaderView.h"
@interface DongwangMyHeaderView ()
@property(nonatomic,strong) UIImageView *  DongwanguserImgView;
@property(nonatomic,strong) UIButton *  DongwangClanderBtn;
@end
@implementation DongwangMyHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView * DongwangBackImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(15), K(5.5), K(341), K(158.5))];
        DongwangBackImgView.image = [UIImage imageNamed:@"区头背景"];
        DongwangBackImgView.userInteractionEnabled = YES;
        [self addSubview:DongwangBackImgView];
        
        [DongwangBackImgView addSubview:self.DongwanguserImgView];
        [DongwangBackImgView addSubview:self.DongwangClanderBtn];
        
    }
    return self;
}
#pragma mark--签到
-(void)DongwangClanderBtnClick{
    NSLog(@"%s",__func__);
}
-(UIButton *)DongwangClanderBtn{
    if (!_DongwangClanderBtn) {
        _DongwangClanderBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(280), K(15.5), K(34.5), K(37))];
        [_DongwangClanderBtn setBackgroundImage:[UIImage imageNamed:@"签到"] forState:UIControlStateNormal];
        [_DongwangClanderBtn setBackgroundImage:[UIImage imageNamed:@"签到"] forState:UIControlStateHighlighted];
        _DongwangClanderBtn.adjustsImageWhenHighlighted = NO;
        [_DongwangClanderBtn addTarget:self action:@selector(DongwangClanderBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _DongwangClanderBtn;
}
-(UIImageView *)DongwanguserImgView{
    if (!_DongwanguserImgView) {
        _DongwanguserImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(20), K(8.5), K(80), K(80))];
        _DongwanguserImgView.image = [UIImage imageNamed:@"占位头像"];
        _DongwanguserImgView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer * DongwangInfoTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangInfoTapClicks)];
        [_DongwanguserImgView addGestureRecognizer:DongwangInfoTap];
    }
    return _DongwanguserImgView;
}
-(void)DongwangInfoTapClicks{
    [self.delegate DongwangMyHeaderViewPushInfoVc];
}
@end
