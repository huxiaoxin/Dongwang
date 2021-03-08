//
//  DongwangThreeCollectionViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/12/9.
//

#import "DongwangMofangThreeCollectionViewCell.h"
@interface DongwangMofangThreeCollectionViewCell ()
@end
@implementation DongwangMofangThreeCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        DongwangMofangImgView * DongwangMofangImgView1 = [[DongwangMofangImgView alloc]initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH-K(30))/3, K(85))];
        DongwangMofangImgView1.backgroundColor = LGDMianColor;
        DongwangMofangImgView1.userInteractionEnabled = YES;
        DongwangMofangImgView1.tag = 0;
        DongwangMofangImgView1.layer.masksToBounds = YES;
        DongwangMofangImgView1.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:DongwangMofangImgView1];
        _DongwangMofangImgView1 = DongwangMofangImgView1;
        
        UITapGestureRecognizer * DongwangimgTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangImgTapClicks:)];
        [DongwangMofangImgView1 addGestureRecognizer:DongwangimgTap];
        
        
        DongwangMofangImgView * DongwangMofangImgView2 = [[DongwangMofangImgView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-K(30))/3, 0, (SCREEN_WIDTH-K(30))/3, K(85))];
        DongwangMofangImgView2.userInteractionEnabled = YES;
        DongwangMofangImgView2.tag = 1;
        DongwangMofangImgView2.backgroundColor = LGDRedColor;
        DongwangMofangImgView2.layer.masksToBounds = YES;
        DongwangMofangImgView2.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:DongwangMofangImgView2];
        _DongwangMofangImgView2 = DongwangMofangImgView2;
        
        UITapGestureRecognizer * DongwangimgTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangImgTapClicks:)];
        [DongwangMofangImgView2 addGestureRecognizer:DongwangimgTap1];
        
        
        DongwangMofangImgView * DongwangMofangImgView3 = [[DongwangMofangImgView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-K(30))/3*2, 0, (SCREEN_WIDTH-K(30))/3, K(85))];
        DongwangMofangImgView3.userInteractionEnabled = YES;
        DongwangMofangImgView3.tag = 2;
        DongwangMofangImgView3.backgroundColor = LGDMianColor;
        DongwangMofangImgView3.layer.masksToBounds = YES;
        DongwangMofangImgView3.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:DongwangMofangImgView3];
        _DongwangMofangImgView3 = DongwangMofangImgView3;
        
        UITapGestureRecognizer * DongwangimgTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwangImgTapClicks:)];
        [DongwangMofangImgView3 addGestureRecognizer:DongwangimgTap2];
        
        
    }
    return self;
}
-(void)DongwangImgTapClicks:(UITapGestureRecognizer *)ImgTap{
    DongwangMofangImgView * infoImg =(DongwangMofangImgView *) [ImgTap view];
    [self.delegate DongwangMofangThreeCollectionViewCellImgIndex:infoImg.tag CellIndex:infoImg.ImgindexPath.row];
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
   

    
}
@end
