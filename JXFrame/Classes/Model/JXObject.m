//
//  JXObject.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/12.
//

#import "JXObject.h"

@interface JXObject ()
@property (nonatomic, copy, readwrite) NSString *mid;

@end

@implementation JXObject
- (instancetype)initWithMid:(NSString *)mid {
    if (self = [super init]) {
        self.mid = mid;
    }
    return self;
}

- (void)updateMid:(NSString *)mid {
    self.mid = mid;
}

@end
