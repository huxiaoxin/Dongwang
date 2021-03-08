//
//  DongwangMsgTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/10.
//

#import "DongwangMsgTableViewCell.h"
@interface DongwangMsgTableViewCell ()
{
    UILabel * _DongwangTimelb;
    UILabel * _DongwangSystemlb;
    UIView * _DongwangContentView;
    UILabel * _DongwangDetailb;
}
@end
@implementation DongwangMsgTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        
        UILabel * DongwangTimelb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-K(5), K(16),K(10), K(18.5))];
        DongwangTimelb.textColor = [UIColor blackColor];
        DongwangTimelb.layer.cornerRadius = K(9.25);
        DongwangTimelb.layer.masksToBounds = YES;
        DongwangTimelb.textAlignment = NSTextAlignmentCenter;
        DongwangTimelb.font = KSysFont(font(11));
        DongwangTimelb.text = @"2020-10-26  10:49:13";
        DongwangTimelb.textAlignment = NSTextAlignmentCenter;
        DongwangTimelb.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF" Alpha:0.5];
        [self.contentView addSubview:DongwangTimelb];
        _DongwangTimelb = DongwangTimelb;
        
        
        UIImageView * DongwangContentView = [[UIImageView alloc]initWithFrame:CGRectMake(K(15.5), CGRectGetMaxY(DongwangTimelb.frame)+K(16.5), SCREEN_WIDTH-K(31), K(120))];
        DongwangContentView.backgroundColor = [UIColor clearColor];
//        DongwangContentView.layer.cornerRadius = K(5);
//        DongwangContentView.layer.masksToBounds = YES;
        DongwangContentView.image = [UIImage imageNamed:@"msgback"];
        [self.contentView addSubview:DongwangContentView];
        _DongwangContentView = DongwangContentView;
        
       
        UILabel * DongwangSystemlb = [[UILabel alloc]initWithFrame:CGRectMake(K(20), K(15.5), CGRectGetWidth(DongwangContentView.frame)-K(20), K(24))];
        DongwangSystemlb.textColor = [UIColor colorWithHexString:@"#333330"];
        DongwangSystemlb.font = KBlFont(font(17));
        DongwangSystemlb.text = @"系统消息主题";
        [DongwangContentView addSubview:DongwangSystemlb];
        _DongwangSystemlb = DongwangSystemlb;
        

        UIView * Dongwangline = [[UIView alloc]initWithFrame:CGRectMake(K(15), K(49.5), CGRectGetWidth(DongwangContentView.frame)-K(30), K(1))];
        [DongwangContentView addSubview:Dongwangline];
//        Dongwangline.backgroundColor =  [UIColor colorWithHexString:@"#EDEDED"];
        [self drawLineOfDashByCAShapeLayer:Dongwangline lineLength:K(2) lineSpacing:K(1) lineColor:[UIColor colorWithHexString:@"#EDEDED"] lineDirection:YES];

        UILabel * DongwangDetailb = [[UILabel alloc]initWithFrame:CGRectMake(K(16), K(16.5)+CGRectGetMaxY(Dongwangline.frame), CGRectGetWidth(DongwangContentView.frame)-K(32), K(40))];
        DongwangDetailb.numberOfLines = 0;
        DongwangDetailb.textColor = [UIColor colorWithHexString:@"#333330"];
        DongwangDetailb.font = KSysFont(font(12));
        DongwangDetailb.text = @"系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息";
        [DongwangContentView addSubview:DongwangDetailb];
        _DongwangDetailb = DongwangDetailb;
        
        
        
        
        
    }
    return self;
}
-(void)setMsgModel:(DongwangMsgModel *)msgModel{
    _msgModel = msgModel;
    CGSize DongwanngTimeSize = [msgModel.insertTimeStr cxl_sizeWithString:KSysFont(font(11))];
    _DongwangTimelb.text =  msgModel.insertTimeStr;
    _DongwangTimelb.width = DongwanngTimeSize.width+K(10);
    _DongwangTimelb.x =  SCREEN_WIDTH/2-DongwanngTimeSize.width/2;
    _DongwangSystemlb.text = [NSString stringWithFormat:@"%@",msgModel.title];
    [_DongwangDetailb setText:msgModel.content lineSpacing:K(3)];
    _DongwangDetailb.height = [_DongwangDetailb getSpaceLabelHeight:msgModel.content withFont:KSysFont(font(12)) withWidth:CGRectGetWidth(_DongwangContentView.frame)-K(32) lineSpacing:K(3)].height;
    _DongwangContentView.height = CGRectGetMaxY(_DongwangDetailb.frame)+K(30);
    msgModel.Cellheight = CGRectGetMaxY(_DongwangContentView.frame)+K(10);
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
