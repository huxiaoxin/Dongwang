//
//  DongwangMyPrizeTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import "DongwangMyPrizeTableViewCell.h"
@interface DongwangMyPrizeTableViewCell ()

@end

@implementation DongwangMyPrizeTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"#EDEDED"];
        UIView * DongwangContentView = [[UIView alloc]initWithFrame:CGRectMake(kLevelSpace(13), 0, SCREEN_WIDTH-kLevelSpace(26),K(103))];
        DongwangContentView.backgroundColor = [UIColor whiteColor];
        DongwangContentView.layer.cornerRadius = K(5);
        DongwangContentView.layer.masksToBounds = YES;
        [self.contentView addSubview:DongwangContentView];
        
        UIView *  Dongwangline = [[UIView alloc]initWithFrame:CGRectMake(0, K(22), CGRectGetWidth(DongwangContentView.frame), K(1))];
        [DongwangContentView addSubview:Dongwangline];
        [self drawLineOfDashByCAShapeLayer:Dongwangline lineLength:K(2) lineSpacing:K(1) lineColor:[UIColor colorWithHexString:@"#E3E4E4"] lineDirection:YES];
        
        UILabel * DongwangTypelb = [[UILabel alloc]initWithFrame:CGRectMake(K(24), K(4), K(200), K(14))];
        DongwangTypelb.textColor = [UIColor colorWithHexString:@"#333330"];
        DongwangTypelb.font = [UIFont systemFontOfSize:font(10)];
        DongwangTypelb.text = @"积分奖励";
        [DongwangContentView addSubview:DongwangTypelb];
        
        UILabel * DongwangTimelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangContentView.frame)-K(221), K(4), K(200), K(14))];
        DongwangTimelb.textAlignment = NSTextAlignmentRight;
        DongwangTimelb.textColor = [UIColor colorWithHexString:@"#999999"];
        DongwangTimelb.font = [UIFont systemFontOfSize:font(9)];
        DongwangTimelb.text = @"2020年12月31日过期";
        [DongwangContentView addSubview:DongwangTimelb];
        
        
        UIImageView * DongwangIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(22), K(36), K(45), K(49))];
        DongwangIconImgView.image = [UIImage imageNamed:@"现金红包"];
        [DongwangContentView addSubview:DongwangIconImgView];
        
        
        UILabel * DongwangMoneylb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangIconImgView.frame)+K(14), K(42), K(200), K(20))];
        DongwangMoneylb.textColor = [UIColor colorWithHexString:@"#333330"];
        DongwangMoneylb.font = KBlFont(font(14));
        DongwangMoneylb.text = @"20积分";
        [DongwangContentView addSubview:DongwangMoneylb];
        

        
        UILabel * DongwangTpislb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangIconImgView.frame)+K(14), K(68), K(200), K(14))];
        DongwangTpislb.textColor = [UIColor colorWithHexString:@"#999999"];
        DongwangTpislb.font = KSysFont(font(10));
        DongwangTpislb.text = @"无任何套路，直接寄回家";
        [DongwangContentView addSubview:DongwangTpislb];
        
        UIButton * DongwangFindBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangContentView.frame)-K(23+61), K(48), K(61), K(26))];
        [DongwangFindBtn setBackgroundImage:[UIImage imageNamed:@"编组15"] forState:UIControlStateNormal];
        [DongwangContentView addSubview:DongwangFindBtn];
        
    }
    return self;
}
/**
 *  通过 CAShapeLayer 方式绘制虚线
 *
 *  param lineView:       需要绘制成虚线的view
 *  param lineLength:     虚线的宽度
 *  param lineSpacing:    虚线的间距
 *  param lineColor:      虚线的颜色
 *  param lineDirection   虚线的方向  YES 为水平方向， NO 为垂直方向
 **/
- (void)drawLineOfDashByCAShapeLayer:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor lineDirection:(BOOL)isHorizonal {

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];

    [shapeLayer setBounds:lineView.bounds];

    if (isHorizonal) {

        [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];

    } else{
        [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame)/2)];
    }

    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    if (isHorizonal) {
        [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    } else {

        [shapeLayer setLineWidth:CGRectGetWidth(lineView.frame)];
    }
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);

    if (isHorizonal) {
        CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
    } else {
        CGPathAddLineToPoint(path, NULL, 0, CGRectGetHeight(lineView.frame));
    }

    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}
@end
