//
//  DongwangJifeChangeCollectionReusableView.m
//  DongWang
//
//  Created by codehzx on 2020/11/18.
//

#import "DongwangJifeChangeCollectionReusableView.h"

@implementation DongwangJifeChangeCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel * DongwangToptitle = [[UILabel alloc]initWithFrame:CGRectMake(0, K(18), SCREEN_WIDTH, K(21))];
        DongwangToptitle.textAlignment = NSTextAlignmentCenter;
        DongwangToptitle.textColor = [UIColor colorWithHexString:@"#333333"];
        [self addSubview:DongwangToptitle];
        
        NSString * FirstText  = @"积分换道具";
        NSString * SecondText = @"（点击即可兑换）";
        NSMutableAttributedString * DongwangAttbure = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",FirstText,SecondText]];
        [DongwangAttbure addAttribute:NSFontAttributeName value:KBlFont(font(15)) range:NSMakeRange(0, FirstText.length)];
        [DongwangAttbure addAttribute:NSFontAttributeName value:KSysFont(font(12)) range:NSMakeRange(FirstText.length, SecondText.length)];

        DongwangToptitle.attributedText = DongwangAttbure;
    }
    return self;
}
@end
