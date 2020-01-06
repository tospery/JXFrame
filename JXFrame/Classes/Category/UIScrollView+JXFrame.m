//
//  UIScrollView+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/3.
//

#import "UIScrollView+JXFrame.h"
#import <objc/runtime.h>
#import <QMUIKit/QMUIKit.h>

@implementation UIScrollView (JXFrame)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ExchangeImplementations([self class], @selector(setFrame:), @selector(jx_setFrame:));
    });
}

- (void)jx_setFrame:(CGRect)frame {
    [self jx_setFrame:frame];
    self.jx_contentView.frame = self.bounds;
}

static char kAssociatedObjectKey_contentView;
- (void)setJx_contentView:(UIView *)jx_contentView {
    UIView *contentView = self.jx_contentView;
    if (contentView) {
        [contentView removeFromSuperview];
    }
    if (jx_contentView) {
        [self addSubview:jx_contentView];
        jx_contentView.frame = self.bounds;
    }
    objc_setAssociatedObject(self, &kAssociatedObjectKey_contentView, jx_contentView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)jx_contentView {
    return (UIView *)objc_getAssociatedObject(self, &kAssociatedObjectKey_contentView);
}

@end
