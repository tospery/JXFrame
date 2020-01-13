//
//  UIViewController+JXFrame.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/9.
//

#import <UIKit/UIKit.h>

@class JXPageViewController;
@class JXTabBarViewController;

@interface UIViewController (JXFrame)

/**
 获取控制器所在的JXPageViewController
 */
@property (nonatomic, strong, readonly) JXPageViewController *jx_pageViewController;

/**
 获取控制器所在的JXTabBarViewController
 */
@property (nonatomic, strong, readonly) JXTabBarViewController *jx_tabBarViewController;

@end

