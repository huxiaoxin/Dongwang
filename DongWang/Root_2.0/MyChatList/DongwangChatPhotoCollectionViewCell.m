//
//  DongwangChatPhotoCollectionViewCell.m
//  DongWang
//
//  Created by sycm on 2021/3/1.
//

#import "DongwangChatPhotoCollectionViewCell.h"

@implementation DongwangChatPhotoCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView * PhotoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, RealWidth(95), RealWidth(95))];
        PhotoImgView.backgroundColor = LGDLightGaryColor;
        PhotoImgView.layer.cornerRadius =RealWidth(5);
        PhotoImgView.layer.masksToBounds = YES;
        PhotoImgView.layer.masksToBounds = YES;
        PhotoImgView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:PhotoImgView];
    }
    return self;
}
@end
