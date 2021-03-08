//
//  DongwangMasonryCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/12/10.
//

#import "DongwangMasonryCollectionViewCell.h"

@implementation DongwangMasonryCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView * dongwangThubImgView = [[UIImageView alloc]init];
        
        [self.contentView addSubview:dongwangThubImgView];
        _dongwangThubImgView = dongwangThubImgView;
        
        [dongwangThubImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).width.offset(0);
            make.top.equalTo(self.contentView).width.offset(0);
            make.right.equalTo(self.contentView).width.offset(0);
            make.bottom.equalTo(self.contentView).width.offset(0);
        }];
        
    }
    return self;
}
@end
