//
//  JXTabBarViewController.h
//  Pods
//
//  Created by 杨建祥 on 2019/12/31.
//

#import "JXScrollViewController.h"
#import <QMUIKit/QMUIKit.h>

@interface JXTabBarViewController : JXScrollViewController <UITabBarControllerDelegate>
@property (nonatomic, strong, readonly) QMUITabBarViewController *innerTabBarController;

@end

