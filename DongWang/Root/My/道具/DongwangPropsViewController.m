//
//  DongwangPropsViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import "DongwangPropsViewController.h"
#import "DongwangProTableViewCell.h"
#import "DongwangMyViewModel.h"
@interface DongwangPropsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * DongwangProTableView;
@property(nonatomic,strong) NSMutableArray * DongwangProDataArr;
@property(nonatomic,strong) NSString *    intimer;
@end

@implementation DongwangPropsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"我的道具";
    self.isShowBtomImgView = NO;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#804AB7"];
    [self.view addSubview:self.DongwangProTableView];
    
    UIView * DongwangHeader  =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(16.5))];
    DongwangHeader.backgroundColor = [UIColor colorWithHexString:@"#804AB7"];
    _DongwangProTableView.tableHeaderView = DongwangHeader;
    
    // Do any additional setup after loading the view.
}
-(NSMutableArray *)DongwangProDataArr{
    if (!_DongwangProDataArr) {
        _DongwangProDataArr = [[NSMutableArray alloc]init];
    }
    return _DongwangProDataArr;
}
-(UITableView *)DongwangProTableView{
    if (!_DongwangProTableView) {
        _DongwangProTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _DongwangProTableView.delegate = self;
        _DongwangProTableView.dataSource = self;
        _DongwangProTableView.showsVerticalScrollIndicator = NO;
        _DongwangProTableView.showsHorizontalScrollIndicator = NO;
        _DongwangProTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _DongwangProTableView.backgroundColor = [UIColor clearColor];
        _DongwangProTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangProHeaderClicks)];
        [_DongwangProTableView.mj_header beginRefreshing];
    }
    return _DongwangProTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    _DongwangProTableView.mj_footer.hidden = !self.DongwangProDataArr.count;
    return self.DongwangProDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangIdentifer = @"DongwangProTableViewCell";
    DongwangProTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangIdentifer];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwangProTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangIdentifer];
    }
    DongwangCell.daojuModel = self.DongwangProDataArr[indexPath.row];
    return DongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(110+13);
}
-(void)DongwangProHeaderClicks{
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithMydaoju:@{}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        self.DongwangProDataArr =(NSMutableArray *) object;
        if (weakSelf.DongwangProDataArr.count == 0) {
            [weakSelf DongwangAdressLoademtyView];
        }
        [weakSelf.DongwangProTableView.mj_header endRefreshing];
        [weakSelf.DongwangProTableView reloadData];
    } Deleaccountfairler:^(id  _Nonnull message) {
        [weakSelf.DongwangProTableView.mj_header endRefreshing];
        [weakSelf.DongwangProTableView.mj_footer endRefreshing];

    }];
}
-(void)DongwangAdressLoademtyView{
    LYEmptyView * dongwangemtyView = [LYEmptyView emptyActionViewWithImage:[UIImage imageNamed:@"holderdata"] titleStr:@"还没有获得道具，去答题试试~" detailStr:@"" btnTitleStr:@"" target:nil action:nil];
    dongwangemtyView.titleLabTextColor = [UIColor whiteColor];
    self.DongwangProTableView.ly_emptyView = dongwangemtyView;
    [self.DongwangProTableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //刚进入
    NSString *  currentTimeStr = [NSString currentDateStr];
//    NSLog(@"页面进入时/z间:%@",currentTimeStr);
    self.intimer = currentTimeStr;
//    NSTimeInterval timer1 = [currentTimeStr longLongValue];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //消失
    NSString *  currentTimeStr = [NSString currentDateStr];
   NSString * chaStr= [self dateTimeDifferenceWithStartTime:self.intimer endTime:currentTimeStr];
//    NSLog(@"页面消失时间:%@---- %@",currentTimeStr,chaStr);
}
-(NSString *)dateTimeDifferenceWithStartTime:(NSString *)startTime endTime:(NSString *)endTime{
NSDateFormatter *date = [[NSDateFormatter alloc]init];
[date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
NSDate *startD =[date dateFromString:startTime];
NSDate *endD = [date dateFromString:endTime];
NSTimeInterval start = [startD timeIntervalSince1970]*1;
NSTimeInterval end = [endD timeIntervalSince1970]*1;
NSTimeInterval value = end - start;
int second = (int)value %60;//秒
int minute = (int)value /60%60;
int house = (int)value % (24 * 3600)/3600;
int day = (int)value / (24 * 3600);
NSString *str;
if (day != 0) {
str = [NSString stringWithFormat:@"耗时%d天%d小时%d分%d秒",day,house,minute,second];
}else if (day==0 && house != 0) {
str = [NSString stringWithFormat:@"耗时%d小时%d分%d秒",house,minute,second];
}else if (day== 0 && house== 0 && minute!=0) {
str = [NSString stringWithFormat:@"耗时%d分%d秒",minute,second];
}else{
str = [NSString stringWithFormat:@"耗时%d秒",second];
}
return str;
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
