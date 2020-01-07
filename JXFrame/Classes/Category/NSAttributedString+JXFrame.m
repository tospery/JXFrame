//
//  NSAttributedString+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import "NSAttributedString+JXFrame.h"

@implementation NSAttributedString (JXFrame)
+ (NSAttributedString *)jx_attributedStringWithString:(NSString *)string color:(UIColor *)color font:(UIFont *)font {
    if (!string || ![string isKindOfClass:NSString.class]) {
        return nil;
    }
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    if (color) {
        [attributes setObject:color forKey:NSForegroundColorAttributeName];
    }
    if (font) {
        [attributes setObject:font forKey:NSFontAttributeName];
    }
    return [[NSAttributedString alloc] initWithString:string attributes:attributes];
}

@end
