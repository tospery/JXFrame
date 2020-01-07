//
//  NSArray+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import "NSArray+JXFrame.h"

@implementation NSArray (JXFrame)
- (id)jx_objectAtIndex:(NSInteger)index {
    if (index <= -1 || index >= self.count) {
        return nil;
    }
    return [self objectAtIndex:index];
}

- (BOOL)jx_containsObject:(id)object {
    BOOL result = NO;
    for (id obj in self) {
        if (obj == object) {
            result = YES;
            break;
        }
    }
    return result;
}


@end
