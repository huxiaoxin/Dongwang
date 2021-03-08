//
//  DongwangTieziBianJiView.m
//  DongWang
//
//  Created by codehzx on 2021/3/8.
//

#import "DongwangTieziBianJiView.h"
@interface DongwangTieziBianJiView ()
@property(nonatomic,strong) UIView * contentView;
@end
@implementation DongwangTieziBianJiView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.contentView];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapClicks)];
        [self addGestureRecognizer:tap];
    }
    return self;
}
-(void)viewTapClicks{
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

@end
