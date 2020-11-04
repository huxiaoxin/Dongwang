#import "NSObject+SSAdd.h"
@implementation NSObject (SSAdd)
+(CGRect)getRectWith:(NSString *)string width:(CGFloat)width font:(UIFont *)font spacing:(CGFloat)spacing Row:(CGFloat)row{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = spacing;
    CGSize constraintSize = CGSizeMake(width, CGFLOAT_MAX);
    NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading |
    NSStringDrawingUsesLineFragmentOrigin;
    NSDictionary *attributes = @{NSFontAttributeName: font ,NSParagraphStyleAttributeName:paragraphStyle,NSKernAttributeName:@(row)};
    CGRect rect = [string boundingRectWithSize:constraintSize options:options attributes:attributes context:NULL];
    return rect;
}
+(CGRect)getRectWith:(NSMutableAttributedString *)string width:(CGFloat)width{
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    NSStringDrawingOptions options = NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine;
    CGRect rect = [string boundingRectWithSize:size options:options context:NULL];
    return rect;
}
@end
