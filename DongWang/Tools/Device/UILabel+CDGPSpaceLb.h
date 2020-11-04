#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UILabel (CDGPSpaceLb)
//设置一行文字相邻间距
- (void)setText:(NSString *)text spacing:(CGFloat)spacing;
//设置行与行之间的距离
- (void)setText:(NSString *)text lineSpacing:(CGFloat)lineSpacing;
-(CGSize)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width;
@end
NS_ASSUME_NONNULL_END
