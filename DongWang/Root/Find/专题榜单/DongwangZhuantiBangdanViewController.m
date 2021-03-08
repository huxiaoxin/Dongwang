//
//  DongwangZhuantiBangdanViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/25.
//

#import "DongwangZhuantiBangdanViewController.h"
#import "DongwangZhuantiBangTableViewCell.h"
#import "DongwangZhuantiBangdanHeader.h"
@interface DongwangZhuantiBangdanViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * DongwangZhuantiTableView;
@property(nonatomic,strong) NSMutableArray * DongwangDataArr;
@property(nonatomic,strong) DongwangZhuantiBangdanHeader * Header;
@end

@implementation DongwangZhuantiBangdanViewController

-(NSMutableArray *)DongwangDataArr{
    if (!_DongwangDataArr) {
        _DongwangDataArr  =[[NSMutableArray alloc]init];
    }
    return _DongwangDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#EDEDED"];
    self.gk_navigationBar.hidden = YES;
    [self.view addSubview:self.DongwangZhuantiTableView];
    self.Header.height  = self.Header.HeaderViewHeight;
    _DongwangZhuantiTableView.tableHeaderView = self.Header;
    // Do any additional setup after loading the view.
}
-(DongwangZhuantiBangdanHeader *)Header{
    if (!_Header) {
        _Header = [[DongwangZhuantiBangdanHeader alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(650))];
    }
    return _Header;
}
-(UITableView *)DongwangZhuantiTableView{
    if (!_DongwangZhuantiTableView) {
        _DongwangZhuantiTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-kTabBarHeight-K(40)) style:UITableViewStyleGrouped];
        _DongwangZhuantiTableView.delegate = self;
        _DongwangZhuantiTableView.dataSource = self;
        _DongwangZhuantiTableView.showsVerticalScrollIndicator = NO;
        _DongwangZhuantiTableView.showsHorizontalScrollIndicator = NO;
        _DongwangZhuantiTableView.backgroundColor = [UIColor clearColor];
        _DongwangZhuantiTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _DongwangZhuantiTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangZhuantiHeaderClicks)];
        _DongwangZhuantiTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(DongwangZhuantiFooterClicks)];
        
    }
    return _DongwangZhuantiTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangZhuantiIdentifer = @"DongwangZhuantiBangTableViewCell";
    DongwangZhuantiBangTableViewCell * DonwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangZhuantiIdentifer];
    if (DonwangCell == nil) {
        DonwangCell = [[DongwangZhuantiBangTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangZhuantiIdentifer];
    }
    return DonwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(90);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * DongwangSectionHeader = [UIView new];
    DongwangSectionHeader.backgroundColor = [UIColor clearColor];
    
    UIView * DonwanglbView = [[UIView alloc]initWithFrame:CGRectMake(K(15), 0, SCREEN_WIDTH-K(30), K(18.5+5))];
    DonwanglbView.backgroundColor =[UIColor whiteColor];
    [DongwangSectionHeader addSubview:DonwanglbView];
    UILabel * DongwangTitle = [[UILabel alloc]initWithFrame:CGRectMake(K(12.5), K(5), K(250), K(18.5))];
    DongwangTitle.textColor = LGDBLackColor;
    DongwangTitle.font = KBlFont(font(15));
    DongwangTitle.text = @"当前排名";
    [DonwanglbView addSubview:DongwangTitle];
    return DongwangSectionHeader;;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return K(18.5+5);
}
-(void)DongwangZhuantiHeaderClicks{
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.DongwangZhuantiTableView.mj_header endRefreshing];
    });
    
}
-(void)DongwangZhuantiFooterClicks{
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.DongwangZhuantiTableView.mj_footer endRefreshing];
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
