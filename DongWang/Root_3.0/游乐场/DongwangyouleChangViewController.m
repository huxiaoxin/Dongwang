//
//  DongwangyouleChangViewController.m
//  DongWang
//
//  Created by codehzx on 2021/1/17.
//

#import "DongwangyouleChangViewController.h"
#import "DongwangFindDetailViewController.h"
@interface DongwangyouleChangViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView * DongwangTableViews;
@property(nonatomic,strong) NSMutableArray * imgDataArr;
@end

@implementation DongwangyouleChangViewController

-(NSMutableArray *)imgDataArr{
    if (!_imgDataArr) {
        _imgDataArr = [[NSMutableArray alloc]initWithArray:@[@"youle0",@"youle1",@"youle2"]];
    }
    return _imgDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"游乐场";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#4A009C"];
    [self.view addSubview:self.DongwangTableViews];
    // Do any additional setup after loading the view.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        return;
    }
    DongwangFindDetailViewController * Vc = [[DongwangFindDetailViewController alloc]init];
    Vc.indexs = indexPath.row+1;
    Vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:Vc animated:YES];
}
-(UITableView *)DongwangTableViews{
    if (!_DongwangTableViews) {
        _DongwangTableViews = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-kTabBarHeight) style:UITableViewStylePlain];
        _DongwangTableViews.delegate = self;
        _DongwangTableViews.dataSource = self;
        _DongwangTableViews.separatorStyle =  UITableViewCellSelectionStyleNone;
        _DongwangTableViews.backgroundColor = [UIColor clearColor];
        
    }
    return _DongwangTableViews;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifer = @"UITableViewCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    UIImageView * imgsViews = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, indexPath.row == 2 ? RealWidth(387) : RealWidth(195))];
    imgsViews.image = [UIImage imageNamed:self.imgDataArr[indexPath.row]];
    [cell addSubview:imgsViews];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.imgDataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        return RealWidth(387);
    }else{
        return RealWidth(195);
    }
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
