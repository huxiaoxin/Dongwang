//
//  DongwangRightAnsureTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2021/2/19.
//

#import "DongwangRightAnsureTableViewCell.h"
@interface DongwangRightAnsureTableViewCell ()
@property(nonatomic,strong) UIView *  DongwangContentView;
@property(nonatomic,strong) UILabel * DongwangAnsurelb;
@property(nonatomic,strong) UIImageView * DongwangImgView;

@end
@implementation DongwangRightAnsureTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor  = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.DongwangContentView];
        [_DongwangContentView addSubview:self.DongwangAnsurelb];
        [_DongwangContentView addSubview:self.DongwangImgView];
    }
    return self;
}
-(UIImageView *)DongwangImgView{
    if (!_DongwangImgView) {
        _DongwangImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _DongwangImgView.size = CGSizeMake(RealWidth(25), RealWidth(25));
        
    }
    return _DongwangImgView;
}
-(UIView *)DongwangContentView{
    if (!_DongwangContentView) {
        _DongwangContentView =  [[UIView alloc]initWithFrame:CGRectMake(RealWidth(63), RealWidth(0), SCREEN_WIDTH- RealWidth(16+126),RealWidth(0))];
        _DongwangContentView.backgroundColor = [UIColor whiteColor];
        _DongwangContentView.layer.masksToBounds = YES;
    }
    return _DongwangContentView;
}
-(UILabel *)DongwangAnsurelb{
    if (!_DongwangAnsurelb) {
        _DongwangAnsurelb = [[UILabel alloc]initWithFrame:CGRectZero];
        _DongwangAnsurelb.numberOfLines = 0;
        _DongwangAnsurelb.textColor = [UIColor blackColor];
        _DongwangAnsurelb.font = PFR15Font;
    }
    return _DongwangAnsurelb;
}
-(void)setLsitModel:(ResponseList *)lsitModel{
    _lsitModel = lsitModel;
    _DongwangAnsurelb.text =  lsitModel.title;
    
    CGFloat maxWidth = RealWidth(234);
    CGFloat  minHeight = RealWidth(40);
    
    CGRect  titleRect =   [lsitModel.title cxl_sizeWithMoreString:PFR15Font maxWidth:maxWidth-RealWidth(35+40)];
    
   
    _DongwangAnsurelb.frame = CGRectMake(RealWidth(20), RealWidth(0), titleRect.size.width, titleRect.size.height);
    CGFloat ContentViewHeight = titleRect.size.height+RealWidth(20);
    
    _DongwangContentView.height = ContentViewHeight;
    _DongwangAnsurelb.y = CGRectGetMidY(_DongwangContentView.frame)-titleRect.size.height/2;
    _DongwangContentView.layer.cornerRadius =  RealWidth(ContentViewHeight)/2;
    
    _DongwangImgView.origin = CGPointMake(CGRectGetWidth(_DongwangContentView.frame)-RealWidth(35), CGRectGetMidY(_DongwangContentView.frame)-RealWidth(12));
        
    lsitModel.CellHeight =  CGRectGetMaxY(_DongwangContentView.frame)+RealWidth(20);
    //erro
    //Correct
    
    
    
    
    
    //0-没有答过 1-已经答过 已经答过会返回用户选择的答案
    if ([lsitModel.status integerValue] == 0) {
        _DongwangImgView.hidden = YES;
        _DongwangAnsurelb.textColor = [UIColor blackColor];
        _DongwangContentView.backgroundColor = [UIColor whiteColor];
        
    }else{
        //用户选择的答案
        if (lsitModel.user_isCorect) {
            if (lsitModel.is_Correct) {
                _DongwangAnsurelb.textColor = [UIColor whiteColor];
                _DongwangContentView.backgroundColor = [UIColor colorWithHexString:@"#01B32E"];
                _DongwangImgView.image = [UIImage imageNamed:@"Correct"];
                _DongwangImgView.hidden = NO;
            }else{
                _DongwangImgView.hidden = NO;
                _DongwangAnsurelb.textColor = [UIColor whiteColor];
                _DongwangContentView.backgroundColor = [UIColor colorWithHexString:@"#D54F00"];
                _DongwangImgView.image = [UIImage imageNamed:@"erro"];
            }
        }else{
            if (lsitModel.is_Correct) {
                _DongwangAnsurelb.textColor = [UIColor whiteColor];
                _DongwangContentView.backgroundColor = [UIColor colorWithHexString:@"#01B32E"];
                _DongwangImgView.image = [UIImage imageNamed:@"Correct"];
                _DongwangImgView.hidden = NO;
            }else{
                _DongwangImgView.hidden = YES;
                _DongwangAnsurelb.textColor = [UIColor blackColor];
                _DongwangContentView.backgroundColor = [UIColor whiteColor];
                
            }
            
            
        }
        
        
        

    }
    
   
    
    
}
@end
