//
//  JXCollectionItem.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import "JXCollectionItem.h"
#import "JXFunc.h"
#import <QMUIKit/QMUIKit.h>

@interface JXCollectionItem ()

@end

@implementation JXCollectionItem
- (instancetype)initWithModel:(JXBaseModel *)model {
    if (self = [super initWithModel:model]) {
        self.cellSize = CGSizeMake(JXScreenWidth, flat(44));
    }
    return self;
}

@end
