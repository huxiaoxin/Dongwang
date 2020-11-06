//
//  DongwangMyInfoViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/6.
//

#import "DongwangMyInfoViewController.h"
#import "DongwangMyInfoTableViewCell.h"
#import "DongwangMyInfoHeaderView.h"
#import "DongwangInfoMsgView.h"
#import "DongwanguserHeaderImgView.h"
@interface DongwangMyInfoViewController ()<UITableViewDelegate,UITableViewDataSource,DongwangMyInfoHeaderViewDelegate>
@property(nonatomic,strong) UITableView * DongwangMyInfoTableView;
@property(nonatomic,strong) NSMutableArray * DongwangInfoLeftDataArr;
@property(nonatomic,strong) NSMutableArray * DongwangInfoRightDataArr;
@property(nonatomic,strong) UIScrollView * DongwangBjScroolView;
@property(nonatomic,strong) DongwangMyInfoHeaderView * InfoHeader;
@property(nonatomic,strong) DongwangInfoMsgView * msgView;
@property(nonatomic,strong) DongwanguserHeaderImgView * ImgView;
@end

@implementation DongwangMyInfoViewController
-(NSMutableArray *)DongwangInfoLeftDataArr{
    if (!_DongwangInfoLeftDataArr) {
        _DongwangInfoLeftDataArr = [[NSMutableArray alloc]initWithArray:@[@"昵称",@"个性签名",@"性别",@"绑定手机号",@"微信绑定",@"收货地址",@"实名认证"]];
    }
    return _DongwangInfoLeftDataArr;
}
-(DongwanguserHeaderImgView *)ImgView{
    if (!_ImgView) {
        _ImgView = [[DongwanguserHeaderImgView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _ImgView;
}
-(NSMutableArray *)DongwangInfoRightDataArr{
    if (!_DongwangInfoRightDataArr) {
        _DongwangInfoRightDataArr = [[NSMutableArray alloc]initWithArray:@[@"156****7799",@"去填写",@"未知",@"156****7799",@"去绑定",@"去填写",@"去认证"]];
    }
    return _DongwangInfoRightDataArr;
}
-(DongwangMyInfoHeaderView *)InfoHeader{
    if (!_InfoHeader) {
        _InfoHeader = [[DongwangMyInfoHeaderView alloc]initWithFrame:CGRectMake(0, K(20), SCREEN_WIDTH, K(100))];
        _InfoHeader.delegate = self;
    }
    return _InfoHeader;
}
-(DongwangInfoMsgView *)msgView{
    if (!_msgView) {
        _msgView = [[DongwangInfoMsgView alloc]initWithFrame:CGRectMake(0, -K(33), SCREEN_WIDTH, K(33))];
    }
    return _msgView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"个人资料";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.DongwangBjScroolView];
    [_DongwangBjScroolView addSubview:self.msgView];
    [_DongwangBjScroolView addSubview:self.InfoHeader];
    [_DongwangBjScroolView addSubview:self.DongwangMyInfoTableView];
    
    MJWeakSelf;
    [UIView animateWithDuration:0.1 animations:^{
        CGRect frame = weakSelf.msgView.frame;
            frame.origin.y = -K(33);
        weakSelf.msgView.frame = frame;
        } completion:^(BOOL finished){
            if (finished) {
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDelay:0.5];
                [UIView setAnimationDuration:0.3];
                CGRect frame = weakSelf.msgView.frame;
                frame.origin.y = K(0);
                weakSelf.msgView.frame = frame;
                weakSelf.InfoHeader.y = CGRectGetMaxY(weakSelf.msgView.frame)+K(20);
                weakSelf.DongwangMyInfoTableView.y =  CGRectGetMaxY(weakSelf.InfoHeader.frame)+K(20);
                [UIView commitAnimations];
            }
        }];

}
-(UIScrollView *)DongwangBjScroolView{
    if (!_DongwangBjScroolView) {
        _DongwangBjScroolView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height)];
        _DongwangBjScroolView.showsVerticalScrollIndicator  = NO;
        _DongwangBjScroolView.showsHorizontalScrollIndicator = NO;
        _DongwangBjScroolView.backgroundColor = [UIColor clearColor];
        _DongwangBjScroolView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _DongwangBjScroolView;
}
-(UITableView *)DongwangMyInfoTableView{
    if (!_DongwangMyInfoTableView) {
        _DongwangMyInfoTableView   = [[UITableView alloc]initWithFrame:CGRectMake(K(21), CGRectGetMaxY(_InfoHeader.frame)+K(20), SCREEN_WIDTH-K(42), self.DongwangInfoLeftDataArr.count*K(45)) style:UITableViewStylePlain];
        _DongwangMyInfoTableView.scrollEnabled = NO;
        _DongwangMyInfoTableView.delegate = self;
        _DongwangMyInfoTableView.dataSource = self;
        _DongwangMyInfoTableView.layer.cornerRadius = K(8);
        _DongwangMyInfoTableView.layer.masksToBounds = YES;
        _DongwangMyInfoTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _DongwangMyInfoTableView.backgroundColor = [UIColor whiteColor];
        _DongwangMyInfoTableView.showsVerticalScrollIndicator = NO;
        _DongwangMyInfoTableView.showsHorizontalScrollIndicator = NO;
        [_DongwangMyInfoTableView viewShadowPathWithColor:LGDBLackColor shadowOpacity:0.09 shadowRadius:K(4) shadowPathType:LeShadowPathAround shadowPathWidth:K(3)];

    }
    return _DongwangMyInfoTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DongwangInfoLeftDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangIdentifer  = @"DongwangMyInfoTableViewCell";
    DongwangMyInfoTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangIdentifer];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwangMyInfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangIdentifer];
    }
    [DongwangCell DongwangMyInfoTableViewCellConfigerData:self.DongwangInfoLeftDataArr RightData:self.DongwangInfoRightDataArr indexPath:indexPath];
    return DongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(45);
}
#pragma mark--DongwangMyInfoHeaderViewDelegate
-(void)DongwangMyInfoHeaderViewChangeuserinfoImg{
//    DongwanguserHeaderImgView * ImgView = [[DongwanguserHeaderImgView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    [self.view addSubview:ImgView];
//    [[AppDelegate getAppDelegate].window addSubview:ImgView];
    
    [self.view addSubview:self.ImgView];
    
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
