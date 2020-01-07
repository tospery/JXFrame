//
//  NSObject+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import "NSObject+JXFrame.h"

@implementation NSObject (JXFrame)

- (NSString *)jx_className {
    return self.class.jx_className;
}

+ (NSString *)jx_className {
    return NSStringFromClass(self);
}

@end
