//
//  DongwangRightnowJoinViewController.m
//  DongWang
//
//  Created by codehzx on 2021/2/19.
//

#import "DongwangRightnowJoinViewController.h"
#import "DongwangDaletouStatusModel.h"
#import "DongwangDaletouViewModel.h"
#import "DongwangRightAnsureTableViewCell.h"
#import "DongwangJoinModel.h"
#import "DongwangRightHeader.h"
#import "DongwangCorectAlterView.h"
#import "DongwangDaletouFailerView.h"
@interface DongwangRightnowJoinViewController ()<UITableViewDataSource,UITableViewDelegate,DongwangCorectAlterViewDelegate,DongwangDaletouFailerViewDelegate>
@property(nonatomic,strong) UITableView * DongwangRightTableViewl;
@property(nonatomic,strong) UIScrollView * DongwangScrollView;
@property(nonatomic,strong) UIImageView * backImgView; //背景
@property(nonatomic,strong) UIImageView * DongwangTopImgView;
@property(nonatomic,strong) UIButton   * DongwangrullesBtn; //规则
@property(nonatomic,strong) UIButton * TpisTimeBtn; //每日时间答题

@property(nonatomic,strong) DongwangDaletouStatusModel * StatusModel; //大乐透状态model
@property(nonatomic,strong)  UIButton * endingBtn;

@property(nonatomic,strong)  UIImageView *   DongwangAnsureBackImgView;

@property(nonatomic,strong) NSMutableArray * dataArr;
@property(nonatomic,strong) DongwangJoinModel *  CurrentJoinModel; //立即参与

@property(nonatomic,strong) NSMutableDictionary *  questionParmters; //答案列表

@property(nonatomic,strong)DongwangRightHeader * Header;

@property(nonatomic,strong) DongwangCorectAlterView * CorectAlterView;

@property(nonatomic,strong) DongwangDaletouFailerView *  FailerView;
@end

@implementation DongwangRightnowJoinViewController
-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
-(NSMutableDictionary *)questionParmters{
    if (!_questionParmters) {
        _questionParmters = [NSMutableDictionary dictionary];
    }
    return _questionParmters;
}
-(DongwangCorectAlterView *)CorectAlterView{
    if (!_CorectAlterView) {
    _CorectAlterView = [[DongwangCorectAlterView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _CorectAlterView.delegate = self;
    }
    return _CorectAlterView;
}
-(DongwangRightHeader *)Header{
    if (!_Header) {
    _Header= [[DongwangRightHeader alloc]initWithFrame:CGRectMake(0, 0, 0, 1)];
    }
    return _Header;
}
-(DongwangDaletouFailerView *)FailerView{
    if (!_FailerView) {
        _FailerView = [[DongwangDaletouFailerView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _FailerView.delegate = self;
    }
    return _FailerView;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.gk_navBarAlpha = 0;
    [self.view addSubview:self.backImgView];
    [self.view  addSubview:self.DongwangScrollView];
    [_DongwangScrollView addSubview:self.DongwangTopImgView];
    [_DongwangTopImgView addSubview:self.TpisTimeBtn];
    [_DongwangScrollView addSubview:self.endingBtn];
    
    [_DongwangScrollView addSubview:self.DongwangAnsureBackImgView];
    [_DongwangAnsureBackImgView addSubview:self.DongwangRightTableViewl];
    
    [self addNotifiCations];
    
    [self DongwangConfigerData];
    
}
-(void)DongwangConfigerData{
    MJWeakSelf;
    [DongwangDaletouViewModel DongwangDaletouRequestJoinLottery:@{}.mutableCopy RequestCuurentControlers:self requestSucced:^(DongwangJoinModel * _Nonnull joinModel, NSMutableDictionary * _Nonnull responseListDic) {
//        NSLog(@"responseListDic=%@",responseListDic);
        weakSelf.questionParmters = responseListDic;
        weakSelf.CurrentJoinModel = joinModel;
        [weakSelf DongwangRealodData];
    } requestfairler:^{
        
    }];
}
-(void)DongwangRealodData{
    self.Header.title = _CurrentJoinModel.title;
    self.Header.height = self->_Header.HeaderHeight;
    self.DongwangRightTableViewl.tableHeaderView = self.Header;
    [self.DongwangRightTableViewl reloadData];
    //获取内容高度
    for (ResponseList * listobjc in self.CurrentJoinModel.responseList) {
        
    }
    
}
-(UITableView *)DongwangRightTableViewl{
    if (!_DongwangRightTableViewl) {
        _DongwangRightTableViewl =  [[UITableView alloc]initWithFrame:_DongwangAnsureBackImgView.bounds style:UITableViewStylePlain];
        _DongwangRightTableViewl.delegate =  self;
        _DongwangRightTableViewl.dataSource = self;
        _DongwangRightTableViewl.showsVerticalScrollIndicator = NO;
        _DongwangRightTableViewl.showsHorizontalScrollIndicator = NO;
        _DongwangRightTableViewl.separatorStyle = UITableViewCellSelectionStyleNone;
        _DongwangRightTableViewl.backgroundColor = [UIColor clearColor];

    }
    return _DongwangRightTableViewl;
}
-(UIImageView *)DongwangAnsureBackImgView{
    if (!_DongwangAnsureBackImgView) {
        _DongwangAnsureBackImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(8), CGRectGetMaxY(_endingBtn.frame)+RealWidth(10), SCREEN_WIDTH-RealWidth(16), RealWidth(316))];
        _DongwangAnsureBackImgView.image = [UIImage imageNamed:@"ansure_back"];
        _DongwangAnsureBackImgView.userInteractionEnabled = YES;
    }
    return _DongwangAnsureBackImgView;
}
-(void)addNotifiCations{
    //答题倒计时
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DongwangShuyunSendTimeLimite:) name:CountdowntoAnswers object:nil];
      //答题结束
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EndofanswerActiom) name:Endofanswer object:nil];
    
}
#pragma mark--答题倒计时中
-(void)DongwangShuyunSendTimeLimite:(NSNotification *)noti{
    NSString * timeLimite=  [noti.userInfo objectForKey:@"timeLimite"];
    NSString * firstStr = [timeLimite  substringToIndex:2];
    NSString * lastStr = [timeLimite  substringFromIndex:2];
    NSString * endTitle = [NSString stringWithFormat:@"距离本题结束还有00:%@:%@",firstStr,lastStr];
    [_endingBtn setTitle:endTitle forState:UIControlStateNormal];
}
#pragma mark--答题结束
-(void)EndofanswerActiom{
[_endingBtn setTitle:@"距离本题结束还有00:00:00" forState:UIControlStateNormal];
}
-(UIButton *)endingBtn{
    if (!_endingBtn) {
        _endingBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-RealWidth(118), CGRectGetMaxY(_DongwangTopImgView.frame)-RealWidth(20), RealWidth(236), RealWidth(43))];
        [_endingBtn setBackgroundImage:[UIImage imageNamed:@"endingback"] forState:UIControlStateNormal];
        _endingBtn.titleLabel.textAlignment =  NSTextAlignmentCenter;
        [_endingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_endingBtn setTitleEdgeInsets:UIEdgeInsetsMake(-10, 0, 0, 0)];
        _endingBtn.titleLabel.font = PFR15Font;
    }
    return _endingBtn;
}
-(UIButton *)TpisTimeBtn{
    if (!_TpisTimeBtn) {
        _TpisTimeBtn = [[UIButton alloc]initWithFrame:CGRectMake(RealWidth(55), RealWidth(164-1), SCREEN_WIDTH-RealWidth(110), RealWidth(57))];
        _TpisTimeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _TpisTimeBtn.titleLabel.font =  PFR11Font;
        [_TpisTimeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_TpisTimeBtn setBackgroundImage:[UIImage imageNamed:@"timeback"] forState:UIControlStateNormal];
        
    }
    return _TpisTimeBtn;
}

-(UIImageView *)DongwangTopImgView{
    if (!_DongwangTopImgView) {
        _DongwangTopImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RealWidth(198)+StatuBar_Height)];
        _DongwangTopImgView.userInteractionEnabled = YES;
//        _DongwangTopImgView.image = [UIImage imageNamed:@"letoutop"];
    }
    return _DongwangTopImgView;
}
-(UIScrollView *)DongwangScrollView{
    if (!_DongwangScrollView) {
        _DongwangScrollView =  [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-SafeAreaBottom_Height)];
        _DongwangScrollView.backgroundColor = [UIColor clearColor];
        _DongwangScrollView.contentSize =  CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _DongwangScrollView;
}
-(UIImageView *)backImgView{
    if (!_backImgView) {
        _backImgView  =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _backImgView.image = [UIImage imageNamed:@"letouback"];
        _backImgView.userInteractionEnabled = YES;
    }
    return _backImgView;
}
#pragma mark--大乐透当前状态
-(void)DongwangGetDaletouStatus{
    MJWeakSelf;
    [DongwangDaletouViewModel DongwangDaletouRequestdaletouStatus:@{}.mutableCopy RequestCuurentControlers:self requestSucced:^(id  _Nonnull object) {
        DongwangDaletouStatusModel * StatusModel =(DongwangDaletouStatusModel * ) object;
        weakSelf.StatusModel =  StatusModel;
        [weakSelf DongwangDalaetouStatusConfigerWithMode];
    } requestfairler:^{
        
    }];
}
-(void)DongwangDalaetouStatusConfigerWithMode{
    [self.DongwangTopImgView sd_setImageWithURL:[NSURL URLWithString:self.StatusModel.url] placeholderImage:[UIImage imageNamed:@""]];
    [_TpisTimeBtn setTitle:self.StatusModel.ruleDes forState:UIControlStateNormal];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self DongwangGetDaletouStatus];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.CurrentJoinModel.responseList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangRightIdentifer  = @"DongwangRightAnsureTableViewCell";
    
    DongwangRightAnsureTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangRightIdentifer];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwangRightAnsureTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangRightIdentifer];
    }
    ResponseList * listmodle = self.CurrentJoinModel.responseList[indexPath.row];
    DongwangCell.lsitModel = listmodle;
    return DongwangCell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ResponseList * listModel =  self.CurrentJoinModel.responseList[indexPath.row];
    return listModel.CellHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ResponseList * listModel = self.CurrentJoinModel.responseList[indexPath.row];
    //没有答过
    if ([self.CurrentJoinModel.status integerValue] == 0) {
       
        [self.questionParmters setValue:self.CurrentJoinModel.answers forKey:@"answers"];
        [self.questionParmters setValue:self.CurrentJoinModel.ansure_id forKey:@"id"];
        [self.questionParmters setValue:listModel.List_id forKey:@"select"];
        [self.questionParmters setValue:@"0" forKey:@"status"];
        [self.questionParmters setValue:self.CurrentJoinModel.title forKey:@"title"];
        
        MJWeakSelf;
        [DongwangDaletouViewModel DongwangDaletouRequestgetAnswerResult:self.questionParmters RequestCuurentControlers:self requestSucced:^(DongwangAnswerResultModel * _Nonnull resultModel) {
            if (listModel.is_Correct) {
                NSLog(@"答对了");
            
            [weakSelf.CorectAlterView Show];
            weakSelf.CorectAlterView.resultModel=  resultModel;
            }else{
                NSLog(@"答错了");
                [weakSelf.FailerView FailerShow];
            }
            for (ResponseList * objec in self.CurrentJoinModel.responseList) {
                objec.status =  @"1";
            }
            self.CurrentJoinModel.status = @"1";
            listModel.user_isCorect = YES;
            listModel.select = listModel.List_id;
            self.CurrentJoinModel.select =  listModel.List_id;
            [weakSelf.DongwangRightTableViewl reloadData];
        } requestfairler:^{

        }];

    }
}
#pragma mark--DongwangCorectAlterViewDelegate
-(void)DongwangCorectAlterViewDismiss{
    _CorectAlterView = nil;
    _CorectAlterView.delegate = nil;
}
#pragma mark--DongwangDaletouFailerViewDelegate
-(void)DongwangDaletouFailerViewhideAction{
    _FailerView = nil;
    _FailerView.delegate = nil;
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
