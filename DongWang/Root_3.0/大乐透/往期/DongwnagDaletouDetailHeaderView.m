//
//  DongwnagDaletouDetailHeaderView.m
//  DongWang
//
//  Created by sycm on 2021/2/23.
//

#import "DongwnagDaletouDetailHeaderView.h"
#import "DongwangTopPrizeView.h"
#import "SHInfiniteShufflingLabel.h"
@interface DongwnagDaletouDetailHeaderView ()
@property(nonatomic,strong) UIView * toPirzceview;
@property(nonatomic,strong) UILabel * secondlb;
@property(nonatomic,strong) UILabel * threelb;
@property(nonatomic,strong) UILabel *  timelb;
@property(nonatomic,strong) UILabel *  toplb;
@property(nonatomic,strong) UILabel *  btomlb;
@property(nonatomic,strong) UILabel *label;
@property(nonatomic,strong) SHInfiniteShufflingLabel * mylbs;
@end
@implementation DongwnagDaletouDetailHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //
        UIImageView * daletouImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RealWidth(240))];
        daletouImgView.image =[UIImage imageNamed:@"deetial_latou"];
        [self addSubview:daletouImgView];
        
        UILabel *  timelb = [[UILabel alloc]initWithFrame:CGRectMake(0, RealWidth(25), SCREEN_WIDTH, RealWidth(18))];
        timelb.textColor = [UIColor whiteColor];
        timelb.font = PFS18Font;
        timelb.textAlignment = NSTextAlignmentCenter;
        [daletouImgView addSubview:timelb];
        _timelb = timelb;
        
        
        UILabel *  toplb = [[UILabel alloc]initWithFrame:CGRectMake(0, RealWidth(31)+CGRectGetMaxY(timelb.frame), SCREEN_WIDTH, RealWidth(22))];
        toplb.textColor = [UIColor whiteColor];
        toplb.font = PFS22Font;
        toplb.textAlignment = NSTextAlignmentCenter;
        [daletouImgView addSubview:toplb];
        _toplb = toplb;
        
        SHInfiniteShufflingLabel * mylbs = [[SHInfiniteShufflingLabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(toplb.frame)+RealWidth(10), SCREEN_WIDTH, RealWidth(40))];
        [daletouImgView addSubview:mylbs];
        _mylbs = mylbs;
        
        
        
        UILabel *  btomlb = [[UILabel alloc]initWithFrame:CGRectMake(0, RealWidth(24)+CGRectGetMaxY(mylbs.frame), SCREEN_WIDTH, RealWidth(15))];
        btomlb.textColor = [UIColor whiteColor];
        btomlb.font = PFR13Font;
        btomlb.textAlignment = NSTextAlignmentCenter;
        [daletouImgView addSubview:btomlb];
        _btomlb = btomlb;
        
        
        
        UIView * toPirzceview = [[UIView alloc] init];
        toPirzceview.frame = CGRectMake(RealWidth(10),CGRectGetMaxY(daletouImgView.frame)+RealWidth(30),SCREEN_WIDTH-RealWidth(20),RealWidth(65));
        [self addSubview:toPirzceview];
        toPirzceview.hidden = YES;
        _toPirzceview = toPirzceview;
        
        CAGradientLayer *gl = [CAGradientLayer layer];
        gl.frame =  toPirzceview.bounds;
        gl.startPoint = CGPointMake(0.5, 0);
        gl.endPoint = CGPointMake(0.5, 1);
        gl.colors = @[(__bridge id)[UIColor colorWithHexString:@"#804AB7"].CGColor, (__bridge id)[UIColor colorWithHexString:@"#250544" Alpha:0.66].CGColor];
        gl.locations = @[@(0), @(1.0f)];
        toPirzceview.layer.cornerRadius = 4;
        toPirzceview.layer.masksToBounds = YES;
        [toPirzceview.layer addSublayer:gl];
        
        
        
        UILabel * secondlb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(toPirzceview.frame), RealWidth(30))];
        secondlb.textAlignment = NSTextAlignmentCenter;
        [toPirzceview addSubview:secondlb];
        _secondlb = secondlb;
        
        UILabel * threelb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(secondlb.frame)+RealWidth(0), CGRectGetWidth(secondlb.frame), RealWidth(30))];
        threelb.textAlignment = NSTextAlignmentCenter;
        [toPirzceview addSubview:threelb];
        _threelb = threelb;
        
    }
    return self;
}
-(void)setResponeDic:(NSDictionary *)responeDic{
    _responeDic = responeDic;
    NSString * schedule =[[responeDic objectForKey:@"data"] objectForKey:@"schedule"];
    _timelb.text = [NSString stringWithFormat:@"%@期",schedule];
    _btomlb.text = [NSString stringWithFormat:@"开奖金额: %@元 ",[[responeDic objectForKey:@"data"] objectForKey:@"topPrize"]];
     id   ticketNums = [[responeDic objectForKey:@"data"] objectForKey:@"ticketNums"];
    if ([ticketNums isKindOfClass:[NSArray class]]) {
        [_mylbs setTextArray:ticketNums InteralTime:1.5 Direction:SHRollingDirectionUp];

    }
    //    NSArray * ticketNums = @[@"TZIVFVS",@"TZIETFE"];

    
    
    
}
-(void)setPrizeResponsesArr:(NSArray *)PrizeResponsesArr{
    _PrizeResponsesArr = PrizeResponsesArr;
    if ([PrizeResponsesArr isKindOfClass:[NSString class]]) {
        self.HeaderHeight = CGRectGetMaxY(_toPirzceview.frame)+RealWidth(10);

        return;
    }
    NSLog(@"class=%@",[PrizeResponsesArr class]);
    
    _toPirzceview.hidden =  PrizeResponsesArr.count == 0 ? YES : NO;
    NSDictionary * topresponeDic = [PrizeResponsesArr objectAtIndex:0];
    NSString * topawardsName = [topresponeDic objectForKey:@"awardsName"];
    NSString *  topawardsNum = [topresponeDic objectForKey:@"awardsNum"];
    _toplb.text = [NSString stringWithFormat:@"%@ (%@人)",topawardsName,topawardsNum];
    if (PrizeResponsesArr.count  == 0  ) {
        _toPirzceview.height = 0 ;
        _secondlb.text = @"";
        _threelb.text = @"";
    }else if (PrizeResponsesArr.count == 1){
        
        _toPirzceview.height = 0 ;
        _secondlb.text = @"";
        _threelb.text = @"";
        
    }else if (PrizeResponsesArr.count == 2){
        _toPirzceview.height = RealWidth(35);
        NSDictionary * responeDic = [PrizeResponsesArr objectAtIndex:1];
        //二等奖
        NSString *  awardsName = [NSString stringWithFormat:@"%@:  ",[responeDic objectForKey:@"awardsName"]];
        //20
        NSString *  awardsWorth = [NSString stringWithFormat:@"%@",[responeDic objectForKey:@"awardsWorth"]];
        //元
        NSString * yuan = @"元,  ";
        //15
        NSString *  awardsNum = [NSString stringWithFormat:@"%@",[responeDic objectForKey:@"awardsNum"]];
        //人已获得
        NSString * huode = @"人已获得";
        
        _secondlb.attributedText = [self AttbureWithawardsName:awardsName awardsWorth:awardsWorth yuan:yuan awardsNum:awardsNum huode:huode];
        
        _threelb.text = @"";
        
        
    }else if (PrizeResponsesArr.count == 3){
        _toPirzceview.height =  RealWidth(65);
        
        NSDictionary * responeDic = [PrizeResponsesArr objectAtIndex:1];
        
        //二等奖
        NSString *  awardsName = [NSString stringWithFormat:@"%@:  ",[responeDic objectForKey:@"awardsName"]];
        //20
        NSString *  awardsWorth = [NSString stringWithFormat:@"%@",[responeDic objectForKey:@"awardsWorth"]];
        //元
        NSString * yuan = @"元,  ";
        //15
        NSString *  awardsNum = [NSString stringWithFormat:@"%@",[responeDic objectForKey:@"awardsNum"]];
        //人已获得
        NSString * huode = @"人已获得";
        _secondlb.attributedText = [self AttbureWithawardsName:awardsName awardsWorth:awardsWorth yuan:yuan awardsNum:awardsNum huode:huode];
        
        
        NSDictionary * responelastDic = [PrizeResponsesArr lastObject];
        //二等奖
        NSString *  lastawardsName = [NSString stringWithFormat:@"%@:  ",[responelastDic objectForKey:@"awardsName"]];
        //20
        NSString *  lastawardsWorth = [NSString stringWithFormat:@"%@",[responelastDic objectForKey:@"awardsWorth"]];
        //元
        NSString * lastyuan = @"元,  ";
        //15
        NSString *  lastawardsNum = [NSString stringWithFormat:@"%@",[responelastDic objectForKey:@"awardsNum"]];
        //人已获得
        NSString * lasthuode = @"人已获得";
        
        _threelb.attributedText = [self AttbureWithawardsName:lastawardsName awardsWorth:lastawardsWorth yuan:lastyuan awardsNum:lastawardsNum huode:lasthuode];
    }
    self.HeaderHeight = CGRectGetMaxY(_toPirzceview.frame)+RealWidth(10);
    
}
-(NSMutableAttributedString *)AttbureWithawardsName:(NSString *)awardsName awardsWorth:(NSString *)awardsWorth yuan:(NSString *)yuan awardsNum:(NSString *)awardsNum huode:(NSString *)huode{
    
    NSMutableAttributedString * attbure = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@%@%@%@",awardsName,awardsWorth,yuan,awardsNum,huode]];
    
    [attbure addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, awardsName.length)];
    
    [attbure addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#FFDD00"] range:NSMakeRange(awardsName.length, awardsWorth.length)];
    
    [attbure addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(awardsName.length+awardsWorth.length, yuan.length)];
    
    [attbure addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#FFDD00"] range:NSMakeRange(awardsName.length+awardsWorth.length+yuan.length, awardsNum.length)];
    
    [attbure addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(awardsName.length+awardsWorth.length+yuan.length+awardsNum.length, huode.length)];
    
    return attbure;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
