//
//  DongwangMyMallView.m
//  DongWang
//
//  Created by codehzx on 2020/12/7.
//

#import "DongwangMyMallView.h"
@interface DongwangMyMallView ()
@property(nonatomic,strong) UIView * DongwangBJView;
@end
@implementation DongwangMyMallView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIView * DongwangBjView = [[UIView alloc]initWithFrame:CGRectMake(K(48), K(139)+StatuBar_Height, SCREEN_WIDTH-K(96), K(157))];
        DongwangBjView.backgroundColor  = [UIColor whiteColor];
        [self addSubview:DongwangBjView];
        
        
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
