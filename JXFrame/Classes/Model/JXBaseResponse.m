//
//  JXBaseResponse.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/24.
//

#import "JXBaseResponse.h"

@interface JXBaseResponse ()

@end

@implementation JXBaseResponse
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"code": @"code",
        @"message": @"message"
    };
}

+ (NSString *)resultKeyPathForJSONDictionary:(NSDictionary *)JSONDictionary {
    return @"data";
}

- (BOOL)validate:(NSError *__autoreleasing *)error {
    return YES;
}

@end
