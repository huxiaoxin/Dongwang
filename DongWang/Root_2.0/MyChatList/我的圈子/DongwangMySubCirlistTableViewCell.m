//
//  DongwangCirleListTableViewCell.m
//  DongWang
//
//  Created by sycm on 2021/3/4.
//

#import "DongwangMySubCirlistTableViewCell.h"
@interface DongwangMySubCirlistTableViewCell ()

@end
@implementation DongwangMySubCirlistTableViewCell

//足球圈1
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        UIImageView * cirleBackImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(10), RealWidth(10), SCREEN_Width-RealWidth(45), RealWidth(80))];
        cirleBackImgView.image = [UIImage imageNamed:@"足球圈1"];
        cirleBackImgView.userInteractionEnabled = YES;
        [self addSubview:cirleBackImgView];
        
        
        UIImageView * cireliconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(10), CGRectGetMidY(cirleBackImgView.frame)-RealWidth(35), RealWidth(50), RealWidth(50))];
        cireliconImgView.backgroundColor = LGDRedColor;
        cireliconImgView.image = [UIImage imageNamed:@""];
        [cirleBackImgView addSubview:cireliconImgView];
        
        UILabel  * cirelToplb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(cireliconImgView.frame)+RealWidth(15), RealWidth(25), CGRectGetWidth(cirleBackImgView.frame)-CGRectGetMaxX(cireliconImgView.frame)-RealWidth(15), RealWidth(16))];
        cirelToplb.font = PFR16Font;
        cirelToplb.textColor =[UIColor whiteColor];
        cirelToplb.text = @"反二次元圈";
        [cirleBackImgView addSubview:cirelToplb];
        
        
        UILabel  * cirelBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(cireliconImgView.frame)+RealWidth(15), RealWidth(5)+CGRectGetMidY(cirelToplb.frame), CGRectGetWidth(cirleBackImgView.frame)-CGRectGetMaxX(cireliconImgView.frame)-RealWidth(15+30), RealWidth(30))];
        cirelBtomlb.numberOfLines = 0;
        cirelBtomlb.font = PFR13Font;
        cirelBtomlb.textColor =[UIColor whiteColor];
        cirelBtomlb.text = @"只要心脏在跳动就不会舍弃脚下滚动的足球！";
        [cirleBackImgView addSubview:cirelBtomlb];
        
        
        UIImageView * righticonImgView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(cirleBackImgView.frame)-RealWidth(25), CGRectGetMidY(cirleBackImgView.frame)-RealWidth(15), RealWidth(10), RealWidth(12))];
        righticonImgView.image = [UIImage imageNamed:@"rightbtnicon"];
        [cirleBackImgView addSubview:righticonImgView];
        
        
    }
    return self;
}
@end

