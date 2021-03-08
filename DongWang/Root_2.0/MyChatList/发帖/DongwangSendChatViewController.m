//
//  DongwangSendChatViewController.m
//  DongWang
//
//  Created by sycm on 2021/3/1.
//

#import "DongwangSendChatViewController.h"
#import "DongwangSendChatTopView.h"
#import "DongwangSendChatCenterView.h"
#import "DongwangSendChatPhotoCollectionViewCell.h"
#import "DongwangPhotoModel.h"
#import <RITLPhotos.h>
#import <HUPhotoBrowser.h>
#import "DongwangChatBtomView.h"
#import "DongwangCirleListView.h"
@interface DongwangSendChatViewController ()<DongwangSendChatTopViewDelegate,DongwangSendChatCenterViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,RITLPhotosViewControllerDelegate,DongwangChatBtomViewDelegate,DongwangCirleListViewDelegate>
@property(nonatomic,strong) DongwangSendChatTopView  * TopView;
@property(nonatomic,strong) DongwangSendChatCenterView * CenterView;
@property(nonatomic,strong) UICollectionView * DongwangSendCollectionView;
@property(nonatomic,strong) NSMutableArray * DongwangPhotoDataArr;
@property(nonatomic,strong) UIImagePickerController * DonwangPicker;
@property (nonatomic,strong)NSMutableArray *saveAssetIds;
@property(nonatomic,strong) DongwangChatBtomView * chatBtomView;
@property(nonatomic,strong) DongwangCirleListView * cirelistView;
@end

@implementation DongwangSendChatViewController
-(NSMutableArray *)DongwangPhotoDataArr{
    if (!_DongwangPhotoDataArr) {
        _DongwangPhotoDataArr =[NSMutableArray array];
        DongwangPhotoModel * photoModel = [[DongwangPhotoModel alloc]init];
        photoModel.islast = YES;
        photoModel.imgName = [UIImage imageNamed:@"addphoto"];
        [_DongwangPhotoDataArr addObject:photoModel];
    }
    return _DongwangPhotoDataArr;
}
-(NSMutableArray *)saveAssetIds{
    if (!_saveAssetIds) {
        _saveAssetIds = [NSMutableArray array];
    }
    return _saveAssetIds;
}
-(void)DongwnagConfigerPickers{
    NSString * mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        [CHShowMessageHud showMessageText:@"应用相机权限受限,请在设置中启用"];
        return;
    }
    RITLPhotosViewController * Vc = RITLPhotosViewController.photosViewController;
    Vc.configuration.maxCount = 4;
    Vc.configuration.containVideo =NO;
    Vc.photo_delegate =self;
    NSMutableArray * tempArr = self.saveAssetIds;
    Vc.defaultIdentifers = [tempArr copy];//记录已经选择过的资源
    [self presentViewController:Vc animated:YES completion:nil];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"发布帖子";
    self.gk_navItemRightSpace = RealWidth(15);
    UIButton * sendBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, RealWidth(45), RealWidth(20))];
    [sendBtn addTarget:self action:@selector(sendBtnClick) forControlEvents:UIControlEventTouchUpInside];
    sendBtn.layer.cornerRadius = RealWidth(5);
    sendBtn.layer.masksToBounds = YES;
    sendBtn.layer.borderColor = [UIColor colorWithHexString:@"#FFBA3E"].CGColor;
    sendBtn.layer.borderWidth = RealWidth(1);
    [sendBtn setTitle:@"发布" forState:UIControlStateNormal];
    sendBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    sendBtn.titleLabel.font = PFR13Font;
    [sendBtn setTitleColor:[UIColor colorWithHexString:@"#FFBA3E"] forState:UIControlStateNormal];
    self.gk_navRightBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:sendBtn];
    [self.view addSubview:self.TopView];
    [self.view addSubview:self.CenterView];
    _CenterView.height = _CenterView.CenterHeight;
    [self.view addSubview:self.DongwangSendCollectionView];
    [_DongwangSendCollectionView reloadData];
    _DongwangSendCollectionView.height = _DongwangSendCollectionView.collectionViewLayout.collectionViewContentSize.height;
    [self.view addSubview:self.chatBtomView];
}
-(DongwangChatBtomView *)chatBtomView{
    if (!_chatBtomView) {
    _chatBtomView = [[DongwangChatBtomView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-RealWidth(58)-SafeAreaBottom_Height, SCREEN_WIDTH, RealWidth(58)+SafeAreaBottom_Height)];
        _chatBtomView.delegate = self;
    }
    return _chatBtomView;
}
-(UICollectionView *)DongwangSendCollectionView{
    if (!_DongwangSendCollectionView) {
        UICollectionViewFlowLayout * Layout =[[UICollectionViewFlowLayout alloc]init];
        Layout.sectionInset = UIEdgeInsetsMake(0, RealWidth(15), 0, RealWidth(15));
        Layout.minimumLineSpacing = RealWidth(10);
        Layout.minimumInteritemSpacing = RealWidth(5);
        Layout.itemSize = CGSizeMake(RealWidth(80), RealWidth(80));
        _DongwangSendCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_CenterView.frame)+RealWidth(40), SCREEN_WIDTH, 0) collectionViewLayout:Layout];
        _DongwangSendCollectionView.delegate = self;
        _DongwangSendCollectionView.dataSource = self;
        _DongwangSendCollectionView.showsVerticalScrollIndicator = NO;
        _DongwangSendCollectionView.showsHorizontalScrollIndicator = NO;
        _DongwangSendCollectionView.backgroundColor =[UIColor clearColor];
        [_DongwangSendCollectionView registerClass:[DongwangSendChatPhotoCollectionViewCell class] forCellWithReuseIdentifier:@"DongwangSendChatPhotoCollectionViewCell"];
    }
    return _DongwangSendCollectionView;
}
-(DongwangCirleListView *)cirelistView{
    if (!_cirelistView) {
        _cirelistView = [[DongwangCirleListView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _cirelistView.delegate = self;
    }
    return _cirelistView;
}
-(DongwangSendChatCenterView *)CenterView{
    if (!_CenterView) {
        _CenterView = [[DongwangSendChatCenterView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_TopView.frame), SCREEN_WIDTH, 0)];
        _CenterView.delegate = self;
    }
    return _CenterView;
}
-(DongwangSendChatTopView *)TopView{
    if (!_TopView) {
        _TopView = [[DongwangSendChatTopView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, RealWidth(64))];
        _TopView.delegate =  self;
    }
    return _TopView;
}
#pragma mar--发贴
-(void)sendBtnClick{
    
}
#pragma mark--选择圈子
-(void)DongwangSendChatTopViewDidTap{
    [self.cirelistView ShowView];
}
#pragma mark--DongwangSendChatCenterViewDelegate
-(void)DongwangSendChatCenterViewUpdateFrame{
    _CenterView.height = _CenterView.CenterHeight;
    _DongwangSendCollectionView.y = CGRectGetMaxY(_CenterView.frame)+RealWidth(40);
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.DongwangPhotoDataArr.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangPhotoModel * photoModel = self.DongwangPhotoDataArr[indexPath.row];
    DongwangSendChatPhotoCollectionViewCell * DongwangPhotoCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DongwangSendChatPhotoCollectionViewCell" forIndexPath:indexPath];
    DongwangPhotoCell.DongwangThubImgView.image = photoModel.imgName;
    DongwangPhotoCell.DongwangBtn.hidden = photoModel.islast;
    DongwangPhotoCell.DongwangBtn.tag = indexPath.row;
    [DongwangPhotoCell.DongwangBtn addTarget:self action:@selector(DongwangPhotoCellClick:) forControlEvents:UIControlEventTouchUpInside];
    return DongwangPhotoCell;
}
- (void)photosViewController:(UIViewController *)viewController
                      images:(NSArray <UIImage *> *)images
                       infos:(NSArray <NSDictionary *> *)infos{
    MJWeakSelf;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        if (weakSelf.DongwangPhotoDataArr.count >0) {
        [weakSelf.DongwangPhotoDataArr removeAllObjects];
        }
        for (int myindex = 0 ; myindex < images.count; myindex++) {
            DongwangPhotoModel  * photoModel = [[DongwangPhotoModel alloc]init];
            photoModel.islast = NO;
            photoModel.imgName =images[myindex];
            [weakSelf.DongwangPhotoDataArr addObject:photoModel];
        }
        if (weakSelf.DongwangPhotoDataArr.count < 3) {
            DongwangPhotoModel * photoModel = [[DongwangPhotoModel alloc]init];
            photoModel.islast = YES;
            photoModel.imgName = [UIImage imageNamed:@"addphoto"];
            [weakSelf.DongwangPhotoDataArr addObject:photoModel];
        }
      dispatch_async(dispatch_get_main_queue(), ^{
      [weakSelf.DongwangSendCollectionView reloadData];
      });
    });
    
}
- (void)photosViewController:(UIViewController *)viewController
            assetIdentifiers:(NSArray <NSString *> *)identifiers
{
    NSMutableArray * TempArr = [NSMutableArray arrayWithArray:identifiers];
    
    self.saveAssetIds = TempArr;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DongwangPhotoModel  * photoModel = self.DongwangPhotoDataArr[indexPath.row];
    if (photoModel.islast) {
        [self DongwnagConfigerPickers];
    }else{
        NSMutableArray * tempImgArr =[NSMutableArray array];
        tempImgArr = self.DongwangPhotoDataArr;
        if (tempImgArr.count < 3) {
        [tempImgArr removeLastObject];
        }
        NSMutableArray * PrviewImgArr = [NSMutableArray array];
        for (DongwangPhotoModel * model in tempImgArr) {
            [PrviewImgArr addObject:model.imgName];
        }
        DongwangSendChatPhotoCollectionViewCell * DongwangPhotoCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DongwangSendChatPhotoCollectionViewCell" forIndexPath:indexPath];
        [HUPhotoBrowser showFromImageView:DongwangPhotoCell.DongwangThubImgView withImages:PrviewImgArr atIndex:indexPath.row];
    }
}
-(void)DongwangPhotoCellClick:(UIButton *)btn{
    [self.DongwangPhotoDataArr removeObjectAtIndex:btn.tag];
    [self.saveAssetIds removeObjectAtIndex:btn.tag];
    if (self.DongwangPhotoDataArr.count <3) {
        if (![self DongwnagCheckModels]) {
            DongwangPhotoModel * photoModel = [[DongwangPhotoModel alloc]init];
            photoModel.islast = YES;
            photoModel.imgName = [UIImage imageNamed:@"addphoto"];
            [self.DongwangPhotoDataArr addObject:photoModel];
        }
    }
    [self.DongwangSendCollectionView reloadData];
}
-(BOOL)DongwnagCheckModels{
    BOOL  isexist = NO;
    for (DongwangPhotoModel * photoModel in self.DongwangPhotoDataArr) {
        if (photoModel.islast) {
            isexist = YES;
            break;
        }
    }
    return isexist;
}
#pragma mark--DongwangChatBtomViewDelegate
-(void)DongwangChatBtomViewWithBtnClickIndex:(NSInteger)btnindex{
    if (btnindex == 0) {
        [self DongwnagConfigerPickers];
    }else if (btnindex == 1){
        
    }else if (btnindex == 2){
        
    }
}
#pragma mark--DongwangCirleListViewDelegate
-(void)DongwangCirleListViewHiden{
    [self.cirelistView removeFromSuperview];
    self.cirelistView = nil;
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
