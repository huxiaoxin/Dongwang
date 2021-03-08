//
//  DongwangMychatDetailTableViewCell.m
//  DongWang
//
//  Created by sycm on 2021/3/5.
//

#import "DongwangMychatDetailTableViewCell.h"
@interface DongwangMychatDetailTableViewCell ()
@property(nonatomic,strong) UIImageView * DongwanguserImgView;
@property(nonatomic,strong) UILabel  *  DongwanguserNamelb;
@property(nonatomic,strong) UILabel * DongwangContentlb;
@property(nonatomic,strong) UILabel * DongwangTimelb;
@property(nonatomic,strong) UILabel * DongwangZanlb;
@property(nonatomic,strong) UIView * Dongwangline;
@end
@implementation DongwangMychatDetailTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.DongwanguserImgView];
        [self addSubview:self.DongwanguserNamelb];
        [self addSubview:self.DongwangContentlb];
        [self addSubview:self.DongwangTimelb];
        [self addSubview:self.DongwangZanlb];
        [self addSubview:self.Dongwangline];
    }
    return self;
}
-(UIView *)Dongwangline{
    if (!_Dongwangline) {
        _Dongwangline = [[UIView alloc]init];
        _Dongwangline.backgroundColor =[UIColor colorWithHexString:@"#FFFFFF"];
    }
    return _Dongwangline;
}
- (UILabel *)DongwangZanlb{
    if (!_DongwangZanlb) {
        _DongwangZanlb = [[UILabel alloc]init];
        _DongwangZanlb.textColor = [UIColor whiteColor];
        _DongwangZanlb.font = PFR11Font;
        _DongwangZanlb.textColor = [UIColor whiteColor];
        _DongwangZanlb.textAlignment = NSTextAlignmentRight;
        _DongwangZanlb.text = @"12";
        UIImage *img = [UIImage imageNamed:@"zan_btn"];
        NSTextAttachment *textAttach = [[NSTextAttachment alloc]init];
        textAttach.image = img;
        textAttach.bounds = CGRectMake(0, -2, RealWidth(15), RealWidth(15));
        NSAttributedString * strA =[NSAttributedString attributedStringWithAttachment:textAttach];
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:@" 12"];
        [attri insertAttributedString:strA atIndex:0];
        _DongwangZanlb.attributedText = attri;
        
    }
    return _DongwangZanlb;
}
-(UILabel *)DongwangTimelb{
    if (!_DongwangTimelb) {
        _DongwangTimelb = [[UILabel alloc]init];
        _DongwangTimelb.textColor = [UIColor colorWithHexString:@"#DEDEDE"];
        _DongwangTimelb.font =  PFR10Font;
        _DongwangTimelb.text = @"2020-12-17";
    }
    return _DongwangTimelb;
}
-(UILabel *)DongwangContentlb{
    if (!_DongwangContentlb) {
        _DongwangContentlb = [[UILabel alloc]init];
        _DongwangContentlb.textColor =[UIColor whiteColor];
        _DongwangContentlb.font = PFR14Font;
        _DongwangContentlb.text = @"这波操作我直呼内行";
    }
    return _DongwangContentlb;
}
-(UILabel *)DongwanguserNamelb{
    if (!_DongwanguserNamelb) {
        _DongwanguserNamelb = [[UILabel alloc]init];
        _DongwanguserNamelb.textColor = [UIColor whiteColor];
        _DongwanguserNamelb.font = PFR12Font;
        _DongwanguserNamelb.text = @"平平无奇小天才";
    }
    return _DongwanguserNamelb;
}
-(UIImageView *)DongwanguserImgView{
    if (!_DongwanguserImgView) {
        _DongwanguserImgView = [[UIImageView alloc]init];
        _DongwanguserImgView.backgroundColor = [UIColor redColor];
        _DongwanguserImgView.layer.cornerRadius = RealWidth(18);
        _DongwanguserImgView.layer.masksToBounds = YES;
    }
    return _DongwanguserImgView;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    _DongwanguserImgView.frame = CGRectMake(RealWidth(15), RealWidth(15), RealWidth(36), RealWidth(36));
    _DongwanguserNamelb.frame = CGRectMake(CGRectGetMaxX(_DongwanguserImgView.frame)+RealWidth(10), RealWidth(15), RealWidth(200), RealWidth(12));
    _DongwangContentlb.frame = CGRectMake(CGRectGetMaxX(_DongwanguserImgView.frame)+RealWidth(10), CGRectGetMaxY(_DongwanguserNamelb.frame)+RealWidth(10), SCREEN_WIDTH-RealWidth(30)-CGRectGetMaxX(_DongwanguserImgView.frame)-RealWidth(10), RealWidth(15));
    _DongwangTimelb.frame =  CGRectMake(RealWidth(15), CGRectGetMaxY(_DongwanguserImgView.frame)+RealWidth(10), RealWidth(200), RealWidth(10));
    _DongwangZanlb.frame = CGRectMake(SCREEN_WIDTH-RealWidth(120), CGRectGetMaxY(_DongwanguserImgView.frame)+RealWidth(10), RealWidth(80), RealWidth(15));
    _Dongwangline.frame = CGRectMake(0, CGRectGetMaxY(_DongwangTimelb.frame)+RealWidth(15), SCREEN_WIDTH-RealWidth(30), RealWidth(1));

}
@end
