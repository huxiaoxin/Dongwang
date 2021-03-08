//
//  DongwangDuihuanView.m
//  DongWang
//
//  Created by codehzx on 2020/12/13.
//

#import "DongwangDuihuanView.h"
#import "DongwnagDuihuanBtn.h"
@interface DongwangDuihuanView ()
{
    UIImageView * _dongwangduihuanbackImgView;
}
@end
@implementation DongwangDuihuanView
-(void)layoutSubviews{
    _dongwangduihuanbackImgView.frame  = self.bounds;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView * dongwangduihuanbackImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        dongwangduihuanbackImgView.image = [UIImage imageNamed:@"jifenduihuanback"];
        [self addSubview:dongwangduihuanbackImgView];
        _dongwangduihuanbackImgView = dongwangduihuanbackImgView;
        
        
//        self.layer.cornerRadius = K(12);
//        self.layer.masksToBounds = YES;
        UILabel * DongwangToptitle = [[UILabel alloc]initWithFrame:CGRectMake(0, K(18), SCREEN_WIDTH-K(30), K(21))];
        DongwangToptitle.textAlignment = NSTextAlignmentCenter;
        DongwangToptitle.textColor = [UIColor colorWithHexString:@"#333333"];
        [self addSubview:DongwangToptitle];
        
        NSString * FirstText  = @"积分换道具";
        NSString * SecondText = @"（点击即可兑换）";
        NSMutableAttributedString * DongwangAttbure = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",FirstText,SecondText]];
        [DongwangAttbure addAttribute:NSFontAttributeName value:KBlFont(font(15)) range:NSMakeRange(0, FirstText.length)];
        [DongwangAttbure addAttribute:NSFontAttributeName value:KSysFont(font(12)) range:NSMakeRange(FirstText.length, SecondText.length)];

        DongwangToptitle.attributedText = DongwangAttbure;
        
        
        DongwnagDuihuanBtn * btn1 = [[DongwnagDuihuanBtn alloc]initWithFrame:CGRectMake(K(55), CGRectGetMaxY(DongwangToptitle.frame)+K(25), K(87), K(65+21+22+8+10))];
        [btn1 setEnlargeEdgeWithTop:20 right:20 bottom:15 left:20];
        btn1.TopimgView.image = [UIImage imageNamed:@"免答卡"];
        btn1.Centerlb.text = @"免答卡";
        btn1.Btomlb.text = @"20积分兑换";
        btn1.tag = 0;
        [btn1 addTarget:self action:@selector(DongwnagDuihuanBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn1];
        
        
        DongwnagDuihuanBtn * btn2 = [[DongwnagDuihuanBtn alloc]initWithFrame:CGRectMake(K(72)+CGRectGetMaxX(btn1.frame), CGRectGetMaxY(DongwangToptitle.frame)+K(25), K(87), K(65+21+22+8+10))];
        btn2.TopimgView.image = [UIImage imageNamed:@"加时卡"];
        btn2.Centerlb.text = @"加时卡";
        btn2.Btomlb.text = @"20积分兑换";
        [btn2 setEnlargeEdgeWithTop:20 right:20 bottom:15 left:10];
        btn2.tag = 1;
        [btn2 addTarget:self action:@selector(DongwnagDuihuanBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn2];
        
        
    }
    return self;
}
-(void)DongwnagDuihuanBtnClick:(DongwnagDuihuanBtn *)duihuanBtn{
    [self.delegate DongwangDuihuanViewBtnDidSeltecdWithBtnIndex:duihuanBtn.tag];
}
@end
