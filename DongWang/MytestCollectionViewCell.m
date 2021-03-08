//
//  MytestCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/3.
//

#import "MytestCollectionViewCell.h"
@interface MytestCollectionViewCell ()
@end
@implementation MytestCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView * testImgView = [[UIImageView alloc]init];
        testImgView.backgroundColor =  LGDMianColor;
        [self addSubview:testImgView];
        _myimage = testImgView;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _myimage.frame = self.frame;
    NSLog(@"-------%f",self.bounds.size.height);
}




-(void)setImgModel:(MyTestImgModel *)imgModel{
    _imgModel = imgModel;
    [_myimage sd_setImageWithURL:[NSURL URLWithString:imgModel.imgurl]];
   _myimage.size =  CGSizeMake(imgModel.width, imgModel.height);
}
-(void)setDic:(NSDictionary *)dic{
    _dic = dic;
    _myimage.frame = CGRectMake(0, 0,[dic[@"w"] floatValue] , [dic[@"g"] floatValue]);
}
@end
