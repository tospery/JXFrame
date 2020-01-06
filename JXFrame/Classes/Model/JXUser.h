//
//  JXUser.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/5.
//

#import "JXBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JXUser : JXBaseModel
@property (nonatomic, assign) BOOL isLogined;

- (void)login:(JXUser *)user;
- (void)logout;

+ (instancetype)current;

@end

NS_ASSUME_NONNULL_END
