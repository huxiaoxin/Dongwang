//
//  DongwangHommetuijianViewController.m
//  DongWang
//
//  Created by codehzx on 2020/12/15.
//

#import "DongwangHommetuijianViewController.h"
#import "DongwnagHotTizuTableViewCell.h"
#import "DongwangHomeViewModel.h"
#import "DongwangHomeTuijianSectionHeaderView.h"


#import "DongwangMofangModel.h"
#import "MyImgCollectionViewCell.h"
#import "DongwangMofangModel.h"
#import <XHWebImageAutoSize.h>
#import "DongwangTuijianHeaderCollectionReusableView.h"
#import "DongwangTuijianFooterCollectionReusableView.h"
#import "DongwangHomeBannarModel.h"
@interface DongwangHommetuijianViewController ()<UITableViewDelegate,UITableViewDataSource,DongwnagHotTizuTableViewCellDelegate,UICollectionViewDelegate,UICollectionViewDataSource,DongwangTuijianFooterCollectionReusableViewDelegate,DongwangTuijianHeaderCollectionReusableViewDelegate>
@property(nonatomic,strong) UITableView * DongwangChildHomeTableView;
@property(nonatomic,strong) NSMutableArray * DongwangHomeDataArr;
@property(nonatomic,strong) NSMutableArray * DongwangDataArr;
@property(nonatomic,assign) NSInteger  page;
@property(nonatomic,strong) NSMutableArray * mofangDataArr;
@property(nonatomic,assign) CGFloat SectionHeaderHeight;
@property(nonatomic,strong) NSArray * ImgArr;
@property(nonatomic,strong) UICollectionView * DongwangActityCollectionView;
@property(nonatomic,assign) CGFloat TableViewContentHeight;
@property(nonatomic,strong) UIView * headerBgView;
@property(nonatomic,strong) NSMutableArray * BanarModelArr;
@end

@implementation DongwangHommetuijianViewController
-(NSMutableArray *)DongwangHomeDataArr{
    if (!_DongwangHomeDataArr) {
        _DongwangHomeDataArr = [[NSMutableArray alloc]init];
    }
    return _DongwangHomeDataArr;
}
-(NSMutableArray *)DongwangDataArr{
    if (!_DongwangDataArr) {
        _DongwangDataArr = [[NSMutableArray alloc]init];
    }
    return _DongwangDataArr;
}
-(NSMutableArray *)BanarModelArr{
    if (!_BanarModelArr) {
        _BanarModelArr =[NSMutableArray array];
    }
    return _BanarModelArr;
}
-(NSMutableArray *)mofangDataArr{
    if (!_mofangDataArr) {
        _mofangDataArr = [NSMutableArray array];
    }
    return _mofangDataArr;
}
-(void)DongwnagHotTizuTableViewCellBtnClickWithCellIndex:(NSInteger)CellIndex{
    
}
-(UITableView *)DongwangChildHomeTableView{
    if (!_DongwangChildHomeTableView) {
        _DongwangChildHomeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Height-NaviH-kTabBarHeight) style:UITableViewStylePlain];
        _DongwangChildHomeTableView.delegate = self;
        _DongwangChildHomeTableView.dataSource = self;
        _DongwangChildHomeTableView.showsVerticalScrollIndicator = NO;
        _DongwangChildHomeTableView.showsHorizontalScrollIndicator = NO;
        _DongwangChildHomeTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _DongwangChildHomeTableView.backgroundColor = [UIColor clearColor];
        _DongwangChildHomeTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangChildHeaderClicks)];
        [_DongwangChildHomeTableView.mj_header beginRefreshing];
        MJWeakSelf;
        _DongwangChildHomeTableView.mj_footer = [MJRefreshManager defaultFooter:^{
        [weakSelf DongwangHomeFooterClicks];
        }];
        _DongwangChildHomeTableView.mj_footer.hidden = YES;
    }
    return _DongwangChildHomeTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DongwangHomeDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangHotIdentier = @"DongwnagHotTizuTableViewCell";
    DongwnagHotTizuTableViewCell  * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangHotIdentier];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwnagHotTizuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangHotIdentier];
    }
    DongwangCell.delegate = self;
    DongwangCell.tag =indexPath.row;
    DongwangCell.tuziModel = self.DongwangHomeDataArr[indexPath.row];
    return DongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(129.5);
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return  400;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    DongwangHomeTuijianSectionHeaderView * header = [[DongwangHomeTuijianSectionHeaderView alloc]init];
    header.DataArr = self.mofangDataArr;
    return header;
}

-(void)DongwangChildHeaderClicks{
    self.page = 1;
    self.TableViewContentHeight =1;
    [self DongwangHomeListRequestData];
    MJWeakSelf;
[DongwangHomeViewModel DongwangHomeIcon:@{}.mutableCopy RequestCuurentControlers:self taskSuuced:^(NSMutableArray * _Nonnull modelAarr, NSMutableArray * _Nonnull chunModelArr) {
        weakSelf.mofangDataArr = modelAarr;
    [weakSelf.DongwangActityCollectionView.collectionViewLayout invalidateLayout];

        [weakSelf.DongwangActityCollectionView reloadData];
    } taskfairler:^(id  _Nonnull message) {
        
}];
    
    
    [DongwangHomeViewModel DongwangHomeBannar:@{}.mutableCopy RequestCuurentControlers:self taskSuuced:^(NSMutableArray * _Nonnull modelAarr, NSMutableArray * _Nonnull ImgsUrl) {
        weakSelf.ImgArr =  [ImgsUrl copy];
        if (weakSelf.BanarModelArr.count > 0) {
            [weakSelf.BanarModelArr removeAllObjects];
        }
        weakSelf.BanarModelArr = modelAarr;
        [weakSelf.DongwangActityCollectionView reloadData];
    } taskfairler:^(id  _Nonnull message) {
        
    }];


    
}
-(void)DongwangHomeFooterClicks{
    self.page +=1;
    [self DongwangHomeListRequestData];
    
}

-(void)DongwangHomeListRequestData{
    NSMutableDictionary * parmters = [NSMutableDictionary dictionary];
    [parmters setValue:[NSString stringWithFormat:@"%ld",(long)self.page] forKey:@"page"];
    MJWeakSelf;
    [DongwangHomeViewModel DongwangHomeAnsurelist:parmters RequestCuurentControlers:self taskSuuced:^(NSMutableArray * _Nonnull modelAarr) {
        if (self.page == 1) {
        if (weakSelf.DongwangHomeDataArr.count > 0) {
        [weakSelf.DongwangHomeDataArr removeAllObjects];
        }
        weakSelf.DongwangHomeDataArr = modelAarr;
        weakSelf.TableViewContentHeight  = weakSelf.DongwangHomeDataArr.count*K(129.5)+K(15);
           
            if (weakSelf.DongwangHomeDataArr.count < 20) {
            weakSelf.DongwangActityCollectionView.mj_footer.hidden = YES;
            }else{
            weakSelf.DongwangActityCollectionView.mj_footer.hidden = NO;
            }

        [weakSelf.DongwangActityCollectionView reloadData];
        [weakSelf.DongwangActityCollectionView.mj_footer  resetNoMoreData];
        [weakSelf.DongwangActityCollectionView.mj_header endRefreshing];
            
            
        }else
        {
        weakSelf.DongwangActityCollectionView.mj_footer.hidden = NO;
        if (modelAarr.count  <  20) {
        weakSelf.TableViewContentHeight  = weakSelf.DongwangHomeDataArr.count*K(129.5)+K(15);
        [weakSelf.DongwangActityCollectionView reloadData];
        [weakSelf.DongwangActityCollectionView.mj_footer endRefreshingWithNoMoreData];
            return;
        }
        [weakSelf.DongwangHomeDataArr addObjectsFromArray:[modelAarr copy]];
        weakSelf.TableViewContentHeight  = weakSelf.DongwangHomeDataArr.count*K(129.5)+K(15);
        [weakSelf.DongwangActityCollectionView reloadData];
        [weakSelf.DongwangActityCollectionView.mj_footer endRefreshing];
        }
        
       
    } taskfairler:^(id  _Nonnull message) {
        
    }];
}
-(void)DongwangAdressLoademtyView{
    LYEmptyView * dongwangemtyView = [LYEmptyView emptyActionViewWithImage:[UIImage imageNamed:@"holderdata"] titleStr:@"暂无数据～" detailStr:@"" btnTitleStr:@"" target:nil action:nil];
    dongwangemtyView.contentViewOffset = K(50);
    self.DongwangChildHomeTableView.ly_emptyView = dongwangemtyView;
    [self.DongwangChildHomeTableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =  [UIColor colorWithHexString:@"#EDEDED"];
    self.gk_navigationBar.hidden = YES;
//    [self.view addSubview:self.DongwangChildHomeTableView];
    [self.view addSubview:self.DongwangActityCollectionView];
    [self.DongwangActityCollectionView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    [_DongwangActityCollectionView.superview addSubview:self.headerBgView];
    // Do any additional setup after loading the view.
}
-(UIView*)headerBgView{
if(!_headerBgView){
_headerBgView = [UIView new];
_headerBgView.backgroundColor= [UIColor colorWithHexString:@"#FFE301"];
}
return _headerBgView;
}

-(UICollectionView *)DongwangActityCollectionView{
    if (!_DongwangActityCollectionView) {
        UICollectionViewFlowLayout * DongwangActiytLayout = [[UICollectionViewFlowLayout alloc]init];
//        DongwangActiytLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, K(100));
        DongwangActiytLayout.sectionInset =  UIEdgeInsetsMake(0, 15, 0, 15);
        DongwangActiytLayout.minimumLineSpacing = 0;
        DongwangActiytLayout.minimumInteritemSpacing = 0;
        _DongwangActityCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-0, SCREEN_Height-NaviH-kTabBarHeight) collectionViewLayout:DongwangActiytLayout];
        _DongwangActityCollectionView.delegate = self;
        _DongwangActityCollectionView.dataSource =self;
        _DongwangActityCollectionView.showsVerticalScrollIndicator = NO;
        _DongwangActityCollectionView.showsHorizontalScrollIndicator = NO;
        _DongwangActityCollectionView.backgroundColor = [UIColor clearColor];
        [_DongwangActityCollectionView registerClass:[MyImgCollectionViewCell class] forCellWithReuseIdentifier:@"MyImgCollectionViewCell"];
        [_DongwangActityCollectionView registerClass:[DongwangTuijianHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DongwangTuijianHeaderCollectionReusableView"];
        
        [_DongwangActityCollectionView registerClass:[DongwangTuijianFooterCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"DongwangTuijianFooterCollectionReusableView"];
        _DongwangActityCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangActiytCollectionHeaderClicks)];
        [_DongwangActityCollectionView.mj_header beginRefreshing];
        MJWeakSelf;
        _DongwangActityCollectionView.mj_footer = [MJRefreshManager defaultFooter:^{
            [weakSelf DongwangHomeFooterClicks];
        }];
        _DongwangActityCollectionView.mj_footer.hidden = YES;

    }
    return _DongwangActityCollectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    _DongwangChildHomeTableView.mj_footer.hidden = !self.DongwangHomeDataArr.count;
    DongwangMofangModel * mofangModle = self.mofangDataArr[section];
    return mofangModle.magicList.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.mofangDataArr.count;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangMofangModel * dongmodle = self.mofangDataArr[indexPath.section];
    MagicList  * listobject  = dongmodle.magicList[indexPath.row];
    if ([listobject.action integerValue] == 0) {
    [[NSNotificationCenter defaultCenter] postNotificationName:AppTabbarActitytapNotiCation object:nil userInfo:@{@"action":[NSString stringWithFormat:@"%@",listobject.action],@"type":[NSString stringWithFormat:@"%@",listobject.type],@"url":[NSString stringWithFormat:@"%@",listobject.url]}];
    }

}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangMofangModel * dongmodle = self.mofangDataArr[indexPath.section];

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
//    [cell.myimgeView sd_setImageWithURL:[NSURL URLWithString:listobject.imageUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//            /** 缓存image size */
//        [XHWebImageAutoSize storeImageSize:image forURL:[NSURL URLWithString:listobject.imageUrl] completed:^(BOOL result) {
//        /** reload  */
//        if(result)  [collectionView  xh_reloadDataForURL:[NSURL URLWithString:listobject.imageUrl]];
//        }];
//        }];
        return cell;

    
    return nil;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangMofangModel * mofangmodel = self.mofangDataArr[indexPath.section];
    MagicList * listmodel = mofangmodel.magicList[indexPath.row];
//    NSLog(@"个数:%ld",listmodel.countNums);
    //指定了item的宽度
    CGFloat  imgWidth = (SCREEN_WIDTH-30)/listmodel.countNums;
    CGFloat imgheight =     [XHWebImageAutoSize imageHeightForURL:[NSURL URLWithString:listmodel.imageUrl] layoutWidth:imgWidth estimateHeight:100];
//    NSLog(@"图片的高度:%f",imgheight);
//    return CGSizeMake(imgrealWidth, imgheight);
    
    //控件宽度＊图片高度/图片宽度  =控件需要的高度
    return  CGSizeMake(imgWidth, imgheight);
}
// 设置区头尺寸高度
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
   
    if (section == 0) {
        CGSize size = CGSizeMake(SCREEN_WIDTH, K(144+15+15));
        return size;
    }else{
        CGSize size = CGSizeMake(0, 0);
        return size;
    }
}
// 设置区尾尺寸高度
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == self.mofangDataArr.count-1) {
        CGSize size = CGSizeMake(SCREEN_WIDTH, self.TableViewContentHeight);
        return size;
    }else{
        CGSize size = CGSizeMake(0, 0);
        return size;
    }
  
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableView = nil;
    // 区头
    if (kind == UICollectionElementKindSectionHeader) {
        DongwangTuijianHeaderCollectionReusableView *headerView = (DongwangTuijianHeaderCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DongwangTuijianHeaderCollectionReusableView" forIndexPath:indexPath];
        headerView.ImgArr = [self.ImgArr mutableCopy];
        headerView.delegate = self;
        reusableView = headerView;
    }
    // 区尾
    if (kind == UICollectionElementKindSectionFooter) {
DongwangTuijianFooterCollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"DongwangTuijianFooterCollectionReusableView" forIndexPath:indexPath];
        footerView.delegate = self;
      footerView.DongwangHomeDataArr = self.DongwangHomeDataArr;
        reusableView = footerView;
    }
    return reusableView;
}
-(void)DongwangActiytCollectionHeaderClicks{
    [self DongwangChildHeaderClicks];
}
#pragma mark--DongwangTuijianFooterCollectionReusableViewDelegate
-(void)DongwangHomeTuijianDidSeltecdWithCellindex:(NSInteger)index{
    DongwangHotTizuModel * tizuModel = self.DongwangHomeDataArr[index];
    if ([NSString isBlankString:tizuModel.url]) {
        [CHShowMessageHud showMessageText:@"url为空"];
        return;
    }
    DongwangPrivetaWebViewController * dongwangprviteVc = [[DongwangPrivetaWebViewController alloc]init];
    dongwangprviteVc.protoclUrlText = tizuModel.url;
    dongwangprviteVc.type = VCPush;
    dongwangprviteVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dongwangprviteVc animated:YES];
    
}
#pragma mark--DongwangTuijianHeaderCollectionReusableViewDelegate
-(void)DongwangTuijianHeaderCollectionReusableViewDidSeltecdWithBannarIndex:(NSInteger)banaIndex{
    DongwangHomeBannarModel * bannarModel = self.BanarModelArr[banaIndex];
    if ([bannarModel.action integerValue] == 0) {
    [[NSNotificationCenter defaultCenter] postNotificationName:AppTabbarActitytapNotiCation object:nil userInfo:@{@"action":[NSString stringWithFormat:@"%@",bannarModel.action],@"type":[NSString stringWithFormat:@"%@",bannarModel.type],@"url":[NSString stringWithFormat:@"%@",bannarModel.url]}];
    }
}
-(void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id>*)change context:(void*)context{
    
    if([keyPath isEqualToString:@"contentOffset"]){
        
        NSValue *value = change[NSKeyValueChangeNewKey];
        
        CGFloat chaneoffsetY = value.UIOffsetValue.vertical;
        self.headerBgView.frame = CGRectMake(0,0,SCREEN_WIDTH,-chaneoffsetY);
  }}
-(void)dealloc{
[_DongwangActityCollectionView removeObserver:self forKeyPath:@"contentOffset" context:nil];
[[NSNotificationCenter defaultCenter] removeObserver:self];
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
