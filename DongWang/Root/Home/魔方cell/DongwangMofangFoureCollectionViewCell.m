//
//  DongwangFoureCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/12/9.
//

#import "DongwangMofangFoureCollectionViewCell.h"
@interface DongwangMofangFoureCollectionViewCell ()
@end
@implementation DongwangMofangFoureCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        DongwangMofangImgView * DongwangMofangImgView1 = [[DongwangMofangImgView alloc]initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH-K(30))/4, K(85))];
        DongwangMofangImgView1.backgroundColor = LGDMianColor;
        DongwangMofangImgView1.tag = 0;
        DongwangMofangImgView1.userInteractionEnabled = YES;
        DongwangMofangImgView1.layer.masksToBounds = YES;
        DongwangMofangImgView1.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:DongwangMofangImgView1];
        _DongwangMofangImgView1 = DongwangMofangImgView1;
        
        UITapGestureRecognizer * DongwangImgTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangimgTapClicks:)];
        [DongwangMofangImgView1 addGestureRecognizer:DongwangImgTap];
        
        
        DongwangMofangImgView * DongwangMofangImgView2 = [[DongwangMofangImgView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-K(30))/4, 0, (SCREEN_WIDTH-K(30))/4, K(85))];
        DongwangMofangImgView2.tag = 1;
        DongwangMofangImgView2.userInteractionEnabled = YES;
        DongwangMofangImgView2.backgroundColor = LGDRedColor;
        DongwangMofangImgView2.layer.masksToBounds = YES;
        DongwangMofangImgView2.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:DongwangMofangImgView2];
        _DongwangMofangImgView2 = DongwangMofangImgView2;
        
        UITapGestureRecognizer * DongwangImgTap1 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangimgTapClicks:)];
        [DongwangMofangImgView2 addGestureRecognizer:DongwangImgTap1];
        
        DongwangMofangImgView * DongwangMofangImgView3 = [[DongwangMofangImgView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-K(30))/4*2, 0, (SCREEN_WIDTH-K(30))/4, K(85))];
        DongwangMofangImgView3.tag = 2;
        DongwangMofangImgView3.userInteractionEnabled =YES;
        DongwangMofangImgView3.layer.masksToBounds = YES;
        DongwangMofangImgView3.contentMode = UIViewContentModeScaleAspectFill;
        DongwangMofangImgView3.backgroundColor = LGDMianColor;
        [self addSubview:DongwangMofangImgView3];
        _DongwangMofangImgView3 = DongwangMofangImgView3;
        
        
        UITapGestureRecognizer * DongwangImgTap2 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangimgTapClicks:)];
        [DongwangMofangImgView3 addGestureRecognizer:DongwangImgTap2];
        
        
        DongwangMofangImgView * DongwangMofangImgView4 = [[DongwangMofangImgView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-K(30))/4*3, 0, (SCREEN_WIDTH-K(30))/4, K(85))];
        DongwangMofangImgView4.tag = 3;
        DongwangMofangImgView4.userInteractionEnabled = YES;
        DongwangMofangImgView4.backgroundColor = LGDRedColor;
        DongwangMofangImgView4.layer.masksToBounds = YES;
        DongwangMofangImgView4.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:DongwangMofangImgView4];
        _DongwangMofangImgView4 = DongwangMofangImgView4;
        
        UITapGestureRecognizer * DongwangImgTap3 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangimgTapClicks:)];
        [DongwangMofangImgView4 addGestureRecognizer:DongwangImgTap3];
        
    }
    return self;
}
-(void)DongwangimgTapClicks:(UITapGestureRecognizer *)ImgTap{
    DongwangMofangImgView * infoImg = (DongwangMofangImgView *)[ImgTap view];
    [self.delegate DongwangMofangFoureCollectionViewCellImgIndex:infoImg.tag CellIndex:infoImg.ImgindexPath.row];
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

}
@end
