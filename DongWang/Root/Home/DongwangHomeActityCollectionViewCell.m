//
//  DongwangHomeActityCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/30.
//

#import "DongwangHomeActityCollectionViewCell.h"
@interface DongwangHomeActityCollectionViewCell ()
@property(nonatomic,strong) UIImageView * testImgView;
@end
@implementation DongwangHomeActityCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView * testImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        testImgView.backgroundColor =  LGDMianColor;
        [self addSubview:testImgView];
        _testImgView = testImgView;
    }
    return self;
}
-(void)setMofangModel:(MagicList *)mofangModel{
    _mofangModel = mofangModel;
    
    MJWeakSelf;
    [_testImgView sd_setImageWithURL:[NSURL URLWithString:mofangModel.imageUrl] placeholderImage:[UIImage imageNamed:@""] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (image) {
    [weakSelf.delegate DongwangHomeActityCollectionViewCellRealodWithCellIndex:weakSelf.tag];
        mofangModel.mofangSize =  image.size;
        weakSelf.testImgView.size =CGSizeMake( image.size.width*(SCREEN_WIDTH/375), image.size.height*(SCREEN_WIDTH/375));
        }
    }];
}

-(void)setDic:(NSDictionary *)dic{
    _dic = dic;
    _testImgView.frame = CGRectMake(0, 0,[dic[@"w"] floatValue] * (SCREEN_Width/375.0) , [dic[@"g"] floatValue]);
}
@end
