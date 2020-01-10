//
//  JXUser.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/5.
//

#import "JXBaseModel.h"

@interface JXUser : JXBaseModel
@property (nonatomic, assign) BOOL isLogined;

- (void)login:(JXUser *)user;
- (void)logout;

@end

