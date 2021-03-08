//
//  DongwangMMallSubListViewController.m
//  DongWang
//
//  Created by codehzx on 2021/1/6.
//

#import "DongwangMMallSubListViewController.h"
#import "DongwangMallCollectionViewCell.h"
#import "UIView+directionBorder.h"
#import "DongwangHomeViewModel.h"
#import "DongwangPrivetaWebViewController.h"
@interface DongwangMMallSubListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, copy) void(^scrollCallback)(UIScrollView *scrollView);
@property(nonatomic,strong) NSMutableArray * DongwangDataArr;
@property(nonatomic,assign) NSInteger Parmters_Index;
@end

@implementation DongwangMMallSubListViewController

-(NSMutableArray *)DongwangDataArr{
    if (!_DongwangDataArr) {
        _DongwangDataArr = [NSMutableArray array];
    }
    return _DongwangDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.Parmters_Index = 1;
    self.gk_navigationBar.hidden = YES;
    self.view.backgroundColor =  [UIColor colorWithHexString:@"#410093"];
    [self.view addSubview:self.mycollectionView];
    [_mycollectionView registerClass:[DongwangMallCollectionViewCell class] forCellWithReuseIdentifier:@"DongwangMallCollectionViewCell"];
    [self DongwangSublistRequstData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DongwangDidVcRefresh) name:@"DongwangDidVcRefresh" object:nil];
}
-(void)DongwangDidVcRefresh{
    
    self.Parmters_Index = 1;
    [self DongwangSublistRequstData];
}
-(UICollectionView *)mycollectionView{
    if (!_mycollectionView) {
        UICollectionViewFlowLayout * DongwangLayout = [[UICollectionViewFlowLayout alloc]init];
        DongwangLayout.sectionInset = UIEdgeInsetsMake(RealWidth(14.5), RealWidth(13), RealWidth(14.5), RealWidth(13));
        DongwangLayout.itemSize = CGSizeMake(RealWidth(156), RealWidth(229));
        DongwangLayout.minimumLineSpacing = RealWidth(14.5);
        _mycollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:DongwangLayout];
        _mycollectionView.delegate = self;
        _mycollectionView.dataSource = self;
        _mycollectionView.showsVerticalScrollIndicator =  NO;
        _mycollectionView.showsHorizontalScrollIndicator = NO;
        _mycollectionView.backgroundColor = [UIColor colorWithHexString:@"#341E7B"];
        
        _mycollectionView.layer.borderColor = [UIColor colorWithHexString:@"#8767E9"].CGColor;
        _mycollectionView.layer.borderWidth = RealWidth(1);
//        _mycollectionView.layer.cornerRadius = RealWidth(5);
//        _mycollectionView.layer.masksToBounds = YES;
        [_mycollectionView acs_radiusWithRadius:K(5) corner:self.indictorIndex == 0 ?   UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight  :UIRectCornerAllCorners];
        MJWeakSelf;
        _mycollectionView.mj_footer = [MJRefreshManager defaultFooter:^{
            self.Parmters_Index += 1;
            [weakSelf DongwangSublistRequstData];
        }];
        
        
    }
    return _mycollectionView;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.DongwangDataArr.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangMallCollectionViewCell * MallCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DongwangMallCollectionViewCell" forIndexPath:indexPath];
    MallCell.TizuModel = self.DongwangDataArr[indexPath.row];
    return MallCell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangHotTizuModel * tizuModel = self.DongwangDataArr[indexPath.row];

    DongwangPrivetaWebViewController * dongwangprviteVc = [[DongwangPrivetaWebViewController alloc]init];
    dongwangprviteVc.protoclUrlText = tizuModel.url;
    dongwangprviteVc.type = VCPush;
    dongwangprviteVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dongwangprviteVc animated:YES];
}
#pragma mark - JXPagingViewListViewDelegate
- (UIView *)listView {
    return self.view;
}

- (UIScrollView *)listScrollView {
    return self.mycollectionView;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView *))callback {
    self.scrollCallback = callback;
    
}
- (void)listWillAppear {
    NSLog(@"%@:%@", self.title, NSStringFromSelector(_cmd));

}

- (void)listDidAppear {
    NSLog(@"已出现");
   
}
- (void)listWillDisappear {
    NSLog(@"%@:%@", self.title, NSStringFromSelector(_cmd));
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.scrollCallback ?: self.scrollCallback(scrollView);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect ViewFrame = self.view.bounds;
    self.mycollectionView.frame = CGRectMake(RealWidth(10), RealWidth(0), ViewFrame.size.width-RealWidth(20), ViewFrame.size.height-RealWidth(30));
   

}
-(void)DongwangSublistRequstData{
    MJWeakSelf;
    [DongwangHomeViewModel DongwangHomeAnsurelist:@{@"pageNo":[NSString stringWithFormat:@"%ld",(long)self.Parmters_Index],@"pageSize":@"20",@"type":[NSString stringWithFormat:@"%ld",(long)self.indictorIndex]}.mutableCopy RequestCuurentControlers:self taskSuuced:^(NSMutableArray * _Nonnull modelAarr) {
        if (weakSelf.Parmters_Index == 1) {
        if (weakSelf.DongwangDataArr.count > 0) {
         [weakSelf.DongwangDataArr removeAllObjects];
        }
        weakSelf.DongwangDataArr = modelAarr;
        }else{
        [weakSelf.DongwangDataArr addObjectsFromArray:[modelAarr copy]];
        }
        if (modelAarr.count == 0) {
        [weakSelf.mycollectionView.mj_footer endRefreshingWithNoMoreData];
        }else{
            [weakSelf.mycollectionView.mj_footer endRefreshing];
        }
        [weakSelf.mycollectionView reloadData];
    } taskfairler:^(id  _Nonnull message) {
        [weakSelf.mycollectionView.mj_footer endRefreshing];
    }];
}
- (void)listDidDisappear {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CHWXCodeNotification object:nil];
//    NSLog(@"%@:%@", self.title, NSStringFromSelector(_cmd));
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
