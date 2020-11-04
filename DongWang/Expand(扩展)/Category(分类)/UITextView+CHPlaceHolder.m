//
//  UITextView+CHPlaceHolder.m
//  SYQuMinApp
//
//  Created by apple on 2018/4/26.
//  Copyright © 2018年 Shuyun. All rights reserved.
//

#import "UITextView+CHPlaceHolder.h"
#import <objc/runtime.h>
static const void *ch_placeHolderKey;
@interface UITextView ()
@property (nonatomic, readonly) UILabel *ch_placeHolderLabel;
@end
@implementation UITextView (CHPlaceHolder)
+(void)load{
    [super load];
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"layoutSubviews")),
                                   class_getInstanceMethod(self.class, @selector(chPlaceHolder_swizzling_layoutSubviews)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
                                   class_getInstanceMethod(self.class, @selector(chPlaceHolder_swizzled_dealloc)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"setText:")),
                                   class_getInstanceMethod(self.class, @selector(chPlaceHolder_swizzled_setText:)));
}
#pragma mark - swizzled
- (void)chPlaceHolder_swizzled_dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self chPlaceHolder_swizzled_dealloc];
}
- (void)chPlaceHolder_swizzling_layoutSubviews {
    if (self.ch_placeHolder) {
        UIEdgeInsets textContainerInset = self.textContainerInset;
        CGFloat lineFragmentPadding = self.textContainer.lineFragmentPadding;
        CGFloat x = lineFragmentPadding + textContainerInset.left + self.layer.borderWidth;
        CGFloat y = textContainerInset.top + self.layer.borderWidth;
        CGFloat width = CGRectGetWidth(self.bounds) - x - textContainerInset.right - 2*self.layer.borderWidth;
        CGFloat height = [self.ch_placeHolderLabel sizeThatFits:CGSizeMake(width, 0)].height;
        self.ch_placeHolderLabel.frame = CGRectMake(x, y, width, height);
    }
    [self chPlaceHolder_swizzling_layoutSubviews];
}
- (void)chPlaceHolder_swizzled_setText:(NSString *)text{
    [self chPlaceHolder_swizzled_setText:text];
    if (self.ch_placeHolder) {
        [self updatePlaceHolder];
    }
}
#pragma mark - associated
-(NSString *)ch_placeHolder{
    return objc_getAssociatedObject(self, &ch_placeHolderKey);
}
-(void)setCh_placeHolder:(NSString *)ch_placeHolder{
    objc_setAssociatedObject(self, &ch_placeHolderKey, ch_placeHolder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updatePlaceHolder];
}
-(UIColor *)ch_placeHolderColor{
    return self.ch_placeHolderLabel.textColor;
}
-(void)setCh_placeHolderColor:(UIColor *)ch_placeHolderColor{
    self.ch_placeHolderLabel.textColor = ch_placeHolderColor;
}
-(NSString *)placeholder{
    return self.ch_placeHolder;
}
-(void)setPlaceholder:(NSString *)placeholder{
    self.ch_placeHolder = placeholder;
}
#pragma mark - update
- (void)updatePlaceHolder{
    if (self.text.length) {
        [self.ch_placeHolderLabel removeFromSuperview];
        return;
    }
    self.ch_placeHolderLabel.font = self.font?self.font:self.cacutDefaultFont;
    self.ch_placeHolderLabel.textAlignment = self.textAlignment;
    self.ch_placeHolderLabel.text = self.ch_placeHolder;
    [self insertSubview:self.ch_placeHolderLabel atIndex:0];
}
#pragma mark - lazzing
-(UILabel *)ch_placeHolderLabel{
    UILabel *placeHolderLab = objc_getAssociatedObject(self, @selector(ch_placeHolderLabel));
    if (!placeHolderLab) {
        placeHolderLab = [[UILabel alloc] init];
        placeHolderLab.numberOfLines = 0;
        placeHolderLab.textColor = [UIColor lightGrayColor];
        objc_setAssociatedObject(self, @selector(ch_placeHolderLabel), placeHolderLab, OBJC_ASSOCIATION_RETAIN);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePlaceHolder) name:UITextViewTextDidChangeNotification object:self];
    }
    return placeHolderLab;
}
- (UIFont *)cacutDefaultFont{
    static UIFont *font = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UITextView *textview = [[UITextView alloc] init];
        textview.text = @" ";
        font = textview.font;
    });
    return font;
}
@end
