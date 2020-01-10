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

- (void)login:(JXUser *)user {
    self.mid = user.mid;
    JXNotify(kJXUserWillLoginNotification, self, nil);
    self.isLogined = YES;
    JXNotify(kJXUserDidLoginNotification, self, nil);
}

- (void)logout {
    self.mid = nil;
    JXNotify(kJXUserWillLogoutNotification, self, nil);
    self.isLogined = NO;
    JXNotify(kJXUserDidLogoutNotification, self, nil);
}

@end
