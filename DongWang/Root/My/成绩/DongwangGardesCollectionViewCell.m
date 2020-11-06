//
//  DongwangGardesCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import "DongwangGardesCollectionViewCell.h"

@implementation DongwangGardesCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIView * whiteView = [[UIView alloc]initWithFrame:CGRectMake(K(0), 0, SCREEN_WIDTH-K(100), K(367))];
        whiteView.layer.cornerRadius = K(5);
        whiteView.layer.masksToBounds = YES;
        whiteView.backgroundColor = [UIColor whiteColor];
        [self addSubview:whiteView];
        
        UIImageView * ThubImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(whiteView.frame), K(140))];
//        ThubImgView.backgroundColor = [UIColor redColor];
        ThubImgView.image = [UIImage imageNamed:@"lunbo"];
        [whiteView addSubview:ThubImgView];
        
        
        UILabel * DongwangTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(ThubImgView.frame)+K(20), CGRectGetWidth(whiteView.frame), K(26))];
        DongwangTitle.textColor = LGDBLackColor;
        DongwangTitle.textAlignment = NSTextAlignmentCenter;
        DongwangTitle.font = KBlFont(font(19));
        DongwangTitle.text = @"非物质文化遗产";
        [whiteView addSubview:DongwangTitle];
        
        
        UILabel * DongwangRightRate = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangTitle.frame)+K(18), CGRectGetWidth(whiteView.frame), K(19))];
        DongwangRightRate.textAlignment = NSTextAlignmentCenter;
        [whiteView addSubview:DongwangRightRate];
        
        NSString * rate1 = @"答题正确率";
        NSString * rate2 = @"88%";
        NSMutableAttributedString * DongwangrateAttbure = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@  %@",rate1,rate2]];
        [DongwangrateAttbure addAttribute:NSFontAttributeName value:KBlFont(font(13)) range:NSMakeRange(0, rate1.length)];
        [DongwangrateAttbure addAttribute:NSFontAttributeName value:KSysFont(font(12)) range:NSMakeRange(rate1.length+2, rate2.length)];

        [DongwangrateAttbure addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#666666"] range:NSMakeRange(0, rate1.length)];
        [DongwangrateAttbure addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#999999"] range:NSMakeRange(rate1.length+2, rate2.length)];
        DongwangRightRate.attributedText  = DongwangrateAttbure;
        
        
        //登录按钮背景
        
        UIButton * DongwangWatchBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(30), K(265), CGRectGetWidth(whiteView.frame)-K(60), K(40))];
        DongwangWatchBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [DongwangWatchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        DongwangWatchBtn.titleLabel.font = KSysFont(font(14));
        [DongwangWatchBtn setTitle:@"查看详情" forState:UIControlStateNormal];
        [DongwangWatchBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];
        [DongwangWatchBtn setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateHighlighted];
        [whiteView addSubview:DongwangWatchBtn];
        
        
        UILabel * DongwangTimeTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangWatchBtn.frame)+K(35), CGRectGetWidth(whiteView.frame), K(15))];
        DongwangTimeTitle.textColor = [UIColor colorWithHexString:@"#999999"];
        DongwangTimeTitle.textAlignment = NSTextAlignmentCenter;
        DongwangTimeTitle.font = KSysFont(font(11));
        DongwangTimeTitle.text = @"答题时间：2020-10-26 11:12:36";
        [whiteView addSubview:DongwangTimeTitle];

        
    }
    return self;
}
@end
