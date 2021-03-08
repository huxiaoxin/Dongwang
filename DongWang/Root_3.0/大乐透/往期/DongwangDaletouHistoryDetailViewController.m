//
//  DongwangDaletouHistoryDetailViewController.m
//  DongWang
//
//  Created by sycm on 2021/2/23.
//

#import "DongwangDaletouHistoryDetailViewController.h"
#import "DongwangDaletouViewModel.h"
#import "DongwnagDaletouDetailHeaderView.h"
#import "DongwangDaletouDetailFooterView.h"
#import "DongwangMyHistoryModel.h"
#import "DongwangDaletouLingScuedView.h"
@interface DongwangDaletouHistoryDetailViewController ()<DongwangDaletouLingScuedViewDelegate,DongwangDaletouDetailFooterViewDelegate>
@property(nonatomic,strong) DongwnagDaletouDetailHeaderView * DetailHeaderView;
@property(nonatomic,strong) DongwangDaletouDetailFooterView * DetailFooterView;
@property(nonatomic,strong) UITableView * DongwangDetailTableView;
@property(nonatomic,strong) DongwangDaletouLingScuedView * SucceView;
@property(nonatomic,strong) NSString * exprineStr;
@property(nonatomic,strong) DongwangMyHistoryModel * CurrendModel;
@end

@implementation DongwangDaletouHistoryDetailViewController

-(DongwnagDaletouDetailHeaderView *)DetailHeaderView{
    if (!_DetailHeaderView) {
        _DetailHeaderView = [[DongwnagDaletouDetailHeaderView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, RealWidth(0))];
    }
    return _DetailHeaderView;
}
-(DongwangDaletouLingScuedView *)SucceView{
    if (!_SucceView) {
        _SucceView = [[DongwangDaletouLingScuedView alloc]initWithFrame:[UIScreen mainScreen].bounds WithExprieStr:self.exprineStr];
        _SucceView.delegate = self;
    }
    return _SucceView;
}
-(DongwangDaletouDetailFooterView *)DetailFooterView{
    if (!_DetailFooterView) {
    _DetailFooterView = [[DongwangDaletouDetailFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, RealWidth(286+10))];
        _DetailFooterView.delegate = self;
        
    }
    return _DetailFooterView;
}
-(UITableView *)DongwangDetailTableView{
    if (!_DongwangDetailTableView) {
        _DongwangDetailTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH,SCREEN_HEIGHT-NaviH) style:UITableViewStylePlain];
        _DongwangDetailTableView.showsVerticalScrollIndicator = NO;
        _DongwangDetailTableView.showsHorizontalScrollIndicator = NO;
        _DongwangDetailTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _DongwangDetailTableView.backgroundColor =[UIColor clearColor];
    }
    return _DongwangDetailTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //deetial_latou
    self.isShowBtomImgView = NO;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#804AB7"];
    self.gk_navTitle = @"开奖结果";    
    [self.view addSubview:self.DongwangDetailTableView];
    [self DongwangRequesData];
}
-(void)DongwangRequesData{
    MJWeakSelf;
    [DongwangDaletouViewModel DongwangDaletouRequestgetpastActivitydetail:@{@"id":self.detailModel.daletou_id}.mutableCopy RequestCuurentControlers:self requestSucced:^(id  _Nonnull resultobject, NSMutableArray * _Nonnull lotteryResponsesArr) {
        self.exprineStr = [NSString stringWithFormat:@"%@",[[resultobject objectForKey:@"data"] objectForKey:@"expire"]];
        NSMutableArray * prizeResponsesArr = [[[resultobject objectForKey:@"data"] objectForKey:@"prizeResponses"] mutableCopy];
        weakSelf.DetailHeaderView.responeDic = resultobject;
        weakSelf.DetailHeaderView.PrizeResponsesArr = prizeResponsesArr;
        weakSelf.DetailHeaderView.height = self->_DetailHeaderView.HeaderHeight;
        weakSelf.DongwangDetailTableView.tableHeaderView = weakSelf.DetailHeaderView;
        NSMutableArray * footerArr = lotteryResponsesArr;
        weakSelf.DetailFooterView.dataArr = footerArr;
        weakSelf.DetailFooterView.responeDic = resultobject;
        weakSelf.DetailFooterView.height = self->_DetailFooterView.FooterHeight;
        weakSelf.DongwangDetailTableView.tableFooterView = self.DetailFooterView;
    } requestfairler:^{
        
    }];

}
#pragma mark--DongwangDaletouLingScuedViewDelegate
-(void)DongwangDaletouLingClouseView{
    [_SucceView  removeFromSuperview];
    _SucceView.delegate = nil;
}
-(void)DongwangDaletouLingScuedViewLingequ{
    [_SucceView  removeFromSuperview];
    _SucceView.delegate = nil;
    MJWeakSelf;
    [DongwangDaletouViewModel DongwangDaletouRequestreceiveAwards:@{@"id":[NSString stringWithFormat:@"%ld",(long)self.CurrendModel.id]}.mutableCopy RequestCuurentControlers:self requestSucced:^(id  _Nonnull resultobject) {
        [weakSelf DongwangRequesData];
    } requestfairler:^{
        
    }];
}
#pragma mark--DongwangDaletouDetailFooterViewDelegate
-(void)DongwangDaletouDetailFooterViewCellDidlseltWith:(DongwangMyHistoryModel *)mdoels{
    
    self.CurrendModel = mdoels;
    [self.SucceView Show];
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
