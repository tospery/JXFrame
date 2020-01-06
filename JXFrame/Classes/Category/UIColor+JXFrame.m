//
//  UIColor+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/3.
//

#import "UIColor+JXFrame.h"

@implementation UIColor (JXFrame)
+ (UIColor *)jx_colorWithHex:(NSInteger)hexValue {
    return [UIColor jx_colorWithHex:hexValue alpha:1.0];
}

+ (UIColor *)jx_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alpha {
    CGFloat red = ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0;
    CGFloat green = ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0;
    CGFloat blue = ((CGFloat)(hexValue & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
