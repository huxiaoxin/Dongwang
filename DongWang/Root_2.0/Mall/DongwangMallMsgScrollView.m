//
//  DongwangMallMsgScrollView.m
//  DongWang
//
//  Created by codehzx on 2021/1/7.
//

#import "DongwangMallMsgScrollView.h"
#import "SGAdvertScrollView.h"
#import "UIVerticalLoopView.h"
#import <UIImage+GIF.h>
@interface DongwangMallMsgScrollView ()<VerticalLoopDelegate>
@property(nonatomic,strong) SGAdvertScrollView * SGMsgView;
@property(nonatomic,strong) UIImageView * MsgImgView;
@property(nonatomic,strong) UIVerticalLoopView * LoopView;
@property(nonatomic,strong) UIImageView * DongwangBjImgView;
@end
@implementation DongwangMallMsgScrollView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
     
//        CAGradientLayer *gradient = [CAGradientLayer layer];
//        gradient.frame = self.bounds;
//        gradient.colors = @[(id)[UIColor colorWithRed:59/255.0 green:0/255.0 blue:139/255.0 alpha:0.66].CGColor,(id)[UIColor colorWithRed:30/255.0 green:12/255.0 blue:47/255.0 alpha:0.66].CGColor];
//        gradient.startPoint = CGPointMake(0.5, 0);
//        gradient.endPoint = CGPointMake(0.5, 1);
//        gradient.locations = @[@(0), @(1.0f)];
//        self.layer.cornerRadius = 4;
//        [self.layer addSublayer:gradient];
        
        
        UIImageView * DongwangBjImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(5), 0, SCREEN_WIDTH-RealWidth(5), RealWidth(60))];
        DongwangBjImgView.image = [UIImage imageNamed:@"消息轮播背景"];
        [self addSubview:DongwangBjImgView];
        _DongwangBjImgView = DongwangBjImgView;
        
//        DongwangBjImgView.layer.shadowColor = [UIColor colorWithHexString:@"#40CAFF"].CGColor;//阴影颜色
//        DongwangBjImgView.layer.shadowOffset = CGSizeMake(5, 5);//偏移距离
//        DongwangBjImgView.layer.shadowOpacity = 1;//不透明度
//        DongwangBjImgView.layer.shadowRadius = 5.0;//半径

        
        
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"通知" ofType:@"gif"];
//        NSData *gifData = [NSData dataWithContentsOfFile:path];
        UIImageView * MsgImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(13), K(17.5+2), RealWidth(15), RealWidth(15))];
        MsgImgView.image = [UIImage imageNamed:@"通知"];
        [DongwangBjImgView addSubview:MsgImgView];
        _MsgImgView = MsgImgView;
        [_DongwangBjImgView addSubview:self.LoopView];

    }
    return self;
}
-(UIVerticalLoopView *)LoopView{
    if (!_LoopView) {
        _LoopView = [[UIVerticalLoopView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_MsgImgView.frame)+RealWidth(10), 0, CGRectGetWidth(_DongwangBjImgView.frame)-CGRectGetMaxX(_MsgImgView.frame)-RealWidth(10), RealWidth(50))];
        _LoopView.backgroundColor = [UIColor clearColor];
        _LoopView.loopDelegate = self;
        _LoopView.verticalLoopAnimationDuration = 1;
        _LoopView.Direction = VerticalLoopDirectionBottom;
    }
    return _LoopView;
}

-(SGAdvertScrollView *)SGMsgView{
    if (!_SGMsgView) {
        _SGMsgView = [[SGAdvertScrollView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_MsgImgView.frame)+RealWidth(10), RealWidth(26.5), CGRectGetWidth(self.frame)-CGRectGetMaxX(_MsgImgView.frame)-RealWidth(20), RealWidth(20))];
        _SGMsgView.backgroundColor = [UIColor clearColor];
    }
    return _SGMsgView;
}
-(void)setMsgArr:(NSMutableArray *)MsgArr{
    _MsgArr = MsgArr;
    _SGMsgView.titles = MsgArr;
    _LoopView.verticalLoopContentArr = MsgArr;
    [_LoopView start];


}
#pragma mark--VerticalLoopDelegate
- (void)didClickContentAtIndex:(NSInteger)index{
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
