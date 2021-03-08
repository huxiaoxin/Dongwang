//
//  DongwangChildHomeViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/30.
//

#import "DongwangChildHomeViewController.h"
#import "DongwnagHotTizuTableViewCell.h"
#import "DongwangHomeHeaderView.h"
#import "DongwangHomeViewModel.h"
#import "DongwangHomeBannarModel.h"
#import "DongwangQuesitonnGroupDetailViewController.h"
#import "DongwangMofangModel.h"
@interface DongwangChildHomeViewController ()<UITableViewDelegate,UITableViewDataSource,DongwangHomeHeaderViewDelegate,DongwnagHotTizuTableViewCellDelegate>
@property(nonatomic,strong) UITableView * DongwangChildHomeTableView;
@property(nonatomic,strong) NSMutableArray * DongwangDataArr;
@property(nonatomic,strong)  DongwangHomeHeaderView * headerView;
@property(nonatomic,strong) UIView * headerBgView;
@property(nonatomic,strong) NSMutableArray * BannarModelArr;
@property(nonatomic,strong) NSMutableArray * DongwangHomeDataArr;
@property(nonatomic,assign) NSInteger  page;
@end

@implementation DongwangChildHomeViewController
#pragma mark--DongwangHomeHeaderViewDelegate
-(void)DongwangHomeHeaderViewWithItmeDidSeltecd:(NSInteger)itemIndex{
    
}
-(void)DongwangHomeHeaderViewWithBanarDidSeltecd:(NSInteger)itemIndex{
    DongwangHomeBannarModel * bannarModel = self.BannarModelArr[itemIndex];
    if ([bannarModel.action integerValue] == 0) {
        DongwangPrivetaWebViewController * websVc = [[DongwangPrivetaWebViewController alloc]init];
        websVc.protoclUrlText = bannarModel.url;
        websVc.type = VCPush;
        websVc.titleName = bannarModel.bannerTitle;
        websVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:websVc animated:YES];
       }
}
-(void)DongwangHomeHeaderViewWithMofangDidSeltecd:(MagicList *)listModel{
    NSLog(@"VCPush");
}

-(DongwangHomeHeaderView *)headerView{
    if (!_headerView) {
        _headerView =[[DongwangHomeHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(0))];
        _headerView.delegate = self;
    }
    return _headerView;
}
-(NSMutableArray *)DongwangHomeDataArr{
    if (!_DongwangHomeDataArr) {
        _DongwangHomeDataArr = [[NSMutableArray alloc]init];
    }
    return _DongwangHomeDataArr;
}
-(UIView*)headerBgView{
if(!_headerBgView){
_headerBgView = [UIView new];
_headerBgView.backgroundColor= [UIColor colorWithHexString:@"#FFE301"];
}
return _headerBgView;
}
-(NSMutableArray *)BannarModelArr{
    if (!_BannarModelArr) {
        _BannarModelArr = [NSMutableArray array];
    }
    return _BannarModelArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =  [UIColor colorWithHexString:@"#410093"];
    self.gk_navigationBar.hidden = YES;
    [self.view addSubview:self.DongwangChildHomeTableView];
    if (self.pageIndex == 0) {
        [self.DongwangChildHomeTableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
        [_DongwangChildHomeTableView.superview addSubview:self.headerBgView];
    }
    
}

-(NSMutableArray *)DongwangDataArr{
    if (!_DongwangDataArr) {
        _DongwangDataArr = [[NSMutableArray alloc]init];
    }
    return _DongwangDataArr;
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
    }
    return _DongwangChildHomeTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    self.DongwangChildHomeTableView.mj_footer.hidden = !self.DongwangHomeDataArr.count;
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
    if (indexPath.row == 0) {
        [DongwangCell.DongwangContentView acs_radiusWithRadius:RealWidth(10) corner:UIRectCornerTopLeft | UIRectCornerTopRight];
    }else if (indexPath.row == self.DongwangDataArr.count-1){
        [DongwangCell.DongwangContentView acs_radiusWithRadius:RealWidth(10) corner:UIRectCornerBottomLeft | UIRectCornerBottomRight];
    }
    return DongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(129.5);
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.pageIndex == 0 ? 0 : K(15);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * header = [UIView new];
    header.backgroundColor = [UIColor clearColor];
    return header;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DongwangHotTizuModel * tizuModel = self.DongwangHomeDataArr[indexPath.row];
//    DongwangQuesitonnGroupDetailViewController * DongwangtuziDetialVc = [[DongwangQuesitonnGroupDetailViewController alloc]init];
//    DongwangtuziDetialVc.hidesBottomBarWhenPushed = YES;
//    DongwangtuziDetialVc.questionurl =  tizuModel.url;
//    DongwangtuziDetialVc.titleName = tizuModel.name;
//    [self.navigationController pushViewController:DongwangtuziDetialVc animated:YES];
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

#pragma mark--DongwnagHotTizuTableViewCellDelegate
-(void)DongwnagHotTizuTableViewCellBtnClickWithCellIndex:(NSInteger)CellIndex{
    DongwangHotTizuModel * tizuModel = self.DongwangHomeDataArr[CellIndex];
    DongwangQuesitonnGroupDetailViewController * DongwangtuziDetialVc = [[DongwangQuesitonnGroupDetailViewController alloc]init];
    DongwangtuziDetialVc.hidesBottomBarWhenPushed = YES;
    DongwangtuziDetialVc.questionurl =  tizuModel.url;
    DongwangtuziDetialVc.titleName = tizuModel.name;
    [self.navigationController pushViewController:DongwangtuziDetialVc animated:YES];

}
-(void)DongwangReqesutTopData{
    if (self.pageIndex == 0) {
        MJWeakSelf;
        [DongwangHomeViewModel DongwangHomeBannar:@{}.mutableCopy RequestCuurentControlers:self taskSuuced:^(NSMutableArray * _Nonnull modelAarr, NSMutableArray * _Nonnull ImgsUrl) {
            weakSelf.BannarModelArr = modelAarr;
            weakSelf.headerView.ImgArr =  ImgsUrl;
        } taskfairler:^(id  _Nonnull message) {
            
        }];
        
        [DongwangHomeViewModel DongwangHomeIcon:@{}.mutableCopy RequestCuurentControlers:self taskSuuced:^(NSMutableArray * _Nonnull modelAarr, NSMutableArray * _Nonnull chunModelArr) {
            if (weakSelf.pageIndex == 0) {
                weakSelf.headerView.DongwangChunMofangData = modelAarr;
                weakSelf.headerView.height = weakSelf.headerView.HeaderViewHeight;
                [weakSelf.DongwangChildHomeTableView beginUpdates];
                [weakSelf.DongwangChildHomeTableView  setTableHeaderView:weakSelf.headerView];
                [weakSelf.DongwangChildHomeTableView endUpdates];
            }else{
                [weakSelf.DongwangChildHomeTableView setTableHeaderView:nil];
            }
        } taskfairler:^(id  _Nonnull message) {
            
        }];
    }
    
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(tintColor)]) {
        CGFloat cornerRadius = 10.f;
        cell.backgroundColor = LGDMianColor;
        CAShapeLayer *layer = [[CAShapeLayer alloc] init];
        CGMutablePathRef pathRef = CGPathCreateMutable();
        CGRect bounds = CGRectInset(cell.bounds, 10, 0);
        BOOL addLine = NO;
        if (indexPath.row == 0 && indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
            CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
        } else if (indexPath.row == 0) {

            CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
            CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
            CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
            CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
            addLine = YES;

        } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
            CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
            CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
            CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
            CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
        } else {
            CGPathAddRect(pathRef, nil, bounds);
            addLine = YES;
        }
        layer.path = pathRef;
        CFRelease(pathRef);
        //颜色修改
        layer.fillColor = LGDMianColor.CGColor;
        layer.strokeColor= LGDMianColor.CGColor;
        if (addLine == YES) {
            CALayer *lineLayer = [[CALayer alloc] init];
            CGFloat lineHeight = (1.f / [UIScreen mainScreen].scale);
            lineLayer.frame = CGRectMake(CGRectGetMinX(bounds)+10, bounds.size.height-lineHeight, bounds.size.width-10, lineHeight);
            lineLayer.backgroundColor = tableView.separatorColor.CGColor;
            [layer addSublayer:lineLayer];
        }
        UIView *testView = [[UIView alloc] initWithFrame:bounds];
        [testView.layer insertSublayer:layer atIndex:0];
        testView.backgroundColor = UIColor.clearColor;
        cell.backgroundView = testView;
    }
}

-(void)DongwangChildHeaderClicks{
    self.page = 1;
    [self DongwangHomeListRequestData];
   // [self DongwangReqesutTopData];
}
-(void)DongwangHomeFooterClicks{
    self.page +=1;
    [self DongwangHomeListRequestData];
    
}
-(void)DongwangHomeListRequestData{
    NSMutableDictionary * parmters = [NSMutableDictionary dictionary];
    [parmters setValue:[NSString stringWithFormat:@"%ld",(long)self.page] forKey:@"page"];
    if (self.pageIndex != 0) {
    [parmters setValue:[NSString stringWithFormat:@"%@",self.TagModel.tagid] forKey:@"tagId"];
    }
    MJWeakSelf;
    [DongwangHomeViewModel DongwangHomeAnsurelist_old:parmters RequestCuurentControlers:self taskSuuced:^(NSMutableArray * _Nonnull modelAarr) {
        if (self.page == 1) {
            if (weakSelf.DongwangHomeDataArr.count > 0) {
            [weakSelf.DongwangDataArr removeAllObjects];
            }
            weakSelf.DongwangHomeDataArr = modelAarr;
            if (weakSelf.DongwangDataArr.count == 0) {
                [weakSelf DongwangAdressLoademtyView];
            }
            [weakSelf.DongwangChildHomeTableView.mj_header endRefreshing];
            [weakSelf.DongwangChildHomeTableView reloadData];
            [TableViewAnimationKit showWithAnimationType:XSTableViewAnimationTypeFall tableView:weakSelf.DongwangChildHomeTableView];
            [weakSelf.DongwangChildHomeTableView.mj_footer resetNoMoreData];
        }else{
            if (modelAarr.count == 0) {
                [weakSelf.DongwangChildHomeTableView.mj_footer endRefreshingWithNoMoreData];
                [weakSelf.DongwangChildHomeTableView reloadData];
                return;
            }
            [weakSelf.DongwangHomeDataArr addObjectsFromArray:[modelAarr copy]];
            [weakSelf.DongwangChildHomeTableView.mj_footer endRefreshing];
            [weakSelf.DongwangChildHomeTableView reloadData];
        }
    } taskfairler:^(id  _Nonnull message) {
        [weakSelf.DongwangChildHomeTableView.mj_header endRefreshing];
        [weakSelf.DongwangChildHomeTableView.mj_footer endRefreshing];
    }];
}
-(void)DongwangAdressLoademtyView{
    LYEmptyView * dongwangemtyView = [LYEmptyView emptyActionViewWithImage:[UIImage imageNamed:@"holderdata"] titleStr:@"暂无数据～" detailStr:@"" btnTitleStr:@"" target:nil action:nil];
    dongwangemtyView.contentViewOffset = K(50);
    self.DongwangChildHomeTableView.ly_emptyView = dongwangemtyView;
    [self.DongwangChildHomeTableView reloadData];
}

-(void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id>*)change context:(void*)context{
    
    if([keyPath isEqualToString:@"contentOffset"]){
        
        NSValue *value = change[NSKeyValueChangeNewKey];
        
        CGFloat chaneoffsetY = value.UIOffsetValue.vertical;
        self.headerBgView.frame = CGRectMake(0,0,SCREEN_WIDTH,-chaneoffsetY);
  }}
-(void)dealloc{
    if (self.pageIndex == 0) {
[_DongwangChildHomeTableView removeObserver:self forKeyPath:@"contentOffset" context:nil];
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.DongwangChildHomeTableView.mj_header beginRefreshing];
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
