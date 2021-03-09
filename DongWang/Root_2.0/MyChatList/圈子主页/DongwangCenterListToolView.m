//
//  DongwangCenterListToolView.m
//  DongWang
//
//  Created by sycm on 2021/3/9.
//

#import "DongwangCenterListToolView.h"
#import "DongwangChatBtn.h"
@interface DongwangCenterListToolView ()
@property(nonatomic,strong) DongwangChatBtn * comentBtn;
@property(nonatomic,strong) DongwangChatBtn * ZanBtn;
@end
@implementation DongwangCenterListToolView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.comentBtn];
        [self addSubview:self.ZanBtn];
    }
    return self;
}
- (DongwangChatBtn *)ZanBtn{
    if (!_ZanBtn) {
        _ZanBtn = [[DongwangChatBtn alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-RealWidth(75+60), RealWidth(5), RealWidth(60), RealWidth(20))];
        _ZanBtn.leftImgView.image = [UIImage imageNamed:@"zan_btn"];
        _ZanBtn.rightlb.text = @"12";
    }
    return _ZanBtn;
}
- (DongwangChatBtn *)comentBtn{
    if (!_comentBtn) {
        _comentBtn =[[DongwangChatBtn alloc]initWithFrame:CGRectMake(RealWidth(80), RealWidth(5), RealWidth(60), RealWidth(20))];
        _comentBtn.leftImgView.image =[UIImage imageNamed:@"coment_btn"];
        _comentBtn.rightlb.text = @"12";
    }
    return _comentBtn;
}

@end
