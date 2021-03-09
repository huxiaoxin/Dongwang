//
//  UIImageView+ImgTapAction.m
//  DongWang
//
//  Created by sycm on 2021/3/9.
//

#import "UIImageView+ImgTapAction.h"
#import <objc/runtime.h>
@implementation UIImageView (ImgTapAction)
-(void)ImgTapActionWith:(imgViewTapblock)imgBlock{
    
    self.userInteractionEnabled = YES;
    objc_setAssociatedObject(self, @selector(ImgTapAction:), imgBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UITapGestureRecognizer * tapView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ImgTapAction:)];
    [self addGestureRecognizer:tapView];

}
-(void)ImgTapAction:(UITapGestureRecognizer *)imgTap{
    UIImageView * imgViews = (UIImageView *)[imgTap view];
    imgViewTapblock imgBlock =  objc_getAssociatedObject(self, _cmd);
    if (imgBlock) {
        imgBlock(imgViews);
    }

}
@end
