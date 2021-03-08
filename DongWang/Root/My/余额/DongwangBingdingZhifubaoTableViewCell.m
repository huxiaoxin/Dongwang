//
//  DongwangBingdingZhifubaoTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/11.
//

#import "DongwangBingdingZhifubaoTableViewCell.h"
@interface DongwangBingdingZhifubaoTableViewCell ()
{
    UILabel * _Dongwangleftlb;
}
@end
@implementation DongwangBingdingZhifubaoTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        UIView * Dongwangline = [[UIView alloc]initWithFrame:CGRectMake(K(98), K(55.5), SCREEN_WIDTH-K(98+24), K(1))];
        Dongwangline.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:Dongwangline];

        
        UILabel * Dongwangleftlb = [[UILabel alloc]initWithFrame:CGRectMake(K(24.5), K(25), K(100), K(18.5))];
        Dongwangleftlb.text =  @"真实姓名：";
        Dongwangleftlb.font = KSysFont(font(13));
        Dongwangleftlb.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
        [self.contentView addSubview:Dongwangleftlb];
        _Dongwangleftlb = Dongwangleftlb;
        
        
        UITextField * DongwangCodeTextField = [[UITextField alloc]initWithFrame:CGRectMake((111.5), K(17), SCREEN_WIDTH-K(111.5+24), K(35))];
        DongwangCodeTextField.font = KSysFont(font(13));
        DongwangCodeTextField.textColor =  [UIColor colorWithHexString:@"#999999"];
        [self addSubview:DongwangCodeTextField];
        _DongwangCodeTextField = DongwangCodeTextField;
        
        
        
        
        
    }
    return self;
}
-(void)DongwangBingdingZhifubaoTableViewCellConfigerleftArr:(NSMutableArray *)leftdata rightDataList:(NSMutableArray *)rightData  holderTextList:(NSMutableArray *)holderData indexPath:(NSInteger)index{
    if (index == 0) {
        _DongwangCodeTextField.textColor = [UIColor colorWithHexString:@"#D4D4D4"];
        _DongwangCodeTextField.clearButtonMode =  UITextFieldViewModeNever;
        _DongwangCodeTextField.enabled = NO;
    }else{
        _DongwangCodeTextField.textColor = [UIColor colorWithHexString:@"#DEDEDE"];
        _DongwangCodeTextField.clearButtonMode =  UITextFieldViewModeAlways;
        _DongwangCodeTextField.enabled = YES;
    }
    _Dongwangleftlb.text = leftdata[index];
    
    NSString * rightText =  rightData[index];
    NSString * holderText = holderData[index];
    
    if (holderText.length != 0) {
_DongwangCodeTextField.attributedPlaceholder =  [[NSAttributedString alloc] initWithString:holderText attributes:@{NSFontAttributeName:KSysFont(font(12)),NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#999999"]}];
    }
    
    if (rightText.length != 0) {
  _DongwangCodeTextField.text = rightText;
    }
}
@end
