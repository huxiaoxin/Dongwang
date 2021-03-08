//
//  DongwangDaletouViewController.m
//  DongWang
//
//  Created by codehzx on 2021/1/15.
//

#import "DongwangDaletouViewController.h"
#import "DongwangwangqinBtn.h"
#import "DongwangunStarView.h"
#import "DongwangDaletouStarView.h"
#import "DongwangDaletouendingView.h"
#import "DongwangDaletouHistoryViewController.h"
#import "BulletView.h"
#import "BulletManager.h"
#import "BulletBackgroudView.h"
#import "DongwangDaletouWaitView.h"
#import "DongwangMyLetouView.h"
#import "DongwangTimeoutView.h"
#import "DongwangTimeoutView.h"
#import "DongwangDaletouViewModel.h"
#import "DongwangDaletouStatusModel.h"
#import "DongwangRightnowJoinViewController.h"
#import "DongwangDaletouHistoryDetailViewController.h"
@interface DongwangDaletouViewController ()<DongwangMyLetouViewDelefare,DongwangDaletouStarViewDelegate>
@property(nonatomic,strong) UIImageView * backImgView; //背景
@property(nonatomic,strong) UIImageView * DongwangTopImgView;
@property(nonatomic,strong) UIButton   * DongwangrullesBtn; //规则
@property(nonatomic,strong) UIButton * TpisTimeBtn; //每日时间答题
@property(nonatomic,strong) DongwangwangqinBtn * historyBtn;  //往期
@property(nonatomic,strong) DongwangwangqinBtn * myBtn;       //我的
@property(nonatomic,strong) DongwangunStarView * unStarView; //未开始
@property(nonatomic,strong) DongwangDaletouStarView * starView; //开始
@property(nonatomic,strong) DongwangDaletouendingView * endingView; //已结束
@property(nonatomic,strong) DongwangDaletouWaitView * waitingView; //等待开奖
@property(nonatomic,strong) DongwangMyLetouView * myletouView; //我的乐透码
@property(nonatomic,strong) NSTimer * myTimer;
@property (nonatomic, strong) BulletManager *bulletManager;
@property (nonatomic, strong) BulletBackgroudView *bulletBgView;
@property(nonatomic,strong) DongwangTimeoutView * timeoutView; //超时未答

@property(nonatomic,strong) DongwangDaletouStatusModel * StatusModel; //大乐透状态model
@end

@implementation DongwangDaletouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"大乐透";
    self.gk_navigationBar.hidden = YES;
    [self.view addSubview:self.backImgView];
    [_backImgView addSubview:self.DongwangTopImgView];
    [_DongwangTopImgView addSubview:self.DongwangrullesBtn];
    [_DongwangTopImgView addSubview:self.TpisTimeBtn];
    [_backImgView addSubview:self.historyBtn];
    [_backImgView addSubview:self.myBtn];
    //未开始
    [_backImgView addSubview:self.unStarView];
    //倒计时
    [_backImgView addSubview:self.starView];
      //已结束
    [_backImgView addSubview:self.endingView];
     //待开奖
     [_backImgView addSubview:self.waitingView];
     //弹幕背景
      [_backImgView addSubview:self.bulletBgView];
      //开启倒计时
      //[self DongwnagCheckacountTimm];
       //超时
     //[self.timeoutView ShowView];
   
      
   
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
    NSInteger status = [self.StatusModel.status integerValue];
    switch (status) {
        case 0:
            //未开始（返回下轮开启时间）
            self.unStarView.hidden = NO;
            self.unStarView.statusModel = self.StatusModel;
            self.starView.hidden = YES;
            self.waitingView.hidden = YES;
            self.endingView.hidden = YES;
            break;
        case 1:
            //倒计时中（返回本轮结束时间）
            self.unStarView.hidden = YES;
            self.starView.hidden = NO;
            self.waitingView.hidden = YES;
            self.endingView.hidden = YES;
            if (_myTimer) {
                [_myTimer invalidate];
                _myTimer = nil;
            }
//            if ([self DongwnagCheckacountTime]) {
            _myTimer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(DongwangTimerClicks) userInfo:nil repeats:YES];
//            }
            break;
        case 2:
            //等待开奖
            self.unStarView.hidden = YES;
            self.starView.hidden = YES;
            self.waitingView.hidden = NO;
            self.waitingView.statusModel = self.StatusModel;
            self.endingView.hidden = YES;
            break;
        case 3:
            //查看开奖
            self.unStarView.hidden = YES;
            self.starView.hidden = YES;
            self.waitingView.hidden = YES;
            self.endingView.hidden = NO;
            break;
        default:
            break;
    }
}
#pragma mark--弹幕data
-(void)DongwnagbulchatData{
    MJWeakSelf;
    [DongwangDaletouViewModel DongwangDaletouRequestbulletChat:@{}.mutableCopy RequestCuurentControlers:self requestSucced:^(id  _Nonnull object) {
        NSMutableArray * bulletDataArr= (NSMutableArray *) object;
        [weakSelf DongwangConfigerDanmu];
        weakSelf.bulletManager.allComments = bulletDataArr;
        [weakSelf.bulletManager start];
    } requestfairler:^{
        
    }];
}
-(DongwangTimeoutView *)timeoutView{
    if (!_timeoutView) {
        _timeoutView = [[DongwangTimeoutView alloc]init];
    }
    return _timeoutView;
}
#pragma mark--立即参与
-(void)DongwangDaletouStarViewAction{
    DongwangRightnowJoinViewController * DongwangjoinVc = [[DongwangRightnowJoinViewController alloc]init];
    DongwangjoinVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:DongwangjoinVc animated:YES];
}
#pragma mark--当前时间是否在活动时间范围
-(void)DongwnagCheckacountTime{
    //服务器时间
    NSDate * sercviceData = [NSDate dateWithTimeIntervalSince1970:[self.StatusModel.endTime longLongValue]/1000];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    // 时间格式,建议大写    HH 使用 24 小时制；hh 12小时制
    [dateFormat setDateFormat:@"YYYY:MM:dd HH:mm:ss"];
    //服务器时间字符串
//    NSString * sercviceStr =[dateFormat stringFromDate:sercviceData];
//    NSLog(@"服务器时间:%@",sercviceStr);
    NSDate * exprindate = sercviceData;
    //过期时间字符串
    NSString * exprinStr = [dateFormat stringFromDate:exprindate];
//    NSLog(@"过期时间：%@",exprinStr);
    
    NSDate *today = [NSDate date];
    //当前时间
    NSString * currentdateStr = [dateFormat  stringFromDate:today];
    //当前时间
//    NSLog(@"currentdateStr=%@",currentdateStr);
    //如果当前时间是在活动时间内 则开启倒计时
    if ([self validateWithStartTime:currentdateStr withExpireTime:exprinStr]) {
   // 开启定时器
    _myTimer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(DongwangTimerClicks) userInfo:nil repeats:YES];
        
//        return YES;
    }else{
//        return NO;
    }

}

-(DongwangMyLetouView *)myletouView{
    if (!_myletouView) {
        _myletouView = [[DongwangMyLetouView alloc]init];
        _myletouView.delegate = self;
    }
    return _myletouView;
}
#pragma mark--创建弹幕
-(void)DongwangConfigerDanmu{
    if (self.bulletManager) {
        self.bulletManager = nil;
    }
    self.bulletManager = [[BulletManager alloc] init];
    MJWeakSelf;
    self.bulletManager.generateBulletBlock = ^(BulletView *bulletView) {
    [weakSelf addBulletView:bulletView];
    };
}
#pragma mark--DongwangMyLetouViewDelefare
-(void)DongwangMyLetouViewremoView{
    [_myletouView removeFromSuperview];
    _myletouView = nil;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.bulletManager stop];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //弹幕
    [self DongwnagbulchatData];
    //大乐透状态
    [self DongwangGetDaletouStatus];
}
- (BulletBackgroudView *)bulletBgView {
    if (!_bulletBgView) {
        _bulletBgView = [[BulletBackgroudView alloc] init];
        _bulletBgView.frame = CGRectMake(0, CGRectGetMaxY(_starView.frame)+RealWidth(20), SCREEN_WIDTH, RealWidth(250));
        _bulletBgView.backgroundColor = [UIColor clearColor];
    }
    return _bulletBgView;
}
- (void)addBulletView:(BulletView *)bulletView {
    bulletView.frame = CGRectMake(SCREEN_WIDTH+RealWidth(50), RealWidth(20) + RealWidth(50) * bulletView.trajectory, CGRectGetWidth(bulletView.bounds), CGRectGetHeight(bulletView.bounds));
    [self.bulletBgView addSubview:bulletView];
    [bulletView startAnimation];

}

#pragma mark--定时器
-(void)DongwangTimerClicks{
  //计算差值
    //exprindate - 1 = 剩余时间
    //剩余时间 = 截止时间 - 倒计时
    NSDate * sercviceData = [NSDate dateWithTimeIntervalSince1970:[self.StatusModel.endTime longLongValue]/1000];
    //NSDate * sercviceData = [NSDate dateWithTimeIntervalSince1970:1613709652000/1000];

    
    //过期时间（往前推15分钟）
    //NSDate * exprindate = [sercviceData dateByAddingTimeInterval:+15*60];
    NSDate * exprindate = sercviceData;
    NSDate *today = [NSDate date];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    // 时间格式,建议大写    HH 使用 24 小时制；hh 12小时制
    [dateFormat setDateFormat:@"YYYY:MM:dd HH:mm:ss"];
//当前时间：2021:02:02 17:12:45 过期时间:2021:02:02 17:25:43
    //当前时间
    NSString * currentdateStr = [dateFormat  stringFromDate:today];
    //过期时间
    NSString * exprindateStr = [dateFormat stringFromDate:exprindate];
    
//    NSLog(@"当前时间：%@ 过期时间:%@",currentdateStr,exprindateStr);
    //当前时间
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.locale =  [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    // 需要对比的时间数据
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth
    | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 对比时间差
    NSDateComponents *dateCom = [calendar components:unit fromDate:today toDate:exprindate options:0];
    _starView.timeStr = [NSString stringWithFormat:@"%02ld%02ld",dateCom.minute,dateCom.second];
    NSString * timeLimite = [NSString stringWithFormat:@"%02ld%02ld",dateCom.minute,dateCom.second];
    [[NSNotificationCenter defaultCenter] postNotificationName:CountdowntoAnswers object:self userInfo:@{@"timeLimite":timeLimite}];
//  /  NSLog(@"======%@",[NSString stringWithFormat:@"%02ld%02ld",dateCom.minute,dateCom.second]);
    if (dateCom.minute == 0 && dateCom.second == 0) {
  [[NSNotificationCenter defaultCenter] postNotificationName:Endofanswer object:nil userInfo:nil];
    [_myTimer invalidate];
    [CHShowMessageHud showMessageText:@"本轮答题已结束"];
    [self DongwangGetDaletouStatus];
    }
}

/**
 *  判断当前时间是否处于某个时间段内
 *
 *  @param startTime        开始时间
 *  @param expireTime       结束时间
 */
- (BOOL)validateWithStartTime:(NSString *)startTime withExpireTime:(NSString *)expireTime {
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    // 时间格式,此处遇到过坑,建议时间HH大写,手机24小时进制和12小时禁止都可以完美格式化
    [dateFormat setDateFormat:@"YYYY:MM:dd HH:mm:ss"];
    NSDate *start = [dateFormat dateFromString:startTime];
    NSDate *expire = [dateFormat dateFromString:expireTime];
    NSString * currentdateStr = [dateFormat  stringFromDate:today];
    NSString * startStr       = [dateFormat stringFromDate:start];
    NSString * expireStr      = [dateFormat stringFromDate:expire];
//    NSLog(@"当前时间:%@\n服务器时间:%@\n过期时间:%@",currentdateStr,startStr,expireStr);
    if ([today compare:start] == NSOrderedDescending && [today compare:expire] == NSOrderedAscending) {
        return YES;
    }
    return NO;
}
-(DongwangunStarView *)unStarView{
    if (!_unStarView) {
  _unStarView = [[DongwangunStarView alloc]initWithFrame:CGRectMake(RealWidth(40), CGRectGetMaxY(_DongwangTopImgView.frame)+RealWidth(19), RealWidth(282), RealWidth(201))];
  _unStarView.hidden = YES;
    }
    return _unStarView;
}
-(DongwangDaletouStarView *)starView{
    if (!_starView) {
        _starView = [[DongwangDaletouStarView alloc]initWithFrame:CGRectMake(RealWidth(40), CGRectGetMaxY(_DongwangTopImgView.frame)+RealWidth(19), RealWidth(289), RealWidth(201))];
        _starView.hidden = YES;
        _starView.delegate = self;
    }
    return _starView;
}
-(DongwangDaletouendingView *)endingView{
    if (!_endingView) {
        MJWeakSelf;
        _endingView = [[DongwangDaletouendingView alloc]initWithFrame:CGRectMake(RealWidth(40), CGRectGetMaxY(_DongwangTopImgView.frame)+RealWidth(19), RealWidth(282), RealWidth(201)) withImgtap:^{
            NSLog(@"查看开奖ID:%@",weakSelf.StatusModel.scheduleId);
            DongwangDaletouHistoryModel * moel = [[DongwangDaletouHistoryModel alloc]init];
            moel.daletou_id = weakSelf.StatusModel.scheduleId;
            DongwangDaletouHistoryDetailViewController * detailVc = [[DongwangDaletouHistoryDetailViewController alloc]init];
            detailVc.detailModel = moel;
            detailVc.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detailVc animated:YES];
        }];
        _endingView.hidden = YES;
    }
    return _endingView;
}
-(DongwangDaletouWaitView *)waitingView{
    if (!_waitingView) {
        _waitingView = [[DongwangDaletouWaitView alloc]initWithFrame:CGRectMake(RealWidth(40), CGRectGetMaxY(_DongwangTopImgView.frame)+RealWidth(19), RealWidth(282), RealWidth(201))];
        _waitingView.hidden = YES;
    }
    return _waitingView;
}
-(DongwangwangqinBtn *)myBtn{
    if (!_myBtn) {
        _myBtn = [[DongwangwangqinBtn alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-RealWidth(50), CGRectGetMaxY(_historyBtn.frame)+RealWidth(20), RealWidth(40), RealWidth(50))];
        _myBtn.topImgView.image = [UIImage imageNamed:@"mycode"];
        _myBtn.btomlb.text = @"我的";
        [_myBtn addTarget:self action:@selector(DongwangmyBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _myBtn;
}
-(DongwangwangqinBtn *)historyBtn{
    if (!_historyBtn) {
        _historyBtn = [[DongwangwangqinBtn alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-RealWidth(50), CGRectGetMaxY(_DongwangTopImgView.frame)+RealWidth(21), RealWidth(40), RealWidth(50))];
        _historyBtn.topImgView.image = [UIImage imageNamed:@"wanqi"];
        _historyBtn.btomlb.text = @"往期";
        [_historyBtn addTarget:self action:@selector(historyBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _historyBtn;
}
-(UIImageView *)backImgView{
    if (!_backImgView) {
        _backImgView  =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-kTabBarHeight)];
        _backImgView.image = [UIImage imageNamed:@"letouback"];
        _backImgView.userInteractionEnabled = YES;
    }
    return _backImgView;
}
-(UIButton *)DongwangrullesBtn{
    if (!_DongwangrullesBtn) {
        _DongwangrullesBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(_DongwangTopImgView.frame)-RealWidth(58), StatuBar_Height+RealWidth(11.5), RealWidth(58), RealWidth(28))];
        [_DongwangrullesBtn setBackgroundImage:[UIImage imageNamed:@"letourulle"] forState:UIControlStateNormal];
        _DongwangrullesBtn.adjustsImageWhenHighlighted = NO;
        [_DongwangrullesBtn addTarget:self action:@selector(DongwangRullesBtnClicks) forControlEvents:UIControlEventTouchUpInside];
    }
    return _DongwangrullesBtn;
}
-(UIButton *)TpisTimeBtn{
    if (!_TpisTimeBtn) {
        _TpisTimeBtn = [[UIButton alloc]initWithFrame:CGRectMake(RealWidth(20), RealWidth(164), SCREEN_WIDTH-RealWidth(40), RealWidth(57+10))];
        _TpisTimeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _TpisTimeBtn.titleLabel.font =  PFR11Font;
        [_TpisTimeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _TpisTimeBtn.adjustsImageWhenHighlighted  = NO;
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
#pragma mark--规则
-(void)DongwangRullesBtnClicks{
    DongwangPrivetaWebViewController * webVc=  [[DongwangPrivetaWebViewController alloc]init];
    webVc.hidesBottomBarWhenPushed = YES;
    webVc.protoclUrlText = [NSString stringWithFormat:@"%@%@",Protocl_Url,daletou];
    [self.navigationController pushViewController:webVc animated:YES];
    
}
#pragma mark--往期
-(void)historyBtnClick{
    DongwangDaletouHistoryViewController * wangqiVc = [[DongwangDaletouHistoryViewController alloc]init];
    wangqiVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:wangqiVc animated:YES];
//    UIPasteboard * past = [UIPasteboard generalPasteboard];
//    past.string = @"1";
//    past.strings = @[@"123123",@""];
}
#pragma mark--我的
-(void)DongwangmyBtnClick{
    MJWeakSelf;
    [DongwangDaletouViewModel DongwangDaletouRequestMyLottery:@{}.mutableCopy RequestCuurentControlers:self requestSucced:^(NSArray * _Nonnull dataArr, NSString * _Nonnull openingTime) {
        [self.myletouView ShowView];
        [weakSelf.myletouView DongwangConfigerLetouWith:dataArr openTime:openingTime];
    } requestfairler:^{

    }];
    

//    [self DongwangDaletouStarViewAction];
    
}
-(void)dealloc{
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

