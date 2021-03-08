//
//  DongwangSubFenleiViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/26.
//

#import "DongwangSubFenleiViewController.h"
#import "DongwangFenleiTableViewCell.h"
#import "DongwangPersonaltaskModel.h"
#import "DongwangcategoryViewModel.h"
#import "DongwangMyInfoViewController.h"
#import "DongwangSigninQiandaoViewController.h"
#import "DongwangLogoinViewModel.h"
#import "DongwangMyViewModel.h"
#import "DongwangRealAuotrViewController.h"
#import "DongwagNewBangdingViewController_V3.h"
@interface DongwangSubFenleiViewController ()<UITableViewDelegate,UITableViewDataSource,DongwangFenleiTableViewCellDelegate>
@property (nonatomic, copy) void(^scrollCallback)(UIScrollView *scrollView);
@end

@implementation DongwangSubFenleiViewController

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
    NSLog(@"-------r%d",taskModel.type);
    
    //有微信
    if (indexPath.row == 0) {
        
        DongwangMyInfoViewController * innfoVc = [[DongwangMyInfoViewController alloc]init];
        innfoVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:innfoVc animated:YES];
    }else if (indexPath.row == 1){
        DongwangSigninQiandaoViewController * QiandaoVc = [[DongwangSigninQiandaoViewController alloc]init];
        QiandaoVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:QiandaoVc animated:YES];
    }else if (indexPath.row == 2){
        self.tabBarController.selectedIndex = 2;
        [self.navigationController popToRootViewControllerAnimated:NO];
    }else if (indexPath.row == 3){
        NSInteger mytype = taskModel.type;
        if (mytype == 0) {
            //绑定微信
            [DongwangLogoinViewModel DongwangWechatAutor];
        }else{
            //绑定手机号
            DongwagNewBangdingViewController_V3 * DongwangVc = [[DongwagNewBangdingViewController_V3 alloc]init];
            DongwangVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:DongwangVc animated:YES];
        }
        
        
    }else if (indexPath.row == 4){
        DongwangRealAuotrViewController * DongwangAlterVc=  [[DongwangRealAuotrViewController alloc]init];
        DongwangAlterVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:DongwangAlterVc animated:YES];
    }
    
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.Index == 0  ? K(21) : K(42);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * SectioNheader =[UIView new];
    SectioNheader.backgroundColor = [UIColor clearColor];
    
    UILabel * DonwgangNumslb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(42))];
    DonwgangNumslb.textColor = [UIColor colorWithHexString:@"#333333"];
    DonwgangNumslb.textAlignment = NSTextAlignmentCenter;
    DonwgangNumslb.font = KSysFont(font(10));
    DonwgangNumslb.text =  self.Index == 0  ? @"" :  @"每日0点更新，今日完成0/4";
    [SectioNheader addSubview:DonwgangNumslb];
    return SectioNheader;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.scrollCallback ?: self.scrollCallback(scrollView);
}
#pragma mark--微信登录回调
- (void)chWxCodeNotification:(NSNotification *)notification {
    NSLog(@"DongwangSubFenleiViewController");
    NSDictionary *notificatDictionary = notification.userInfo;
    NSString * wxCode= [notificatDictionary objectForKey:@"wxCode"];
 
    
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithbindingWechat_hwc:@{@"code":wxCode,@"userId":[NSString stringWithFormat:@"%@",[UserManager userInfo].userid]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        [weakSelf dongwangRealodListViews];
    } Deleaccountfairler:^(id  _Nonnull message) {
        
    }];
   }
-(void)dongwangRealodListViews{
    MJWeakSelf;
    [DongwangcategoryViewModel DongwangFenleiViewModelWithgetTask:@{}.mutableCopy RequestCuurentControlers:self taskSuuced:^(id  _Nonnull object, BOOL isNewTask, NSString * _Nonnull completeProgress) {
        if (isNewTask) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"DongwangSubNewsTaskAction" object:nil];

        }
        
        weakSelf.dataSoure =  [(NSMutableArray *)object copy];
        [weakSelf.tableView reloadData];
//        [TableViewAnimationKit showWithAnimationType:XSTableViewAnimationTypeFall tableView:weakSelf.tableView];
    } taskfairler:^(id  _Nonnull message) {
    }];

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
-(NSInteger)DongwangCaculateCompltecCount{
    NSInteger  index = 0;
    for (DongwangPersonaltaskModel * mdoel in self.dataSoure) {
        if (mdoel.iscomplete == YES) {
            index +=1;
        }
    }
    return index;
}

- (void)listDidAppear {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chWxCodeNotification:) name:CHWXCodeNotification object:nil];
    MJWeakSelf;
    [DongwangcategoryViewModel DongwangFenleiViewModelWithgetTask:@{}.mutableCopy RequestCuurentControlers:self taskSuuced:^(id  _Nonnull object, BOOL isNewTask, NSString * _Nonnull completeProgress) {
        if (isNewTask) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"DongwangSubNewsTaskAction" object:nil];

        }
        
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
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CHWXCodeNotification object:nil];

//    NSLog(@"%@:%@", self.title, NSStringFromSelector(_cmd));
}
#pragma mark--DongwangFenleiTableViewCellDelegate
-(void)DongwangFenleiTableViewCellDidSeltecdWithCellIndex:(NSInteger)CellIndex{
    DongwangPersonaltaskModel * taskModel = self.dataSoure[CellIndex];
    if (taskModel.iscomplete == YES) {
        return;
    }
    if (CellIndex == 0) {
        DongwangMyInfoViewController * innfoVc = [[DongwangMyInfoViewController alloc]init];
        innfoVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:innfoVc animated:YES];
    }else if (CellIndex == 1){
        DongwangSigninQiandaoViewController * QiandaoVc = [[DongwangSigninQiandaoViewController alloc]init];
        QiandaoVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:QiandaoVc animated:YES];
    }else if (CellIndex == 2){
        self.tabBarController.selectedIndex = 2;
        [self.navigationController popToRootViewControllerAnimated:NO];
    }else if (CellIndex == 3){
        [DongwangLogoinViewModel DongwangWechatAutor];
    }else if (CellIndex == 4){
        DongwangRealAuotrViewController * DongwangAlterVc=  [[DongwangRealAuotrViewController alloc]init];
        DongwangAlterVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:DongwangAlterVc animated:YES];
    }
    

}
-(void)dealloc{
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
