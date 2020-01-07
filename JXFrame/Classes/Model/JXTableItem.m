//
//  JXTableItem.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import "JXTableItem.h"
#import <QMUIKit/QMUIKit.h>

@interface JXTableItem ()

@end

@implementation JXTableItem
- (instancetype)initWithModel:(JXBaseModel *)model {
    if (self = [super initWithModel:model]) {
        self.cellHeight = flat(44);
    }
    return self;
}

@end
