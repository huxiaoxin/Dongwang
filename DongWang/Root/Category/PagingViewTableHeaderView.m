//
//  PagingViewTableHeaderView.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/27.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "PagingViewTableHeaderView.h"

@interface PagingViewTableHeaderView()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) CGRect imageViewFrame;
@property (nonatomic, strong) UILabel *nickLabel;
@end

@implementation PagingViewTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"任务"]];
//        self.imageView.clipsToBounds = YES;
        self.imageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
//        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.imageView];
        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

        UILabel * DongwnagMsglb = [[UILabel alloc]initWithFrame:CGRectMake(0, K(35), SCREEN_WIDTH, K(34))];
        DongwnagMsglb.textAlignment = NSTextAlignmentCenter;
        DongwnagMsglb.font = KBlFont(font(24));
        DongwnagMsglb.textColor = [UIColor whiteColor];
        DongwnagMsglb.text = @"做任务，赚好礼";
//        [self.imageView addSubview:DongwnagMsglb];
        
        UIButton * DongwangbackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [DongwangbackBtn sizeToFit];
        DongwangbackBtn.origin = CGPointMake(RealWidth(15), StatuBar_Height+RealWidth(3));
        [DongwangbackBtn setImage:[UIImage imageNamed:@"btn_back_white"] forState:UIControlStateNormal];
        [DongwangbackBtn setEnlargeEdgeWithTop:10 right:10 bottom:10 left:10];
        [DongwangbackBtn addTarget:self action:@selector(DongwangbackBtnClicks) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:DongwangbackBtn];

      
    }
    return self;
}
-(void)DongwangbackBtnClicks{
    [self.delegate PagingViewTableHeaderViewbackActon];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageViewFrame = self.bounds;
}

- (void)scrollViewDidScroll:(CGFloat)contentOffsetY {
    CGRect frame = self.imageViewFrame;
    frame.size.height -= contentOffsetY;
    frame.origin.y = contentOffsetY;
    self.imageView.frame = frame;
}


@end
