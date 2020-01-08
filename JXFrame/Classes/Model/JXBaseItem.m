//
//  JXBaseItem.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import "JXBaseItem.h"

@interface JXBaseItem ()
@property (nonatomic, strong, readwrite) JXBaseModel *model;

@end

@implementation JXBaseItem
- (instancetype)init {
    if (self = [super init]) {
        [self didInitialize];
    }
    return self;
}

- (instancetype)initWithModel:(JXBaseModel *)model {
    if (self = [super init]) {
        self.model = model;
        [self didInitialize];
    }
    return self;
}

- (void)didInitialize {
    
}

- (BOOL)isEqual:(id)object {
    if (!object || ![object isKindOfClass:JXBaseItem.class]) {
        return NO;
    }
    if (self == object) {
        return NO;
    }
    JXBaseItem *item = (JXBaseItem *)object;
    return [self.model isEqual:item.model];
}

@end
