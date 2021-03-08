//
//  DongwangMofangFiveCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/12/9.
//

#import "DongwangMofangFiveCollectionViewCell.h"
@interface DongwangMofangFiveCollectionViewCell ()

@end
@implementation DongwangMofangFiveCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        DongwangMofangImgView * DongwangMofangImgView1 = [[DongwangMofangImgView alloc]initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH-K(30))/5, K(85))];
//        DongwangMofangImgView1.backgroundColor = LGDMianColor;
        DongwangMofangImgView1.userInteractionEnabled = YES;
        DongwangMofangImgView1.tag = 0;
        DongwangMofangImgView1.layer.masksToBounds = YES;
        DongwangMofangImgView1.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:DongwangMofangImgView1];
        _DongwangMofangImgView1 = DongwangMofangImgView1;
        
        UITapGestureRecognizer * DongwangImgTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangImgInfoClicks:)];
        [DongwangMofangImgView1 addGestureRecognizer:DongwangImgTap];
        
        
        DongwangMofangImgView * DongwangMofangImgView2 = [[DongwangMofangImgView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-K(30))/5, 0, (SCREEN_WIDTH-K(30))/5, K(85))];
        DongwangMofangImgView2.userInteractionEnabled = YES;
        DongwangMofangImgView2.tag  = 1;
//        DongwangMofangImgView2.backgroundColor = LGDRedColor;
        DongwangMofangImgView2.layer.masksToBounds = YES;
        DongwangMofangImgView2.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:DongwangMofangImgView2];
        _DongwangMofangImgView2 = DongwangMofangImgView2;
        
        
        UITapGestureRecognizer * DongwangImgTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangImgInfoClicks:)];
        [DongwangMofangImgView2 addGestureRecognizer:DongwangImgTap1];
        
        DongwangMofangImgView * DongwangMofangImgView3 = [[DongwangMofangImgView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-K(30))/5*2, 0, (SCREEN_WIDTH-K(30))/5, K(85))];
        DongwangMofangImgView3.userInteractionEnabled  =YES;
        DongwangMofangImgView3.tag = 2;
//        DongwangMofangImgView3.backgroundColor = LGDMianColor;
        DongwangMofangImgView3.layer.masksToBounds = YES;
        DongwangMofangImgView3.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:DongwangMofangImgView3];
        _DongwangMofangImgView3 = DongwangMofangImgView3;
        
        UITapGestureRecognizer * DongwangImgTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangImgInfoClicks:)];
        [DongwangMofangImgView3 addGestureRecognizer:DongwangImgTap2];
        
        
        
        DongwangMofangImgView * DongwangMofangImgView4 = [[DongwangMofangImgView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-K(30))/5*3, 0, (SCREEN_WIDTH-K(30))/5, K(85))];
        DongwangMofangImgView4.userInteractionEnabled = YES;
        DongwangMofangImgView4.tag = 3;
//        DongwangMofangImgView4.backgroundColor = LGDRedColor;
        DongwangMofangImgView4.layer.masksToBounds = YES;
        DongwangMofangImgView4.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:DongwangMofangImgView4];
        _DongwangMofangImgView4 = DongwangMofangImgView4;
        
        UITapGestureRecognizer * DongwangImgTap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangImgInfoClicks:)];
        [DongwangMofangImgView4 addGestureRecognizer:DongwangImgTap3];
        
        
        DongwangMofangImgView * DongwangMofangImgView5 = [[DongwangMofangImgView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-K(30))/5*4, 0, (SCREEN_WIDTH-K(30))/5, K(85))];
        DongwangMofangImgView5.tag = 4;
        DongwangMofangImgView5.userInteractionEnabled = YES;
//        DongwangMofangImgView5.backgroundColor = LGDMianColor;
        DongwangMofangImgView5.layer.masksToBounds = YES;
        DongwangMofangImgView5.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:DongwangMofangImgView5];
        _DongwangMofangImgView5 = DongwangMofangImgView5;
        
        UITapGestureRecognizer * DongwangImgTap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangImgInfoClicks:)];
        [DongwangMofangImgView5 addGestureRecognizer:DongwangImgTap4];

        
    }
    return self;
}
-(void)DongwangImgInfoClicks:(UITapGestureRecognizer *)imgTap{
    DongwangMofangImgView * infoImg = (DongwangMofangImgView *)[imgTap view];
    [self.delegate DongwangMofangFiveCollectionViewCellImgIndex:infoImg.tag CellIndex:infoImg.ImgindexPath.row];
}
-(void)setListMsgic:(NSArray *)listMsgic{
    _listMsgic = listMsgic;
    
    if (listMsgic.count >= 1) {
        MagicList  * listobjetc1 =  listMsgic.firstObject;
        [_DongwangMofangImgView1 sd_setImageWithURL:[NSURL URLWithString:listobjetc1.imageUrl]];
    }
    
    if (listMsgic.count >= 2) {
        MagicList  * listobjetc2 =  [listMsgic objectAtIndex:1];
        [_DongwangMofangImgView2 sd_setImageWithURL:[NSURL URLWithString:listobjetc2.imageUrl]];

    }
    
    if (listMsgic.count >= 3) {
        MagicList  * listobjetc3 =  [listMsgic objectAtIndex:2];
        [_DongwangMofangImgView3 sd_setImageWithURL:[NSURL URLWithString:listobjetc3.imageUrl]];
    }
   
    if (listMsgic.count >= 4) {
        MagicList  * listobjetc4 =  [listMsgic objectAtIndex:3];
        [_DongwangMofangImgView4 sd_setImageWithURL:[NSURL URLWithString:listobjetc4.imageUrl]];
    }
    if (listMsgic.count >= 5) {
        MagicList  * listobjetc5 =  [listMsgic objectAtIndex:4];
        [_DongwangMofangImgView5 sd_setImageWithURL:[NSURL URLWithString:listobjetc5.imageUrl]];
    }


}
@end
