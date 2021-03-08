//
//  DongwangSendChatTopView.m
//  DongWang
//
//  Created by sycm on 2021/3/2.
//

#import "DongwangSendChatTopView.h"
@interface DongwangSendChatTopView ()

@end
@implementation DongwangSendChatTopView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithHexString:@"#3D156F"];
//        [UIColor colorWithHexString:@"#333333" Alpha:0.6];
        
        UIView *  ContentView = [[UIView alloc]initWithFrame:CGRectMake(0, RealWidth(10), SCREEN_WIDTH, RealWidth(44))];
        ContentView.backgroundColor = [UIColor colorWithHexString:@"#410093"];
        [self addSubview:ContentView];
        
        UIImageView * leftImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(15), RealWidth(12), RealWidth(20), RealWidth(20))];
        leftImgView.image = [UIImage imageNamed:@"相片"];
        [ContentView addSubview:leftImgView];
        
        UILabel * leftlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftImgView.frame)+RealWidth(10), CGRectGetMidY(leftImgView.frame)-RealWidth(8), RealWidth(200), RealWidth(16))];
        leftlb.textColor =[UIColor whiteColor];
        leftlb.font = PFR12Font;
        leftlb.text = @"选择圈子";
        [ContentView addSubview:leftlb];
        
        UIImageView * rightImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-RealWidth(20), RealWidth(14), RealWidth(8), RealWidth(15))];
        rightImgView.image = [UIImage imageNamed:@"Fill2"];
        [ContentView addSubview:rightImgView];
        
        UITapGestureRecognizer * ContentTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ContentTapClicks)];
        
        [ContentView addGestureRecognizer:ContentTap];
    }
    return self;
}
-(void)ContentTapClicks{
    [self.delegate DongwangSendChatTopViewDidTap];
}
@end
