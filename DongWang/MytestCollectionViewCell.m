//
//  MytestCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/3.
//

#import "MytestCollectionViewCell.h"
@interface MytestCollectionViewCell ()
{
    UIImageView * _testImgView;
}
@end
@implementation MytestCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView * testImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        testImgView.backgroundColor =  LGDMianColor;
        [self addSubview:testImgView];
        _testImgView = testImgView;
        
    }
    return self;
}
-(void)setImgModel:(MyTestImgModel *)imgModel{
    _imgModel = imgModel;
    [_testImgView sd_setImageWithURL:[NSURL URLWithString:imgModel.imgurl]];
   _testImgView.size =  CGSizeMake(imgModel.width, imgModel.height);
}
-(void)setDic:(NSDictionary *)dic{
    _dic = dic;
    
    _testImgView.frame = CGRectMake(0, 0,[dic[@"w"] floatValue] , [dic[@"g"] floatValue]);
}
-(void)layoutSubviews{
    [super layoutSubviews];
//    _testImgView.frame = self.frame;
    NSLog(@"Cell：%@  屏幕宽:%.2f",NSStringFromCGRect(self.frame),SCREEN_WIDTH);
}
@end
