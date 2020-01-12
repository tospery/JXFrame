//
//  JXBaseItem.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import "JXObject.h"
#import "JXBaseModel.h"

@interface JXBaseItem : JXObject
@property (nonatomic, strong, readonly) JXBaseModel *model;

- (instancetype)initWithMid:(NSString *)mid NS_UNAVAILABLE;
- (instancetype)initWithModel:(JXBaseModel *)model;

- (void)didInitialize;

@end

