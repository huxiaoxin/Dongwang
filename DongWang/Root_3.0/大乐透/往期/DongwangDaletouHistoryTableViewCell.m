//
//  DongwangDaletouHistoryTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2021/2/1.
//

#import "DongwangDaletouHistoryTableViewCell.h"
#import "DongwangDaletouHistoryCollectionViewCell.h"
#import "LMJVerticalScrollText.h"
#import "SHInfiniteShufflingLabel.h"
#import <SDCycleScrollView.h>
@interface DongwangDaletouHistoryTableViewCell  ()<UICollectionViewDelegate,UICollectionViewDataSource>
//@property(nonatomic,strong) LMJVerticalScrollText *  tikieNumlb;
//@property(nonatomic,strong) UILabel *  tikieNumlb;
//@property(nonatomic,strong) SHInfiniteShufflingLabel *  tikieNumlb;
@property(nonatomic,strong) SDCycleScrollView * SDCView;
@property(nonatomic,strong) UILabel * tikieNumbtomlb;
@property(nonatomic,strong) UILabel* DongwangToppricelb;
@property(nonatomic,strong) UILabel *  ToplbTimelb;
@property(nonatomic,strong) UILabel * BtomTimelb;
@property(nonatomic,strong) UICollectionView * collectionView;
@property(nonatomic,strong) UIImageView * DongwangContentImgView;
@property(nonatomic,strong) UIImageView *  fengeimgView;
@property(nonatomic,strong) UIView * DongwangThreeline;
@property(nonatomic,strong) UIView * DongwangSecondline;
@property(nonatomic,strong) UIView * DongwangFirstline;
@end
@implementation DongwangDaletouHistoryTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        UIImageView * DongwangContentImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(13), RealWidth(10), SCREEN_WIDTH-RealWidth(26), RealWidth(200))];
        DongwangContentImgView.image = [UIImage imageNamed:@"wangqihistory"];
        [self.contentView addSubview:DongwangContentImgView];
        _DongwangContentImgView = DongwangContentImgView;
        
        SDCycleScrollView * sdcView =  [[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, RealWidth(28), CGRectGetWidth(DongwangContentImgView.frame)-RealWidth(15), RealWidth(30))];
        sdcView.titleLabelBackgroundColor = [UIColor clearColor];
        sdcView.mainView.backgroundColor = [UIColor clearColor];
        sdcView.onlyDisplayText = YES;
        sdcView.backgroundColor = [UIColor clearColor];
        sdcView.titleLabelTextAlignment = NSTextAlignmentCenter;
        sdcView.titleLabelTextColor = [UIColor colorWithHexString:@"#804AB7"];
        sdcView.titleLabelTextFont = PFS30Font;
        sdcView.scrollDirection = UICollectionViewScrollDirectionVertical;
        [DongwangContentImgView addSubview:sdcView];
        _SDCView = sdcView;
        

        
        
        UILabel * tikieNumbtomlb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(sdcView.frame)+RealWidth(8), CGRectGetWidth(DongwangContentImgView.frame), RealWidth(15))];
        tikieNumbtomlb.textAlignment = NSTextAlignmentCenter;
        tikieNumbtomlb.font = PFS15Font;
        tikieNumbtomlb.textColor = [UIColor colorWithHexString:@"#804AB7"];
        tikieNumbtomlb.text = @"";
        [DongwangContentImgView addSubview:tikieNumbtomlb];
        _tikieNumbtomlb = tikieNumbtomlb;
        
        
        UIImageView * DongwangTopPriceImgView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangContentImgView.frame)-RealWidth(75+15), RealWidth(0), RealWidth(75), RealWidth(45))];
        DongwangTopPriceImgView.image = [UIImage imageNamed:@"topprice"];
        [DongwangContentImgView addSubview:DongwangTopPriceImgView];
        
        
        UILabel* DongwangToppricelb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(DongwangTopPriceImgView.frame), CGRectGetHeight(DongwangTopPriceImgView.frame))];
        DongwangToppricelb.numberOfLines = 0;
        DongwangToppricelb.font = PFR15Font;
        DongwangToppricelb.textAlignment = NSTextAlignmentCenter;
        DongwangToppricelb.textColor = [UIColor whiteColor];
        [DongwangTopPriceImgView addSubview:DongwangToppricelb];
        _DongwangToppricelb = DongwangToppricelb;
        
        
        UIImageView * DongwangTimeBakcImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(22), RealWidth(21), RealWidth(65), RealWidth(65))];
        DongwangTimeBakcImgView.image = [UIImage imageNamed:@"history_data"];
        [DongwangContentImgView addSubview:DongwangTimeBakcImgView];
        
        
        UILabel *  ToplbTimelb = [[UILabel alloc]initWithFrame:CGRectMake(0, RealWidth(7), CGRectGetWidth(DongwangTimeBakcImgView.frame), RealWidth(30))];
        ToplbTimelb.textAlignment = NSTextAlignmentCenter;
        ToplbTimelb.textColor = [UIColor whiteColor];
        [DongwangTimeBakcImgView addSubview:ToplbTimelb];
        _ToplbTimelb = ToplbTimelb;
        
        
        UILabel * BtomTimelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangTimeBakcImgView.frame)/2-RealWidth(25), CGRectGetMaxY(ToplbTimelb.frame)+RealWidth(5), RealWidth(50), RealWidth(15))];
        BtomTimelb.layer.cornerRadius = RealWidth(7.5);
        BtomTimelb.layer.masksToBounds = YES;
        [BtomTimelb setBackgroundColor:[UIColor colorWithHexString:@"#E5DAF0"]];
        BtomTimelb.font =  PFR15Font;
        BtomTimelb.textAlignment = NSTextAlignmentCenter;
        BtomTimelb.textColor = [UIColor colorWithHexString:@"#6F48B8"];
        [DongwangTimeBakcImgView addSubview:BtomTimelb];
        _BtomTimelb  =  BtomTimelb;
        
        
        
        UIImageView *  fengeimgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangTimeBakcImgView.frame)+RealWidth(10), CGRectGetWidth(DongwangContentImgView.frame)-RealWidth(10), RealWidth(1))];
        fengeimgView.image = [UIImage imageNamed:@"fengelin"];
        [DongwangContentImgView addSubview:fengeimgView];
        _fengeimgView = fengeimgView;
        
        
        
        
        UIView * DongwangFirstline  = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangContentImgView.frame)/3, CGRectGetMaxY(fengeimgView.frame)+RealWidth(8), 0.5, RealWidth(60))];
        DongwangFirstline.backgroundColor = [UIColor colorWithHexString:@"#6A43B5"];
        [DongwangContentImgView addSubview:DongwangFirstline];
        _DongwangFirstline = DongwangFirstline;
        
        
        UIView * DongwangSecondline  = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangContentImgView.frame)/3*2, CGRectGetMaxY(fengeimgView.frame)+RealWidth(8), 0.5, RealWidth(60))];
        DongwangSecondline.backgroundColor = [UIColor colorWithHexString:@"#6A43B5"];
        [DongwangContentImgView addSubview:DongwangSecondline];
        _DongwangSecondline = DongwangSecondline;
        
        
        UIView * DongwangThreeline  = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangContentImgView.frame)/2, CGRectGetMaxY(fengeimgView.frame)+RealWidth(8), 0.5, RealWidth(60))];
        DongwangThreeline.backgroundColor = [UIColor colorWithHexString:@"#6A43B5"];
        [DongwangContentImgView addSubview:DongwangThreeline];
        _DongwangThreeline = DongwangThreeline;
        
        
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangTimeBakcImgView.frame)+RealWidth(10), CGRectGetWidth(DongwangContentImgView.frame), 0) collectionViewLayout:layout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.backgroundColor = [UIColor clearColor];
        [DongwangContentImgView addSubview:collectionView];
        _collectionView = collectionView;
        [collectionView registerClass:[DongwangDaletouHistoryCollectionViewCell class] forCellWithReuseIdentifier:@"DongwangDaletouHistoryCollectionViewCell"];
        
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _historyModel.prizeResponses.count;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat ImgWidth = SCREEN_WIDTH-RealWidth(26+15);
    return CGSizeMake(ImgWidth/_historyModel.prizeResponses.count, RealWidth(85));
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangDaletouHistoryCollectionViewCell * CollectionViewCell= [collectionView dequeueReusableCellWithReuseIdentifier:@"DongwangDaletouHistoryCollectionViewCell" forIndexPath:indexPath];
    CollectionViewCell.resPone = _historyModel.prizeResponses[indexPath.row];
    return CollectionViewCell;
}


-(void)setHistoryModel:(DongwangDaletouHistoryModel *)historyModel{
    _historyModel = historyModel;
    _SDCView.titlesGroup = historyModel.ticketNums;
    _tikieNumbtomlb.text = @"一等奖中奖号码";
    _DongwangToppricelb.text = [NSString stringWithFormat:@"最高\n¥%@",historyModel.topPrize];
    NSString * schedule = historyModel.schedule;
    NSString * schedulemonthe = [schedule substringFromIndex:5];
    NSArray * scheduleAr  = [schedulemonthe componentsSeparatedByString:@"-"];
    //年
    NSString * scheduleyear = [schedule substringToIndex:4];
    //月
    NSString * moneth =scheduleAr.firstObject;
    //日
    NSString * day = scheduleAr.lastObject;
    NSMutableAttributedString * attbure = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@/%@",day,moneth]];
    [attbure addAttribute:NSFontAttributeName value:PFS30Font range:NSMakeRange(0, day.length)];
    [attbure addAttribute:NSFontAttributeName value:PFR17Font range:NSMakeRange(day.length, moneth.length+1)];
    _ToplbTimelb.attributedText = attbure;
    _BtomTimelb.text =  scheduleyear;
    _fengeimgView.hidden =  _historyModel.prizeResponses.count == 0 ? YES : NO;
    _collectionView.height = _historyModel.prizeResponses.count == 0 ? 0 : RealWidth(85);
    [_collectionView reloadData];
    _historyModel.CellHeight = _historyModel.prizeResponses.count == 0 ? RealWidth(136+30) : RealWidth(189+30);
    
    _DongwangContentImgView.height = _historyModel.CellHeight-RealWidth(15);
    
    if (_historyModel.prizeResponses.count ==  1 ) {
        _DongwangThreeline.hidden = YES;
        _DongwangSecondline.hidden = YES;
        _DongwangFirstline.hidden = YES;
    }else if (_historyModel.prizeResponses.count == 2){
        _DongwangThreeline.hidden   =  NO;
        _DongwangSecondline.hidden = YES;
        _DongwangFirstline.hidden = YES;
    }else if (_historyModel.prizeResponses.count == 3){
        _DongwangThreeline.hidden   =  YES;
        _DongwangSecondline.hidden = NO;
        _DongwangFirstline.hidden = NO;
    }else{
        _DongwangThreeline.hidden = YES;
        _DongwangSecondline.hidden = YES;
        _DongwangFirstline.hidden = YES;
    }
}
@end
