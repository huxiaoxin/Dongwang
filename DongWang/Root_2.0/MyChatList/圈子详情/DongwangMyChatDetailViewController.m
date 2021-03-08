//
//  DongwangMyChatDetailViewController.m
//  DongWang
//
//  Created by sycm on 2021/3/5.
//

#import "DongwangMyChatDetailViewController.h"
#import "DongwangMychatDetailTableViewCell.h"
#import "DongwangMyChatSendToolView.h"
#import "DongwangMyChtaDetailHeaderView.h"
@interface DongwangMyChatDetailViewController ()<UITableViewDataSource,UITableViewDelegate,DongwangMyChatSendToolViewDelegate>
@property(nonatomic,strong) UITableView * DongwangMyChatTableView;
@property(nonatomic,strong) DongwangMyChtaDetailHeaderView * DetailHeader;
@property(nonatomic,strong) DongwangMyChatSendToolView * topView;
@end

@implementation DongwangMyChatDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.gk_navTitle = @"详情";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#48009A"];
    [self.view addSubview:self.DongwangMyChatTableView];
    _DetailHeader.height = self.DetailHeader.DetailHeaderHeight;
    _DongwangMyChatTableView.tableHeaderView = self.DetailHeader;
    [self.view addSubview:self.topView];
    _topView.height = self.topView.ToolViewHeight;

}
#pragma mark--DongwangMyChatSendToolViewDelegate
-(void)DongwangMyChatSendToolViewUpdateFrame{
    self.topView.height = _topView.ToolViewHeight;
    self.topView.y = SCREEN_HEIGHT-_topView.ToolViewHeight;
}
-(DongwangMyChtaDetailHeaderView *)DetailHeader{
    if (!_DetailHeader) {
        _DetailHeader = [[DongwangMyChtaDetailHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
    }
    return _DetailHeader;
}
-(DongwangMyChatSendToolView *)topView{
    if (!_topView) {
        _topView = [[DongwangMyChatSendToolView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-RealWidth(59), SCREEN_WIDTH, RealWidth(59))];
        _topView.delegate = self;
    }
    return _topView;
}
-(UITableView *)DongwangMyChatTableView{
    if (!_DongwangMyChatTableView) {
        _DongwangMyChatTableView = [[UITableView alloc]initWithFrame:CGRectMake(RealWidth(15), NaviH, SCREEN_WIDTH-RealWidth(30), SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height-RealWidth(60)) style:UITableViewStylePlain];
        _DongwangMyChatTableView.layer.cornerRadius = RealWidth(5);
        _DongwangMyChatTableView.layer.masksToBounds = YES;
        _DongwangMyChatTableView.backgroundColor = [UIColor colorWithHexString:@"#453593"];
        _DongwangMyChatTableView.delegate = self;
        _DongwangMyChatTableView.dataSource = self;
        _DongwangMyChatTableView.showsVerticalScrollIndicator = NO;
        _DongwangMyChatTableView.showsHorizontalScrollIndicator = NO;
        _DongwangMyChatTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _DongwangMyChatTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangMyChatHeaderClicks)];
        [_DongwangMyChatTableView.mj_header  beginRefreshing];
    }
    return _DongwangMyChatTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangMyChatIdentifer = @"DongwangMychatDetailTableViewCell";
    DongwangMychatDetailTableViewCell * ChatCell = [tableView dequeueReusableCellWithIdentifier:DongwangMyChatIdentifer];
    if (ChatCell == nil) {
        ChatCell = [[DongwangMychatDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangMyChatIdentifer];
    }
    return ChatCell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return RealWidth(80);
}
-(void)DongwangMyChatHeaderClicks{
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.DongwangMyChatTableView.mj_header endRefreshing];
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
