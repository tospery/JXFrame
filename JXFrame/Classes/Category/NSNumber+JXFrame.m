//
//  NSNumber+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/6.
//

#import "NSNumber+JXFrame.h"

@implementation NSNumber (JXFrame)

+ (NSNumber *)jx_numberWithObject:(id)value {
    if ([value isKindOfClass:NSNumber.class]) {
        return value;
    }else if ([value isKindOfClass:NSString.class]) {
        NSString *string = (NSString *)value;
        return @(string.integerValue);
    }
    return nil;
}

@end
