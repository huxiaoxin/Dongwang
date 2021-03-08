//
//  StratPageView.m
//  引导启动页
//
//  Created by 顾成辉 on 2017/8/14.
//  Copyright © 2017年 zimo. All rights reserved.
//

#import "StratPageView.h"
#import "StartPageCell.h"
#define  kScreenBounds  [[UIScreen mainScreen] bounds]

@interface StratPageView ()<UICollectionViewDelegate, UICollectionViewDataSource>
/** collectionView */
@property (nonatomic,strong) UICollectionView * collectionView;


/** <#des#> */
@property (nonatomic,strong) NSArray * images;

/** <#des#> */
@property (nonatomic,copy) CurrentSelctBlock selectBlock;

/** 跳过回调 */
@property (nonatomic,copy) dispatch_block_t skipCallBack;


@end
@implementation StratPageView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self settingCollectionView];
    }
    return self;
}

- (void)addSlectBlock:(CurrentSelctBlock)selectBlock
{
    self.selectBlock = selectBlock;
}
#pragma mark - SDCycleScrollViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    StartPageCell *cell = (StartPageCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"StartPageCell" forIndexPath:indexPath];
    [cell cellDataWithImageNames:self.images indexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectBlock) {
        self.selectBlock(indexPath.row);
    }
}

#pragma mark - 数据方法
- (void)guideViewDataWithImages:(NSArray *)images
{
            
    self.images = images;
    [self.collectionView reloadData];
}
#pragma mark -getter
- (void)settingCollectionView
{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
    _collectionView.collectionViewLayout = layout;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.pagingEnabled = YES;
    _collectionView.backgroundColor = [UIColor whiteColor];
    // 注册
    [_collectionView registerClass:[StartPageCell class] forCellWithReuseIdentifier:@"StartPageCell"];

    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self addSubview:_collectionView];
}

- (void)settingX:(CGFloat)x WithView:(UIView *)view
{
    CGRect frame = view.frame;
    frame.origin.x = x;
    view.frame = frame;
}

- (void)settingWidth:(CGFloat)width WithView:(UIView *)view
{
    CGRect frame = view.frame;
    frame.size.width = width;
    view.frame = frame;
}

@end
