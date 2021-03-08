//
//  MyImgCollectionViewCell.m
//  MofangPhoto
//
//  Created by codehzx on 2020/12/12.
//

#import "MyImgCollectionViewCell.h"
#import <Masonry-umbrella.h>
@implementation MyImgCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.myimgeView = [[UIImageView alloc]init];
        [self addSubview:self.myimgeView];
        [self.myimgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.width.height.mas_equalTo(self);

        }];
    }
    return self;
}
- (UICollectionViewLayoutAttributes*)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes*)layoutAttributes {
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize: layoutAttributes.size];
    CGRect cellFrame = layoutAttributes.frame;
    cellFrame.size.height= size.height;
    layoutAttributes.frame= cellFrame;
    return layoutAttributes;
}
@end
