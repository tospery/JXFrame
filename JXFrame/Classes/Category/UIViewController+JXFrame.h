//
//  UIViewController+JXFrame.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/9.
//

#import <UIKit/UIKit.h>

@class JXPageViewController;

@interface UIViewController (JXFrame)

/**
 获取控制器所在的WMPageController
 */
@property (nonatomic, strong, readonly) JXPageViewController *jx_pageViewController;

@end

