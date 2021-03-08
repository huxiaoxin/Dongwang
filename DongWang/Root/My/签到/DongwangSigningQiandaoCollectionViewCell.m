//
//  DongwangSigningQiandaoCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/16.
//

#import "DongwangSigningQiandaoCollectionViewCell.h"
@interface DongwangSigningQiandaoCollectionViewCell ()
@property(nonatomic,strong)   UIImageView * DongwangBjView;
@property(nonatomic,strong)   UILabel * DongwangToplb;
@property(nonatomic,strong)  UIImageView * DongwangActityImgView;
@property(nonatomic,strong) UILabel * DongwangBtomlb;
@end
@implementation DongwangSigningQiandaoCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView * DongwangBjView = [[UIImageView alloc]init];
//       DongwangBjView.backgroundColor = [UIColor colorWithHexString:@"#F1F0FF"];
//        DongwangBjView.layer.cornerRadius = K(5);
//        DongwangBjView.layer.masksToBounds = YES;
        [self addSubview:DongwangBjView];
        _DongwangBjView = DongwangBjView;
        
        
        [DongwangBjView addSubview:self.DongwangToplb];
        [DongwangBjView addSubview:self.DongwangActityImgView];
        [DongwangBjView addSubview:self.DongwangBtomlb];
        
        
        
        
        
    }
    return self;
}
-(UIImageView *)DongwangActityImgView{
    if (!_DongwangActityImgView) {
        _DongwangActityImgView = [[UIImageView alloc]init];
        _DongwangActityImgView.image =[UIImage imageNamed:@"抽奖"];
        _DongwangActityImgView.layer.masksToBounds = YES;
        _DongwangActityImgView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _DongwangActityImgView;
}
-(UILabel *)DongwangBtomlb{
    if (!_DongwangBtomlb) {
        _DongwangBtomlb = [[UILabel alloc]init];
        _DongwangBtomlb.font = KSysFont(font(12));
        _DongwangBtomlb.textColor = [UIColor whiteColor];
        _DongwangBtomlb.text = @"2积分";

    }
    return _DongwangBtomlb;
}
-(UILabel *)DongwangToplb{
    if (!_DongwangToplb) {
        _DongwangToplb = [[UILabel alloc]init];
        _DongwangToplb.textAlignment = NSTextAlignmentCenter;
        _DongwangToplb.font = KBlFont(font(13));
        _DongwangToplb.textColor = [UIColor whiteColor];
        _DongwangToplb.text = @"第一天";

    }
    return _DongwangToplb;
}
-(void)setDongwnagFrameModel:(DongwangSigninQiandaoFrameModel *)dongwnagFrameModel{
    
    _dongwnagFrameModel  = dongwnagFrameModel;
    _DongwangBjView.frame = dongwnagFrameModel.ViewFrame;
    _DongwangToplb.frame = dongwnagFrameModel.ToplbFrame;
    _DongwangBtomlb.frame = dongwnagFrameModel.BtomlbFrame;
    _DongwangActityImgView.frame = dongwnagFrameModel.ImgFrame;
    if (dongwnagFrameModel.qiandaoModel.islast) {
        _DongwangToplb.textAlignment =  NSTextAlignmentLeft;
        _DongwangBtomlb.textAlignment = NSTextAlignmentLeft;
    }else{
        _DongwangToplb.textAlignment =  NSTextAlignmentCenter;
        _DongwangBtomlb.textAlignment = NSTextAlignmentCenter;
    }
    _DongwangToplb.text   = dongwnagFrameModel.qiandaoModel.signDate; 
    _DongwangBtomlb.text = dongwnagFrameModel.qiandaoModel.prizeName;
    

    //今日是否签到状态，0-未签到,1-已签到,2-今日待签到
    if ([dongwnagFrameModel.qiandaoModel.todayStatus intValue] == 0) {
        _DongwangBjView.alpha = 0.4;
        if (dongwnagFrameModel.qiandaoModel.islast) {
        _DongwangBjView.image = [UIImage imageNamed:@"未签到last"];
        }else{
        _DongwangBjView.image = [UIImage imageNamed:@"未签到背景"];
        }
        [_DongwangActityImgView sd_setImageWithURL:[NSURL URLWithString:dongwnagFrameModel.qiandaoModel.logo]];

    }else if ([dongwnagFrameModel.qiandaoModel.todayStatus intValue] == 1){
      //已签到
        _DongwangBjView.alpha =1;
        if (dongwnagFrameModel.qiandaoModel.islast) {
            _DongwangBjView.image = [UIImage imageNamed:@"已签到last"];
        }else{
            _DongwangBjView.image = [UIImage imageNamed:@"已签到背景"];
        }
        [_DongwangActityImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"已签到文字"]];

    }else if ([dongwnagFrameModel.qiandaoModel.todayStatus intValue] == 2){
        _DongwangBjView.alpha = 1;
        if (dongwnagFrameModel.qiandaoModel.islast) {
        _DongwangBjView.image = [UIImage imageNamed:@"未签到last"];
        }else{
        _DongwangBjView.image = [UIImage imageNamed:@"未签到背景"];
        }
     [_DongwangActityImgView sd_setImageWithURL:[NSURL URLWithString:dongwnagFrameModel.qiandaoModel.logo]];
    }
    
    
//    else{
//        _DongwangBjView.image = [UIImage imageNamed:@""];
//        _DongwangActityImgView.image = [UIImage imageNamed:@"已签到"];
//
//    }
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
//    _DongwangBjView.frame = self.bounds;
}
@end
