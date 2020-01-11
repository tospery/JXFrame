//
//  UIFont+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/3.
//

#import "UIFont+JXFrame.h"
#import <QMUIKit/QMUIKit.h>
#import "JXFrameManager.h"

@implementation UIFont (JXFrame)

+ (UIFont *)jx_normal:(CGFloat)size {
    return [UIFont systemFontOfSize:(size + JXFrameManager.share.fontScale)];
}

+ (UIFont *)jx_bold:(CGFloat)size {
    return [UIFont boldSystemFontOfSize:(size + JXFrameManager.share.fontScale)];
}

+ (UIFont *)jx_light:(CGFloat)size {
    return [UIFont qmui_lightSystemFontOfSize:(size + JXFrameManager.share.fontScale)];
}

@end
