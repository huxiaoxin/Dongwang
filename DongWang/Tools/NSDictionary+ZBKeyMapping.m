

#import "NSDictionary+ZBKeyMapping.h"



@implementation NSDictionary (ZBKeyMapping)
- (NSDictionary *)zbRemapKeyWithMappingDictionary:(NSDictionary *)keyMappingDic removingNullValues:(BOOL)removeNulls {
    __block NSMutableDictionary *newDictionary = [NSMutableDictionary dictionaryWithCapacity:[self count]];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (removeNulls) {
            if ([obj isEqual:[NSNull null]]) {
                return;
            }
        }
        
        id newKey = keyMappingDic[key];
        if (!newKey) {
            [newDictionary setObject:obj forKey:key];
        } else {
            [newDictionary setObject:obj forKey:newKey];
        }
    }];
    return [newDictionary copy];
}
@end
