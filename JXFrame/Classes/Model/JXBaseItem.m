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
- (instancetype)initWithModel:(JXBaseModel *)model {
    if (self = [super init]) {
        self.model = model;
    }
    return self;
}

@end
