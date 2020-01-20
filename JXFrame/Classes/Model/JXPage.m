//
//  JXPage.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/21.
//

#import "JXPage.h"

@interface JXPage ()

@end

@implementation JXPage
- (instancetype)init {
    if (self = [super init]) {
        self.start = 1;
        self.size = 20;
        self.style = JXPageStyleGroup;
    }
    return self;
}

- (void)setStart:(NSInteger)start {
    _start = start;
    self.index = start;
}

@end
