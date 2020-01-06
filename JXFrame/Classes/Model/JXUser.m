//
//  JXUser.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/5.
//

#import "JXUser.h"
#import "JXConst.h"
#import "JXFunc.h"

//JXUser *gUser;

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

+ (instancetype)current {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = NSClassFromString(@"User");
        SEL sel = NSSelectorFromString(@"cachedObject");
        if (cls && sel && [cls respondsToSelector:sel]) {
            instance = ((id (*)(id, SEL))[cls methodForSelector:sel])(cls, sel);
            if (!instance) {
                instance = [[cls alloc] init];
            }
        } else {
            instance = [[self.class alloc] init];
        }
    });
    return instance;
}

@end
