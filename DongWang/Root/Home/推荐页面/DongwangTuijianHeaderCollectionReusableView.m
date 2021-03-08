//
//  DongwangTuijianHeaderCollectionReusableView.m
//  DongWang
//
//  Created by codehzx on 2020/12/15.
//

#import "DongwangTuijianHeaderCollectionReusableView.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
#import "DongwangbannarCollectionViewCell.h"
@interface DongwangTuijianHeaderCollectionReusableView ()<SDCycleScrollViewDelegate>
@property(nonatomic,strong) SDCycleScrollView * DongwangSDC;


@end

@implementation DongwangTuijianHeaderCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        UIImageView * DongwangBjimgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(119.5))];
        DongwangBjimgView.image = [UIImage imageNamed:@"形状结合"];
        [self addSubview:DongwangBjimgView];
        [self addSubview:self.DongwangSDC];

    }
    return self;
}
-(SDCycleScrollView *)DongwangSDC{
    if (!_DongwangSDC) {
        _DongwangSDC = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(K(0), K(15), SCREEN_WIDTH-K(0), K(143))];
        _DongwangSDC.delegate = self;
        _DongwangSDC.backgroundColor = [UIColor clearColor];
        _DongwangSDC.currentPageDotImage = [UIImage imageNamed:@"选中_indictor"];
        _DongwangSDC.pageDotImage = [UIImage imageNamed:@"未选中_indictor"];
        
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
-(void)setImgArr:(NSMutableArray *)ImgArr{
    _ImgArr = ImgArr;
    _DongwangSDC.imageURLStringsGroup = [ImgArr copy];
}
#pragma mark--SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    [self.delegate DongwangTuijianHeaderCollectionReusableViewDidSeltecdWithBannarIndex:index];
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{

}

@end
