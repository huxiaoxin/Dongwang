//
//  DongwangMyChatSendToolView.m
//  DongWang
//
//  Created by sycm on 2021/3/5.
//

#import "DongwangMyChatSendToolView.h"
#import "UITextView+WZB.h"
@interface DongwangMyChatSendToolView ()
@property(nonatomic,strong) UIButton * zanBtn;
@end
@implementation DongwangMyChatSendToolView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor =[UIColor colorWithHexString:@"#8767E9"];
        [self addSubview:self.ContentTextView];
        [self addSubview:self.zanBtn];
        
        self.ToolViewHeight = CGRectGetMaxY(_ContentTextView.frame)+RealWidth(15);
        MJWeakSelf;
        [_ContentTextView wzb_autoHeightWithMaxHeight:MAXFLOAT textViewHeightDidChanged:^(CGFloat currentTextViewHeight) {
            weakSelf.ContentTextView.height = currentTextViewHeight;
            weakSelf.zanBtn.y = CGRectGetMidY(weakSelf.ContentTextView.frame)-RealWidth(9);
            self->_ContentTextView.layer.cornerRadius = currentTextViewHeight/2;
            self->_ContentTextView.layer.masksToBounds = YES;
            weakSelf.ToolViewHeight = CGRectGetMaxY(self->_ContentTextView.frame)+RealWidth(15);
            [weakSelf.delegate DongwangMyChatSendToolViewUpdateFrame];
        }];

    }
    return self;
}
-(UIButton *)zanBtn{
    if (!_zanBtn) {
        _zanBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_ContentTextView.frame)+RealWidth(40), CGRectGetMidY(_ContentTextView.frame)-RealWidth(9), RealWidth(20), RealWidth(18))];
        [_zanBtn setBackgroundImage:[UIImage imageNamed:@"zan_btn"] forState:UIControlStateNormal];
    }
    return _zanBtn;
}
-(UITextView *)ContentTextView{
    if (!_ContentTextView) {
        _ContentTextView = [[UITextView alloc]initWithFrame:CGRectMake(RealWidth(10), RealWidth(15), SCREEN_WIDTH-RealWidth(79), RealWidth(29))];
        _ContentTextView.layer.cornerRadius = RealWidth(14.5);
        _ContentTextView.layer.masksToBounds = YES;
        _ContentTextView.wzb_placeholder = @"分享内容";
        _ContentTextView.textColor = [UIColor blackColor];
        _ContentTextView.wzb_placeholderColor =[UIColor colorWithHexString:@"#999999"];
        _ContentTextView.font = PFR14Font;
        _ContentTextView.backgroundColor = [UIColor colorWithHexString:@"#DEDEDE"];
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
