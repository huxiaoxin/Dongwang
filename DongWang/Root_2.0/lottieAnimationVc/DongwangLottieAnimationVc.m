//
//  DongwangLottieAnimationVc.m
//  DongWang
//
//  Created by codehzx on 2021/1/11.
//

#import "DongwangLottieAnimationVc.h"
#import "DongwangLogoinViewModel.h"
#import <Lottie/LOTAnimationView.h>
#import <AVKit/AVKit.h>
@interface DongwangLottieAnimationVc ()
@property(nonatomic,strong) LOTAnimationView * animationView;
@property (nonatomic,strong)AVPlayer * player;
@property (nonatomic,strong)AVPlayerItem * playItem;
@end

@implementation DongwangLottieAnimationVc
-(LOTAnimationView *)animationView{
    if (!_animationView) {
        _animationView =
        [[LOTAnimationView  alloc]initWithContentsOfURL:[NSURL URLWithString:self.lottiemodel.actionUrl]];
        
        _animationView.frame = CGRectMake(0,SCREEN_HEIGHT/2-RealWidth(255)/2, RealWidth(375), RealWidth(255));
        _animationView.contentMode =  UIViewContentModeScaleToFill;
        _animationView.backgroundColor = [UIColor clearColor];
        _animationView.userInteractionEnabled = YES;
    }
    return _animationView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    UIImageView * DongwnagBjImgView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    DongwnagBjImgView.image = [UIImage imageNamed:@"动效背景"];
    [self.view addSubview:DongwnagBjImgView];
    self.gk_navigationBar.hidden = YES;
    self.playItem = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:self.lottiemodel.audioUrl]];
    self.player = [[AVPlayer alloc] initWithPlayerItem:self.playItem];
    if ([self.lottiemodel.audioStatus integerValue] == 0) {
      [self.player play];
    }
    if ([self.lottiemodel.actionStatus integerValue] == 0) {
        [self.view addSubview:self.animationView];
        [_animationView play];
    }else{
        [self BaseTabarRequest];
    }
    
    
    MJWeakSelf;
    _animationView.completionBlock = ^(BOOL animationFinished) {
    if (animationFinished) {
        [weakSelf.player pause];
        weakSelf.player = nil;
     [weakSelf BaseTabarRequest];
     }
      };
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
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
