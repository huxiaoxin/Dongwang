
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (ZBKeyMapping)
- (NSDictionary *)zbRemapKeyWithMappingDictionary:(NSDictionary *)keyMappingDic removingNullValues:(BOOL)removeNulls;
@end

NS_ASSUME_NONNULL_END
