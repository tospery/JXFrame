//
//  JXNavigator.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/5.
//

#import <UIKit/UIKit.h>
#import "JXNavigationProtocol.h"

@class JXBaseViewController;

@interface JXNavigator : NSObject <JXNavigationProtocol>
@property (nonatomic, strong, readonly) UINavigationController *topNavigationController;

- (void)pushNavigationController:(UINavigationController *)navigationController;
- (UINavigationController *)popNavigationController;

- (JXBaseViewController *)viewController:(JXBaseViewModel *)viewModel;

- (BOOL)canRouteURL:(NSURL *)URL;
- (BOOL)routeURL:(NSURL *)URL;
- (BOOL)routeNativeURL:(NSURL *)nativeURL withWebURL:(NSURL *)webURL;

+ (instancetype)share;

@end

