//
//  DongwangSubFenleiNewViewController.m
//  DongWang
//
//  Created by codehzx on 2020/12/3.
//

#import "DongwangSubFenleiNewViewController.h"
#import "DongwangcategoryViewModel.h"
#import "DongwangFenleiTableViewCell.h"
#import "DongwangPrivetaWebViewController.h"
#import "DongwangJifenChangViewController.h"
@interface DongwangSubFenleiNewViewController ()<UITableViewDelegate,UITableViewDataSource,DongwangFenleiTableViewCellDelegate>
@property (nonatomic, copy) void(^scrollCallback)(UIScrollView *scrollView);
@property(nonatomic,strong) NSString * completeProgressStr;
@end

@implementation DongwangSubFenleiNewViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //新手任务
    self.gk_navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#341E7B"];
    [self.view addSubview:self.tableView];
   
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        
    }
    return _tableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSoure.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangIdentifer = @"DongwangFenleiTableViewCell";
    DongwangFenleiTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangIdentifer];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwangFenleiTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangIdentifer];
    }
    DongwangCell.tag  = indexPath.row;
    DongwangCell.delegate = self;
    DongwangCell.taskModel = self.dataSoure[indexPath.row];
    return DongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(85+0);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DongwangPersonaltaskModel * taskModel = self.dataSoure[indexPath.row];
    if (taskModel.iscomplete == YES) {
        return;
    }
    if (indexPath.row == 0) {
        self.tabBarController.selectedIndex = 2;
        [self.navigationController popToRootViewControllerAnimated:NO];
    }else if (indexPath.row == 1){
        self.tabBarController.selectedIndex = 2;
        [self.navigationController popToRootViewControllerAnimated:NO];
        
    }else if (indexPath.row == 2){
        DongwangPrivetaWebViewController * DongwangCardsVc = [[DongwangPrivetaWebViewController alloc]init];
        DongwangCardsVc.protoclUrlText = [NSString stringWithFormat:@"%@%@",Protocl_Url,jifenpaifan];
        DongwangCardsVc.type = VCPush;
        DongwangCardsVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:DongwangCardsVc animated:YES];
    }else if (indexPath.row == 3){
        DongwangJifenChangViewController * jifenduihuanVc = [[DongwangJifenChangViewController alloc]init];
        jifenduihuanVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:jifenduihuanVc animated:YES];
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return  K(42);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * SectioNheader =[UIView new];
    SectioNheader.backgroundColor = [UIColor clearColor];
    
    UILabel * DonwgangNumslb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(42))];
    DonwgangNumslb.textColor = [UIColor whiteColor];
    DonwgangNumslb.textAlignment = NSTextAlignmentCenter;
    DonwgangNumslb.font = KSysFont(font(10));
    DonwgangNumslb.text = self.completeProgressStr;
//    [NSString stringWithFormat:@"每日0点更新，今日完成%ld/%lu",(long)[self DongwangCaculateCompltecCount],(unsigned long)self.dataSoure.count];
//    @"每日0点更新，今日完成1/4";
    [SectioNheader addSubview:DonwgangNumslb];
    return SectioNheader;
}
-(NSInteger)DongwangCaculateCompltecCount{
    NSInteger  index = 0;
    for (DongwangPersonaltaskModel * mdoel in self.dataSoure) {
        if (mdoel.iscomplete == YES) {
            index +=1;
        }
    }
    return index;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.scrollCallback ?: self.scrollCallback(scrollView);
}
#pragma mark--DongwangFenleiTableViewCellDelegate
-(void)DongwangFenleiTableViewCellDidSeltecdWithCellIndex:(NSInteger)CellIndex{
    DongwangPersonaltaskModel * taskModel = self.dataSoure[CellIndex];
    if (taskModel.iscomplete == YES) {
        return;
    }
    if (CellIndex == 0) {
        self.tabBarController.selectedIndex = 2;
        [self.navigationController popToRootViewControllerAnimated:NO];
    }else if (CellIndex == 1){
        self.tabBarController.selectedIndex = 2;
        [self.navigationController popToRootViewControllerAnimated:NO];
    }else if (CellIndex == 2){
        DongwangPrivetaWebViewController * DongwangCardsVc = [[DongwangPrivetaWebViewController alloc]init];
        DongwangCardsVc.hidesBottomBarWhenPushed = YES;
        DongwangCardsVc.protoclUrlText = [NSString stringWithFormat:@"%@%@",Protocl_Url,jifenpaifan];
        DongwangCardsVc.type = VCPush;
        [self.navigationController pushViewController:DongwangCardsVc animated:YES];      
    }else if (CellIndex == 3){
        DongwangJifenChangViewController * jifenduihuanVc = [[DongwangJifenChangViewController alloc]init];
        jifenduihuanVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:jifenduihuanVc animated:YES];
    }
}

#pragma mark - JXPagingViewListViewDelegate

- (UIView *)listView {
    return self.view;
}

- (UIScrollView *)listScrollView {
    return self.tableView;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView *))callback {
    self.scrollCallback = callback;
}

- (void)listWillAppear {
    //    NSLog(@"%@:%@", self.title, NSStringFromSelector(_cmd));
        
}

- (void)listDidAppear {
//    NSLog(@"%@:%@", self.title, NSStringFromSelector(_cmd));
    MJWeakSelf;
    [DongwangcategoryViewModel DongwangFenleiViewModelWithgetTask:@{}.mutableCopy RequestCuurentControlers:self taskSuuced:^(id  _Nonnull object, BOOL isNewTask, NSString * _Nonnull completeProgress) {
        weakSelf.completeProgressStr = completeProgress;
        weakSelf.dataSoure =  [(NSMutableArray *)object copy];
        [weakSelf.tableView reloadData];
//        [TableViewAnimationKit showWithAnimationType:XSTableViewAnimationTypeFall tableView:weakSelf.tableView];
    } taskfairler:^(id  _Nonnull message) {
    }];

}

- (void)listWillDisappear {
//    NSLog(@"%@:%@", self.title, NSStringFromSelector(_cmd));
}

- (void)listDidDisappear {
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
