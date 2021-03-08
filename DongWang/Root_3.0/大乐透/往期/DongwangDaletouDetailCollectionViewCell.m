//
//  DongwangDaletouDetailCollectionViewCell.m
//  DongWang
//
//  Created by sycm on 2021/2/23.
//

#import "DongwangDaletouDetailCollectionViewCell.h"
@interface DongwangDaletouDetailCollectionViewCell ()
@property(nonatomic,strong)  UIImageView * DongwangBakcImgView;
@property(nonatomic,strong)  UILabel * Dongwangtoplb;
@property(nonatomic,strong)  UILabel * Dongwangletoumalb;
@property(nonatomic,strong)  UILabel * Dongwangbtomlb;
@end
@implementation DongwangDaletouDetailCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //letouma_sel
        //letouma_nomal
        
        UIImageView * DongwangBakcImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, RealWidth(149), RealWidth(82))];
        DongwangBakcImgView.image =[UIImage imageNamed:@"letouma_sel"];
        [self addSubview:DongwangBakcImgView];
        _DongwangBakcImgView = DongwangBakcImgView;
        
        UITapGestureRecognizer * backImgTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bakcImTapClick)];
        [DongwangBakcImgView addGestureRecognizer:backImgTap];
        
        
        UILabel * Dongwangtoplb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(DongwangBakcImgView.frame), RealWidth(15))];
        Dongwangtoplb.textAlignment = NSTextAlignmentCenter;
        Dongwangtoplb.font = PFR11Font;
        Dongwangtoplb.textColor =[UIColor whiteColor];
        Dongwangtoplb.text = @"已中二等奖";
        [DongwangBakcImgView addSubview:Dongwangtoplb];
        _Dongwangtoplb = Dongwangtoplb;
        
        
        UILabel * Dongwangletoumalb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(Dongwangtoplb.frame)+RealWidth(12), CGRectGetWidth(DongwangBakcImgView.frame), RealWidth(27))];
        Dongwangletoumalb.textAlignment = NSTextAlignmentCenter;
        Dongwangletoumalb.font = PFR20Font;
        Dongwangletoumalb.textColor =[UIColor whiteColor];
        Dongwangletoumalb.text = @"958S51";
        [DongwangBakcImgView addSubview:Dongwangletoumalb];
        _Dongwangletoumalb  =Dongwangletoumalb;
        

        
        UILabel * Dongwangbtomlb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(Dongwangletoumalb.frame)+RealWidth(6), CGRectGetWidth(DongwangBakcImgView.frame), RealWidth(15))];
        Dongwangbtomlb.textAlignment = NSTextAlignmentCenter;
        Dongwangbtomlb.font = PFR9Font;
        Dongwangbtomlb.textColor =[UIColor whiteColor];
        Dongwangbtomlb.text = @"您的乐透码";
        [DongwangBakcImgView addSubview:Dongwangbtomlb];
        _Dongwangbtomlb = Dongwangbtomlb;
        

    }
    return self;
}
-(void)setHistoryModel:(DongwangMyHistoryModel *)historyModel{
    _historyModel = historyModel;
   //receive  是否领取 0-未领取 1-已领取 默认0
   //status    是否中奖 0-不中奖 1-中奖 2-过期 默认0
   
    if (historyModel.status == 2) {
        //已过期
        _DongwangBakcImgView.image = [UIImage imageNamed:@"letouma_nomal"];
        _DongwangBakcImgView.userInteractionEnabled = NO;

    }else if(historyModel.status == 1){
        //中奖
        if (historyModel.receive == 0) {
            //未领取
            _DongwangBakcImgView.userInteractionEnabled = YES;

            _DongwangBakcImgView.image = [UIImage imageNamed:@"letouma_sel"];
        }else{
            //已领取
            _DongwangBakcImgView.userInteractionEnabled = NO;

            _DongwangBakcImgView.image = [UIImage imageNamed:@"letouma_sel"];
        }
        
    }else if(historyModel.status == 0){
        _DongwangBakcImgView.userInteractionEnabled = NO;

        //未中奖
        _DongwangBakcImgView.image = [UIImage imageNamed:@"letouma_nomal"];
    }
    _Dongwangtoplb.text = [NSString isBlankString:historyModel.name] ? @"未中奖" : historyModel.name;
    _Dongwangletoumalb.text =  historyModel.ticketNum;
}
-(void)bakcImTapClick{
    
    [self.delegate DongwangDaletouDetailCollectionViewCellWithClickIndex:self.tag];
}
@end
