//
//  DongwangCirelCenterInfoView.m
//  DongWang
//
//  Created by sycm on 2021/3/9.
//

#import "DongwangCirelCenterInfoView.h"
#import "DongwangCireCenterInfoTableViewCell.h"
#import "DongwangCireinfoSectionFooter.h"
@interface DongwangCirelCenterInfoView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * DongwangCireTableView;
@end
@implementation DongwangCirelCenterInfoView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.DongwangCireTableView];
    }
    return self;
}
-(UITableView *)DongwangCireTableView{
    if (!_DongwangCireTableView) {
        _DongwangCireTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RealWidth(80)) style:UITableViewStylePlain];
        _DongwangCireTableView.delegate = self;
        _DongwangCireTableView.dataSource = self;
        _DongwangCireTableView.showsVerticalScrollIndicator = NO;
        _DongwangCireTableView.showsHorizontalScrollIndicator = NO;
        _DongwangCireTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _DongwangCireTableView.backgroundColor = [UIColor clearColor];
}
    return _DongwangCireTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangCireleIdentifer = @"DongwangCireCenterInfoTableViewCell";
    DongwangCireCenterInfoTableViewCell  * cirell = [tableView dequeueReusableCellWithIdentifier:DongwangCireleIdentifer];
    if (cirell == nil) {
        cirell  = [[DongwangCireCenterInfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangCireleIdentifer];
    }
    return cirell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return RealWidth(30);
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    DongwangCireinfoSectionFooter * footerView = [DongwangCireinfoSectionFooter new];    
    return footerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return RealWidth(15);
}
@end
