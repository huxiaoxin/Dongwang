//
//  DongwangHomeTuijianHeaderCollectionReusableView_V3.m
//  DongWang
//
//  Created by codehzx on 2021/1/17.
//

#import "DongwangHomeTuijianHeaderCollectionReusableView_V3.h"
#import <SDCycleScrollView.h>
#import "DongwangbannarCollectionViewCell.h"
#import "DongwangMallMsgScrollView.h"
@interface DongwangHomeTuijianHeaderCollectionReusableView_V3 ()<SDCycleScrollViewDelegate>
@property(nonatomic,strong) SDCycleScrollView * DongwangSDC;
@property(nonatomic,strong) DongwangMallMsgScrollView * MsgViews;
@end
@implementation DongwangHomeTuijianHeaderCollectionReusableView_V3
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithHexString:@"#410093"];
        [self addSubview:self.DongwangSDC];
        [self addSubview:self.MsgViews];
    }
    return self;
}
-(DongwangMallMsgScrollView *)MsgViews{
    if (!_MsgViews) {
        _MsgViews = [[DongwangMallMsgScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_DongwangSDC.frame)+RealWidth(10), SCREEN_WIDTH, RealWidth(50))];
    }
    return _MsgViews;
}

-(SDCycleScrollView *)DongwangSDC{
    if (!_DongwangSDC) {
        _DongwangSDC = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(K(0), K(20), SCREEN_WIDTH-K(0), RealWidth(174))];
        _DongwangSDC.delegate = self;
        _DongwangSDC.backgroundColor = [UIColor clearColor];
    }
    return _DongwangSDC;
}
- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view{
    return [DongwangbannarCollectionViewCell class];
}
- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view{
    DongwangbannarCollectionViewCell *myCell = (DongwangbannarCollectionViewCell *)cell;
    [myCell.ThubImgView sd_setImageWithURL:[NSURL URLWithString:self.ImgArr[index]]];
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    [self.delegate DongwangHomeTiuJinaHeaderBannarDidSeltecdWithBannarIndex:index];
}
-(void)setImgArr:(NSMutableArray *)ImgArr{
    _ImgArr = ImgArr;
    NSLog(@"banner数组:%@",ImgArr);
    _DongwangSDC.imageURLStringsGroup = [ImgArr copy];
}
-(void)setMsgArr:(NSMutableArray *)MsgArr{
    _MsgArr = MsgArr;
    _MsgViews.MsgArr = MsgArr;
}

@end
