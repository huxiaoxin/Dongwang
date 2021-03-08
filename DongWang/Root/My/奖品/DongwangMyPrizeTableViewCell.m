//
//  DongwangMyPrizeTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import "DongwangMyPrizeTableViewCell.h"
@interface DongwangMyPrizeTableViewCell ()
{
    UILabel * _DongwangTypelb;
    UIImageView * _DongwangIconImgView;
    UILabel * _DongwangTimelb;
    UILabel * _DongwangMoneylb;
    UIButton * _DongwangFindBtn;
    UILabel * _DongwangTpislb;
}
@end

@implementation DongwangMyPrizeTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView * DongwangContentView = [[UIImageView alloc]initWithFrame:CGRectMake(kLevelSpace(13), 0, SCREEN_WIDTH-kLevelSpace(26),K(103))];
        DongwangContentView.userInteractionEnabled = YES;
        DongwangContentView.backgroundColor = [UIColor clearColor];
        DongwangContentView.image = [UIImage imageNamed:@"wodejiangpin"];
//        DongwangContentView.layer.cornerRadius = K(5);
//        DongwangContentView.layer.masksToBounds = YES;
        [self.contentView addSubview:DongwangContentView];
        
//        DongwangContentView.layer.shadowColor = [UIColor colorWithHexString:@"#F6D548"].CGColor;//阴影颜色
//        DongwangContentView.layer.shadowOffset = CGSizeMake(5, 5);//偏移距离
//        DongwangContentView.layer.shadowOpacity = 1;//不透明度
//        DongwangContentView.layer.shadowRadius = 5.0;//半径

        
        
        UIView *  Dongwangline = [[UIView alloc]initWithFrame:CGRectMake(0, K(22), CGRectGetWidth(DongwangContentView.frame)-RealWidth(13), K(1))];
        [DongwangContentView addSubview:Dongwangline];
        
        [self drawLineOfDashByCAShapeLayer:Dongwangline lineLength:K(2) lineSpacing:K(1) lineColor:[UIColor colorWithHexString:@"#EDEDED"] lineDirection:YES];
        
        UILabel * DongwangTypelb = [[UILabel alloc]initWithFrame:CGRectMake(K(24), K(4), K(250), K(14))];
        DongwangTypelb.textColor = [UIColor colorWithHexString:@"#333330"];
        DongwangTypelb.font = [UIFont systemFontOfSize:font(10)];
        DongwangTypelb.text = @"积分奖励";
        [DongwangContentView addSubview:DongwangTypelb];
        _DongwangTypelb = DongwangTypelb;
        
        
        UILabel * DongwangTimelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangContentView.frame)-K(221), K(4), K(200), K(14))];
        DongwangTimelb.textAlignment = NSTextAlignmentRight;
        DongwangTimelb.textColor = [UIColor colorWithHexString:@"#999999"];
        DongwangTimelb.font = [UIFont systemFontOfSize:font(9)];
        DongwangTimelb.text = @"2020年12月31日过期";
        [DongwangContentView addSubview:DongwangTimelb];
        _DongwangTimelb = DongwangTimelb;
        
        
        UIImageView * DongwangIconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(22), K(36), K(49), K(49))];
        DongwangIconImgView.image = [UIImage imageNamed:@"现金红包"];
        [DongwangContentView addSubview:DongwangIconImgView];
        _DongwangIconImgView = DongwangIconImgView;
        
        
        UILabel * DongwangMoneylb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangIconImgView.frame)+K(14), K(42), K(200), K(20))];
        DongwangMoneylb.textColor = [UIColor colorWithHexString:@"#333330"];
        DongwangMoneylb.font = KBlFont(font(14));
        DongwangMoneylb.text = @"20积分";
        [DongwangContentView addSubview:DongwangMoneylb];
        _DongwangMoneylb = DongwangMoneylb;
        

        
        UILabel * DongwangTpislb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangIconImgView.frame)+K(14), K(68), K(200), K(14))];
        DongwangTpislb.textColor = [UIColor colorWithHexString:@"#999999"];
        DongwangTpislb.font = KSysFont(font(10));
        DongwangTpislb.text = @"无任何套路，直接寄回家";
        [DongwangContentView addSubview:DongwangTpislb];
        _DongwangTpislb = DongwangTpislb;
        
        
        UIButton * DongwangFindBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangContentView.frame)-K(23+61), K(40), K(74), K(39))];
        [DongwangFindBtn addTarget:self action:@selector(DongwangFindBtnÇlick) forControlEvents:UIControlEventTouchUpInside];
        DongwangFindBtn.titleLabel.font= KBlFont(font(11));
        DongwangFindBtn.adjustsImageWhenHighlighted = NO;
        [DongwangContentView addSubview:DongwangFindBtn];
        _DongwangFindBtn = DongwangFindBtn;
        
    }
    return self;
}
-(void)setMyPrizeModel:(DongwangMyPrizeModel *)MyPrizeModel{
    _MyPrizeModel = MyPrizeModel;
    _DongwangTypelb.text = [NSString stringWithFormat:@"%@%@",MyPrizeModel.modeValue,MyPrizeModel.mode];
    [_DongwangIconImgView sd_setImageWithURL:[NSURL URLWithString:MyPrizeModel.logo]];
    if ([[NSString stringWithFormat:@"%@",MyPrizeModel.endTimeStr] isEqualToString:@"-1"] ) {
        _DongwangTimelb.text = @"";
    }else{
        _DongwangTimelb.text =  [NSString stringWithFormat:@"%@到期",MyPrizeModel.endTimeStr];

    }
    
    _DongwangMoneylb.text =MyPrizeModel.name;
    
    
    if ([MyPrizeModel.buttonStatus intValue] == 0) {
    [_DongwangFindBtn setBackgroundImage:[UIImage imageNamed:@"去完成"] forState:UIControlStateNormal];
    _DongwangFindBtn.enabled =  YES;
    }else{
    _DongwangFindBtn.enabled = NO;
    [_DongwangFindBtn setBackgroundImage:[UIImage imageNamed:@"已完成"] forState:UIControlStateNormal];
    }
    [_DongwangFindBtn setTitle:MyPrizeModel.buttonDetails forState:UIControlStateNormal];
    _DongwangTpislb.text = MyPrizeModel.content;
}
-(void)DongwangFindBtnÇlick{
    [self.delegate DongwangMyPrizeTableViewCellDidSeltecdWithCellIndex:self.tag];
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
