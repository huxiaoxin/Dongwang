//
//  DongwangCirleListView.m
//  DongWang
//
//  Created by sycm on 2021/3/4.
//

#import "DongwangCirleListView.h"
#import "DongwangCirleListTableViewCell.h"
@interface DongwangCirleListView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UIView * DongwnagContentView;
@property(nonatomic,strong) NSArray * dataAr;
@property(nonatomic,strong) UIButton   * tagSelbtn;
@property(nonatomic,strong) UITableView * DongwangCirleTableView;
@end
@implementation DongwangCirleListView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.DongwnagContentView];
        
        for (int index = 0; index < self.dataAr.count; index++) {
            UIButton * tagBtn = [[UIButton alloc]initWithFrame:CGRectMake(RealWidth(25)+RealWidth(80)*index, RealWidth(30), RealWidth(60), RealWidth(16))];
            [tagBtn setTitle:self.dataAr[index] forState:UIControlStateNormal];
            [tagBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [tagBtn setTitleColor:[UIColor colorWithHexString:@"#FEDA00"] forState:UIControlStateSelected];
            tagBtn.titleLabel.font =PFR14Font;
            tagBtn.tag = index;
            [tagBtn addTarget:self action:@selector(tagBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_DongwnagContentView addSubview:tagBtn];
            if (index == 0) {
                tagBtn.selected = YES;
                [self setTagSelbtn:tagBtn];
            }
        }
        
        
        UIButton * clearBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-RealWidth(30), CGRectGetMidY(_tagSelbtn.frame)-RealWidth(7.5), RealWidth(15), RealWidth(15))];
        
        [clearBtn setBackgroundImage:[UIImage imageNamed:@"error-1"] forState:UIControlStateNormal];
        clearBtn.adjustsImageWhenHighlighted = NO;
        [clearBtn addTarget:self action:@selector(infoTapClicks) forControlEvents:UIControlEventTouchUpInside];
        [_DongwnagContentView addSubview:clearBtn];
        [_DongwnagContentView addSubview:self.DongwangCirleTableView];
        
        
    }
    return self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangCirleIdentifer = @"DongwangCirleListTableViewCell";
    DongwangCirleListTableViewCell * dongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangCirleIdentifer];
    if (dongwangCell == nil) {
        dongwangCell = [[DongwangCirleListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangCirleIdentifer];
    }
    return dongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return RealWidth(90);
}
-(UITableView *)DongwangCirleTableView{
    if (!_DongwangCirleTableView) {
        _DongwangCirleTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_tagSelbtn.frame)+RealWidth(15), SCREEN_Width, CGRectGetHeight(_DongwnagContentView.frame)-CGRectGetMaxY(_tagSelbtn.frame)-RealWidth(15)) style:UITableViewStylePlain];
        _DongwangCirleTableView.delegate = self;
        _DongwangCirleTableView.dataSource = self;
        _DongwangCirleTableView.showsVerticalScrollIndicator = NO;
        _DongwangCirleTableView.showsHorizontalScrollIndicator = NO;
        _DongwangCirleTableView.backgroundColor =[UIColor clearColor];
    }
    return _DongwangCirleTableView;
}
-(void)tagBtnClick:(UIButton * )btn{
    self.tagSelbtn.selected = NO;
    btn.selected = YES;
    self.tagSelbtn = btn;
}
-(NSArray *)dataAr{
    if (!_dataAr) {
        _dataAr = @[@"我加入的",@"最近逛的"];
    }
    return _dataAr;
}
-(UIView *)DongwnagContentView{
    if (!_DongwnagContentView) {
        _DongwnagContentView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT+RealWidth(518), SCREEN_WIDTH, RealWidth(518))];
        _DongwnagContentView.backgroundColor = [UIColor colorWithHexString:@"#8767E9"];
    }
    return _DongwnagContentView;
}
-(void)ShowView{
    MJWeakSelf;
    [[AppDelegate getAppDelegate].window addSubview:self];
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.backgroundColor =[UIColor colorWithHexString:@"#333333" Alpha:0.9];
    weakSelf.DongwnagContentView.y = RealWidth(132)+StatuBar_Height;
    } completion:nil];
}
-(void)infoTapClicks{
    MJWeakSelf;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.alpha = .0;
        weakSelf.DongwnagContentView.y = SCREEN_HEIGHT+RealWidth(517);
    } completion:^(BOOL finished) {
        [weakSelf.delegate DongwangCirleListViewHiden];
        [weakSelf.DongwnagContentView removeFromSuperview];
        [weakSelf removeFromSuperview];
    }];
    

}
@end
