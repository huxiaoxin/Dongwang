//
//  DongwangCireSubCenterViewController.m
//  DongWang
//
//  Created by sycm on 2021/3/9.
//

#import "DongwangCireSubCenterViewController.h"
#import "DongwangCireSubCenterlistTableViewCell.h"
@interface DongwangCireSubCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy) void(^scrollCallback)(UIScrollView *scrollView);

@end

@implementation DongwangCireSubCenterViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navigationBar.hidden = YES;
    [self.view addSubview:self.DongwangTableView];
    // Do any additional setup after loading the view.
}

#pragma mark - JXPagingViewListViewDelegate
- (UIView *)listView {
    return self.view;
}

- (UIScrollView *)listScrollView {
    return self.DongwangTableView;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView *))callback {
    self.scrollCallback = callback;
    
}
- (void)listWillAppear {
    NSLog(@"%@:%@", self.title, NSStringFromSelector(_cmd));

}

- (void)listDidAppear {
    NSLog(@"已出现");
   
}
- (void)listWillDisappear {
    NSLog(@"%@:%@", self.title, NSStringFromSelector(_cmd));
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.scrollCallback ?: self.scrollCallback(scrollView);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect ViewFrame = self.view.bounds;
    self.DongwangTableView.frame = CGRectMake(RealWidth(10), RealWidth(0), ViewFrame.size.width-RealWidth(20), ViewFrame.size.height-RealWidth(30));
}
-(UITableView *)DongwangTableView{
    if (!_DongwangTableView) {
        _DongwangTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _DongwangTableView.delegate =self;
        _DongwangTableView.dataSource = self;
        _DongwangTableView.layer.borderColor = [UIColor colorWithHexString:@"#8767E9"].CGColor;
        _DongwangTableView.layer.borderWidth = RealWidth(1);
        [_DongwangTableView acs_radiusWithRadius:K(5) corner:self.indictorIndex == 0 ?   UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight  :UIRectCornerAllCorners];
        _DongwangTableView.backgroundColor = [UIColor colorWithHexString:@"#341E7B"];
//        [UIColor colorWithHexString:@"#341E7B"];

    }
    return _DongwangTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangCirleIdentifer = @"DongwangCireSubCenterlistTableViewCell";
    DongwangCireSubCenterlistTableViewCell * dongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangCirleIdentifer];
    if (dongwangCell == nil) {
        dongwangCell = [[DongwangCireSubCenterlistTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangCirleIdentifer];
    }
    return dongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return RealWidth(80+220);
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return RealWidth(0);
}

-(void)DongwangSublistRequstData{
   
}
- (void)listDidDisappear {
//    NSLog(@"%@:%@", self.title, NSStringFromSelector(_cmd));
}
@end
