//
//  JXFunc.h
//  JXFrame
//
//  Created by 杨建祥 on 2019/12/30.
//

#ifndef JXFunc_h
#define JXFunc_h

#import <QMUIKit/QMUIKit.h>
#import <DKNightVersion/DKNightVersion.h>
#import "NSURL+JXFrame.h"
#import "UIColor+JXFrame.h"
#import "UIFont+JXFrame.h"
#import "UIImage+JXFrame.h"
#import "NSDictionary+JXFrame.h"

#pragma mark - 标准尺寸
#define JXScreenWidth                       ScreenBoundsSize.width
#define JXScreenHeight                      ScreenBoundsSize.height
#define JXStatusBarHeight                   StatusBarHeight
#define JXStatusBarHeightConstant           StatusBarHeightConstant
#define JXNavBarHeight                      NavigationBarHeight
#define JXNavContentTop                     NavigationContentTop
#define JXNavContentTopConstant             NavigationContentTopConstant
#define JXTabBarHeight                      TabBarHeight
#define JXToolBarHeight                     ToolBarHeight

#pragma mark - 安全区域
#define JXSafeArea                          SafeAreaInsetsConstantForDeviceWithNotch
#define JXSafeBottom                        JXSafeArea.bottom

#pragma mark - 颜色
#pragma mark 函数
#define JXColorRGB(r, g, b)                 (UIColorMake((r), (g), (b)))
#define JXColorRGBA(r, g, b, a)             (UIColorMakeWithRGBA((r), (g), (b), (a)))
#define JXColorVal(hexValue)                ([UIColor jx_colorWithHex:(hexValue)])
#define JXColorStr(hexString)               ([UIColor qmui_colorWithHexString:(hexString)])
#define JXColorKey(t)                       (DKColorPickerWithKey(t)(self.dk_manager.themeVersion))
#pragma mark 黑白
#define JXColorClear                        (UIColorMakeWithRGBA(255, 255, 255, 0))
#define JXColorWhite                        (UIColorMake(255, 255, 255))
#define JXColorBlack                        (UIColorMake(0, 0, 0))

#pragma mark - 字体
#define JXFont(x)                           ([UIFont jx_normal:(x)])
#define JXFontBold(x)                       ([UIFont jx_bold:(x)])
#define JXFontLight(x)                      ([UIFont jx_light:(x)])

#pragma mark - 字体
#define JXImageLoading          (JXFrameManager.share.loadingImage)
#define JXImageWaiting          (JXFrameManager.share.waitingImage)

#pragma mark - 日志
#define JXLog(name, fmt, ...)               QMUILog((name), fmt, ##__VA_ARGS__)
#define JXLogInfo(name, fmt, ...)           QMUILogInfo((name), fmt, ##__VA_ARGS__)
#define JXLogWarn(name, fmt, ...)           QMUILogWarn((name), fmt, ##__VA_ARGS__)

#pragma mark - 便捷方法
#define JXStrWithBool(x)                    ((x) ? @"YES" : @"NO")
#define JXStrWithInt(x)                     ([NSString stringWithFormat:@"%llu", ((unsigned long long)x)])
#define JXStrWithFlt(x)                     ([NSString stringWithFormat:@"%.2f", (x)])
#define JXStrWithFmt(fmt, ...)              ([NSString stringWithFormat:(fmt), ##__VA_ARGS__])
#define JXURLWithStr(x)                     ([NSURL jx_urlWithString:(x)])
#define JXImageColor(x)                     ([UIImage qmui_imageWithColor:(x)])
#define JXImageBundle(x)                    ([UIImage jx_imageInBundle:JXStrWithFmt(@"JXFrame/%@", (x))])
#define JXRandomNumber(x, y)                ((NSInteger)((x) + (arc4random() % ((y) - (x) + 1))))

#pragma mark - 便捷属性
#define JXPageAutomaticDimension            (-1)
#define JXAppWindow                         (UIApplication.sharedApplication.delegate.window)

#pragma mark - 本地化
#ifdef JXEnableFuncLocalize
#define JXT(local, display)                 (local)
#else
#define JXT(local, display)                 (display)
#endif

//// scale - 高宽比
//func metric(scale: CGFloat) -> CGFloat {
//    return flat(UIScreen.main.bounds.size.width * scale)
//}
//
//// value - 375标准
//func metric(_ value: CGFloat) -> CGFloat {
//    return flat(value / 375.f * UIScreen.width)
//}

#pragma mark - 尺寸
CG_INLINE CGFloat
JXMetric(CGFloat value) {
    return flat(value / 375.f * JXScreenWidth);
}

CG_INLINE CGFloat
JXScale(CGFloat value) {
    return flat(value * JXScreenWidth);
}

#pragma mark - 通知
CG_INLINE void
JXAddObserver(NSString *name, id observer, SEL selector, id object) {
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:name object:object];
}

CG_INLINE void
JXNotify(NSString *notificationName, id object, NSDictionary *userInfo) {
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:object userInfo:userInfo];
}

CG_INLINE void
JXRemoveObserver(id observer) {
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}

#pragma mark - 默认
CG_INLINE BOOL
JXBoolWithDft(BOOL value, BOOL dft) {
    if (value == NO) {
        return dft;
    }
    
    return value;
}

CG_INLINE NSInteger
JXIntWithDft(NSInteger value, NSInteger dft) {
    if (value == 0) {
        return dft;
    }
    
    return value;
}

CG_INLINE id
JXObjWithDft(id value, id dft) {
    if (value == nil || [value isKindOfClass:[NSNull class]]) {
        return dft;
    }
    
    return value;
}

CG_INLINE NSString *
JXStrWithDft(NSString *value, NSString *dft) {
    if (![value isKindOfClass:[NSString class]]) {
        return dft;
    }
    
    if (value.length == 0) {
        return dft;
    }
    
    return value;
}

CG_INLINE NSArray *
JXArrWithDft(NSArray *value, NSArray *dft) {
    if (![value isKindOfClass:[NSArray class]]) {
        return dft;
    }
    
    if (value.count == 0) {
        return dft;
    }
    
    return value;
}

#pragma mark - 成员
CG_INLINE BOOL
JXBoolMember(NSDictionary *dict, NSString *key, BOOL dft) {
    if (!dict || ![dict isKindOfClass:NSDictionary.class] || !dict.count) {
        return dft;
    }
    return [dict jx_numberForKey:key withDefault:@(dft)].boolValue;
}

CG_INLINE NSInteger
JXIntMember(NSDictionary *dict, NSString *key, NSInteger dft) {
    if (!dict || ![dict isKindOfClass:NSDictionary.class] || !dict.count) {
        return dft;
    }
    return [dict jx_numberForKey:key withDefault:@(dft)].integerValue;
}

CG_INLINE NSString *
JXStrMember(NSDictionary *dict, NSString *key, NSString *dft) {
    if (!dict || ![dict isKindOfClass:NSDictionary.class] || !dict.count) {
        return dft;
    }
    return [dict jx_stringForKey:key withDefault:dft];
}

CG_INLINE NSArray *
JXArrMember(NSDictionary *dict, NSString *key, NSArray *dft) {
    if (!dict || ![dict isKindOfClass:NSDictionary.class] || !dict.count) {
        return dft;
    }
    return [dict jx_arrayForKey:key withDefault:dft];
}

CG_INLINE NSDictionary *
JXDictMember(NSDictionary *dict, NSString *key, NSDictionary *dft) {
    if (!dict || ![dict isKindOfClass:NSDictionary.class] || !dict.count) {
        return dft;
    }
    return [dict jx_dictionaryForKey:key withDefault:dft];
}

CG_INLINE id
JXObjMember(NSDictionary *dict, NSString *key, id dft) {
    if (!dict || ![dict isKindOfClass:NSDictionary.class] || !dict.count) {
        return dft;
    }
    return [dict jx_objectForKey:key withDefault:dft];
}

CG_INLINE UIColor *
JXColorMember(NSDictionary *dict, NSString *key, UIColor *dft) {
    if (!dict || ![dict isKindOfClass:NSDictionary.class] || !dict.count) {
        return dft;
    }
    id value = JXObjMember(dict, key, dft);
    if ([value isKindOfClass:UIColor.class]) {
        return value;
    }else if ([value isKindOfClass:NSString.class]) {
        return JXObjWithDft(JXColorStr(value), dft);
    }
    return dft;
}

CG_INLINE NSURL *
JXURLMember(NSDictionary *dict, NSString *key, NSURL *dft) {
    if (!dict || ![dict isKindOfClass:NSDictionary.class] || !dict.count) {
        return dft;
    }
    id value = JXObjMember(dict, key, dft);
    if ([value isKindOfClass:NSURL.class]) {
        return value;
    }else if ([value isKindOfClass:NSString.class]) {
        return JXObjWithDft(JXURLWithStr(value), dft);
    }
    return dft;
}

#pragma mark - 其他
CG_INLINE NSArray *
JXDataSource(NSArray *arr) {
    if (!arr ||
        ![arr isKindOfClass:NSArray.class]) {
        return nil;
    }
    return @[arr];
}

#endif /* JXFunc_h */
