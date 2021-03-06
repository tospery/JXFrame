//
//  UIViewController+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/9.
//

#import "UIViewController+JXFrame.h"
#import "JXPageViewController.h"
#import "JXTabBarViewController.h"

@implementation UIViewController (JXFrame)

- (JXPageViewController *)jx_pageViewController {
    UIViewController *parentViewController = self.parentViewController;
    while (parentViewController) {
        if ([parentViewController isKindOfClass:JXPageViewController.class]) {
            return (JXPageViewController *)parentViewController;
        }
        parentViewController = parentViewController.parentViewController;
    }
    return nil;
}

- (JXTabBarViewController *)jx_tabBarViewController {
    UIViewController *parentViewController = self.parentViewController;
    while (parentViewController) {
        if ([parentViewController isKindOfClass:JXTabBarViewController.class]) {
            return (JXTabBarViewController *)parentViewController;
        }
        parentViewController = parentViewController.parentViewController;
    }
    return nil;
}


@end
