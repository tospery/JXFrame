//
//  JXBaseItem.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import <UIKit/UIKit.h>
#import "JXBaseModel.h"

@interface JXBaseItem : NSObject
@property (nonatomic, strong, readonly) JXBaseModel *model;

- (instancetype)initWithModel:(JXBaseModel *)model;

@end

