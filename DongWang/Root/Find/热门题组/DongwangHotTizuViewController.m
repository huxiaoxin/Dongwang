//
//  DongwangHotTizuViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/25.
//

#import "DongwangHotTizuViewController.h"
#import "DongwnagHotTizuTableViewCell.h"
#import "DongwangFindViewModel.h"
#import "DongwangQuesitonnGroupDetailViewController.h"
#import "Cat.h"
@interface DongwangHotTizuViewController ()<UITableViewDelegate,UITableViewDataSource,DongwnagHotTizuTableViewCellDelegate>
@property(nonatomic,strong) UITableView * DongwangHotTizuTableView;
@property(nonatomic,strong) NSMutableArray * DongwangHotDataArr;
@property(nonatomic,strong) UIImageView * DongwangHeaderImgView;
@property(nonatomic,assign) NSInteger  page;
@property(nonatomic,strong)  NSString * showTimeStr;
@property(nonatomic,strong)  NSString * leaveTimeStr;
@end

@implementation DongwangHotTizuViewController

-(NSMutableArray *)DongwangHotDataArr{
    if (!_DongwangHotDataArr) {
        _DongwangHotDataArr = [[NSMutableArray alloc]init];
    }
    return _DongwangHotDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Cat eat];
    self.gk_navTitle = @"发现";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#EDEDED"];
    
    UIImageView * DongwangHeaderImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, K(206))];
    DongwangHeaderImgView.image = [UIImage imageNamed:@"huamian"];
    [self.view addSubview:DongwangHeaderImgView];
    
    UILabel * DongwnagMsglb = [[UILabel alloc]initWithFrame:CGRectMake(0, K(35), SCREEN_WIDTH, K(31))];
    DongwnagMsglb.textAlignment = NSTextAlignmentCenter;
    DongwnagMsglb.font = KBlFont(font(22));
    DongwnagMsglb.textColor = [UIColor whiteColor];
    DongwnagMsglb.text = @"发现·题组";
    [DongwangHeaderImgView addSubview:DongwnagMsglb];
    _DongwangHeaderImgView = DongwangHeaderImgView;
    [self.view addSubview:self.DongwangHotTizuTableView];
    
    UIView * TableHeader = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(180))];
    TableHeader.backgroundColor = [UIColor clearColor];
    _DongwangHotTizuTableView.tableHeaderView = TableHeader;
    
}
-(UITableView *)DongwangHotTizuTableView{
    if (!_DongwangHotTizuTableView) {
        _DongwangHotTizuTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH+K(0), SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-kTabBarHeight-K(0)) style:UITableViewStylePlain];
        _DongwangHotTizuTableView.delegate = self;
        _DongwangHotTizuTableView.dataSource = self;
        _DongwangHotTizuTableView.showsVerticalScrollIndicator = NO;
        _DongwangHotTizuTableView.showsHorizontalScrollIndicator = NO;
        _DongwangHotTizuTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _DongwangHotTizuTableView.backgroundColor = [UIColor clearColor];
        _DongwangHotTizuTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangHotTizuHeaderClicks)];
        [_DongwangHotTizuTableView.mj_header beginRefreshing];
//        _DongwangHotTizuTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(DongwangHotTizuFooterClicks)];
//        _DongwangHotTizuTableView.mj_footer.hidden = YES;
        MJWeakSelf;
        _DongwangHotTizuTableView.mj_footer = [MJRefreshManager defaultFooter:^{
        [weakSelf DongwangHotTizuFooterClicks];
        }];

    }
    return _DongwangHotTizuTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    _DongwangHotTizuTableView.mj_footer.hidden= !self.DongwangHotDataArr.count;
    return self.DongwangHotDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangHotIdentier = @"DongwnagHotTizuTableViewCell";
    DongwnagHotTizuTableViewCell  * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangHotIdentier];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwnagHotTizuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangHotIdentier];
    }
    DongwangCell.tag = indexPath.row;
    DongwangCell.delegate = self;
    DongwangCell.tuziModel = self.DongwangHotDataArr[indexPath.row];
    return DongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(129.5);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DongwangHotTizuModel * tizuModel = self.DongwangHotDataArr[indexPath.row];
//    DongwangQuesitonnGroupDetailViewController * DongwangtuziDetialVc = [[DongwangQuesitonnGroupDetailViewController alloc]init];
//    DongwangtuziDetialVc.hidesBottomBarWhenPushed = YES;
//    DongwangtuziDetialVc.questionurl =  tizuModel.url;
//    DongwangtuziDetialVc.titleName = tizuModel.name;
//    [self.navigationController pushViewController:DongwangtuziDetialVc animated:YES];
    DongwangPrivetaWebViewController * dongwangprviteVc = [[DongwangPrivetaWebViewController alloc]init];
    dongwangprviteVc.protoclUrlText = tizuModel.url;
    dongwangprviteVc.type = VCPush;
    dongwangprviteVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dongwangprviteVc animated:YES];

}

-(void)DongwangHotTizuHeaderClicks{
    self.page = 1;
    [self DongwamgHottuziReqeustData];
}
-(void)DongwangHotTizuFooterClicks{
    
    self.page +=1;
    [self DongwamgHottuziReqeustData];
    
}
-(void)DongwamgHottuziReqeustData{
    MJWeakSelf;
    [DongwangFindViewModel DongwangFindViewModelWithgetGrouphot:@{@"page":[NSString stringWithFormat:@"%ld",self.page]}.mutableCopy RequestCuurentControlers:self taskSuuced:^(id  _Nonnull object) {
        NSMutableArray *  responeArr = (NSMutableArray *)object;
        if (weakSelf.page == 1) {
            if (weakSelf.DongwangHotDataArr.count > 0) {
                [weakSelf.DongwangHotDataArr removeAllObjects];
            }
            weakSelf.DongwangHotDataArr = responeArr;
            if (responeArr.count == 0) {
                [weakSelf DongwangAdressLoademtyView];
            }
            [weakSelf.DongwangHotTizuTableView.mj_footer resetNoMoreData];
            [weakSelf.DongwangHotTizuTableView.mj_header endRefreshing];
            [weakSelf.DongwangHotTizuTableView reloadData];
            [TableViewAnimationKit showWithAnimationType:XSTableViewAnimationTypeFall tableView:weakSelf.DongwangHotTizuTableView];
        }else{
            if (responeArr.count == 0) {
            [weakSelf.DongwangHotTizuTableView.mj_footer endRefreshingWithNoMoreData];
            }else{
                [weakSelf.DongwangHotDataArr addObjectsFromArray:[responeArr copy]];
                [weakSelf.DongwangHotTizuTableView.mj_footer endRefreshing];
                [weakSelf.DongwangHotTizuTableView reloadData];
            }
            
        }
    } taskfairler:^(id  _Nonnull message) {
        [weakSelf.DongwangHotTizuTableView.mj_header endRefreshing];
        [weakSelf.DongwangHotTizuTableView.mj_footer endRefreshing];

    }];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(tintColor)]) {
        CGFloat cornerRadius = 10.f;
        cell.backgroundColor = UIColor.clearColor;
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
        layer.fillColor = [UIColor whiteColor].CGColor;
        layer.strokeColor=[UIColor whiteColor].CGColor;
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
#pragma mark--DongwnagHotTizuTableViewCellDelegate
-(void)DongwnagHotTizuTableViewCellBtnClickWithCellIndex:(NSInteger)CellIndex{
    DongwangHotTizuModel * tizuModel = self.DongwangHotDataArr[CellIndex];
//    DongwangQuesitonnGroupDetailViewController * DongwangtuziDetialVc = [[DongwangQuesitonnGroupDetailViewController alloc]init];
//    DongwangtuziDetialVc.hidesBottomBarWhenPushed = YES;
//    DongwangtuziDetialVc.questionurl =  tizuModel.url;
//    DongwangtuziDetialVc.titleName = tizuModel.name;
//    [self.navigationController pushViewController:DongwangtuziDetialVc animated:YES];
    
    DongwangPrivetaWebViewController * dongwangprviteVc = [[DongwangPrivetaWebViewController alloc]init];
    dongwangprviteVc.protoclUrlText = tizuModel.url;
    dongwangprviteVc.type = VCPush;
    dongwangprviteVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dongwangprviteVc animated:YES];

    
}
-(void)DongwangAdressLoademtyView{
    LYEmptyView * dongwangemtyView = [LYEmptyView emptyActionViewWithImage:[UIImage imageNamed:@"holderdata"] titleStr:@"暂无数据～" detailStr:@"" btnTitleStr:@"" target:nil action:nil];
    dongwangemtyView.contentViewOffset = K(50);
    self.DongwangHotTizuTableView.ly_emptyView = dongwangemtyView;
    [self.DongwangHotTizuTableView reloadData];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offery  =  scrollView.contentOffset.y;
    _DongwangHeaderImgView.y =  -offery+NaviH;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.showTimeStr = [NSString currentTimeStr];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

    self.leaveTimeStr =  [NSString currentTimeStr];
    [[DataBuried ShareManager] CLLogoninWithParmesWithShowTimeStr:self.showTimeStr LeaveTimeStr:self.leaveTimeStr ViewPageName:5];
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
