//
//  NSString+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/5.
//

#import "NSString+JXFrame.h"

@implementation NSString (JXFrame)

+ (NSString *)jx_stringWithObject:(id)value {
    if ([value isKindOfClass:NSString.class]) {
        return value;
    }else if ([value isKindOfClass:NSNumber.class]) {
        NSNumber *number = (NSNumber *)value;
        return number.stringValue;
    }
    return nil;
}

// YJX_TODO 兼容性，变为属性
- (NSString *)jx_urlEncoded {
    NSString *str = [self jx_urlDecoded]; // 避免两次encode
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    NSString *result = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (__bridge CFStringRef)str, NULL, NULL, kCFStringEncodingUTF8));
#pragma clang diagnostic pop
    return result;
}

- (NSString *)jx_urlDecoded {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    NSString *result = CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)self, CFSTR(""), kCFStringEncodingUTF8));
#pragma clang diagnostic pop
    return result;
}

- (NSString *)jx_urlComponentEncoded {
    NSString *str = [self jx_urlComponentDecoded]; // 避免两次encode
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    NSString *result = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,(__bridge CFStringRef)str, NULL,(CFStringRef)@":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`",kCFStringEncodingUTF8));
#pragma clang diagnostic pop
    return result;
}

- (NSString *)jx_urlComponentDecoded {
    return [self jx_urlDecoded];
}

@end
