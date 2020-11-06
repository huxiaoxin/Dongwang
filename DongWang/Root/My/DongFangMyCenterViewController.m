//
//  DongFangMyCenterViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/27.
//

#import "DongFangMyCenterViewController.h"
#import "DongwangMyCenterTableViewCell.h"
#import "DongwangMyHeaderView.h"
#import "DongwangMyPrizeViewController.h"
#import "DongwangPropsViewController.h"
#import "DongwangGradesViewController.h"
#import "DongwangMyInfoViewController.h"
#import "DongwangSettingViewController.h"
@interface DongFangMyCenterViewController ()<UITableViewDelegate,UITableViewDataSource,DongwangMyHeaderViewDelegate>
@property(nonatomic,strong) UIImageView  *  DongwangBackImgView;
@property(nonatomic,strong) UITableView *  DongwangTableView;
@property(nonatomic,strong) NSMutableArray  *  DongwangDataArr;
@property(nonatomic,strong) DongwangMyHeaderView * Header;
@end

@implementation DongFangMyCenterViewController
-(NSMutableArray *)DongwangDataArr{
    if (!_DongwangDataArr) {
        _DongwangDataArr = [[NSMutableArray alloc]initWithArray:@[@"我的奖品",@"我的道具",@"我的成绩",@"我的任务"]];
    }
    return _DongwangDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navigationBar.hidden = YES;
    [self.view addSubview:self.DongwangBackImgView];
    [self.view addSubview:self.DongwangTableView];
    _DongwangTableView.tableHeaderView = self.Header;
}
-(DongwangMyHeaderView *)Header{
    if (!_Header) {
        _Header = [[DongwangMyHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(188.5))];
        _Header.delegate = self;
    }
    return _Header;
}
-(UITableView *)DongwangTableView{
    if (!_DongwangTableView) {
        _DongwangTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, K(93), SCREEN_WIDTH, SCREEN_HEIGHT-K(93)) style:UITableViewStylePlain];
        _DongwangTableView.delegate = self;
        _DongwangTableView.dataSource = self;
        _DongwangTableView.showsVerticalScrollIndicator = NO;
        _DongwangTableView.showsHorizontalScrollIndicator = NO;
        _DongwangTableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
        _DongwangTableView.backgroundColor = [UIColor clearColor];
    }
    return _DongwangTableView;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DongwangDataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(49);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath  *)indexPath{
    static NSString * DongwangIdentifer = @"DongwangMyCenterTableViewCell";
    DongwangMyCenterTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangIdentifer];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwangMyCenterTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangIdentifer];
    }
    DongwangCell.NameText = self.DongwangDataArr[indexPath.row];
    return DongwangCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        DongwangMyPrizeViewController * DongwangVc = [[DongwangMyPrizeViewController alloc]init];
        DongwangVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:DongwangVc animated:YES];
    }else if (indexPath.row == 1){
        DongwangPropsViewController * DongwangVc = [[DongwangPropsViewController alloc]init];
        DongwangVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:DongwangVc animated:YES];
        
    }else if (indexPath.row == 2){
        DongwangGradesViewController * DongwangVc = [[DongwangGradesViewController alloc]init];
        DongwangVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:DongwangVc animated:YES];
    }else if (indexPath.row == 3){
        self.tabBarController.selectedIndex = 1;
    }
}
-(UIImageView *)DongwangBackImgView{
    if (!_DongwangBackImgView) {
        _DongwangBackImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT-kTabBarHeight)];
        _DongwangBackImgView.userInteractionEnabled = YES;
        _DongwangBackImgView.image = [UIImage imageNamed:kIs_iPhoneX ? @"底面" : @"底面"];
        
        UIButton * msgBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-K(11.5+19.5), StatuBar_Height+K(10), K(19.5), K(19.5))];
        [msgBtn setBackgroundImage:[UIImage imageNamed:@"消息"] forState:UIControlStateNormal];
        [msgBtn addTarget:self action:@selector(msgBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_DongwangBackImgView  addSubview:msgBtn];
        
        UIButton * SettingBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(msgBtn.frame)-K(35), StatuBar_Height+K(10), K(22), K(22))];
        [SettingBtn addTarget:self action:@selector(SettingBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [SettingBtn setBackgroundImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
        [SettingBtn addTarget:self action:@selector(msgBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_DongwangBackImgView  addSubview:SettingBtn];

        
    }
    return _DongwangBackImgView;
}
#pragma mark--消息
-(void)msgBtnClick{
    
}
#pragma mark--SettingBtnClick
-(void)SettingBtnClick{
    DongwangSettingViewController * SetingVc = [[DongwangSettingViewController alloc]init];
    SetingVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:SetingVc animated:YES];
}
#pragma mark--DongwangMyHeaderViewDelegate
-(void)DongwangMyHeaderViewPushInfoVc{
    DongwangMyInfoViewController * DongwangInfoVc = [[DongwangMyInfoViewController alloc]init];
    DongwangInfoVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:DongwangInfoVc animated:YES];
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
