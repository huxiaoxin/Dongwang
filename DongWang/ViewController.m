//
//  ViewController.m
//  DongWang
//
//  Created by codehzx on 2020/10/20.
//

#import "ViewController.h"
#import "MytestCollectionViewCell.h"
#import "MyTestImgModel.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView * MyCollectionView;
@property(nonatomic,strong) NSMutableArray * MyDataArr;
@end

@implementation ViewController

-(NSMutableArray *)MyDataArr{
    if (!_MyDataArr) {
        _MyDataArr = [[NSMutableArray alloc]init];
//        MyTestImgModel * imgmodel = [[MyTestImgModel alloc]init];
//        imgmodel.imgurl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604382215847&di=34ffe65cbe5bbf3ae06546f249241623&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201901%2F29%2F20190129233255_2VXnt.jpeg";
//        imgmodel.height = K(160);
//        imgmodel.width = SCREEN_WIDTH;
//        [_MyDataArr addObject:imgmodel];
//
//        MyTestImgModel * imgmodel1 = [[MyTestImgModel alloc]init];
//        imgmodel1.imgurl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604382215846&di=d38cffd8f2da705191f0714de2896ce9&imgtype=0&src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F201806%2F26%2F20180626231714_xETGH.jpeg";
//        imgmodel1.height = K(80);
//        imgmodel1.width = SCREEN_WIDTH/2;
//        [_MyDataArr addObject:imgmodel1];
//
//
//        MyTestImgModel * imgmodel2 = [[MyTestImgModel alloc]init];
//        imgmodel2.imgurl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604382270487&di=5491b65ec848fd959d9d1ad62ffb27c2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fbaike%2Fpic%2Fitem%2F27d647ee0706b0c7b2fb958d.jpg";
//        imgmodel2.height = K(80);
//        imgmodel2.width = SCREEN_WIDTH/2;
//
//        [_MyDataArr addObject:imgmodel2];
//
//
//        MyTestImgModel * imgmodel3 = [[MyTestImgModel alloc]init];
//        imgmodel3.imgurl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604382270487&di=5491b65ec848fd959d9d1ad62ffb27c2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fbaike%2Fpic%2Fitem%2F27d647ee0706b0c7b2fb958d.jpg";
//        imgmodel3.height = K(80);
//        imgmodel3.width = SCREEN_WIDTH/2;
//        [_MyDataArr addObject:imgmodel3];
//
//
//        MyTestImgModel * imgmodel4 = [[MyTestImgModel alloc]init];
//        imgmodel4.imgurl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604382270487&di=5491b65ec848fd959d9d1ad62ffb27c2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fbaike%2Fpic%2Fitem%2F27d647ee0706b0c7b2fb958d.jpg";
//        imgmodel4.height = K(80);
//        imgmodel4.width = SCREEN_WIDTH/2;
//        [_MyDataArr addObject:imgmodel4];
//
//        MyTestImgModel * imgmodel5 = [[MyTestImgModel alloc]init];
//        imgmodel5.imgurl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604382270487&di=5491b65ec848fd959d9d1ad62ffb27c2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fbaike%2Fpic%2Fitem%2F27d647ee0706b0c7b2fb958d.jpg";
//        imgmodel5.height = K(80);
//        imgmodel5.width = SCREEN_WIDTH/2;
//        [_MyDataArr addObject:imgmodel5];

        
//        MyTestImgModel * imgmodel6 = [[MyTestImgModel alloc]init];
//        imgmodel6.imgurl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604382270487&di=5491b65ec848fd959d9d1ad62ffb27c2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fbaike%2Fpic%2Fitem%2F27d647ee0706b0c7b2fb958d.jpg";
//        imgmodel6.height = K(80);
//        imgmodel6.width = SCREEN_WIDTH/2;
//        [_MyDataArr addObject:imgmodel6];
//        _MyDataArr = [[NSMutableArray alloc]init];
        [_MyDataArr addObject:@{@"w":@"204.5",@"g":@"30"}];
        [_MyDataArr addObject:@{@"w":@"204.5",@"g":@"30"}];
        [_MyDataArr addObject:@{@"w":@"99.75",@"g":@"30"}];
        [_MyDataArr addObject:@{@"w":@"99.75",@"g":@"30"}];
        [_MyDataArr addObject:@{@"w":@"99.75",@"g":@"30"}];
        [_MyDataArr addObject:@{@"w":@"99.75",@"g":@"30"}];
        [_MyDataArr addObject:@{@"w":@"134.6",@"g":@"30"}];
        [_MyDataArr addObject:@{@"w":@"134.6",@"g":@"30"}];
        [_MyDataArr addObject:@{@"w":@"134.6",@"g":@"30"}];
        [_MyDataArr addObject:@{@"w":@"414",@"g":@"30"}];


        
    }
    return _MyDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.MyCollectionView];
    [self.MyCollectionView reloadData];
    // Do any additional setup after loading the view.
}
-(UICollectionView *)MyCollectionView{
    if (!_MyCollectionView) {
        UICollectionViewFlowLayout * Layout = [[UICollectionViewFlowLayout alloc]init];
//        Layout.scrollDirection =  UICollectionViewScrollDirectionHorizontal;
//        Layout.minimumLineSpacing = 0 ;
//        Layout.minimumInteritemSpacing = 0;
        
        _MyCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height) collectionViewLayout:Layout];
        _MyCollectionView.delegate = self;
        _MyCollectionView.dataSource = self;
        _MyCollectionView.showsVerticalScrollIndicator = NO;
        _MyCollectionView.showsHorizontalScrollIndicator = NO;
        _MyCollectionView.backgroundColor = [UIColor whiteColor];
        [_MyCollectionView registerClass:[MytestCollectionViewCell class] forCellWithReuseIdentifier:@"MytestCollectionViewCell"];
    }
    return _MyCollectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.MyDataArr.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MytestCollectionViewCell * MyCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MytestCollectionViewCell" forIndexPath:indexPath];
    MyCell.dic = self.MyDataArr[indexPath.row];
    NSLog(@"----%@",self.MyDataArr[indexPath.row]);
//    MyCell.imgModel = self.MyDataArr[indexPath.row];
    return MyCell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * dic = self.MyDataArr[indexPath.row];
    NSLog(@"%@",dic);
    return CGSizeMake([dic[@"w"] floatValue],[dic[@"g"] floatValue]);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

@end
