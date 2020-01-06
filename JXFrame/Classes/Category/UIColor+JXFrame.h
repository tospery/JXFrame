//
//  UIColor+JXFrame.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (JXFrame)
+ (UIColor *)jx_colorWithHex:(NSInteger)hexValue;
+ (UIColor *)jx_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
