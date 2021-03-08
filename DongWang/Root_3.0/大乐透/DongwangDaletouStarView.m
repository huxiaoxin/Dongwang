//
//  DongwangDaletouStarView.m
//  DongWang
//
//  Created by codehzx on 2021/1/27.
//

#import "DongwangDaletouStarView.h"
#import "DongwangDaletouTableViewCell.h"
@interface DongwangDaletouStarView ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)  UIImageView * dongwangbackImgView;
@property(nonatomic,strong) UITableView * dongwangFirsTableView;
@property(nonatomic,strong) UITableView * dongwangSecondTableView;
@property(nonatomic,strong) UITableView * dongwangThreeTableView;
@property(nonatomic,strong) UITableView * dongwangFoureTableView;

@property(nonatomic,strong) UILabel * dongwangFenImgView;
@property(nonatomic,strong) UILabel * dongwangMiaoImgView;
@property(nonatomic,strong) UIImageView * mybackView;
@property(nonatomic,strong) UIImageView * mybackView1;
@property(nonatomic,strong) UIImageView * mybackView2;
@property(nonatomic,strong) UIImageView * mybackView3;
@property(nonatomic,strong) UIButton  * injoinnbtn; //立即参与
@end
@implementation DongwangDaletouStarView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView * dongwangbackImgView  =[[UIImageView alloc]initWithFrame:CGRectZero];
        dongwangbackImgView.userInteractionEnabled = YES;
        dongwangbackImgView.image = [UIImage imageNamed:@"starView"];
        [self addSubview:dongwangbackImgView];
        _dongwangbackImgView = dongwangbackImgView;
        
        UIImageView * mybackView = [[UIImageView alloc]initWithFrame:CGRectZero];
        mybackView.image = [UIImage imageNamed:@"black_backIcon"];
        [dongwangbackImgView addSubview:mybackView];
        _mybackView = mybackView;
        
        UIImageView * mybackView1 = [[UIImageView alloc]initWithFrame:CGRectZero];
        mybackView1.image = [UIImage imageNamed:@"black_backIcon"];
        [dongwangbackImgView addSubview:mybackView1];
        _mybackView1 = mybackView1;
        
        
        UIImageView * mybackView2 = [[UIImageView alloc]initWithFrame:CGRectZero];
        mybackView2.image = [UIImage imageNamed:@"black_backIcon"];
        [dongwangbackImgView addSubview:mybackView2];
        _mybackView2 = mybackView2;
        
        
        UIImageView * mybackView3 = [[UIImageView alloc]initWithFrame:CGRectZero];
        mybackView3.image = [UIImage imageNamed:@"black_backIcon"];
        [dongwangbackImgView addSubview:mybackView3];
        _mybackView3 = mybackView3;
        
        
        
        [dongwangbackImgView addSubview:self.dongwangFirsTableView];
        [dongwangbackImgView addSubview:self.dongwangSecondTableView];
        [dongwangbackImgView addSubview:self.dongwangFenImgView];
        [dongwangbackImgView addSubview:self.dongwangThreeTableView];
        [dongwangbackImgView addSubview:self.dongwangFoureTableView];
        [dongwangbackImgView addSubview:self.dongwangMiaoImgView];
        [dongwangbackImgView addSubview:self.injoinnbtn];
    }
    return self;
}
-(UIButton *)injoinnbtn{
    if (!_injoinnbtn) {
        _injoinnbtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_injoinnbtn setBackgroundImage:[UIImage imageNamed:@"injon_icon"] forState:UIControlStateNormal];
        _injoinnbtn.adjustsImageWhenHighlighted = NO;
        _injoinnbtn.titleEdgeInsets =  UIEdgeInsetsMake(-RealWidth(5), 0, 0, 0);
        [_injoinnbtn setTitle:@"立即参与" forState:UIControlStateNormal];
        _injoinnbtn.titleLabel.font = PFS18Font;
        [_injoinnbtn setTitleColor:[UIColor colorWithHexString:@"#5F0000"] forState:UIControlStateNormal];
        [_injoinnbtn addTarget:self action:@selector(injonBtnClicks) forControlEvents:UIControlEventTouchUpInside];
    }
    return _injoinnbtn;
}
-(UITableView *)dongwangFirsTableView{
    if (!_dongwangFirsTableView) {
        _dongwangFirsTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _dongwangFirsTableView.scrollEnabled = NO;
        _dongwangFirsTableView.delegate = self;
        _dongwangFirsTableView.dataSource = self;
        _dongwangFirsTableView.showsVerticalScrollIndicator = NO;
        _dongwangFirsTableView.showsHorizontalScrollIndicator = NO;
        _dongwangFirsTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _dongwangFirsTableView.tag = 100;
        _dongwangFirsTableView.backgroundColor = [UIColor clearColor];
        _dongwangFirsTableView.scrollEnabled = NO;

        
        
    }
    return _dongwangFirsTableView;
}
-(UITableView *)dongwangThreeTableView{
    if (!_dongwangThreeTableView) {
        _dongwangThreeTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _dongwangThreeTableView.delegate = self;
        _dongwangThreeTableView.dataSource = self;
        _dongwangThreeTableView.showsVerticalScrollIndicator = NO;
        _dongwangThreeTableView.showsHorizontalScrollIndicator = NO;
        _dongwangThreeTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _dongwangThreeTableView.tag = 102;
        _dongwangThreeTableView.backgroundColor = [UIColor clearColor];
        _dongwangThreeTableView.scrollEnabled = NO;

    }
    return _dongwangThreeTableView;
}
-(UITableView *)dongwangFoureTableView{
    if (!_dongwangFoureTableView) {
        _dongwangFoureTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _dongwangFoureTableView.delegate = self;
        _dongwangFoureTableView.dataSource = self;
        _dongwangFoureTableView.showsVerticalScrollIndicator = NO;
        _dongwangFoureTableView.showsHorizontalScrollIndicator = NO;
        _dongwangFoureTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _dongwangFoureTableView.tag = 103;
        _dongwangFoureTableView.backgroundColor = [UIColor clearColor];
        _dongwangFoureTableView.scrollEnabled = NO;

    }
    return _dongwangFoureTableView;
}

-(UITableView *)dongwangSecondTableView{
    if (!_dongwangSecondTableView) {
        _dongwangSecondTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _dongwangSecondTableView.delegate = self;
        _dongwangSecondTableView.dataSource = self;
        _dongwangSecondTableView.showsVerticalScrollIndicator = NO;
        _dongwangSecondTableView.showsHorizontalScrollIndicator = NO;
        _dongwangSecondTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _dongwangSecondTableView.tag = 101;
        _dongwangSecondTableView.backgroundColor = [UIColor clearColor];
        _dongwangSecondTableView.scrollEnabled = NO;

    }
    return _dongwangSecondTableView;
}
-(UILabel *)dongwangMiaoImgView{
    if (!_dongwangMiaoImgView) {
        _dongwangMiaoImgView =[[UILabel alloc]initWithFrame:CGRectZero];
//        _dongwangMiaoImgView.backgroundColor = [UIColor redColor];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"秒"attributes: @{NSFontAttributeName: PFS18Font,NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#5D5D5D"],NSStrokeWidthAttributeName:@-5,NSStrokeColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
        _dongwangMiaoImgView.attributedText = string;
        _dongwangMiaoImgView.textAlignment = NSTextAlignmentCenter;
        _dongwangMiaoImgView.alpha = 1.0;

    }
    return _dongwangMiaoImgView;
}
-(UILabel *)dongwangFenImgView{
    if (!_dongwangFenImgView) {
        _dongwangFenImgView = [[UILabel alloc]initWithFrame:CGRectZero];
        //        _dongwangFenImgView.backgroundColor = [UIColor redColor];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"分"attributes: @{NSFontAttributeName: PFS18Font,NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#5D5D5D"],NSStrokeWidthAttributeName:@-5,NSStrokeColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
        _dongwangFenImgView.attributedText = string;
        _dongwangFenImgView.textAlignment = NSTextAlignmentCenter;
        _dongwangFenImgView.alpha = 1.0;
    }
    return _dongwangFenImgView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return RealWidth(71);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangFirstCellIdentifer = @"DongwangDaletouTableViewCell";
    DongwangDaletouTableViewCell * dongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangFirstCellIdentifer];
    if (dongwangCell == nil) {
        dongwangCell = [[DongwangDaletouTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangFirstCellIdentifer];
    }
    dongwangCell.DongwangImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld_daletou",indexPath.row]];
    return dongwangCell;
}
-(void)layoutSubviews{
    _dongwangbackImgView.frame = self.bounds;
    _dongwangFirsTableView.frame = CGRectMake(RealWidth(10), RealWidth(51), RealWidth(48), RealWidth(71));
    _mybackView.frame = CGRectMake(RealWidth(10), RealWidth(51), RealWidth(48), RealWidth(71));
    _dongwangSecondTableView.frame =  CGRectMake(CGRectGetMaxX(_dongwangFirsTableView.frame)+RealWidth(10), RealWidth(51), RealWidth(48), RealWidth(71));
    _mybackView1.frame =CGRectMake(CGRectGetMaxX(_dongwangFirsTableView.frame)+RealWidth(10), RealWidth(51), RealWidth(48), RealWidth(71));
    
    _dongwangFenImgView.frame = CGRectMake(CGRectGetMaxX(_dongwangSecondTableView.frame)+RealWidth(6), CGRectGetMaxY(_dongwangSecondTableView.frame)-RealWidth(25), RealWidth(18), RealWidth(25));
    
    _dongwangThreeTableView.frame = CGRectMake(CGRectGetMaxX(_dongwangFenImgView.frame)+RealWidth(6), RealWidth(51), RealWidth(48), RealWidth(71));
    _mybackView2.frame = CGRectMake(CGRectGetMaxX(_dongwangFenImgView.frame)+RealWidth(6), RealWidth(51), RealWidth(48), RealWidth(71));
    
    
    _dongwangFoureTableView.frame =CGRectMake(CGRectGetMaxX(_dongwangThreeTableView.frame)+RealWidth(10), RealWidth(51), RealWidth(48), RealWidth(71));
    
    _mybackView3 .frame = CGRectMake(CGRectGetMaxX(_dongwangThreeTableView.frame)+RealWidth(10), RealWidth(51), RealWidth(48), RealWidth(71));
    
    _dongwangMiaoImgView.frame =CGRectMake(CGRectGetMaxX(_dongwangFoureTableView.frame)+RealWidth(6), CGRectGetMaxY(_dongwangFoureTableView.frame)-RealWidth(25), RealWidth(18), RealWidth(25));
    _injoinnbtn.frame = CGRectMake(CGRectGetWidth(_dongwangbackImgView.frame)/2-RealWidth(102), RealWidth(138), RealWidth(204), RealWidth(40));
    
}
-(void)setTimeStr:(NSString *)timeStr{
    _timeStr = timeStr;
    NSString * myTime = timeStr;
    
    //0954
//    NSLog(@"%@",timeStr);
    NSString * firstStr = [myTime  substringToIndex:1];

    //954
    NSString * seocndTempStr = [myTime substringFromIndex:1];
    //9
    NSString * seocndStr = [seocndTempStr substringToIndex:1];
//    NSLog(@"%@ %@",seocndTempStr,seocndStr);
    
    //54
    NSString * threeTempStr = [myTime substringFromIndex:2];
    //5
    NSString * threeStr = [threeTempStr substringToIndex:1];
    
    //4
    NSString * foureStr = [threeTempStr substringFromIndex:1];
//    NSLog(@"%@-%@",threeTempStr,foureStr);


//    NSLog(@"第一个：%@ 第二个：%@ 第三个:%@ 第四个：%@",firstStr,seocndStr,threeStr,foureStr);
    
    [_dongwangFirsTableView setContentOffset:CGPointMake(0, RealWidth(71)*([firstStr integerValue])) animated:NO];

    [_dongwangSecondTableView setContentOffset:CGPointMake(0, RealWidth(71)*([seocndStr integerValue])) animated:YES];

    [_dongwangThreeTableView setContentOffset:CGPointMake(0, RealWidth(71)*([threeStr integerValue])) animated:NO];

    [_dongwangFoureTableView setContentOffset:CGPointMake(0, RealWidth(71)*([foureStr integerValue])) animated:NO];

    
    
}
#pragma mark--立即参与
-(void)injonBtnClicks{
    
    [self.delegate DongwangDaletouStarViewAction];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
