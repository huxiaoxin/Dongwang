//
//  DongwangDaletouendingView.m
//  DongWang
//
//  Created by codehzx on 2021/1/27.
//

#import "DongwangDaletouendingView.h"
typedef void(^imgTapBlock)(void);

@interface DongwangDaletouendingView ()
@property(nonatomic,strong) UIImageView * dongwangbackImgView;
@property(nonatomic,copy) imgTapBlock tapblock;
@end
@implementation DongwangDaletouendingView
-(instancetype)initWithFrame:(CGRect)frame withImgtap:(void(^)(void))findblock{
    if (self = [super initWithFrame:frame]) {
        self.tapblock = findblock;
        UIImageView * dongwangbackImgView  =[[UIImageView alloc]initWithFrame:CGRectZero];
        dongwangbackImgView.userInteractionEnabled = YES;
        dongwangbackImgView.image = [UIImage imageNamed:@"daleto_end"];
        [self addSubview:dongwangbackImgView];
        _dongwangbackImgView = dongwangbackImgView;
        UITapGestureRecognizer * mytap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backImgTapClicks)];
        [dongwangbackImgView addGestureRecognizer:mytap];
        
    }
    return self;
}
-(void)backImgTapClicks{
    if (self.tapblock) {
        self.tapblock();
    }
}
-(void)layoutSubviews{
    _dongwangbackImgView.frame = self.bounds;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
