//
//  JXNavigator.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/5.
//

#import "JXNavigator.h"
#import <JLRoutes/JLRoutes.h>
#import "JXBaseViewController.h"
#import "JXNavigationController.h"
#import "JXTabBarViewController.h"
#import "UIApplication+JXFrame.h"

@interface JXNavigator () <UINavigationControllerDelegate>
@property (nonatomic, strong, readwrite) UINavigationController *topNavigationController;
@property (nonatomic, strong) NSMutableArray *navigationControllers;
@property (nonatomic, strong) JLRoutes *router;

@end

@implementation JXNavigator

#pragma mark - Property
- (UINavigationController *)topNavigationController {
    return self.navigationControllers.lastObject;
}

- (NSMutableArray *)navigationControllers {
    if (!_navigationControllers) {
        _navigationControllers = [NSMutableArray array];
    }
    return _navigationControllers;
}

- (JLRoutes *)router {
    if (!_router) {
        NSString *urlScheme = UIApplication.sharedApplication.jx_urlScheme;
        if (urlScheme.length != 0) {
            _router = [JLRoutes routesForScheme:urlScheme];
        } else {
            _router = [JLRoutes globalRoutes];
        }
    }
    return _router;
}

#pragma mark - Private
- (JXBaseViewController *)viewController:(JXBaseViewModel *)viewModel {
    NSString *viewModelSuffix = @"ViewModel";
    NSString *viewControllerSuffix = @"ViewController";
    NSString *name = NSStringFromClass(viewModel.class);
    NSParameterAssert([name hasSuffix:viewModelSuffix]);
    name = [name stringByReplacingCharactersInRange:NSMakeRange(name.length - viewModelSuffix.length, viewModelSuffix.length) withString:viewControllerSuffix];
    Class cls = NSClassFromString(name);
    NSParameterAssert([cls isSubclassOfClass:[JXBaseViewController class]]);
    NSParameterAssert([cls instancesRespondToSelector:@selector(initWithViewModel:)]);
    return [[cls alloc] initWithViewModel:viewModel];
}

#pragma mark - Public
- (BOOL)routeURL:(NSURL *)URL {
    return [self.router routeURL:URL];
}

- (void)pushNavigationController:(UINavigationController *)navigationController {
    if ([self.navigationControllers containsObject:navigationController]) {
        return;
    }
    navigationController.delegate = self;
    [self.navigationControllers addObject:navigationController];
}

- (UINavigationController *)popNavigationController {
    UINavigationController *navigationController = self.topNavigationController;
    [self.navigationControllers removeLastObject];
    return navigationController;
}

#pragma mark - Delegate
#pragma mark JXNavigationProtocol
- (void)pushViewModel:(JXBaseViewModel *)viewModel animated:(BOOL)animated {
    UIViewController *viewController = (UIViewController *)[self viewController:viewModel];
    [self.topNavigationController pushViewController:viewController animated:animated];
}

- (void)popViewModelAnimated:(BOOL)animated {
    [self.topNavigationController popViewControllerAnimated:animated];
}

- (void)popToRootViewModelAnimated:(BOOL)animated {
    [self.topNavigationController popToRootViewControllerAnimated:animated];
}

- (void)presentViewModel:(JXBaseViewModel *)viewModel animated:(BOOL)animated completion:(JXVoidBlock)completion {
    UIViewController *viewController = (UIViewController *)[self viewController:viewModel];
    UINavigationController *presentingViewController = self.topNavigationController;
    if (![viewController isKindOfClass:UINavigationController.class]) {
        viewController = [[JXNavigationController alloc] initWithRootViewController:viewController];
    }
    [self pushNavigationController:(JXNavigationController *)viewController];
    [presentingViewController presentViewController:viewController animated:animated completion:completion];
}

- (void)dismissViewModelAnimated:(BOOL)animated completion:(JXVoidBlock)completion {
    UINavigationController *dismissingViewController = self.topNavigationController;
    [self popNavigationController];
    [dismissingViewController dismissViewControllerAnimated:animated completion:completion];
}

- (void)resetRootViewModel:(JXBaseViewModel *)viewModel {
    [self.navigationControllers removeAllObjects];
    
    UIViewController *viewController = (UIViewController *)[self viewController:viewModel];
    if (![viewController isKindOfClass:[UINavigationController class]] &&
        ![viewController isKindOfClass:[UITabBarController class]] &&
        ![viewController isKindOfClass:[JXTabBarViewController class]]) {
        viewController = [[JXNavigationController alloc] initWithRootViewController:viewController];
        [self pushNavigationController:(UINavigationController *)viewController];
    }
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    window.rootViewController = viewController;
    [window makeKeyAndVisible];
}

#pragma mark - Class
+ (instancetype)share {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

@end

