//
//  DongwangMyChatTopCollectionViewCell.m
//  DongWang
//
//  Created by sycm on 2021/3/1.
//

#import "DongwangMyChatTopCollectionViewCell.h"

@implementation DongwangMyChatTopCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView * DongwangImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, RealWidth(55), RealWidth(55))];
        DongwangImgView.image =  [UIImage imageNamed:@"1"];
        [self.contentView addSubview:DongwangImgView];
    }
    return self;
}
@end
