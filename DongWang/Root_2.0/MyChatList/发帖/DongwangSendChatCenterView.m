//
//  DongwangSendChatCenterView.m
//  DongWang
//
//  Created by sycm on 2021/3/2.
//

#import "DongwangSendChatCenterView.h"
#import "UITextView+WZB.h"
@interface DongwangSendChatCenterView ()

@end
@implementation DongwangSendChatCenterView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.TopTextField];
        UIView * DongwangLine = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_TopTextField.frame), SCREEN_WIDTH, RealWidth(1))];
        DongwangLine.backgroundColor = [UIColor whiteColor];
        [self addSubview:DongwangLine];
        [self addSubview:self.ContentTextView];
        self.CenterHeight = CGRectGetMaxY(_ContentTextView.frame)+RealWidth(5);
        MJWeakSelf;
        [_ContentTextView wzb_autoHeightWithMaxHeight:MAXFLOAT textViewHeightDidChanged:^(CGFloat currentTextViewHeight) {
            weakSelf.ContentTextView.height = currentTextViewHeight;
            weakSelf.CenterHeight = CGRectGetMaxY(self->_ContentTextView.frame)+RealWidth(5);
            [weakSelf.delegate DongwangSendChatCenterViewUpdateFrame];
        }];
    }
    return self;
}
-(UITextField *)TopTextField{
    if (!_TopTextField) {
        _TopTextField = [[UITextField alloc]initWithFrame:CGRectMake(RealWidth(10), 0, SCREEN_WIDTH-RealWidth(20), RealWidth(40))];
        _TopTextField.font = PFR15Font;
        _TopTextField.textColor =[UIColor whiteColor];
        [_TopTextField addPlaceholders:PFR13Font holderStr:@"这个帖子距离爆火就差一个标题了" holderColor:[UIColor whiteColor]];
    }
    return _TopTextField;
}
-(UITextView *)ContentTextView{
    if (!_ContentTextView) {
        _ContentTextView = [[UITextView alloc]initWithFrame:CGRectMake(RealWidth(10), CGRectGetMaxY(_TopTextField.frame)+RealWidth(10), SCREEN_WIDTH-RealWidth(20), RealWidth(37))];
        _ContentTextView.wzb_placeholder = @"分享内容";
        _ContentTextView.wzb_placeholderColor =[UIColor whiteColor];
        _ContentTextView.font = PFR14Font;
        _ContentTextView.backgroundColor = [UIColor clearColor];
        _ContentTextView.textColor = [UIColor whiteColor];
        
    }
    return _ContentTextView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
