//
//  StartPageCell.m
//  引导启动页
//
//  Created by 顾成辉 on 2017/8/14.
//  Copyright © 2017年 zimo. All rights reserved.
//

#import "StartPageCell.h"
@interface StartPageCell ()
@property (strong, nonatomic)  UIImageView *imageView;

@end
@implementation StartPageCell

- (instancetype)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [self addSubview:self.imageView];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
//    self.tipsButton.hidden = YES;
}


- (void)cellDataWithImageNames:(NSArray *)imageNames indexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < imageNames.count && indexPath.row != imageNames.count) {
         _imageView.image = [UIImage imageNamed:imageNames[indexPath.row]];
    }

}


@end
