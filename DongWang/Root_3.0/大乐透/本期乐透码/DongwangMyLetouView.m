//
//  DongwangMyLetouView.m
//  DongWang
//
//  Created by codehzx on 2021/1/29.
//

#import "DongwangMyLetouView.h"
#import "DongwanngMyletouCollectionViewCell.h"
#import "DongwangMyletouHeaderCollectionReusableView.h"
#import "DongwnagMyletouFooterCollectionReusableView.h"
@interface DongwangMyLetouView ()<UICollectionViewDelegate,UICollectionViewDataSource,DongwangMyletouHeaderCollectionReusableViewDelegate>
@property(nonatomic,strong) UICollectionView * dongwangCollectionView;
@property(nonatomic,strong) NSArray * dataArr;
@property(nonatomic,copy) NSString * topStr;
@property(nonatomic,strong) DongwnagMyletouFooterCollectionReusableView * resbueView;
@end
@implementation DongwangMyLetouView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_Height);
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.dongwangCollectionView];
        
        DongwnagMyletouFooterCollectionReusableView * resbueView = [[DongwnagMyletouFooterCollectionReusableView alloc]initWithFrame:CGRectZero];
        [self addSubview:resbueView];
        _resbueView = resbueView;
        
        self.alpha = 0 ;

    }
    return self;
}
-(void)infoTapClicks{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = .0;
        self->_dongwangCollectionView.frame = CGRectMake(0, RealWidth(248)+SCREEN_Height, SCREEN_WIDTH, RealWidth(248)+SafeAreaBottom_Height);
    } completion:^(BOOL finished) {
        [self.delegate DongwangMyLetouViewremoView];
        [self removeFromSuperview];
        [self->_dongwangCollectionView removeFromSuperview];
    }];
    
}
-(UICollectionView *)dongwangCollectionView{
    if (!_dongwangCollectionView) {
        UICollectionViewFlowLayout * Layout = [[UICollectionViewFlowLayout alloc]init];
        Layout.sectionInset = UIEdgeInsetsMake(RealWidth(15), RealWidth(15), RealWidth(5), RealWidth(15));
        Layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, RealWidth(70));
        Layout.footerReferenceSize = CGSizeMake(SCREEN_WIDTH, RealWidth(0));
        _dongwangCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:Layout];
        Layout.itemSize = CGSizeMake(RealWidth(149.5), RealWidth(65));
        _dongwangCollectionView.backgroundColor = [UIColor colorWithHexString:@"#804AB7"];
        _dongwangCollectionView.showsVerticalScrollIndicator = NO;
        _dongwangCollectionView.showsHorizontalScrollIndicator = NO;
        _dongwangCollectionView.delegate = self;
        _dongwangCollectionView.dataSource = self;
        [_dongwangCollectionView registerClass:[DongwanngMyletouCollectionViewCell class] forCellWithReuseIdentifier:@"DongwanngMyletouCollectionViewCell"];
        [_dongwangCollectionView registerClass:[DongwangMyletouHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DongwangMyletouHeaderCollectionReusableView"];
//        [_dongwangCollectionView registerClass:[DongwnagMyletouFooterCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"DongwnagMyletouFooterCollectionReusableView"];
    }
    return _dongwangCollectionView;
}
-(void)DongwangConfigerLetouWith:(NSArray *)dataArr  openTime:(NSString *)openTimeStr{
    self.dataArr = dataArr;
    self.topStr = openTimeStr;
    [self.dongwangCollectionView reloadData];
    if (dataArr.count == 0) {
        LYEmptyView * emtyView =  [LYEmptyView emptyViewWithImage:nil titleStr:nil detailStr:@"当前暂无乐透码\n参与活动可以获得乐透码哦～"];
        emtyView.detailLabMaxLines = 10;
        
        emtyView.titleLabTextColor = [UIColor whiteColor];
        emtyView.detailLabTextColor = [UIColor whiteColor];
//        emtyView.detailLabMargin = -RealWidth(40);
        emtyView.titleLabFont =  PFR16Font;
        emtyView.detailLabFont = PFR16Font;
        self.dongwangCollectionView.ly_emptyView =  emtyView;
    }
    
   
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwanngMyletouCollectionViewCell * myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DongwanngMyletouCollectionViewCell" forIndexPath:indexPath];
    myCell.dongwangToplb.text = self.dataArr[indexPath.row];
    return myCell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        DongwangMyletouHeaderCollectionReusableView *header  =(DongwangMyletouHeaderCollectionReusableView*) [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DongwangMyletouHeaderCollectionReusableView" forIndexPath:indexPath];
        header.topStr = self.topStr;
        header.delegate = self;
        return header;
    }else{
        return nil;
    }
    return nil;
}
#pragma mar--DongwangMyletouHeaderCollectionReusableViewDelegate
-(void)DongwangMyletouHeaderCollectionReusableViewWithClouesdAction{
    [self infoTapClicks];
}
-(void)ShowView{
    
    [[AppDelegate getAppDelegate].window addSubview:self];
    _dongwangCollectionView.frame = CGRectMake(0, RealWidth(248)+SCREEN_Height, SCREEN_WIDTH, RealWidth(248)+SafeAreaBottom_Height);
    _resbueView.frame =  CGRectMake(0, CGRectGetMaxY(_dongwangCollectionView.frame), SCREEN_WIDTH, RealWidth(30));
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1.0;
    [self->_dongwangCollectionView setFrame:CGRectMake(0, SCREEN_Height - RealWidth(248)-SafeAreaBottom_Height-RealWidth(0+0), SCREEN_WIDTH, RealWidth(248)+SafeAreaBottom_Height-RealWidth(30))];
    self->_resbueView.frame =  CGRectMake(0, CGRectGetMaxY(self->_dongwangCollectionView.frame), SCREEN_WIDTH, RealWidth(30));
    } completion:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
