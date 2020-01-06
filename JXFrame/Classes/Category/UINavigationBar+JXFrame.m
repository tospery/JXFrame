//
//  UINavigationBar+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/3.
//

#import "UINavigationBar+JXFrame.h"
#import <QMUIKit/QMUIKit.h>

@implementation UINavigationBar (JXFrame)
- (void)jx_transparet {
    self.translucent = YES;
    self.qmui_backgroundView.hidden = YES;
    self.qmui_backgroundContentView.hidden = YES;
    self.qmui_shadowImageView.hidden = YES;
    [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

- (void)jx_reset {
    self.translucent = NO;
    self.qmui_backgroundView.hidden = NO;
    self.qmui_backgroundContentView.hidden = NO;
    self.qmui_shadowImageView.hidden = NO;
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
}

@end
