#import <UIKit/UIKit.h>
@interface NSObject (SSAdd)
+(CGRect)getRectWith:(NSString *)string width:(CGFloat)width font:(UIFont *)font spacing:(CGFloat)spacing Row:(CGFloat)row;
+(CGRect)getRectWith:(NSMutableAttributedString *)string width:(CGFloat)width;
@end
