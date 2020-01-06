//
//  JXAppDependency.h
//  Pods
//
//  Created by 杨建祥 on 2019/12/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXAppDependency : NSObject
@property (nonatomic, strong, readonly) UIWindow *window;

- (instancetype)initWithWindow:(UIWindow *)window;

- (void)setupFrame;
- (void)setupVendor;
- (void)setupAppearance;
- (void)setupData;

- (void)entryDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (void)leaveDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

- (void)applicationWillResignActive:(UIApplication *)application;
- (void)applicationDidEnterBackground:(UIApplication *)application;
- (void)applicationWillEnterForeground:(UIApplication *)application;
- (void)applicationDidBecomeActive:(UIApplication *)application;
- (void)applicationWillTerminate:(UIApplication *)application;

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url;
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation;
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;

@end

NS_ASSUME_NONNULL_END
