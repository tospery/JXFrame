//
//  NSObject+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import "NSObject+JXFrame.h"
#import <Mantle/Mantle.h>

@implementation NSObject (JXFrame)

- (NSString *)jx_className {
    return self.class.jx_className;
}

+ (NSString *)jx_className {
    return NSStringFromClass(self);
}

- (NSData *)jx_JSONData {
    if ([self isKindOfClass:[NSString class]]) {
        return [((NSString *)self) dataUsingEncoding:NSUTF8StringEncoding];
    } else if ([self isKindOfClass:[NSData class]]) {
        return (NSData *)self;
    }
    
    return [NSJSONSerialization dataWithJSONObject:[self jx_JSONObject] options:kNilOptions error:nil];
}

- (id)jx_JSONObject {
    if ([self isKindOfClass:[NSString class]]) {
        return [NSJSONSerialization JSONObjectWithData:[((NSString *)self) dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
    } else if ([self isKindOfClass:[NSData class]]) {
        return [NSJSONSerialization JSONObjectWithData:(NSData *)self options:kNilOptions error:nil];
    }
    
    if ([self conformsToProtocol:@protocol(MTLModel)]) {
        return [(id<MTLModel>)self dictionaryValue];
    }
    
    return nil;
}

- (NSString *)jx_JSONString {
    if ([self isKindOfClass:[NSString class]]) {
        return (NSString *)self;
    } else if ([self isKindOfClass:[NSData class]]) {
        return [[NSString alloc] initWithData:(NSData *)self encoding:NSUTF8StringEncoding];
    }
    
    return [[NSString alloc] initWithData:[self jx_JSONData] encoding:NSUTF8StringEncoding];
}

@end
