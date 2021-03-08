//
//  DongwangFindDetailViewController.m
//  DongWang
//
//  Created by codehzx on 2021/1/15.
//

#import "DongwangFindDetailViewController.h"
#import "DongwangMyStratPageView.h"

@interface DongwangFindDetailViewController ()
@property (nonatomic,strong) DongwangMyStratPageView * guideView;
@property (nonatomic,strong) NSArray * images;
@property (nonatomic, strong)NSArray *stratImageArray;

@end

@implementation DongwangFindDetailViewController
- (DongwangMyStratPageView *)guideView
{
    if(!_guideView){
        _guideView = [[DongwangMyStratPageView alloc] initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH)];
        [_guideView addSlectBlock:^(NSInteger curretnPageNumber) {
        }];
        [self.view addSubview:_guideView];
    }
    return _guideView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.indexs == 1) {
        self.gk_navTitle = @"懂王大富翁";
    }else if (self.indexs ==2 ){
        self.gk_navTitle = @"答题游戏机";
    }else if (self.indexs == 3){
        self.gk_navTitle = @"答题对战";
    }
    self.view.backgroundColor = LGDMianColor;
    if (self.indexs == 1) {
        _stratImageArray = self.images;
    } else if (self.indexs == 2){
        _stratImageArray = self.images;
    }else if (self.indexs == 3){
        _stratImageArray = self.images;

    }
    [self.guideView guideViewDataWithImages:_stratImageArray];
    // Do any additional setup after loading the view.
}
- (NSArray *)images
{
    if(!_images){
        if (self.indexs == 1) {
            _images = @[@"dafuwen", @"dafuwen1", @"dafuwen2"];

        }else if (self.indexs == 2){
            _images = @[@"datiji", @"datiji1", @"datiji2",@"datiji3"];

        }else if (self.indexs == 3){
            _images = @[@"pk", @"pk1"];

        }
    }
    return _images;
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
