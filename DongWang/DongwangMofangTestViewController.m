//
//  DongwangMofangTestViewController.m
//  DongWang
//
//  Created by codehzx on 2020/12/10.
//

#import "DongwangMofangTestViewController.h"
#import "EqualSpaceFlowLayoutEvolve.h"
#import "DongwangHomeViewModel.h"
#import "textcollectionCell.h"
#import "DongwangMasonryCollectionViewCell.h"
#import "MytestCollectionViewCell.h"
#import <XHWebImageAutoSize.h>
#import "WaterfallColectionLayout.h"
#import "SGAdvertScrollView.h"
#import "UIVerticalLoopView.h"

#import <WebKit/WebKit.h>
@interface DongwangMofangTestViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView *DongwangCollectonView;
@property(nonatomic,strong) NSMutableArray * DongwangDataArr;
@property(nonatomic,strong) NSMutableDictionary * imgheightDic;
@property(nonatomic,strong)WaterfallColectionLayout* layout;
@property(nonatomic,strong) UIVerticalLoopView * LoopView;

@end

@implementation DongwangMofangTestViewController
-(NSMutableDictionary *)imgheightDic{
    if (!_imgheightDic) {
        _imgheightDic = [NSMutableDictionary dictionary];
    }
    return _imgheightDic;
}
-(NSMutableArray *)DongwangDataArr{
    if (!_DongwangDataArr) {
    _DongwangDataArr = [[NSMutableArray alloc]init];
    }
    return _DongwangDataArr;
}
-(UIVerticalLoopView *)LoopView{
    if (!_LoopView) {
        _LoopView = [[UIVerticalLoopView alloc]initWithFrame:CGRectMake(RealWidth(25), RealWidth(100), RealWidth(220), RealWidth(30))];
        _LoopView.backgroundColor = [UIColor redColor];
//        _LoopView.loopDelegate = self;
        _LoopView.verticalLoopAnimationDuration = 1;
        _LoopView.Direction = VerticalLoopDirectionDown;

    }
    return _LoopView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//   [self.view addSubview:self.DongwangCollectonView];
    
//    SGAdvertScrollView *SGView = [[SGAdvertScrollView alloc]initWithFrame:CGRectMake(RealWidth(100), RealWidth(100), RealWidth(250), RealWidth(40))];
//    [self.view addSubview:SGView];
//    SGView.titles  = @[@"31231232131231",@"11111111",@"9999999932132131"];
//
    [self.view addSubview:self.LoopView];
    
    WKWebViewConfiguration * configer = [WKWebViewConfiguration new];
    WKWebView *webs = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, RealWidth(200), RealWidth(30)) configuration:configer];
    [self.view addSubview:webs];
    
//    //消息滚动
    MJWeakSelf;
    [DongwangHomeViewModel DongwangHomeBroadcastlist:@{}.mutableCopy RequestCuurentControlers:self taskSuuced:^(NSMutableArray * _Nonnull modelAarr) {
        weakSelf.LoopView.verticalLoopContentArr =  modelAarr;
        [weakSelf.LoopView start];

//        weakSelf.userHeaderView.MsgArr = modelAarr;
        [webs loadHTMLString:modelAarr.firstObject baseURL:nil];
    } taskfairler:^(id  _Nonnull message) {

    }];

    


    // Do any additional setup after loading the view.
}
-(WaterfallColectionLayout *)layout{
    if(!_layout){
        __weak __typeof(self) weakSelf = self;
        _layout = [[WaterfallColectionLayout alloc]initWithItemsHeightBlock:^CGFloat(NSIndexPath *index) {
            return [weakSelf itemHeightAtIndexPath:index];
        }];
    }
    return _layout;
}
-(CGFloat )itemHeightAtIndexPath:(NSIndexPath *)indexPath{
   MagicList  * listobject  = self.DongwangDataArr[indexPath.row];
    /**
     *  参数1:图片URL
     *  参数2:imageView 宽度
     *  参数3:预估高度,(此高度仅在图片尚未加载出来前起作用,不影响真实高度)
     */
    return [XHWebImageAutoSize imageHeightForURL:[NSURL URLWithString:listobject.imageUrl] layoutWidth:self.layout.itemWidth estimateHeight:100];
}



-(UICollectionView *)DongwangCollectonView{
    if (!_DongwangCollectonView) {
//        UICollectionViewFlowLayout * Layout = [[UICollectionViewFlowLayout alloc]init];
//        Layout.minimumLineSpacing = 0;
//        Layout.minimumInteritemSpacing = 0;
        EqualSpaceFlowLayoutEvolve * Layout = [[EqualSpaceFlowLayoutEvolve alloc]initWthType:AlignWithLeft];
        _DongwangCollectonView  = [[UICollectionView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height) collectionViewLayout:Layout];
        _DongwangCollectonView.delegate = self;
        _DongwangCollectonView.dataSource = self;
        _DongwangCollectonView.showsVerticalScrollIndicator  =NO;
        _DongwangCollectonView.showsHorizontalScrollIndicator = NO;
        _DongwangCollectonView.backgroundColor = [UIColor clearColor];
        _DongwangCollectonView.backgroundColor = [UIColor whiteColor];
        _DongwangCollectonView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangHeaderClicks)];
        [_DongwangCollectonView.mj_header beginRefreshing];
        [_DongwangCollectonView registerNib:[UINib nibWithNibName:@"textcollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"textcollectionCell"];
        [_DongwangCollectonView registerClass:[MytestCollectionViewCell class] forCellWithReuseIdentifier:@"MytestCollectionViewCell"];
        [_DongwangCollectonView registerClass:[DongwangMasonryCollectionViewCell class] forCellWithReuseIdentifier:@"DongwangMasonryCollectionViewCell"];
    }
    return _DongwangCollectonView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.DongwangDataArr.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MagicList * listmodel = self.DongwangDataArr[indexPath.row];
    textcollectionCell * Cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"textcollectionCell" forIndexPath:indexPath];
    [Cell.myimage sd_setImageWithURL:[NSURL URLWithString:listmodel.imageUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        /** 缓存image size */
    [XHWebImageAutoSize storeImageSize:image forURL:[NSURL URLWithString:listmodel.imageUrl] completed:^(BOOL result) {
                   /** reload  */
    if(result)  [collectionView  xh_reloadDataForURL:[NSURL URLWithString:listmodel.imageUrl]];
               }];
    }];
    return Cell;
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    MagicList * listmodel = self.DongwangDataArr[indexPath.row];
    //指定了item的宽度
    NSInteger  imgWidth = SCREEN_WIDTH/listmodel.countNums;
//    CGSize imgSize = [XHWebImageAutoSize imageSizeFromCacheForURL:[NSURL URLWithString:listmodel.imageUrl]];
    CGFloat imgheight =     [XHWebImageAutoSize imageHeightForURL:[NSURL URLWithString:listmodel.imageUrl] layoutWidth:imgWidth estimateHeight:100];
    NSLog(@"图片的高度:%f",imgheight);
//    return CGSizeMake(imgrealWidth, imgheight);
    //控件宽度＊图片高度/图片宽度  =控件需要的高度
    return  CGSizeMake(imgWidth, imgheight);
}

-(void)DongwangHeaderClicks{
    MJWeakSelf;
    [DongwangHomeViewModel DongwangHomeIcon:@{}.mutableCopy RequestCuurentControlers:self taskSuuced:^(NSMutableArray * _Nonnull modelAarr, NSMutableArray * _Nonnull chunModelArr) {
        if (weakSelf.DongwangDataArr.count > 0) {
            [weakSelf.DongwangDataArr removeAllObjects];
        }
        weakSelf.DongwangDataArr = chunModelArr;
        [weakSelf.DongwangCollectonView reloadData];
        [weakSelf.DongwangCollectonView.mj_header endRefreshing];
    } taskfairler:^(id  _Nonnull message) {

    }];

    
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
