//
//  DongwangMyPrizeViewSubController.m
//  DongWang
//
//  Created by codehzx on 2020/11/5.
//

#import "DongwangMyPrizeViewSubController.h"
#import "DongwangMyPrizeTableViewCell.h"
@interface DongwangMyPrizeViewSubController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * DongwangMyPrizeTableView;
@property(nonatomic,strong) NSMutableArray * DongwangMyPrizeDataArr;
@end

@implementation DongwangMyPrizeViewSubController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#EDEDED"];
    [self.view addSubview:self.DongwangMyPrizeTableView];
    
    
    UIView * TableHeader = [[UIView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH-0, K(19.5))];
    TableHeader.backgroundColor =  [UIColor colorWithHexString:@"#EDEDED"];
    _DongwangMyPrizeTableView.tableHeaderView = TableHeader;
}
-(UITableView *)DongwangMyPrizeTableView{
    if (!_DongwangMyPrizeTableView) {
        _DongwangMyPrizeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, K(0), SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-K(40)-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _DongwangMyPrizeTableView.delegate = self;
        _DongwangMyPrizeTableView.dataSource = self;
        _DongwangMyPrizeTableView.showsVerticalScrollIndicator = NO;
        _DongwangMyPrizeTableView.showsHorizontalScrollIndicator = NO;
        _DongwangMyPrizeTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _DongwangMyPrizeTableView.backgroundColor = [UIColor clearColor];
        _DongwangMyPrizeTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangMyPrizeHeaderClick)];
        [_DongwangMyPrizeTableView.mj_header beginRefreshing];
    }
    return _DongwangMyPrizeTableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangMyPrizeIdentifer = @"DongwangMyPrizeTableViewCell";
    DongwangMyPrizeTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangMyPrizeIdentifer];
    
    if (DongwangCell == nil) {
    DongwangCell = [[DongwangMyPrizeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangMyPrizeIdentifer];
    }
    return DongwangCell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(103+13.4);
}
-(void)DongwangMyPrizeHeaderClick{
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.DongwangMyPrizeTableView.mj_header endRefreshing];
        [weakSelf.DongwangMyPrizeTableView reloadData];
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
