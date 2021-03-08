//
//  DongwangTieziBianJiView.m
//  DongWang
//
//  Created by codehzx on 2021/3/8.
//

#import "DongwangTieziBianJiView.h"
#import "DongwangTieziBtn.h"
@interface DongwangTieziBianJiView ()
@property(nonatomic,strong) UIView * contentView;
@property(nonatomic,strong) UIButton * cancleBtn;
@property(nonatomic,strong) DongwangTieziBtn * zhidingBtn;
@property(nonatomic,strong) DongwangTieziBtn * deleteBtn;
@end
@implementation DongwangTieziBianJiView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.contentView];
        [_contentView addSubview:self.cancleBtn];
        
        [_contentView addSubview:self.zhidingBtn];
        [_contentView addSubview:self.deleteBtn];
    }
    return self;
}
-(DongwangTieziBtn *)deleteBtn{
    if (!_deleteBtn) {
        _deleteBtn = [[DongwangTieziBtn alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_cancleBtn.frame)-RealWidth(70), RealWidth(19), RealWidth(70), RealWidth(80))];
        _deleteBtn.btomlb.text = @"删除帖子";
        _deleteBtn.topImgView.image = [UIImage imageNamed:@"shanchutiezi"];
        _deleteBtn.tag = 1;
        [_deleteBtn addTarget:self action:@selector(DongwangTieziBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _deleteBtn;
}
-(DongwangTieziBtn *)zhidingBtn{
    if (!_zhidingBtn) {
        _zhidingBtn  = [[DongwangTieziBtn alloc]initWithFrame:CGRectMake(CGRectGetMinX(_cancleBtn.frame), RealWidth(19), RealWidth(70), RealWidth(80))];
        _zhidingBtn.btomlb.text = @"取消置顶";
        _zhidingBtn.topImgView.image = [UIImage imageNamed:@"quxiaozhiding"];
        _zhidingBtn.tag = 0;
        [_zhidingBtn addTarget:self action:@selector(DongwangTieziBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _zhidingBtn;
}
-(UIButton *)cancleBtn{
    if (!_cancleBtn) {
        _cancleBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-RealWidth(109), RealWidth(101), RealWidth(219), RealWidth(27))];
        [_cancleBtn setBackgroundImage:[UIImage imageNamed:@"canclebtn"] forState:UIControlStateNormal];
        [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        _cancleBtn.titleLabel.textAlignment =  NSTextAlignmentCenter;
        [_cancleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _cancleBtn.titleLabel.font = PFR13Font;
        [_cancleBtn addTarget:self action:@selector(cancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancleBtn;
}
-(void)cancleBtnClick{
    MJWeakSelf;
    [UIView animateWithDuration:0.3 animations:^{
    weakSelf.contentView.frame = CGRectMake(0, SCREEN_HEIGHT+RealWidth(149), SCREEN_WIDTH, RealWidth(149));
   weakSelf.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
    [self.delegate DongwangTieziBianJiViewhiden];
    [self removeFromSuperview];
    }];
}
-(UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]initWithFrame:CGRectZero];
        _contentView.backgroundColor = [UIColor colorWithHexString:@"#A478DB"];
    }
    return _contentView;
}
-(void)ShowView{
    MJWeakSelf;
    [[AppDelegate getAppDelegate].window addSubview:self];
    _contentView.frame = CGRectMake(0, SCREEN_HEIGHT+RealWidth(149), SCREEN_WIDTH, RealWidth(149));
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.contentView.y =  SCREEN_HEIGHT-RealWidth(149);
        weakSelf.backgroundColor = [UIColor colorWithHexString:@"#333333" Alpha:0.8];
    } completion:^(BOOL finished) {
    }];
    
    
}
-(void)DongwangTieziBtnClick:(DongwangTieziBtn * )tieziBtn{
    [self.delegate DongwangTieziBianJiViewWithBtnIndex:tieziBtn.tag];
    [self cancleBtnClick];
}
@end
