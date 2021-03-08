//
//  DongwangFindViewController_V2.m
//  DongWang
//
//  Created by codehzx on 2021/1/15.
//

#import "DongwangFindViewController_V2.h"
#import "DongwangFindTableViewCell_V2.h"
#import "DongwangFindHeaderView_V2.h"
#import "DongwangPrivetaWebViewController.h"
#import "DongwangFindDetailViewController.h"
@interface DongwangFindViewController_V2 ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * DongwangFindTableView;
@property(nonatomic,strong) DongwangFindHeaderView_V2 * FindHeader;
@end

@implementation DongwangFindViewController_V2

-(DongwangFindHeaderView_V2 *)FindHeader{
    if (!_FindHeader) {
        _FindHeader = [[DongwangFindHeaderView_V2 alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RealWidth(900))];
    }
    return _FindHeader;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"发现";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#4A009C"];
    [self.view addSubview:self.DongwangFindTableView];
    _DongwangFindTableView.tableHeaderView = self.FindHeader;
    
    //
    
    UIImageView * DongwangSecondImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(252))];
    DongwangSecondImgView.image = [UIImage imageNamed:@"faxintop"];
    DongwangSecondImgView.tag = 0;
    DongwangSecondImgView.userInteractionEnabled = YES;
    [_FindHeader addSubview:DongwangSecondImgView];
    UITapGestureRecognizer  * DongwanSecondTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwanGSeocndTapCLic:)];
    [DongwangSecondImgView addGestureRecognizer:DongwanSecondTap];
    
    
    UIImageView * DongwangSecond1ImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangSecondImgView.frame), SCREEN_WIDTH, K(209))];
    DongwangSecond1ImgView.image = [UIImage imageNamed:@"faxian02"];
    DongwangSecond1ImgView.tag = 1;
    DongwangSecond1ImgView.userInteractionEnabled = YES;
    [_FindHeader addSubview:DongwangSecond1ImgView];
    
    UITapGestureRecognizer  * DongwanSecondTa1p = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwanGSeocndTapCLic:)];
    [DongwangSecond1ImgView addGestureRecognizer:DongwanSecondTa1p];
    
    UIImageView * DongwangSecond2ImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(DongwangSecond1ImgView.frame), SCREEN_WIDTH, K(185))];
    DongwangSecond2ImgView.image = [UIImage imageNamed:@"faxian03"];
    DongwangSecond2ImgView.tag = 2;
    DongwangSecond2ImgView.userInteractionEnabled = YES;
    [_FindHeader addSubview:DongwangSecond2ImgView];
    
    UITapGestureRecognizer  * DongwanSecondTa12p = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DongwanGSeocndTapCLic:)];
    [DongwangSecond2ImgView addGestureRecognizer:DongwanSecondTa12p];
    // Do any additional setup after loading the view.
}
//http://192.168.3.157/dongwang_h5/answer_default?groupId=4
-(void)DongwanGSeocndTapCLic:(UITapGestureRecognizer *)imgTap{
    UIImageView * imgs =(UIImageView *) [imgTap view];
    NSLog(@"=====%ld",imgs.tag);
    if (imgs.tag == 0) {
        DongwangPrivetaWebViewController * dongwVc = [[DongwangPrivetaWebViewController alloc]init];
        dongwVc.protoclUrlText = @"http://47.101.168.243:91/preview/dongwang_h5/answer_default/index.html?groupId=4";
        //
        dongwVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:dongwVc animated:YES];
    }else if (imgs.tag == 1){
        DongwangFindDetailViewController * DongwanVc = [[DongwangFindDetailViewController alloc]init];
        DongwanVc.hidesBottomBarWhenPushed = YES;
        DongwanVc.indexs =  1;
        [self.navigationController pushViewController:DongwanVc animated:YES];
    }else if (imgs.tag == 2){
        DongwangFindDetailViewController * DongwanVc = [[DongwangFindDetailViewController alloc]init];
        DongwanVc.hidesBottomBarWhenPushed = YES;
        DongwanVc.indexs =  2;
        [self.navigationController pushViewController:DongwanVc animated:YES];
    }
   
    
}
-(UITableView *)DongwangFindTableView{
    if (!_DongwangFindTableView) {
        _DongwangFindTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-kTabBarHeight) style:UITableViewStylePlain];
//        _DongwangFindTableView.delegate = self;
//        _DongwangFindTableView.dataSource = self;
        _DongwangFindTableView.showsVerticalScrollIndicator = NO;
        _DongwangFindTableView.showsHorizontalScrollIndicator = NO;
        _DongwangFindTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _DongwangFindTableView.backgroundColor = [UIColor clearColor];
    }
    return _DongwangFindTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return RealWidth(10);
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView * DonwgangFooter  = [UIView new];
    DonwgangFooter.backgroundColor = [UIColor clearColor];
    
    UIView * Lines = [[UIView alloc]initWithFrame:CGRectMake(RealWidth(8), 0, SCREEN_WIDTH-RealWidth(16), RealWidth(9))];
    
    
    [DonwgangFooter addSubview:Lines];
    return DonwgangFooter;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangFindIdentifer = @"DongwangFindTableViewCell_V2";
    DongwangFindTableViewCell_V2 * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangFindIdentifer];
    if (DongwangCell == nil) {
        DongwangCell =[[DongwangFindTableViewCell_V2 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangFindIdentifer];
    }
    return DongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return RealWidth(174);
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
