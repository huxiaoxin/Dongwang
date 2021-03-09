//
//  DongwangCirleTopinfoView.m
//  DongWang
//
//  Created by sycm on 2021/3/9.
//

#import "DongwangCirleTopinfoView.h"
@interface DongwangCirleTopinfoView ()
@property(nonatomic,strong) UIImageView * backImgView;
@property(nonatomic,strong) UIImageView * iconImgView;
@property(nonatomic,strong) UILabel * cireleTopnamelb;
@property(nonatomic,strong) UILabel * cirelCenterlb;
@property(nonatomic,strong) UIImageView * authorImgView;
@property(nonatomic,strong) UILabel * cirleBtomlb;
@property(nonatomic,strong)  UIButton * isAuhorebtn;

@property(nonatomic,strong) UIButton * joinBtn;
@end
@implementation DongwangCirleTopinfoView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.backImgView];
        [_backImgView addSubview:self.iconImgView];
        [_backImgView addSubview:self.cireleTopnamelb];
        [_backImgView addSubview:self.cirelCenterlb];
        [_backImgView addSubview:self.authorImgView];
        [_backImgView addSubview:self.cirleBtomlb];
        [_backImgView addSubview:self.isAuhorebtn];
        [_backImgView addSubview:self.joinBtn];
    }
    return self;
}
-(UIImageView *)backImgView{
    if (!_backImgView) {
        _backImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _backImgView.image =[UIImage imageNamed:@"backImg_cirle"];
        _backImgView.userInteractionEnabled = YES;
    }
    return _backImgView;
}
-(UIImageView *)iconImgView{
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _iconImgView.layer.borderColor = [UIColor whiteColor].CGColor;
        _iconImgView.layer.borderWidth = RealWidth(1);
        _backImgView.layer.cornerRadius = RealWidth(5);
        _iconImgView.layer.masksToBounds = YES;
        _iconImgView.backgroundColor = [UIColor redColor];
    }
    return _iconImgView;
}
-(UILabel *)cireleTopnamelb{
    if (!_cireleTopnamelb) {
        _cireleTopnamelb = [[UILabel alloc]initWithFrame:CGRectZero];
        _cireleTopnamelb.textColor =[UIColor whiteColor];
        _cireleTopnamelb.font = PFS16Font;
        _cireleTopnamelb.text = @"明日方舟圈";
    }
    return _cireleTopnamelb;
}
-(UILabel *)cirelCenterlb{
    if (!_cirelCenterlb) {
        _cirelCenterlb =[[UILabel alloc]initWithFrame:CGRectZero];
        _cirelCenterlb.textColor = [UIColor whiteColor];
        _cirelCenterlb.font = PFR13Font;
        _cirelCenterlb.text = @"加入8W，帖子51W";
    }
    return _cirelCenterlb;
}
-(UIImageView *)authorImgView{
    if (!_authorImgView) {
        _authorImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _authorImgView.layer.cornerRadius = RealWidth(7);
        _authorImgView.layer.masksToBounds = YES;
        _authorImgView.layer.borderColor = [UIColor whiteColor].CGColor;
        _authorImgView.layer.borderWidth = RealWidth(1);
        _authorImgView.backgroundColor = [UIColor redColor];
    }
    return _authorImgView;
}
-(UILabel *)cirleBtomlb{
    if (!_cirleBtomlb) {
        _cirleBtomlb = [[UILabel alloc]initWithFrame:CGRectZero];
        _cirleBtomlb.textColor = [UIColor whiteColor];
        _cirleBtomlb.font = PFR13Font;
        _cirleBtomlb.text = @"一水还宗";
    }
    return _cirleBtomlb;
}
-(UIButton *)isAuhorebtn{
    if (!_isAuhorebtn) {
    _isAuhorebtn = [[UIButton alloc]initWithFrame:CGRectZero];
    [_isAuhorebtn setBackgroundImage:[UIImage imageNamed:@"quanzhu"] forState:UIControlStateNormal];
        _isAuhorebtn.titleLabel.textAlignment =  NSTextAlignmentCenter;
        [_isAuhorebtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _isAuhorebtn.titleLabel.font = PFR9Font;
        [_isAuhorebtn setTitle:@"圈主" forState:UIControlStateNormal];
    }
    return _isAuhorebtn;
}
-(UIButton *)joinBtn{
    if (!_joinBtn) {
        _joinBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_joinBtn setBackgroundColor:[UIColor colorWithHexString:@"#FF9E67"]];
        _joinBtn.layer.cornerRadius = RealWidth(12.5);
        _joinBtn.layer.masksToBounds = YES;
        [_joinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_joinBtn setTitle:@"加入" forState:UIControlStateNormal];
        _joinBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _joinBtn.titleLabel.font = PFR14Font;
    }
    return _joinBtn;
}
-(void)layoutSubviews{
    _backImgView.frame = self.bounds;
    _iconImgView.frame = CGRectMake(RealWidth(16), CGRectGetMaxY(self.frame)-RealWidth(55+15), RealWidth(55), RealWidth(55));
    _cireleTopnamelb.frame = CGRectMake(CGRectGetMaxX(_iconImgView.frame)+RealWidth(15), CGRectGetMinY(_iconImgView.frame), RealWidth(250), RealWidth(16));
    _cirelCenterlb.frame = CGRectMake(CGRectGetMaxX(_iconImgView.frame)+RealWidth(15), CGRectGetMaxY(_cireleTopnamelb.frame)+RealWidth(7), RealWidth(250), RealWidth(16));
    _authorImgView.frame = CGRectMake(CGRectGetMaxX(_iconImgView.frame)+RealWidth(15), CGRectGetMaxY(_cirelCenterlb.frame)+RealWidth(7), RealWidth(14), RealWidth(14));
    _cirleBtomlb.frame = CGRectMake(CGRectGetMaxX(_authorImgView.frame)+RealWidth(5), CGRectGetMidY(_authorImgView.frame)-RealWidth(6), RealWidth(40), RealWidth(12));
    _isAuhorebtn.frame = CGRectMake(CGRectGetMaxX(_cirleBtomlb.frame)+RealWidth(20), CGRectGetMidY(_authorImgView.frame)-RealWidth(6), RealWidth(28), RealWidth(12));
    _joinBtn.frame = CGRectMake(SCREEN_WIDTH-RealWidth(76), CGRectGetMidY(_iconImgView.frame)-RealWidth(12.5), RealWidth(60), RealWidth(25));
}
@end
