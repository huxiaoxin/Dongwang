//
//  DongwangSendChatPhotoCollectionViewCell.m
//  DongWang
//
//  Created by sycm on 2021/3/2.
//

#import "DongwangSendChatPhotoCollectionViewCell.h"

@implementation DongwangSendChatPhotoCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.DongwangThubImgView];
        [_DongwangThubImgView addSubview:self.DongwangBtn];
        
    }
    return self;
}
-(UIImageView *)DongwangThubImgView{
    if (!_DongwangThubImgView) {
        _DongwangThubImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _DongwangThubImgView.userInteractionEnabled = YES;
    }
    return _DongwangThubImgView;
}
-(UIButton *)DongwangBtn{
    if (!_DongwangBtn) {
        _DongwangBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_DongwangBtn setImage:[UIImage imageNamed:@"error-1"] forState:UIControlStateNormal];
        [_DongwangBtn setBackgroundColor:[UIColor colorWithHexString:@"666666" Alpha:0.5]];
    }
    return _DongwangBtn;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    _DongwangThubImgView.frame =  self.bounds;
    _DongwangBtn.frame = CGRectMake(CGRectGetMaxX(_DongwangThubImgView.frame)-RealWidth(15), RealWidth(0), RealWidth(15), RealWidth(15));
}
@end
