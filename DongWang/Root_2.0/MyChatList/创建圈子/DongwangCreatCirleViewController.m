//
//  DongwangCreatCirleViewController.m
//  DongWang
//
//  Created by sycm on 2021/3/5.
//

#import "DongwangCreatCirleViewController.h"
#import "DongwangCreatCirelHeaderView.h"
#import <MOFSPickerManager-umbrella.h>
@interface DongwangCreatCirleViewController ()<DongwangCreatCirelHeaderViewDelegate>
@property(nonatomic,strong) UITableView * DongwangCreaTableView;
@property(nonatomic,strong) DongwangCreatCirelHeaderView * CirleHeader;
@end

@implementation DongwangCreatCirleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"创建圈子";
    [self.view addSubview:self.DongwangCreaTableView];
    _CirleHeader.height = self.CirleHeader.cirleHeaderHeight;
    _DongwangCreaTableView.tableHeaderView = self.CirleHeader;
    // Do any additional setup after loading the view.
}
-(DongwangCreatCirelHeaderView *)CirleHeader{
    if (!_CirleHeader) {
        _CirleHeader = [[DongwangCreatCirelHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RealWidth(150))];
        _CirleHeader.delegate = self;
    }
    return _CirleHeader;
}
-(UITableView *)DongwangCreaTableView{
    if (!_DongwangCreaTableView) {
        _DongwangCreaTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _DongwangCreaTableView.showsVerticalScrollIndicator = NO;
        _DongwangCreaTableView.showsHorizontalScrollIndicator = NO;
        _DongwangCreaTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _DongwangCreaTableView.backgroundColor = [UIColor clearColor];
    }
    return _DongwangCreaTableView;
}
#pragma mark--DongwangCreatCirelHeaderViewDelegate
-(void)DongwangCreatCirelHeaderViewupdateFrame:(CGFloat)HeaderHeight{
    self.CirleHeader.height = HeaderHeight;
    _DongwangCreaTableView.tableHeaderView = self.CirleHeader;
}
-(void)DongwangCreatCirelHeaderViewTosSeltecdCirle:(UITextField *)cirleTextField{
    [MOFSPickerManager shareManger].pickView.backgroundColor = [UIColor colorWithHexString:@"#8767E9"];
    [MOFSPickerManager shareManger].pickView.toolBar.backgroundColor = [UIColor colorWithHexString:@"#8767E9"];
    [MOFSPickerManager shareManger].pickView.toolBar.cancelBarTintColor =[UIColor whiteColor];
    [[MOFSPickerManager shareManger] showPickerViewWithDataArray:@[@"1",@"2",@"3"] title:@"" cancelTitle:@"取消" commitTitle:@"" commitBlock:^(NSString * _Nonnull string) {
            
        } cancelBlock:^{
            
        }];
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
