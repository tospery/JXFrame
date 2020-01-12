//
//  JXUser.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/5.
//

#import "JXUser.h"
#import "JXConst.h"
#import "JXFunction.h"

@interface JXUser ()

@end

@implementation JXUser
// YJX_TODO 使用keyvalues的方式设置属性
- (void)login:(JXUser *)user {
    [self updateMid:user.mid];
    JXNotify(kJXUserWillLoginNotification, self, nil);
    self.isLogined = YES;
    JXNotify(kJXUserDidLoginNotification, self, nil);
}

- (void)logout {
    [self updateMid:nil];
    JXNotify(kJXUserWillLogoutNotification, self, nil);
    self.isLogined = NO;
    JXNotify(kJXUserDidLogoutNotification, self, nil);
}

@end
