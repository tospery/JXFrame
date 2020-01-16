//
//  UIView+JXFrame.m
//  ReactHub
//
//  Created by 杨建祥 on 2019/12/30.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "UIView+JXFrame.h"
#import <QMUIKit/QMUIKit.h>

@implementation UIView (JXFrame)
- (CGFloat)jx_borderWidth {
    return self.layer.borderWidth;
}

- (void)setJx_borderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)jx_cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setJx_cornerRadius:(CGFloat)cornerRadius {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = flat(cornerRadius);
}

- (UIColor *)jx_borderColor {
    if (!self.layer.borderColor) {
        return nil;
    }
    return [[UIColor alloc] initWithCGColor:self.layer.borderColor];
}

- (void)setJx_borderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

@end
