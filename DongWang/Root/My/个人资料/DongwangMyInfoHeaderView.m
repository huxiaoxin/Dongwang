//
//  DongwangMyInfoHeaderView.m
//  DongWang
//
//  Created by codehzx on 2020/11/6.
//

#import "DongwangMyInfoHeaderView.h"
@interface DongwangMyInfoHeaderView ()
{
    UIImageView * _DongwangInfoImgView;
}
@end
@implementation DongwangMyInfoHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        
        UIImageView * DongwangChangeIconView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-RealWidth(97), 0, RealWidth(194), RealWidth(130))];
        DongwangChangeIconView.image = [UIImage imageNamed:@"changeicon"];
        DongwangChangeIconView.userInteractionEnabled = YES;
        [self addSubview:DongwangChangeIconView];
        
        UITapGestureRecognizer * DongwanginfoTa1p = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangInfoTapClicks)];
        [DongwangChangeIconView addGestureRecognizer:DongwanginfoTa1p];
        
        
        
        
        NSString  * headeID = [NSString stringWithFormat:@"%@",[UserManager userInfo].headId];
        UIImageView * DongwangInfoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(65), K(30), K(60), K(60))];
        DongwangInfoImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"头像%@",headeID.length == 0 ? @"0" :headeID]];
        DongwangInfoImgView.userInteractionEnabled = YES;
        DongwangInfoImgView.layer.cornerRadius = K(30);
        DongwangInfoImgView.layer.masksToBounds = YES;
        DongwangInfoImgView.layer.borderColor = LGDLightGaryColor.CGColor;
        DongwangInfoImgView.layer.borderWidth = K(1);
        [DongwangChangeIconView addSubview:DongwangInfoImgView];
        _DongwangInfoImgView = DongwangInfoImgView;
        
        UITapGestureRecognizer * DongwanginfoTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangInfoTapClicks)];
        [DongwangInfoImgView addGestureRecognizer:DongwanginfoTap];
        
        UILabel * DongwangRightTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, K(10)+CGRectGetMaxY(DongwangInfoImgView.frame), SCREEN_WIDTH, K(15))];
        DongwangRightTitle.textColor = [UIColor colorWithHexString:@"#999999"];
        DongwangRightTitle.font = KSysFont(font(11));
        DongwangRightTitle.text = @"点击修改头像";
        DongwangRightTitle.textAlignment = NSTextAlignmentCenter;
//        [self addSubview:DongwangRightTitle];

    }
    return self;
}
-(void)setInfo:(UserInfo *)info{
    _info = info;
    NSString  * headeID = [NSString stringWithFormat:@"%@",info.headId];
    _DongwangInfoImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"头像%@",headeID.length == 0 ? @"0" :headeID]];

}
-(void)DongwangInfoTapClicks{
    [self.delegate DongwangMyInfoHeaderViewChangeuserinfoImg];
}
@end
