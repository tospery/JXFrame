//
//  JXAppDependency.m
//  Pods
//
//  Created by 杨建祥 on 2019/12/30.
//

#import "JXAppDependency.h"
#import <JLRoutes/JLRoutes.h>
#import "JXUser.h"

//extern JXUser *gUser;

@interface JXAppDependency ()
@property (nonatomic, strong, readwrite) UIWindow *window;

@end

@implementation JXAppDependency
#pragma mark - Init
- (instancetype)initWithWindow:(UIWindow *)window {
    if (self = [super init]) {
        self.window = window;
        [self setupFrame];
        [self setupVendor];
        [self setupAppearance];
        [self setupData];
    }
    return self;
}

#pragma mark - Setup
- (void)setupFrame {
    
}

- (void)setupVendor {
    
}

- (void)setupAppearance {
    
}

- (void)setupData {
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
//    Class cls = NSClassFromString(@"User");
//    gUser = [cls cachedObject];
//    if (!gUser) {
//        gUser = [[cls alloc] init];
//    }
//#pragma clang diagnostic pop
//    Class cls = NSClassFromString(@"User");
//    SEL sel = NSSelectorFromString(@"cachedObject");
//    if (cls && sel && [cls respondsToSelector:sel]) {
//        gUser = ((id (*)(id, SEL))[cls methodForSelector:sel])(cls, sel);
//        if (!gUser) {
//            gUser = [[cls alloc] init];
//        }
//    } else {
//        gUser = [[JXUser alloc] init];
//    }
//    NSLog(@"");
}

#pragma mark - Launch
- (void)entryDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
}

- (void)leaveDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
}

#pragma mark - Status
- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [JXUser.current saveWithKey:nil];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // DDLogDebug(@"【TBFrame】disk = %@", NSHomeDirectory());
    NSLog(@"【JXFrame】disk = %@", NSHomeDirectory()); // YJX_TODO
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [JXUser.current saveWithKey:nil];
}

#pragma mark - URL
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [JLRoutes routeURL:url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation {
    return [JLRoutes routeURL:url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    return [JLRoutes routeURL:url];
}

@end
