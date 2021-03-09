//
//  DongwangCireinfoSectionFooter.m
//  DongWang
//
//  Created by sycm on 2021/3/9.
//

#import "DongwangCireinfoSectionFooter.h"
@interface DongwangCireinfoSectionFooter ()
@property(nonatomic,strong) UIButton * openBtn;
@end
@implementation DongwangCireinfoSectionFooter
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.openBtn];
    }
    return self;
}
-(UIButton *)openBtn{
    if (!_openBtn) {
        _openBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-RealWidth(40), RealWidth(0), RealWidth(13), RealWidth(10))];
        [_openBtn setEnlargeEdgeWithTop:5 right:10 bottom:5 left:10];
        [_openBtn setBackgroundImage:[UIImage imageNamed:@"jiantou_down"] forState:UIControlStateNormal];
        [_openBtn setBackgroundImage:[UIImage imageNamed:@"jiantou_up"] forState:UIControlStateSelected];

        //jiantou_up
        [_openBtn addTarget:self action:@selector(openBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _openBtn;
}
-(void)openBtnClick:(UIButton *)openBtn{
    openBtn.selected = !openBtn.selected;
}
@end
