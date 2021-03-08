//
//  DongwangDaletouLingquFooterCollectionReusableView.m
//  DongWang
//
//  Created by sycm on 2021/2/24.
//

#import "DongwangDaletouLingquFooterCollectionReusableView.h"
@interface DongwangDaletouLingquFooterCollectionReusableView ()
@property(nonatomic,strong) UILabel * dongwnagdeeplb;
@property(nonatomic,strong) UIButton * dongwangBtn;
@end
@implementation DongwangDaletouLingquFooterCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
//
        
       
        UIButton * dongwangBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-RealWidth(119), RealWidth(5), RealWidth(238), RealWidth(35))];
        [dongwangBtn setBackgroundImage:[UIImage imageNamed:@"lijilingqu"] forState:UIControlStateNormal];
        dongwangBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [dongwangBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        dongwangBtn.titleLabel.font = PFR14Font;
        [dongwangBtn setTitle:@"点击领取" forState:UIControlStateNormal];
        [dongwangBtn addTarget:self action:@selector(dongwangBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:dongwangBtn];
        _dongwangBtn = dongwangBtn;
        
        UILabel * dongwnagdeeplb  =[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(dongwangBtn.frame)+RealWidth(5), SCREEN_WIDTH, RealWidth(15))];
//        dongwnagdeeplb.text = @"7天内领取有效";
        dongwnagdeeplb.font = PFR12Font;
        dongwnagdeeplb.textAlignment = NSTextAlignmentCenter;
        dongwnagdeeplb.textColor = [UIColor colorWithHexString:@"#999999"];
        [self addSubview:dongwnagdeeplb];
        _dongwnagdeeplb = dongwnagdeeplb;
        
        
    }
    return self;
}
-(void)setIsLingequ:(BOOL)isLingequ{
    _isLingequ =  isLingequ;
    if (isLingequ) {
        _dongwnagdeeplb.hidden = NO;
        _dongwangBtn.enabled = YES;
        _dongwangBtn.layer.cornerRadius = RealWidth(17);
        [_dongwangBtn setTitle:@"点击领取" forState:UIControlStateNormal];
        [_dongwangBtn setBackgroundImage:[UIImage imageNamed:@"lijilingqu"] forState:UIControlStateNormal];
        [_dongwangBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    }else{
        _dongwangBtn.layer.cornerRadius = RealWidth(17);
        _dongwnagdeeplb.hidden = YES;
        _dongwangBtn.enabled = NO;
        [_dongwangBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
        [_dongwangBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_dongwangBtn setTitle:@"已领取" forState:UIControlStateNormal];
        [_dongwangBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    }
}
-(void)setIszhongjiang:(BOOL)iszhongjiang{
    _iszhongjiang = iszhongjiang;
    if (iszhongjiang) {
        _dongwangBtn.hidden = NO;
    }else{
        _dongwangBtn.hidden = YES;
    }
}
-(void)setExprineStr:(NSString *)exprineStr{
    _exprineStr = exprineStr;
    _dongwnagdeeplb.text = [NSString stringWithFormat:@"%@天内领取有效",exprineStr];
}
-(void)dongwangBtnClick{
    // 有的话再判断是否有已中奖的且未领取的
    //有的话 显示高亮
    //没有的话 显示置灰 //且文字隐藏
    NSLog(@"领取按钮");
    [self.delegate DongwangDaletouLingquFooterCollectionReusableViewlingqu];
}
@end
