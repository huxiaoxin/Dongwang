#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (StringSize)
- (CGSize)cxl_sizeWithString:(UIFont *)font;
- (CGRect)cxl_sizeWithMoreString:(UIFont *)font maxWidth:(CGFloat)width;
- (NSDictionary *)dictionaryWithJsonString;
- (NSString *)changeToHexFromString;  
- (NSString *)changeToStringFromHex;    
- (NSString *)changeToDecimalFromHex;  
+ (BOOL)stringContainsEmoji:(NSString *)string; 
@end
