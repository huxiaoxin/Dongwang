//
//  DongwangCreatCirelHeaderView.m
//  DongWang
//
//  Created by sycm on 2021/3/9.
//

#import "DongwangCreatCirelHeaderView.h"
@interface DongwangCreatCirelHeaderView ()
@property(nonatomic,strong) UIImageView * userHeaderImgView;
@property(nonatomic,strong) UILabel * userHeadermsglb;
@property(nonatomic,strong) UILabel * cirleNamelb;
@property(nonatomic,strong) UITextField * cirleNameTextField;
@property(nonatomic,strong) UIView * cirleNameLine;

@property(nonatomic,strong) UILabel * cirleIntrducelb;
@property(nonatomic,strong) UITextView * cirleIntrducetextView;
@property(nonatomic,strong) UIView * cirleIntrduceLine;

@property(nonatomic,strong) UIView * btomView;
@property(nonatomic,strong) UILabel * cirletypelb;
@property(nonatomic,strong) UITextField * ciretypeTextField;
@property(nonatomic,strong) UIView * cirleTypeLine;
@property(nonatomic,strong) UIImageView * cirleTypeRightImg;

@property(nonatomic,strong) UIButton * cirleCommitBtn;
@end
@implementation DongwangCreatCirelHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.userHeaderImgView];
        [self addSubview:self.userHeadermsglb];
        [self addSubview:self.cirleNamelb];
        [self addSubview:self.cirleNameTextField];
        [self addSubview:self.cirleNameLine];
        [self addSubview:self.cirleIntrducelb];
        [self addSubview:self.cirleIntrducetextView];
        [self addSubview:self.cirleIntrduceLine];
        [self addSubview:self.btomView];
        [_btomView addSubview:self.cirletypelb];
        [_btomView addSubview:self.ciretypeTextField];
        [_btomView addSubview:self.cirleTypeLine];
        [_btomView addSubview:self.cirleTypeRightImg];
        [_btomView addSubview:self.cirleCommitBtn];
        self.cirleHeaderHeight = CGRectGetMaxY(_btomView.frame);
        MJWeakSelf;
        [self.cirleIntrducetextView wzb_autoHeightWithMaxHeight:MAXFLOAT textViewHeightDidChanged:^(CGFloat currentTextViewHeight) {
            NSLog(@"=%f",currentTextViewHeight);
            weakSelf.cirleIntrducetextView.height = currentTextViewHeight;
            weakSelf.cirleIntrduceLine.y = CGRectGetMaxY(weakSelf.cirleIntrducetextView.frame)+RealWidth(5);
            weakSelf.btomView.y = CGRectGetMaxY(weakSelf.cirleIntrduceLine.frame);
            weakSelf.cirleHeaderHeight = CGRectGetMaxY(weakSelf.btomView.frame);
            [weakSelf.delegate DongwangCreatCirelHeaderViewupdateFrame:weakSelf.cirleHeaderHeight];
        }];
    }
    return self;
}
-(UIImageView *)userHeaderImgView{
    if (!_userHeaderImgView) {
        _userHeaderImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-RealWidth(37.5), RealWidth(35), RealWidth(75), RealWidth(75))];
        _userHeaderImgView.image =[UIImage imageNamed:@"cirle_add"];
        [_userHeaderImgView ImgTapActionWith:^(id  _Nonnull object) {
        }];
    }
    return _userHeaderImgView;
}
-(UILabel *)userHeadermsglb{
    if (!_userHeadermsglb) {
        _userHeadermsglb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_userHeaderImgView.frame)+RealWidth(10), SCREEN_WIDTH, RealWidth(15))];
        _userHeadermsglb.textAlignment = NSTextAlignmentCenter;
        _userHeadermsglb.textColor =[UIColor colorWithHexString:@"#FFFFFF" Alpha:0.7];
        _userHeadermsglb.font = PFR14Font;
        _userHeadermsglb.text  = @"添加圈子头像";
    }
    return _userHeadermsglb;
}
-(UILabel *)cirleNamelb{
    if (!_cirleNamelb) {
    _cirleNamelb = [self ToplbConfigeWithText:@"圈子名称" lbFrame:CGRectMake(RealWidth(15), RealWidth(30)+CGRectGetMaxY(_userHeadermsglb.frame), RealWidth(200), RealWidth(17))];
    }
    return  _cirleNamelb;
}
-(UITextField *)cirleNameTextField{
    if (!_cirleNameTextField) {
        _cirleNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(RealWidth(20), CGRectGetMaxY(_cirleNamelb.frame)+RealWidth(20), SCREEN_WIDTH-RealWidth(40), RealWidth(40))];
        [_cirleNameTextField addPlaceholders:PFR14Font holderStr:@"输入圈子名称（必填）" holderColor:[UIColor colorWithHexString:@"#FFFFFF" Alpha:0.7]];
        _cirleNameTextField.textColor = [UIColor whiteColor];
        _cirleNameTextField.font = PFR15Font;
//        _cirleNameTextField.clearButtonMode = UITextFieldViewModeAlways;
    }
    return _cirleNameTextField;
}
-(UIView *)cirleNameLine{
    if (!_cirleNameLine) {
        _cirleNameLine = [[UIView alloc]initWithFrame:CGRectMake(RealWidth(15), CGRectGetMaxY(_cirleNameTextField.frame)+RealWidth(10), SCREEN_WIDTH-RealWidth(30), RealWidth(1))];
        _cirleNameLine.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF" Alpha:0.5];
    }
    return _cirleNameLine;
}
-(UILabel *)cirleIntrducelb{
    if (!_cirleIntrducelb) {
        _cirleIntrducelb = [self ToplbConfigeWithText:@"圈子简介" lbFrame:CGRectMake(RealWidth(15), CGRectGetMaxY(_cirleNameLine.frame)+RealWidth(20), RealWidth(200), RealWidth(17))];
    }
    return _cirleIntrducelb;
}
-(UITextView *)cirleIntrducetextView{
    if (!_cirleIntrducetextView) {
        _cirleIntrducetextView = [[UITextView alloc]initWithFrame:CGRectMake(RealWidth(20), CGRectGetMaxY(_cirleIntrducelb.frame)+RealWidth(20), SCREEN_WIDTH-RealWidth(40), RealWidth(39))];
        _cirleIntrducetextView.wzb_placeholderColor = [UIColor colorWithHexString:@"#FFFFFF" Alpha:0.7];
        _cirleIntrducetextView.wzb_placeholder = @"输入圈子简介（必填）";
        _cirleIntrducetextView.holderFont = PFR15Font;
        _cirleIntrducetextView.font = PFR15Font;
        _cirleIntrducetextView.textColor =[UIColor whiteColor];
        _cirleIntrducetextView.backgroundColor =[UIColor clearColor];
    }
    return _cirleIntrducetextView;
}
- (UIView *)cirleIntrduceLine{
    if (!_cirleIntrduceLine) {
        _cirleIntrduceLine = [[UIView alloc]initWithFrame:CGRectMake(RealWidth(15), CGRectGetMaxY(_cirleIntrducetextView.frame)+RealWidth(5), SCREEN_WIDTH-RealWidth(30), RealWidth(1))];
        _cirleIntrduceLine.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF" Alpha:0.5];

    }
    return _cirleIntrduceLine;
}
-(UIView *)btomView{
    if (!_btomView) {
        _btomView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_cirleIntrduceLine.frame), SCREEN_WIDTH, RealWidth(200))];
//        _btomView.backgroundColor = [UIColor redColor];
    }
    return _btomView;
}
- (UILabel *)cirletypelb{
    if (!_cirletypelb) {
        _cirletypelb  = [self ToplbConfigeWithText:@"圈子类目" lbFrame:CGRectMake(RealWidth(15), RealWidth(20), RealWidth(200), RealWidth(17))];
    }
    return _cirletypelb;
}
- (UITextField *)ciretypeTextField{
    if (!_ciretypeTextField) {
        _ciretypeTextField = [[UITextField alloc]initWithFrame:CGRectMake(RealWidth(30), CGRectGetMaxY(_cirletypelb.frame)+RealWidth(20), SCREEN_WIDTH-RealWidth(60), RealWidth(40))];
        [_ciretypeTextField addPlaceholders:PFR14Font holderStr:@"选择圈子类目" holderColor:[UIColor colorWithHexString:@"#FFFFFF" Alpha:0.7]];
        _ciretypeTextField.textColor = [UIColor whiteColor];
        _ciretypeTextField.font = PFR15Font;
        _ciretypeTextField.userInteractionEnabled =YES;
        UITapGestureRecognizer * textFieldTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ciretypeTextFieldTapclick)];
        [_ciretypeTextField addGestureRecognizer:textFieldTap];
    }
    return _ciretypeTextField;
}
- (UIView *)cirleTypeLine{
    if (!_cirleTypeLine) {
        _cirleTypeLine = [[UIView alloc]initWithFrame:CGRectMake(RealWidth(15), CGRectGetMaxY(_ciretypeTextField.frame)+RealWidth(5), SCREEN_WIDTH-RealWidth(30), RealWidth(1))];
        _cirleTypeLine.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF" Alpha:0.5];
    }
    return _cirleTypeLine;
}
-(UILabel * )ToplbConfigeWithText:(NSString *)lbStr lbFrame:(CGRect)lbFrame{
    UILabel * toplb = [[UILabel alloc]initWithFrame:lbFrame];
    toplb.text = lbStr;
    toplb.font = PFS17Font;
    toplb.textColor =[UIColor whiteColor];
    return toplb;
}
- (UIImageView *)cirleTypeRightImg{
    if (!_cirleTypeRightImg) {
        _cirleTypeRightImg =[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-RealWidth(15+15), CGRectGetMidY(_ciretypeTextField.frame)-RealWidth(12), RealWidth(15), RealWidth(24))];
        _cirleTypeRightImg.image = [UIImage imageNamed:@"Fill2"];
        MJWeakSelf;
        [_cirleTypeRightImg ImgTapActionWith:^(id  _Nonnull object) {
        [weakSelf.delegate DongwangCreatCirelHeaderViewTosSeltecdCirle:weakSelf.ciretypeTextField];
        }];
    }
    return _cirleTypeRightImg;
}
- (UIButton *)cirleCommitBtn{
    if (!_cirleCommitBtn) {
        _cirleCommitBtn = [[UIButton alloc]initWithFrame:CGRectMake(RealWidth(48), CGRectGetMaxY(_cirleTypeLine.frame)+RealWidth(40), SCREEN_WIDTH-RealWidth(96), RealWidth(42))];
        [_cirleCommitBtn setBackgroundImage:[UIImage imageNamed:@"disable_btn"] forState:UIControlStateDisabled];
        [_cirleCommitBtn setBackgroundImage:[UIImage imageNamed:@"sel_btn"] forState:UIControlStateNormal];
        [_cirleCommitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _cirleCommitBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _cirleCommitBtn .titleLabel.font = PFR17Font;
        [_cirleCommitBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_cirleCommitBtn setTitle:@"提交" forState:UIControlStateDisabled];
        [_cirleCommitBtn addTarget:self action:@selector(cirleCommitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cirleCommitBtn;
}
-(void)cirleCommitBtnClick:(UIButton *)btn{
    
    NSLog(@"1");
}
-(void)ciretypeTextFieldTapclick{
    [self.delegate DongwangCreatCirelHeaderViewTosSeltecdCirle:_ciretypeTextField];
}
@end
