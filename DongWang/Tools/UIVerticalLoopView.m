//
//  UIVerticalLoopView.m
//  SYQuMinApp
//
//  Created by apple on 2018/4/24.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import "UIVerticalLoopView.h"
#define intervalX RealWidth(10)
@interface UIVerticalLoopView ()

@property (nonatomic,strong) NSTimer *timer;
@property(nonatomic,assign) BOOL isSucced;
@end
@implementation UIVerticalLoopView

- (UILabel *)firstContentLabel {
    if (!_firstContentLabel) {
        _firstContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(intervalX, 0, self.frame.size.width - intervalX, self.frame.size.height)];
        [_firstContentLabel setBackgroundColor:[UIColor clearColor]];
        [_firstContentLabel setNumberOfLines:0];
        _firstContentLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesturRecongnizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loopContentClick)];
        tapGesturRecongnizer1.numberOfTapsRequired = 1;
        [_firstContentLabel addGestureRecognizer:tapGesturRecongnizer1];
        
        _firstContentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [_firstContentLabel setTextColor:Color19];
        _firstContentLabel.font= PFR15Font;
    }
    return _firstContentLabel;
}
- (UILabel *)secondContentLabel {
    if (!_secondContentLabel) {
//        _secondContentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _secondContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(intervalX, self.frame.size.height , self.frame.size.width - intervalX, self.frame.size.height)];
        [_secondContentLabel setBackgroundColor:[UIColor clearColor]];
        [_secondContentLabel setTextColor:Color19];
        _secondContentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [_secondContentLabel setNumberOfLines:0];
        _secondContentLabel.userInteractionEnabled = YES;
        _secondContentLabel.font= PFR15Font;
        
        UITapGestureRecognizer *tapGesturRecongnizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loopContentClick)];
        tapGesturRecongnizer2.numberOfTapsRequired = 1;
        [_secondContentLabel addGestureRecognizer:tapGesturRecongnizer2];
    }
    return _secondContentLabel;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.isSucced = NO;
        [self setUI];
       // [self addTimer];

    }
    return self;
}
- (void)addTimer{
    
    /*
     scheduledTimerWithTimeInterval:  滑动视图的时候timer会停止
     这个方法会默认把Timer以NSDefaultRunLoopMode添加到主Runloop上，而当你滑tableView的时候，就不是NSDefaultRunLoopMode了，这样，你的timer就会停了。
     self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(nextLabel) userInfo:nil repeats:YES];
     */
    
    self.timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(nextLabel) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)setUI {
    
    [self addSubview:self.firstContentLabel];
    [self addSubview:self.secondContentLabel];
    // 默认初始方向是向上
    _Direction = VerticalLoopDirectionDown;
    _verticalLoopAnimationDuration = 1;
    self.clipsToBounds = YES;
}
-(void)startVerticalLoopAnimation{
    self.isSucced = YES;
    if (_currentIndex < _verticalLoopContentArr.count && _currentIndex != _verticalLoopContentArr.count) {
        NSString *firstString = [_verticalLoopContentArr objectAtIndex:_currentIndex];
        _firstContentLabel.attributedText = [self AttbuteConfgerWithText:firstString];
    }
    float firstContentLaStartY = 0;
    float firstContentLaEndY = 0;
    float secondContentLaStartY = 0;
    float secondContentLaEndY = 0;
    
    int secondCurrentIndex  = _currentIndex + 1;
    if (secondCurrentIndex > _verticalLoopContentArr.count - 1) {
        secondCurrentIndex = 0;
    }
    
    switch (_Direction) {
        case VerticalLoopDirectionBottom:
            
            firstContentLaStartY = 0;
            firstContentLaEndY = self.frame.size.height;
            
            secondContentLaStartY = firstContentLaStartY - self.frame.size.height;
            secondContentLaEndY = firstContentLaEndY - self.frame.size.height;
            
            break;
        case VerticalLoopDirectionDown:
            
            firstContentLaStartY = 0;
            firstContentLaEndY = -self.frame.size.height;
            
            secondContentLaStartY = firstContentLaStartY + self.frame.size.height;
            secondContentLaEndY = firstContentLaEndY + self.frame.size.height;
            
            break;
        default:
            break;
    }
    if (secondCurrentIndex < _verticalLoopContentArr.count && secondCurrentIndex != _verticalLoopContentArr.count) {
        NSString *secondString = [_verticalLoopContentArr objectAtIndex:secondCurrentIndex];
        _secondContentLabel.attributedText = [self AttbuteConfgerWithText:secondString];
    }
    
    
    
    _firstContentLabel.frame = CGRectMake(intervalX, firstContentLaStartY, self.frame.size.width - intervalX, self.frame.size.height);
    _secondContentLabel.frame = CGRectMake(intervalX, secondContentLaStartY, self.frame.size.width - intervalX, self.frame.size.height);

    
    
    if (_firstContentLabel && _secondContentLabel) {
        [UIView beginAnimations:@"" context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [UIView setAnimationDuration:_verticalLoopAnimationDuration];
        [UIView setAnimationDelay:0.9];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(verticalLoopAnimationDidStop:finished:context:)];
        CGRect firstContentLabelFrame = _firstContentLabel.frame;
        firstContentLabelFrame = CGRectMake(intervalX, firstContentLaEndY, self.frame.size.width - intervalX, self.frame.size.height);
        self.firstContentLabel.frame = firstContentLabelFrame;
        CGRect secondContentLabelFrame = _secondContentLabel.frame;
        secondContentLabelFrame = CGRectMake(intervalX,secondContentLaEndY, self.frame.size.width - intervalX, self.frame.size.height);
        self.secondContentLabel.frame = secondContentLabelFrame;
        self.firstContentLabel.alpha = 0.01;
        [UIView commitAnimations];


    }
    
}
-(void)nextLabel{
    _currentIndex++;
    if (_currentIndex >= [_verticalLoopContentArr count]) {
        _currentIndex = 0;
    }

    [self startVerticalLoopAnimation];

}
-(void)verticalLoopAnimationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    _currentIndex++;
    if (_currentIndex >= [_verticalLoopContentArr count]) {
        _currentIndex = 0;
    }
    self.firstContentLabel.alpha = 1;
    [self startVerticalLoopAnimation];
}
- (void)loopContentClick
{
    if ([self.loopDelegate respondsToSelector:@selector(didClickContentAtIndex:)]) {
        [self.loopDelegate didClickContentAtIndex:_currentIndex];
    }
}
#pragma mark - verticalLoop Animation Handling
-(void)start {
    if (self.isSucced  == YES) {
        return;
    }
    // 开启动画默认第一条信息
    _currentIndex = 0;
    // 开始动画
    [self startVerticalLoopAnimation];
}
-(NSMutableAttributedString * )AttbuteConfgerWithText:(NSString *)Text{
    NSArray * TitleArr = [Text componentsSeparatedByString:@","];
    
    NSString *  FirstStr = [NSString stringWithFormat:@"%@  ",TitleArr.count > 0 ? [TitleArr firstObject] : @""];
    NSString *  SecondStr = [NSString stringWithFormat:@"%@  ",TitleArr.count >= 1 ? [TitleArr objectAtIndex:1] : @""];
    NSString *  ThreeStr = [NSString stringWithFormat:@"%@  ",TitleArr.count >=2 ? [TitleArr objectAtIndex:2] : @""];
    NSString *  FoureStr = [NSString stringWithFormat:@"%@  ",TitleArr.count >= 3 ? [TitleArr objectAtIndex:3] : @""];
    NSString *  FiveStr = TitleArr.count >= 4 ? [TitleArr objectAtIndex:4] : @"";
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@%@%@%@",FirstStr,SecondStr,ThreeStr,FoureStr,FiveStr]];
    //第一段
    [attrStr addAttribute:NSFontAttributeName value:PFR13Font range:NSMakeRange(0, FirstStr.length)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, FirstStr.length)];

     //第二段
    [attrStr addAttribute:NSFontAttributeName value:PFR13Font range:NSMakeRange(FirstStr.length, SecondStr.length)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#FFDD00"] range:NSMakeRange(FirstStr.length, SecondStr.length)];

    //第三段
    [attrStr addAttribute:NSFontAttributeName value:PFR11Font range:NSMakeRange(FirstStr.length+SecondStr.length, ThreeStr.length)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(FirstStr.length+SecondStr.length, ThreeStr.length)];

    
    //第四段
    [attrStr addAttribute:NSFontAttributeName value:PFS17Font range:NSMakeRange(FirstStr.length+SecondStr.length+ThreeStr.length, FoureStr.length)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#FFDD00"] range:NSMakeRange(FirstStr.length+SecondStr.length+ThreeStr.length, FoureStr.length)];

    
    //第五段
    [attrStr addAttribute:NSFontAttributeName value:PFR11Font range:NSMakeRange(FirstStr.length+SecondStr.length+ThreeStr.length+FoureStr.length, FiveStr.length)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(FirstStr.length+SecondStr.length+ThreeStr.length+FoureStr.length, FiveStr.length)];

    
    return attrStr;
}
- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
    
}

@end
