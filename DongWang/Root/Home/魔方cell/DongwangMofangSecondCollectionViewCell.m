//
//  DongwangMofangSecondCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/12/9.
//

#import "DongwangMofangSecondCollectionViewCell.h"
@interface DongwangMofangSecondCollectionViewCell ()
@end
@implementation DongwangMofangSecondCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        DongwangMofangImgView * DongwangMofangImgView1 = [[DongwangMofangImgView alloc]initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH-K(30))/2, K(85))];
        DongwangMofangImgView1.backgroundColor = LGDMianColor;
        DongwangMofangImgView1.tag = 0;
        DongwangMofangImgView1.userInteractionEnabled = YES;
        DongwangMofangImgView1.layer.masksToBounds = YES;
        DongwangMofangImgView1.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:DongwangMofangImgView1];
        _DongwangMofangImgView1 =  DongwangMofangImgView1;
        
        UITapGestureRecognizer * DongwangImg1Tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangImgTapClicks:)];
        [DongwangMofangImgView1 addGestureRecognizer:DongwangImg1Tap];
        
        
        DongwangMofangImgView * DongwangMofangImgView2 = [[DongwangMofangImgView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-K(30))/2+K(0), 0, (SCREEN_WIDTH-K(30))/2, K(85))];
        DongwangMofangImgView2.userInteractionEnabled = YES;
        DongwangMofangImgView2.tag = 1;
        DongwangMofangImgView2.backgroundColor = LGDRedColor;
        DongwangMofangImgView2.layer.masksToBounds = YES;
        DongwangMofangImgView2.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:DongwangMofangImgView2];
        _DongwangMofangImgView2 = DongwangMofangImgView2;
        
        UITapGestureRecognizer * DongwangImg2Tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangImgTapClicks:)];
        [DongwangMofangImgView2 addGestureRecognizer:DongwangImg2Tap];
        
    }
    return self;
}
-(void)DongwangImgTapClicks:(UITapGestureRecognizer *)ImgTap{
    DongwangMofangImgView * ImgView = (DongwangMofangImgView *)[ImgTap view];
[self.delegate DongwangMofangSecondCollectionViewCellDidSeltecdWithImgIndex:ImgView.tag CellIndex:ImgView.ImgindexPath.row];
}
-(void)setListMsgic:(NSArray *)listMsgic{
    _listMsgic = listMsgic;
    if (listMsgic.count >= 1 ) {
    MagicList * firstlist = listMsgic.firstObject;
    [_DongwangMofangImgView1 sd_setImageWithURL:[NSURL URLWithString:firstlist.imageUrl]];
    }
    if (listMsgic.count >=2) {
        MagicList * secondlist = [listMsgic objectAtIndex:1];
        [_DongwangMofangImgView2 sd_setImageWithURL:[NSURL URLWithString:secondlist.imageUrl]];
    }
}
@end
