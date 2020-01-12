//
//  JXBaseItem.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import "JXBaseItem.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface JXBaseItem ()
@property (nonatomic, strong, readwrite) JXBaseModel *model;

@end

@implementation JXBaseItem
- (instancetype)initWithModel:(JXBaseModel *)model {
    if (self = [super initWithMid:model.mid]) {
        self.model = model;
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

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    JXBaseItem *item = [super allocWithZone:zone];
    @weakify(item)
    [[item rac_signalForSelector:@selector(initWithModel:)] subscribeNext:^(id x) {
        @strongify(item)
        [item didInitialize];
    }];
    return item;
}

@end
