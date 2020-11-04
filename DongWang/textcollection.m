//
//  textcollection.m
//  FruitLib
//
//  Created by ZY_ZMB on 2020/11/3.
//  Copyright © 2020 FruitAI. All rights reserved.
//

#import "textcollection.h"
#import "textcollectionCell.h"

@interface textcollection ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray * allArray;

@end

@implementation textcollection

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"------%.2f",SCREEN_WIDTH);
    self.allArray = [[NSMutableArray alloc]init];
    [self.allArray addObject:@{@"w":@"204.5",@"g":@"30"}];
    [self.allArray addObject:@{@"w":@"204.5",@"g":@"30"}];
    [self.allArray addObject:@{@"w":@"99.75",@"g":@"30"}];
    [self.allArray addObject:@{@"w":@"99.75",@"g":@"30"}];
    [self.allArray addObject:@{@"w":@"99.75",@"g":@"30"}];
    [self.allArray addObject:@{@"w":@"99.75",@"g":@"30"}];
    [self.allArray addObject:@{@"w":@"134.6",@"g":@"30"}];
    [self.allArray addObject:@{@"w":@"134.6",@"g":@"30"}];
    [self.allArray addObject:@{@"w":@"134.6",@"g":@"30"}];
    [self.allArray addObject:@{@"w":@"414",@"g":@"30"}];

    
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"textcollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"textcollectionCell"];
    

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.allArray.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    textcollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"textcollectionCell" forIndexPath:indexPath];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * dic = self.allArray[indexPath.row];
    NSLog(@"%@",dic);
    return CGSizeMake([dic[@"w"] floatValue],[dic[@"g"] floatValue]);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
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
