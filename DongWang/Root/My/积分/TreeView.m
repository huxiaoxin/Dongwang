//
//  TreeView.m
//  仿支付宝蚂蚁森林
//
//  Created by Dian Xin on 2019/1/6.
//  Copyright © 2019年 com.ovix. All rights reserved.
//

#import "TreeView.h"

#import "Config.h"

#import "TreeBtn.h"

#import <UICountingLabel/UICountingLabel.h>
#import "PurchaseCarAnimationTool.h"
#import "UIButton+ButtonAcnimatons.h"
@interface TreeView ()

@property (nonatomic, strong) NSMutableArray <NSValue *> *centerPointArr;

@property (nonatomic, strong) NSMutableArray <UIButton *> *randomBtnArr;

@property (nonatomic, strong) NSMutableArray <UIButton *> *randomBtnArrX;

@property (nonatomic, strong) NSMutableArray <UIButton *> *timeLimitedBtnArr;

@property (nonatomic, strong) NSMutableArray <UIButton *> *unlimitedBtnArr;
@property(nonatomic,strong)  UIImageView * DongwangpigImgView;
@property (nonatomic, assign) CGRect pigFrame;
@property (nonatomic, strong) UICountingLabel * DongwangMoneylb;
@end

@implementation TreeView

static NSInteger const kTimeLimitedBtnTag = 20000;
static NSInteger const kUnlimitedBtnTag = 30000;

static CGFloat const kMargin = 15.0;
static CGFloat const kBtnDiameter = 40;
static CGFloat const kBtnMinX = kBtnDiameter * 0.5 + 0;
static CGFloat const kBtnMinY = 0.0;


#pragma mark - life cycle
-(void)Updateuserintgers{
    [self realoduserInteagers];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Updateuserintgers) name:@"Updateuserintgers" object:nil];
        _pigFrame = CGRectMake(DEF_SCREEN_WIDTH/2-K(64), K(250)+StatuBar_Height-NaviH-K(106), K(122), K(106));
        UIImageView * DongwangpigImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_Width/2-K(64), K(250)+StatuBar_Height-NaviH-K(106), K(122), K(106))];
        DongwangpigImgView.image = [UIImage imageNamed:@"存钱罐"];
        [self addSubview:DongwangpigImgView];
        _DongwangpigImgView = DongwangpigImgView;
        

        UILabel  *  DongwangToplb = [[UILabel alloc]initWithFrame:CGRectMake(K(5), K(44), CGRectGetWidth(DongwangpigImgView.frame)-K(5), K(16))];
        DongwangToplb.textColor = [UIColor blackColor];
        DongwangToplb.font = KSysFont(font(11));
        DongwangToplb.text = @"我的积分";
        DongwangToplb.textAlignment = NSTextAlignmentCenter;
        [DongwangpigImgView addSubview:DongwangToplb];
        
        
        UICountingLabel * DongwangMoneylb = [[UICountingLabel alloc]initWithFrame:CGRectMake(K(5), CGRectGetMaxY(DongwangToplb.frame)+K(1), CGRectGetWidth(DongwangpigImgView.frame)-K(5), K(15))];
        DongwangMoneylb.textAlignment = NSTextAlignmentCenter;
        DongwangMoneylb.font = KBlFont(font(15));
        DongwangMoneylb.textColor = [UIColor blackColor];
        DongwangMoneylb.method = UILabelCountingMethodEaseOut;
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = kCFNumberFormatterDecimalStyle;
        DongwangMoneylb.formatBlock = ^NSString* (CGFloat value)
        {
            NSString* formatted = [formatter stringFromNumber:@((int)value)];
            return [NSString stringWithFormat:@"%@",formatted];
        };
        [DongwangpigImgView addSubview:DongwangMoneylb];
        NSInteger myIntegral = [[UserManager userInfo].myIntegral integerValue];
//        [DongwangMoneylb countFrom:0 to:myIntegral withDuration:1.5];
        DongwangMoneylb.text = [NSString stringWithFormat:@"%ld",(long)myIntegral];

        _DongwangMoneylb = DongwangMoneylb;
        
        
    }
    return self;
}
-(void)realoduserInteagers{
    NSInteger myIntegral = [[UserManager userInfo].myIntegral integerValue];
    _DongwangMoneylb.text = [NSString stringWithFormat:@"%ld",(long)myIntegral];
//    [_DongwangMoneylb countFrom:0 to:myIntegral withDuration:.9];
}
- (void)dealloc
{
    
}

#pragma mark - setter

- (void)setTimeLimitedArr:(NSArray<NSString *> *)timeLimitedArr
{
    _timeLimitedArr = timeLimitedArr;
    for (int i = 0; i < timeLimitedArr.count; i ++) {
        [self createRandomBtnWithType:FruitTypeTimeLimited andText:timeLimitedArr[i]];
    }
}

- (void)setUnimitedArr:(NSArray<NSString *> *)unimitedArr
{
    _unimitedArr = unimitedArr;
    for (int i = 0; i < unimitedArr.count; i ++) {
        [self createRandomBtnWithType:FruitTypeUnlimited andText:unimitedArr[i]];
    }
}
-(void)setTreesModelArr:(NSArray<DongwangJifenTreeModel *> *)treesModelArr{
    _treesModelArr = treesModelArr;
    for (int i = 0 ; i < treesModelArr.count; i ++) {
        [self createRandomBtnWithType:FruitTypeUnlimited andText:treesModelArr[i]];

    }
}

#pragma mark - getter

- (NSMutableArray <NSValue *> *)centerPointArr
{
    if (_centerPointArr == nil) {
        _centerPointArr = [NSMutableArray array];
    }
    return _centerPointArr;
}

- (NSMutableArray<UIButton *> *)randomBtnArr
{
    if (_randomBtnArr == nil) {
        _randomBtnArr = [NSMutableArray array];
    }
    return _randomBtnArr;
}

- (NSMutableArray<UIButton *> *)randomBtnArrX
{
    if (_randomBtnArrX == nil) {
        _randomBtnArrX = [NSMutableArray array];
    }
    return _randomBtnArrX;
}

- (NSMutableArray<UIButton *> *)timeLimitedBtnArr
{
    if (_timeLimitedBtnArr == nil) {
        _timeLimitedBtnArr = [NSMutableArray array];
    }
    return _timeLimitedBtnArr;
}

- (NSMutableArray<UIButton *> *)unlimitedBtnArr
{
    if (_unlimitedBtnArr == nil) {
        _unlimitedBtnArr = [NSMutableArray array];
    }
    return _unlimitedBtnArr;
}


#pragma mark - 随机数

- (NSInteger)getRandomNumber:(CGFloat)from to:(CGFloat)to
{
    return (NSInteger)(from + (arc4random() % ((NSInteger)to - (NSInteger)from + 1)));
}


#pragma mark - 随机按钮

- (void)createRandomBtnWithType:(FruitType)fruitType andText:(DongwangJifenTreeModel *)jifenMdoel
{
    //最小y坐标
    CGFloat minY = kBtnMinY + kBtnDiameter * 0.5 + kMargin;
    //最大y坐标
//    CGFloat maxY = self.bounds.size.height - kBtnDiameter * 0.5 - kMargin;
        CGFloat maxY = self.bounds.size.height - kBtnDiameter * 1.5  - kMargin;

    //最小x坐标
    CGFloat minX = kBtnMinX + kMargin;
    //最大x坐标
    CGFloat maxX = DEF_SCREEN_WIDTH - kBtnDiameter * 1.5  - kMargin;
    //获得随机x坐标
    CGFloat x = [self getRandomNumber:minX to:maxX];
    //获得随机y坐标
    CGFloat y = [self getRandomNumber:minY to:maxY];
    
    BOOL success = YES;
    
    CGRect  btnFrame =  CGRectMake(x, y, kBtnDiameter, kBtnDiameter);
    if (CGRectIntersectsRect(btnFrame, self.pigFrame))
    {
        success = NO;
        [self createRandomBtnWithType:fruitType andText:jifenMdoel];
        return;
    }
    if (_timeLimitedArr.count <= 5) {
        //centerPointArr装的是坐标 [NSValue valueWithCGPoint:CGPointMake(x, y)]
        for (int i = 0; i < self.centerPointArr.count; i ++) {
            NSValue *pointValue = self.centerPointArr[i];
            CGPoint point = [pointValue CGPointValue];
    
           //如果是圆 /^2 如果不是圆 不用/^2
            if (sqrt(pow(point.x - x, 2) + pow(point.y - y, 2)) <= kBtnDiameter + kMargin ) {
                success = NO;
                [self createRandomBtnWithType:fruitType andText:jifenMdoel];
                return;
            }
    
        }

    }
    
    
    
    
    
    
    
    
    if (success == YES) {
        NSValue *pointValue = [NSValue valueWithCGPoint:CGPointMake(x, y)];
        [self.centerPointArr addObject:pointValue];
        TreeBtn *randomBtn = [[TreeBtn alloc]init];
        randomBtn.numslb.text = [NSString stringWithFormat:@"%@",jifenMdoel.integral];
        randomBtn.btomlb.text = [NSString stringWithFormat:@"%@",jifenMdoel.name];
        [randomBtn setEnlargeEdgeWithTop:10 right:10 bottom:10 left:10];
        randomBtn.frame = CGRectMake(x, y, kBtnDiameter, kBtnDiameter);
//        randomBtn.center = CGPointMake(x, y);
//        [randomBtn setTitleColor:[UIColor whiteColor] forState:0];
        [self addSubview:randomBtn];
        [randomBtn addTarget:self action:@selector(randomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.randomBtnArr addObject:randomBtn];
        [self.randomBtnArrX addObject:randomBtn];
        //区分
        if (fruitType == FruitTypeTimeLimited) {
            randomBtn.tag = kUnlimitedBtnTag + self.centerPointArr.count - 1;
            [self.timeLimitedBtnArr addObject:randomBtn];
        } else if (fruitType == FruitTypeUnlimited) {
            randomBtn.tag = kTimeLimitedBtnTag + self.centerPointArr.count - 1;
            [self.unlimitedBtnArr addObject:randomBtn];
        }
        
        //添加缩放动画
//        [self animationScaleOnceWithView:randomBtn];
        //添加上下移动动画
           [self animationUpDownWithView:randomBtn];
    }
}
#pragma mark - 随机按钮被点击
- (void)randomBtnClick:(UIButton *)randomBtn
{
    CGPoint endpoint = CGPointMake(ScreenWidth/2+K(5), K(170));
    MJWeakSelf;
    [randomBtn animationStartPoint:randomBtn.origin endPoint:endpoint didStopAnimation:^{
        randomBtn.transform = CGAffineTransformMakeScale(.0, .0);
        [PurchaseCarAnimationTool shakeAnimation:weakSelf.DongwangpigImgView];
        if (randomBtn.tag >= kUnlimitedBtnTag) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(selectTimeLimitedBtnAtIndex:)]) {
                [self.delegate selectTimeLimitedBtnAtIndex:randomBtn.tag - kUnlimitedBtnTag];
            }
        } else if (randomBtn.tag >= kTimeLimitedBtnTag) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(selectUnlimitedBtnAtIndex:)]) {
                [self.delegate selectUnlimitedBtnAtIndex:randomBtn.tag - kTimeLimitedBtnTag];
            }
        }

    }];

        NSLog(@"----%@",NSStringFromCGRect(randomBtn.frame));
//    [UIView animateWithDuration:0.1 animations:^{
//        randomBtn.transform = CGAffineTransformMakeScale(1.15, 1.15);
//    } completion:^(BOOL finished) {
//        randomBtn.transform = CGAffineTransformMakeScale(1.0, 1.0);
//        [randomBtn animationStartPoint:randomBtn.origin endPoint:CGPointMake(DEF_SCREEN_WIDTH/4-K(32), K(56)) didStopAnimation:^{
//            if (randomBtn.tag >= kUnlimitedBtnTag) {
//                if (self.delegate && [self.delegate respondsToSelector:@selector(selectTimeLimitedBtnAtIndex:)]) {
//                    [self.delegate selectTimeLimitedBtnAtIndex:randomBtn.tag - kUnlimitedBtnTag];
//                }
//            } else if (randomBtn.tag >= kTimeLimitedBtnTag) {
//                if (self.delegate && [self.delegate respondsToSelector:@selector(selectUnlimitedBtnAtIndex:)]) {
//                    [self.delegate selectUnlimitedBtnAtIndex:randomBtn.tag - kTimeLimitedBtnTag];
//                }
//            }
//
//        }];
//
//

}


#pragma mark - 移除随机按钮
- (void)removeRandomIndex:(NSInteger)index
{
    UIButton *randomBtn = self.randomBtnArr[index];
    [UIView animateWithDuration:0.1 animations:^{
        randomBtn.transform = CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished) {
        [randomBtn removeFromSuperview];
        [self.randomBtnArrX removeObject:randomBtn];
        if ([self.timeLimitedBtnArr containsObject:randomBtn]) {
            [self.timeLimitedBtnArr removeObject:randomBtn];
        } else if ([self.unlimitedBtnArr containsObject:randomBtn]) {
            [self.unlimitedBtnArr removeObject:randomBtn];
        }
        if (self.timeLimitedBtnArr.count == 0 && self.unlimitedBtnArr.count == 0) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(allCollected)]) {
                [self.delegate allCollected];
            }
        }
    }];
}
- (void)removeAllRandomBtn
{
    for (int i = 0; i < self.randomBtnArr.count; i ++) {
        UIButton *randomBtn = self.randomBtnArr[i];
        [randomBtn removeFromSuperview];
    }
    self.unlimitedBtnArr = [NSMutableArray array];
    self.timeLimitedBtnArr = [NSMutableArray array];
    self.randomBtnArr = [NSMutableArray array];
    self.randomBtnArrX = [NSMutableArray array];
    self.centerPointArr = [NSMutableArray array];
}


#pragma mark - 动画

- (void)animationScaleOnceWithView:(UIView *)view
{
    [UIView animateWithDuration:0.2 animations:^{
        view.transform = CGAffineTransformMakeScale(1.05, 1.05);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            view.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:^(BOOL finished) {
        }];
    }];
}

- (void)animationUpDownWithView:(UIView *)view
{
    CALayer *viewLayer = view.layer;
    CGPoint position = viewLayer.position;
    CGPoint fromPoint = CGPointMake(position.x, position.y);
    CGPoint toPoint = CGPointZero;
    
    uint32_t typeInt = arc4random() % 100;
    CGFloat distanceFloat = 0.0;
    while (distanceFloat == 0) {
        distanceFloat = (6 + (int)(arc4random() % (9 - 7 + 1))) * 100.0 / 101.0;
    }
    if (typeInt % 2 == 0) {
        toPoint = CGPointMake(position.x, position.y - distanceFloat);
    } else {
        toPoint = CGPointMake(position.x, position.y + distanceFloat);
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fromValue = [NSValue valueWithCGPoint:fromPoint];
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    animation.autoreverses = YES;
    CGFloat durationFloat = 0.0;
    while (durationFloat == 0.0) {
        durationFloat = 0.9 + (int)(arc4random() % (100 - 70 + 1)) / 31.0;
    }
    [animation setDuration:durationFloat];
    [animation setRepeatCount:MAXFLOAT];

    [viewLayer addAnimation:animation forKey:nil];
}

@end
