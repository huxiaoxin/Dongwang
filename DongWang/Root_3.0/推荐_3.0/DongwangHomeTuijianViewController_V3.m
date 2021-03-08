//
//  DongwangHomeTuijianViewController_3.m
//  DongWang
//
//  Created by codehzx on 2021/1/17.
//

#import "DongwangHomeTuijianViewController_V3.h"
#import "DongwangMallCollectionViewCell.h"
#import "MyImgCollectionViewCell.h"
#import "DongwangMofangModel.h"
#import <XHWebImageAutoSize.h>
#import "DongwangHomeViewModel.h"
#import "DongwangHomeTuijianHeaderCollectionReusableView_V3.h"
#import "DongwangHomeTuijianFooterCollectionReusableView_V3.h"
#import "DongwangPrivetaWebViewController.h"
#import "DongwangHomeBannarModel.h"
@interface DongwangHomeTuijianViewController_V3 ()<UICollectionViewDelegate,UICollectionViewDataSource,DongwangHomeTuijianFooterCollectionReusableView_V3Delegate,DongwangHomeTuijianHeaderCollectionReusableView_V3Delegate>
@property(nonatomic,strong) UICollectionView * DongwangMyCollectionView;
@property(nonatomic,strong) NSMutableArray * DongwangMyDataArr;
@property(nonatomic,strong) NSMutableArray * ImgsArr;
@property(nonatomic,strong) NSMutableArray * BannarModelArr;
@property(nonatomic,strong) NSMutableArray * msgArr;
@property(nonatomic,assign) NSInteger Parmters_Index;
@property(nonatomic,strong) NSMutableArray * TizuDataArr;
@property(nonatomic,assign) CGFloat SectionFooterHeight;

@property(nonatomic,strong) DongwangHomeTuijianHeaderCollectionReusableView_V3 *headerView;

@property(nonatomic,strong) DongwangHomeTuijianFooterCollectionReusableView_V3 *footerView;

@end

@implementation DongwangHomeTuijianViewController_V3
-(NSMutableArray *)TizuDataArr{
    if (!_TizuDataArr) {
        _TizuDataArr = [NSMutableArray array];
    }
    return _TizuDataArr;
}
-(NSMutableArray *)ImgsArr{
    if (!_ImgsArr) {
        _ImgsArr = [NSMutableArray array];
    }
    return _ImgsArr;
}
-(NSMutableArray *)msgArr{
    if (!_msgArr) {
        _msgArr = [NSMutableArray array];
    }
    return _msgArr;
}
-(NSMutableArray *)BannarModelArr{
    if (!_BannarModelArr) {
        _BannarModelArr =[NSMutableArray array];
    }
    return _BannarModelArr;
}
-(NSMutableArray *)DongwangMyDataArr{
    if (!_DongwangMyDataArr) {
        _DongwangMyDataArr = [[NSMutableArray alloc]init];
    }
    return _DongwangMyDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.SectionFooterHeight = 10;
    self.Parmters_Index = 1;
    self.gk_navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#410093"];
    [self.view addSubview:self.DongwangMyCollectionView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DongwangChangetuijianVCOfferset) name:@"DongwangChangetuijianVCOfferset" object:nil];
}
-(void)DongwangChangetuijianVCOfferset{
    CGPoint targetPoint = CGPointMake(0, RealWidth(470));
    [self.DongwangMyCollectionView layoutIfNeeded];
    [self.DongwangMyCollectionView setContentOffset:targetPoint animated:YES];

}
-(void)viewWillAppear:(BOOL)animated{
    //取出上一次保存的tableview的y值
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    CGFloat offsety = [user floatForKey:@"offSet"];
//    NSLog(@"offsety=%f",offsety);
//    CGPoint targetPoint = CGPointMake(0, 300);
//    [self.DongwangMyCollectionView layoutIfNeeded];
//    self.DongwangMyCollectionView.contentOffset = targetPoint;
}
#pragma mark--题组
-(void)DongwangSublistRequstData{
    MJWeakSelf;
    [DongwangHomeViewModel DongwangHomeAnsurelist_old:@{@"pageNo":[NSString stringWithFormat:@"%ld",(long)self.Parmters_Index],@"pageSize":@"20",@"type":@"0"}.mutableCopy RequestCuurentControlers:self taskSuuced:^(NSMutableArray * _Nonnull modelAarr) {
        if (weakSelf.Parmters_Index == 1) {
        if (weakSelf.TizuDataArr.count > 0) {
         [weakSelf.TizuDataArr removeAllObjects];
        }
        weakSelf.TizuDataArr = modelAarr;
        }else{
        [weakSelf.TizuDataArr addObjectsFromArray:[modelAarr copy]];
        }
        
        if (weakSelf.Parmters_Index > 1) {
        if (modelAarr.count == 0) {
        [weakSelf.DongwangMyCollectionView.mj_footer endRefreshingWithNoMoreData];
        return;
        }
        }
        weakSelf.footerView.DongwangDataArr = weakSelf.TizuDataArr;
       [weakSelf.DongwangMyCollectionView.mj_footer endRefreshing];
    } taskfairler:^(id  _Nonnull message) {
    [weakSelf.DongwangMyCollectionView.mj_footer endRefreshing];
    }];
}

#pragma mark--下拉刷新
-(void)DongwangActiytCollectionHeaderClicks{
    self.Parmters_Index = 1;
    [self.DongwangMyCollectionView.mj_footer resetNoMoreData];
    //魔方
    [self DongwangReqeustMofang];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //bannar
        [self DongwangRequestbannar];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //消息
        [self DongwnagRequestMsgData];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //题组
    [self DongwangSublistRequstData];
    });
   
}
#pragma mark--图片魔方
-(void)DongwangReqeustMofang{
    MJWeakSelf;
      //图片魔方
    [DongwangHomeViewModel DongwangHomeIcon:@{}.mutableCopy RequestCuurentControlers:self taskSuuced:^(NSMutableArray * _Nonnull modelAarr, NSMutableArray * _Nonnull chunModelArr) {
      if (weakSelf.DongwangMyDataArr.count > 0) {
      [weakSelf.DongwangMyDataArr removeAllObjects];
      }
      weakSelf.DongwangMyDataArr = modelAarr;
      [weakSelf.DongwangMyCollectionView reloadData];
      //消除collectionview的隐士动画
      [UIView animateWithDuration:0 animations:^{
      [weakSelf.DongwangMyCollectionView performBatchUpdates:^{
      [weakSelf.DongwangMyCollectionView reloadData];
      } completion:nil];
      }];
      [weakSelf.DongwangMyCollectionView.mj_header endRefreshing];
      } taskfairler:^(id  _Nonnull message) {
      }];

}
#pragma mark--banner
-(void)DongwangRequestbannar{
    MJWeakSelf;
    [DongwangHomeViewModel DongwangHomeBannar:@{}.mutableCopy RequestCuurentControlers:self taskSuuced:^(NSMutableArray * _Nonnull modelAarr, NSMutableArray * _Nonnull ImgsUrl) {
        weakSelf.ImgsArr =  [ImgsUrl copy];
        if (weakSelf.BannarModelArr.count > 0) {
            [weakSelf.BannarModelArr removeAllObjects];
        }
        weakSelf.BannarModelArr = modelAarr;
        weakSelf.headerView.ImgArr =  weakSelf.ImgsArr;
 
    } taskfairler:^(id  _Nonnull message) {
    }];

}
#pragma mmark--消息轮播
-(void)DongwnagRequestMsgData{
    MJWeakSelf;
    [DongwangHomeViewModel DongwangHomeBroadcastlist:@{}.mutableCopy RequestCuurentControlers:self taskSuuced:^(NSMutableArray * _Nonnull modelAarr) {
        weakSelf.msgArr = modelAarr;
        weakSelf.headerView.MsgArr =  weakSelf.msgArr;
    } taskfairler:^(id  _Nonnull message) {
    }];
}
#pragma mark--上拉加载
-(void)DongwangRequestmoreDataTizu{
    self.Parmters_Index +=1;
    [self DongwangSublistRequstData];
}
-(UICollectionView *)DongwangMyCollectionView{
    if (!_DongwangMyCollectionView) {
        UICollectionViewFlowLayout * Layout = [[UICollectionViewFlowLayout alloc]init];
        Layout.minimumLineSpacing = 0;
        Layout.minimumInteritemSpacing = 0;
        Layout.sectionInset =  UIEdgeInsetsMake(0, RealWidth(0), 0, RealWidth(0));
        _DongwangMyCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(RealWidth(0), 0, SCREEN_WIDTH-RealWidth(0), SCREEN_HEIGHT-NaviH-kTabBarHeight) collectionViewLayout:Layout];
        _DongwangMyCollectionView.delegate = self;
        _DongwangMyCollectionView.dataSource = self;
        _DongwangMyCollectionView.backgroundColor = [UIColor colorWithHexString:@"#410093"];
        _DongwangMyCollectionView.layer.cornerRadius = RealWidth(5);
        _DongwangMyCollectionView.layer.masksToBounds = YES;
        [_DongwangMyCollectionView registerClass:[MyImgCollectionViewCell class] forCellWithReuseIdentifier:@"MyImgCollectionViewCell"];
        [_DongwangMyCollectionView registerClass:[DongwangHomeTuijianHeaderCollectionReusableView_V3 class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DongwangHomeTuijianHeaderCollectionReusableView_V3"];
        [_DongwangMyCollectionView registerClass:[DongwangHomeTuijianFooterCollectionReusableView_V3 class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"DongwangHomeTuijianFooterCollectionReusableView_V3"];
        _DongwangMyCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangActiytCollectionHeaderClicks)];
        [_DongwangMyCollectionView.mj_header beginRefreshing];
        MJWeakSelf;
        
//        _DongwangMyCollectionView.mj_footer = [MJRefreshManager defaultFooter:^{
//        [weakSelf DongwangRequestmoreDataTizu];
//        }];
        
        
    }
    return _DongwangMyCollectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    DongwangMofangModel * mofangModle = self.DongwangMyDataArr[section];
    return mofangModle.magicList.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.DongwangMyDataArr.count;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangMofangModel * dongmodle = self.DongwangMyDataArr[indexPath.section];
    MagicList  * listobject  = dongmodle.magicList[indexPath.row];
    if ([listobject.action integerValue] == 0) {
    [[NSNotificationCenter defaultCenter] postNotificationName:AppTabbarActitytapNotiCation object:nil userInfo:@{@"action":[NSString stringWithFormat:@"%@",listobject.action],@"type":[NSString stringWithFormat:@"%@",listobject.type],@"url":[NSString stringWithFormat:@"%@",listobject.url]}];
    }

}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangMofangModel * dongmodle = self.DongwangMyDataArr[indexPath.section];
    MyImgCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyImgCollectionViewCell" forIndexPath:indexPath];
    cell.myimgeView.backgroundColor = [UIColor clearColor];
        MagicList  * listobject  = dongmodle.magicList[indexPath.row];
    [cell.myimgeView sd_setImageWithURL:[NSURL URLWithString:listobject.imageUrl] placeholderImage:[UIImage imageNamed:@"zw01"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        /** 缓存image size */
        [XHWebImageAutoSize storeImageSize:image forURL:[NSURL URLWithString:listobject.imageUrl] completed:^(BOOL result) {
            /** reload  */
            if(result)  [collectionView  xh_reloadDataForURL:[NSURL URLWithString:listobject.imageUrl]];
        }];
        
    }];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangMofangModel * mofangmodel = self.DongwangMyDataArr[indexPath.section];
    MagicList * listmodel = mofangmodel.magicList[indexPath.row];
//    NSLog(@"个数:%ld",listmodel.countNums);
    //指定了item的宽度
    CGFloat  imgWidth = (SCREEN_WIDTH-RealWidth(0))/listmodel.countNums;
    CGFloat imgheight =     [XHWebImageAutoSize imageHeightForURL:[NSURL URLWithString:listmodel.imageUrl] layoutWidth:imgWidth estimateHeight:100];
//    NSLog(@"图片的高度:%f",imgheight);
//    return CGSizeMake(imgrealWidth, imgheight);
    //控件宽度＊图片高度/图片宽度  =控件需要的高度
    return  CGSizeMake(imgWidth, imgheight);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    // 区头
    if (kind == UICollectionElementKindSectionHeader) {
        DongwangHomeTuijianHeaderCollectionReusableView_V3 *headerView = (DongwangHomeTuijianHeaderCollectionReusableView_V3 *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DongwangHomeTuijianHeaderCollectionReusableView_V3" forIndexPath:indexPath];
        headerView.delegate = self;
        _headerView = headerView;
        return headerView;
    }else if (kind == UICollectionElementKindSectionFooter){
        DongwangHomeTuijianFooterCollectionReusableView_V3 *footerView = (DongwangHomeTuijianFooterCollectionReusableView_V3 *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"DongwangHomeTuijianFooterCollectionReusableView_V3" forIndexPath:indexPath];
        footerView.delegate = self;
        footerView.HeaderHeight = ^(CGFloat footerHeight) {
        self.SectionFooterHeight = footerHeight;
        [self.DongwangMyCollectionView reloadData];
        };
        _footerView = footerView;
        return footerView;
    }
    return nil;
}
#pragma mark--DongwangHomeTuijianHeaderCollectionReusableView_V3Delegate
-(void)DongwangHomeTiuJinaHeaderBannarDidSeltecdWithBannarIndex:(NSInteger)BannarIndex{
    DongwangHomeBannarModel * bannarModel = self.BannarModelArr[BannarIndex];
    if ([bannarModel.action integerValue] == 0) {
    [[NSNotificationCenter defaultCenter] postNotificationName:AppTabbarActitytapNotiCation object:nil userInfo:@{@"action":[NSString stringWithFormat:@"%@",bannarModel.action],@"type":[NSString stringWithFormat:@"%@",bannarModel.type],@"url":[NSString stringWithFormat:@"%@",bannarModel.url]}];
    }
}
#pragma marl--DongwangHomeTuijianFooterCollectionReusableView_V3Delegate
-(void)DongwangHomeTuijianFooterCollectionReusableView_V3ItemDidSeltecdWithModels:(DongwangHotTizuModel *)tizuModel{
        DongwangPrivetaWebViewController * dongwangprviteVc = [[DongwangPrivetaWebViewController alloc]init];
        dongwangprviteVc.protoclUrlText = tizuModel.url;
        dongwangprviteVc.type = VCPush;
        dongwangprviteVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:dongwangprviteVc animated:YES];
}
//区头
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (self.DongwangMyDataArr.count == 0) {
        NSInteger BannarHeight = RealWidth(190);
        NSInteger ScrollMgsHeight = RealWidth(80);
        return CGSizeMake(SCREEN_WIDTH, BannarHeight+ScrollMgsHeight);
    }else{
        NSInteger BannarHeight = section == 0 ? RealWidth(190) : 0;
        NSInteger ScrollMgsHeight = section == 0 ? RealWidth(80) : 0;
        return CGSizeMake(SCREEN_WIDTH, BannarHeight+ScrollMgsHeight);
    }
   
}
//区尾
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (self.DongwangMyDataArr.count == 0) {
        return CGSizeMake(SCREEN_WIDTH, self.SectionFooterHeight);
    }else{
        CGFloat FooterHeifhg = section == self.DongwangMyDataArr.count -1 ?  self.SectionFooterHeight : 0;
        return CGSizeMake(SCREEN_WIDTH, FooterHeifhg);
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f",_DongwangMyCollectionView.contentOffset.y);
    
    //存储tableview滚动的位置(y值)
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setInteger:scrollView.contentOffset.y forKey:@"offSet"];
    [user synchronize];
    
//    NSLog(@"%@",NSHomeDirectory());

    
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
