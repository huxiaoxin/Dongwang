//
//  DongwangHomeTypeCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/30.
//

#import "DongwangHomeTypeCollectionViewCell.h"
@interface DongwangHomeTypeCollectionViewCell ()
{
    
    UILabel * _dongwanglb;
}
@end
@implementation DongwangHomeTypeCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UILabel * dongwanglb =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, K(69), K(23))];
        dongwanglb.layer.borderWidth = K(1);
        dongwanglb.layer.borderColor = [UIColor colorWithHexString:@"#999999"].CGColor;
        dongwanglb.layer.cornerRadius = K(11.5);
        dongwanglb.layer.masksToBounds = YES;
        dongwanglb.font  = KSysFont(font(13));
        dongwanglb.lineBreakMode = NSLineBreakByTruncatingMiddle;
        dongwanglb.textAlignment = NSTextAlignmentCenter;
        dongwanglb.textColor = [UIColor colorWithHexString:@"#999999"];
        [self.contentView addSubview:dongwanglb];
        _dongwanglb = dongwanglb;
    }
    return self;
}
-(void)setTagModel:(DongwangHomeTagModel *)tagModel{
    _tagModel = tagModel;
    _dongwanglb.text = tagModel.tagName;
    _dongwanglb.font =  tagModel.isSeltecd ? KBlFont(font(13)) : KSysFont(font(13));
    if (tagModel.isSeltecd) {
        // 创建渐变层
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = _dongwanglb.frame;
        gradientLayer.colors = @[(id)[UIColor colorWithHexString:@"#FFDB00"].CGColor, (id)[UIColor colorWithHexString:@"#FF6F12"].CGColor];
        [self.layer addSublayer:gradientLayer];
        gradientLayer.mask = _dongwanglb.layer;
        _dongwanglb.frame = gradientLayer.bounds;

    }else{
        _dongwanglb.layer.borderColor = [UIColor colorWithHexString:@"#999999"].CGColor;
        _dongwanglb.textColor = [UIColor colorWithHexString:@"999999"];
    }
}

@end
