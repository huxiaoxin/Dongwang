//
//  DongwangCirelCenterHeader.m
//  DongWang
//
//  Created by sycm on 2021/3/9.
//

#import "DongwangCirelCenterHeader.h"
#import "DongwangCirleTopinfoView.h"
#import "DongwangCirelCenterInfoView.h"
@interface DongwangCirelCenterHeader ()
@property(nonatomic,strong) DongwangCirleTopinfoView * topinfoView;
@property(nonatomic,strong) DongwangCirelCenterInfoView * centerInfoView;
@end
@implementation DongwangCirelCenterHeader
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.topinfoView];
        [self addSubview:self.centerInfoView];
    }
    return self;
}
-(DongwangCirleTopinfoView *)topinfoView{
    if (!_topinfoView) {
        _topinfoView = [[DongwangCirleTopinfoView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, StatuBar_Height+RealWidth(159))];
    }
    return _topinfoView;
}
- (DongwangCirelCenterInfoView *)centerInfoView{
    if (!_centerInfoView) {
        _centerInfoView = [[DongwangCirelCenterInfoView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_topinfoView.frame)+RealWidth(15), SCREEN_WIDTH, RealWidth(80))];
    }
    return _centerInfoView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
