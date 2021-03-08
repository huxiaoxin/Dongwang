//
//  DongwangMyJifenHeaderView.m
//  DongWang
//
//  Created by codehzx on 2020/11/17.
//

#import "DongwangMyJifenHeaderView.h"
#import "DongwangMyVipView.h"
@interface DongwangMyJifenHeaderView ()<TreeViewDelegate>
@property(nonatomic,strong) DongwangBaseViewController * VC;
@end
@implementation DongwangMyJifenHeaderView
-(instancetype)initWithFrame:(CGRect)frame withCurrentVc:(DongwangBaseViewController *)Vc{
    if (self = [super initWithFrame:frame]) {
        self.VC = Vc;
        UIImageView * DongwangBjImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(250)+StatuBar_Height)];
        DongwangBjImgView.userInteractionEnabled = YES;
        DongwangBjImgView.image = [UIImage imageNamed:@"积分背景顶部"];
        [self addSubview:DongwangBjImgView];
        
        

        TreeView * DongwangTreeView = [[TreeView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, CGRectGetHeight(DongwangBjImgView.frame)-NaviH)];
//        DongwangTreeView.timeLimitedArr = @[@"1",@"2",@"3",@"4",@"5"];
        DongwangTreeView.delegate = self;
        [self addSubview:DongwangTreeView];
        _DongwangTreeView = DongwangTreeView;
        
        self.JifenHeaderHeight = CGRectGetMaxY(DongwangBjImgView.frame)+K(24.5);

        
        
        
        
        
        
        
        
    }
    return self;
}
-(void)setTreeModelArr:(NSArray *)treeModelArr{
    _treeModelArr = treeModelArr;
    _DongwangTreeView.treesModelArr = treeModelArr;
}
#pragma mark - TreeViewDelegate

- (void)selectTimeLimitedBtnAtIndex:(NSInteger)index
{
    [_DongwangTreeView removeRandomIndex:index];
    
}

- (void)selectUnlimitedBtnAtIndex:(NSInteger)index
{
    [_DongwangTreeView removeRandomIndex:index];
    DongwangJifenTreeModel * jifeModel = _treeModelArr[index];
    MJWeakSelf;
    [DongwangMyVipView DongwangMyViewModelWithtakeActiveIntegral:@{@"id":[NSNumber numberWithLong:[jifeModel.id longLongValue]]}.mutableCopy RequestCuurentControlers:self.VC DeleAccountSuuced:^(id  _Nonnull object) {
        [weakSelf.DongwangTreeView realoduserInteagers];
    } Deleaccountfairler:^(id  _Nonnull message) {
        
    }];

}

- (void)allCollected{
    
}

@end
