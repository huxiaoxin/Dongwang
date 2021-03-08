//
//  DongwangMyFooter.m
//  DongWang
//
//  Created by sycm on 2021/3/5.
//

#import "DongwangMyFooter.h"

@implementation DongwangMyFooter
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        UIImageView * cirleBackImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(10), RealWidth(10), SCREEN_Width-RealWidth(45), RealWidth(60))];
        cirleBackImgView.image = [UIImage imageNamed:@"足球圈1"];
        cirleBackImgView.userInteractionEnabled = YES;
        [self addSubview:cirleBackImgView];
        
        UILabel * DongwngAtch = [[UILabel alloc]initWithFrame:CGRectMake(0, RealWidth(20), CGRectGetWidth(cirleBackImgView.frame), RealWidth(20))];
        DongwngAtch.textAlignment = NSTextAlignmentCenter;
        DongwngAtch.font = PFR14Font;
        DongwngAtch.textColor = [UIColor whiteColor];
        [cirleBackImgView addSubview:DongwngAtch];
        
        
        NSTextAttachment * ament = [[NSTextAttachment alloc]init];
        ament.image = [UIImage imageNamed:@"add"];
        ament.bounds =CGRectMake(0, -2, RealWidth(15), RealWidth(15));
        NSAttributedString * atbur = [NSAttributedString attributedStringWithAttachment:ament];
        NSMutableAttributedString * attbure =[[NSMutableAttributedString alloc]initWithString:@"  更多圈子"];
        [attbure insertAttributedString:atbur atIndex:0];
        DongwngAtch.attributedText = attbure;
    }
    return self;
}
@end
