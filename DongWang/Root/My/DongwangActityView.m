//
//  DongwangActityView.m
//  DongWang
//
//  Created by codehzx on 2020/11/18.
//

#import "DongwangActityView.h"

@implementation DongwangActityView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView * DongwangDragImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, K(86), K(74.5))];
        DongwangDragImgView.image = [UIImage imageNamed:@"悬浮窗"];
        [self addSubview:DongwangDragImgView];
    }
    return self;
}
@end
