//
//  JXNavigator.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/5.
//

#import "JXNavigator.h"
#import <JLRoutes/JLRoutes.h>
#import "JXConst.h"
#import "JXBaseViewController.h"
#import "JXNavigationController.h"
#import "JXTabBarViewController.h"
#import "UIApplication+JXFrame.h"

@interface JXNavigator () <UINavigationControllerDelegate>
@property (nonatomic, strong, readwrite) UINavigationController *topNavigationController;
@property (nonatomic, strong) NSMutableArray *navigationControllers;

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

#pragma mark - Public
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

- (JXBaseViewController *)viewController:(JXBaseViewModel *)viewModel {
    NSString *name = NSStringFromClass(viewModel.class);
    NSParameterAssert([name hasSuffix:kJXVMSuffix]);
    name = [name stringByReplacingCharactersInRange:NSMakeRange(name.length - kJXVMSuffix.length, kJXVMSuffix.length) withString:kJXVCSuffix];
    Class cls = NSClassFromString(name);
    NSParameterAssert([cls isSubclassOfClass:[JXBaseViewController class]]);
    NSParameterAssert([cls instancesRespondToSelector:@selector(initWithViewModel:)]);
    return [[cls alloc] initWithViewModel:viewModel];
}

- (BOOL)routeURL:(NSURL *)URL {
    // NSURL *abc = [NSURL URLWithString:@"kujia://setting"];
    return [JLRoutes routeURL:URL];
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

