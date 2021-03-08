//
//  DongwangChatListSubViewController.m
//  DongWang
//
//  Created by sycm on 2021/3/1.
//

#import "DongwangChatListSubViewController.h"
#import "DongwangChatListSubTableViewCell.h"
#import "DongwangMyChatDetailViewController.h"
@interface DongwangChatListSubViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy) void(^scrollCallback)(UIScrollView *scrollView);

@end

@implementation DongwangChatListSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#410093"];
    [self.view addSubview:self.tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangChiaIdentifer = @"DongwangChatListSubTableViewCell";
    DongwangChatListSubTableViewCell * ChatCell = [tableView dequeueReusableCellWithIdentifier:DongwangChiaIdentifer];
    if (ChatCell == nil) {
        ChatCell =[[DongwangChatListSubTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangChiaIdentifer];
    }
    return ChatCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return RealWidth(360);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DongwangMyChatDetailViewController * chatDetailVc = [[DongwangMyChatDetailViewController alloc]init];
    chatDetailVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatDetailVc animated:YES];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect viewFrame =  self.view.bounds;
    
    self.tableView.frame = CGRectMake(RealWidth(15), RealWidth(10), viewFrame.size.width-RealWidth(30), viewFrame.size.height-RealWidth(10));
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.layer.borderColor = [UIColor colorWithHexString:@"#40CAFF"].CGColor;
        _tableView.layer.borderWidth = RealWidth(2);
        _tableView.layer.cornerRadius = RealWidth(5);
        _tableView.layer.masksToBounds = YES;
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    }
    return _tableView;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.scrollCallback ?: self.scrollCallback(scrollView);
}
#pragma mark - JXPagingViewListViewDelegate
- (UIView *)listView {
    return self.view;
}

- (UIScrollView *)listScrollView {
    return self.tableView;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView *))callback {
    self.scrollCallback = callback;
}
- (void)listWillAppear {
//    NSLog(@"%@:%@", self.title, NSStringFromSelector(_cmd));

}
- (void)listDidAppear {
    
}
- (void)listWillDisappear {
//    NSLog(@"%@:%@", self.title, NSStringFromSelector(_cmd));
}

- (void)listDidDisappear {

//    NSLog(@"%@:%@", self.title, NSStringFromSelector(_cmd));
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
