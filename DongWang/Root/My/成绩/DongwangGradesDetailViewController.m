//
//  DongwangGradesDetailViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/18.
//

#import "DongwangGradesDetailViewController.h"
#import "DongwangGardesDetailTableViewCell.h"
#import "DongwangMyViewModel.h"
@interface DongwangGradesDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * DongwangTizuTableView;
@property(nonatomic,strong) NSMutableArray * DongwangDataArr;
@property(nonatomic,assign) NSInteger page;
@end

@implementation DongwangGradesDetailViewController

-(NSMutableArray *)DongwangDataArr{
    if (!_DongwangDataArr) {
        _DongwangDataArr = [[NSMutableArray alloc]init];
    }
    return _DongwangDataArr;
}
-(UITableView *)DongwangTizuTableView{
    if (!_DongwangTizuTableView) {
        _DongwangTizuTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _DongwangTizuTableView.delegate = self;
        _DongwangTizuTableView.dataSource = self;
        _DongwangTizuTableView.showsVerticalScrollIndicator = NO;
        _DongwangTizuTableView.showsHorizontalScrollIndicator = NO;
        _DongwangTizuTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _DongwangTizuTableView.backgroundColor = [UIColor clearColor];
        _DongwangTizuTableView.mj_header  = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(DongwangTizuHeaderClicks)];
        [_DongwangTizuTableView.mj_header beginRefreshing];
//        _DongwangTizuTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(DongwangTizuFooterClicks)];
//        _DongwangTizuTableView.mj_footer.hidden = YES;
        
        MJWeakSelf;
        _DongwangTizuTableView.mj_footer = [MJRefreshManager defaultFooter:^{
        [weakSelf DongwangTizuFooterClicks];
        }];


    }
    return _DongwangTizuTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    _DongwangTizuTableView.mj_footer.hidden= !self.DongwangDataArr.count;
    return self.DongwangDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwagGareddentifer = @"DongwangGardesDetailTableViewCell";
    DongwangGardesDetailTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwagGareddentifer];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwangGardesDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwagGareddentifer];
    }
    DongwangCell.detailModel= self.DongwangDataArr[indexPath.row];
    return DongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DongwangGradesDetailModel * detailModel = self.DongwangDataArr[indexPath.row];
    return detailModel.Cellheight;
}
-(void)DongwangTizuHeaderClicks{
    self.page = 1;
    [self DongwangDataRequets];
}
-(void)DongwangTizuFooterClicks{
    self.page+=1;
    [self DongwangDataRequets];
}
-(void)DongwangDataRequets{
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithMychenjiDetail:@{@"page":[NSString stringWithFormat:@"%ld",(long)self.page],@"groupId":[NSString stringWithFormat:@"%@",self.gardesModel.groupId],@"id":[NSString stringWithFormat:@"%@",self.gardesModel.id]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        NSMutableArray * dataArr  = (NSMutableArray *)object;
        if (weakSelf.page == 1) {
            if (weakSelf.DongwangDataArr.count >0) {
                [weakSelf.DongwangDataArr removeAllObjects];
            }
            weakSelf.DongwangDataArr = dataArr;
            [weakSelf.DongwangTizuTableView reloadData];
            [weakSelf.DongwangTizuTableView.mj_header endRefreshing];
            [weakSelf.DongwangTizuTableView.mj_footer resetNoMoreData];

        }else{
            if (dataArr.count == 0) {
                [weakSelf.DongwangTizuTableView reloadData];
                [weakSelf.DongwangTizuTableView.mj_footer endRefreshingWithNoMoreData];
                return;
            }
            [weakSelf.DongwangDataArr addObjectsFromArray:[dataArr copy]];
            [weakSelf.DongwangTizuTableView reloadData];
            [weakSelf.DongwangTizuTableView .mj_footer endRefreshing];
        }
    } Deleaccountfairler:^(id  _Nonnull message) {
        [weakSelf.DongwangTizuTableView .mj_footer endRefreshing];
        [weakSelf.DongwangTizuTableView.mj_header endRefreshing];
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#804AB7"];
    self.gk_navTitle = self.gardesModel.name;
    self.isShowBtomImgView = NO;
    [self.view addSubview:self.DongwangTizuTableView];
    // Do any additional setup after loading the view.
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
