//
//  DongwangMyInfoHeaderView.m
//  DongWang
//
//  Created by codehzx on 2020/11/6.
//

#import "DongwangMyInfoHeaderView.h"
@interface DongwangMyInfoHeaderView ()

@end
@implementation DongwangMyInfoHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        
        UIImageView * DongwangInfoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-K(37.5), 0, K(75), K(75))];
        DongwangInfoImgView.image = [UIImage imageNamed:@"占位头像"];
        DongwangInfoImgView.userInteractionEnabled = YES;
        [self addSubview:DongwangInfoImgView];
        UITapGestureRecognizer * DongwanginfoTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangInfoTapClicks)];
        [DongwangInfoImgView addGestureRecognizer:DongwanginfoTap];
        
        UILabel * DongwangRightTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, K(10)+CGRectGetMaxY(DongwangInfoImgView.frame), SCREEN_WIDTH, K(15))];
        DongwangRightTitle.textColor = [UIColor colorWithHexString:@"#999999"];
        DongwangRightTitle.font = KSysFont(font(11));
        DongwangRightTitle.text = @"点击修改头像";
        DongwangRightTitle.textAlignment = NSTextAlignmentCenter;
        [self addSubview:DongwangRightTitle];
        
    }
    return self;
}
-(void)DongwangInfoTapClicks{
    [self.delegate DongwangMyInfoHeaderViewChangeuserinfoImg];
}
@end
