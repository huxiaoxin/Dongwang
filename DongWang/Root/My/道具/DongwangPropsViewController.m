//
//  DongwangPropsViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import "DongwangPropsViewController.h"
#import "DongwangProTableViewCell.h"
@interface DongwangPropsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * DongwangProTableView;
@property(nonatomic,strong) NSMutableArray * DongwangProDataArr;
@end

@implementation DongwangPropsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"我的道具";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#EDEDED"];
    [self.view addSubview:self.DongwangProTableView];
    
    UIView * DongwangHeader  =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(16.5))];
    DongwangHeader.backgroundColor = [UIColor colorWithHexString:@"#EDEDED"];
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
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangIdentifer = @"DongwangProTableViewCell";
    DongwangProTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangIdentifer];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwangProTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangIdentifer];
    }
    return DongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(110+13);
}
-(void)DongwangProHeaderClicks{
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.DongwangProTableView reloadData];
        [weakSelf.DongwangProTableView.mj_header endRefreshing];
    });
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
