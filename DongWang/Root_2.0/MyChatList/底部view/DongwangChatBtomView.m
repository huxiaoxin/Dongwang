//
//  DongwangChatBtomView.m
//  DongWang
//
//  Created by sycm on 2021/3/4.
//

#import "DongwangChatBtomView.h"
@interface DongwangChatBtomView ()
@property(nonatomic,strong) UIButton * sendPhotoBtn;
@property(nonatomic,strong) UIButton * sednemojinBtn;
@property(nonatomic,strong) UIButton * sendtieziBtn;
@end
@implementation DongwangChatBtomView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithHexString:@"#8767E9"];
        
         [self addSubview:self.sendPhotoBtn];
        [self  addSubview:self.sednemojinBtn];
        [self addSubview:self.sendtieziBtn];
        
    }
    return self;
}
-(UIButton *)sendtieziBtn{
    if (!_sendtieziBtn) {
        _sendtieziBtn =[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_sednemojinBtn.frame)+RealWidth(30), CGRectGetHeight(self.frame)/2-RealWidth(13.5), SCREEN_WIDTH-CGRectGetMaxX(_sednemojinBtn.frame)-RealWidth(40), RealWidth(27))];
        _sendtieziBtn.tag = 0 ;
        [_sendtieziBtn setBackgroundImage:[UIImage imageNamed:@"fabubtn"] forState:UIControlStateNormal];
        [_sendtieziBtn setTitle:@"发布" forState:UIControlStateNormal];
        _sendtieziBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _sendtieziBtn.titleLabel.font = PFR15Font;
        [_sendtieziBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _sendtieziBtn.adjustsImageWhenHighlighted =NO;
        [_sendtieziBtn addTarget:self action:@selector(sendtieziBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendtieziBtn;
}
-(UIButton *)sednemojinBtn{
    if (!_sednemojinBtn) {
        _sednemojinBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_sendPhotoBtn.frame)+RealWidth(30), CGRectGetHeight(self.frame)/2-RealWidth(12.5), RealWidth(25), RealWidth(25))];
        _sednemojinBtn.tag = 1;
        [_sednemojinBtn setBackgroundImage:[UIImage imageNamed:@"表情"] forState:UIControlStateNormal];
        _sednemojinBtn.adjustsImageWhenHighlighted = NO;
        [_sednemojinBtn addTarget:self action:@selector(sendemojinbtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _sednemojinBtn;
}
-(UIButton *)sendPhotoBtn{
    if (!_sendPhotoBtn) {
        _sendPhotoBtn = [[UIButton alloc]initWithFrame:CGRectMake(RealWidth(16), CGRectGetHeight(self.frame)/2-RealWidth(12.5), RealWidth(25), RealWidth(25))];
        _sendPhotoBtn.tag =2;
        [_sendPhotoBtn setBackgroundImage:[UIImage imageNamed:@"相片-1"] forState:UIControlStateNormal];
        _sendPhotoBtn.adjustsImageWhenHighlighted =NO;
        [_sendPhotoBtn addTarget:self action:@selector(sendphotobtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _sendPhotoBtn;
}
//图片
-(void)sendphotobtnClick{
    [self.delegate DongwangChatBtomViewWithBtnClickIndex:2];
}
//表情
-(void)sendemojinbtnClick{
    [self.delegate DongwangChatBtomViewWithBtnClickIndex:1];

}
-(void)sendtieziBtnClick{
    [self.delegate DongwangChatBtomViewWithBtnClickIndex:0];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
