//
//  DongwangMofangFirstCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/12/9.
//

#import "DongwangMofangFirstCollectionViewCell.h"
@interface DongwangMofangFirstCollectionViewCell ()
{
}

@end
@implementation DongwangMofangFirstCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        DongwangMofangImgView * mofangImgView = [[DongwangMofangImgView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-K(30)   , K(85))];
        mofangImgView.backgroundColor = LGDMianColor;
        mofangImgView.userInteractionEnabled = YES;
        mofangImgView.tag =  0;
        mofangImgView.layer.masksToBounds = YES;
        mofangImgView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:mofangImgView];
        _mofangImgView = mofangImgView;
        
        UITapGestureRecognizer * imgTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangInfoTapClicks)];
        [mofangImgView addGestureRecognizer:imgTap];
    }
    return self;
}
-(void)setListMsgic:(NSArray *)listMsgic{
    _listMsgic = listMsgic;
    if (listMsgic.count >= 1) {
        MagicList * list=  listMsgic.firstObject;
        [_mofangImgView sd_setImageWithURL:[NSURL URLWithString:list.imageUrl]];
    }
}
-(void)DongwangInfoTapClicks{
    [self.delegate DongwangMofangFirstCollectionViewCellInfoTapClick:0 CellIndex:_mofangImgView.ImgindexPath.row];
}
@end
