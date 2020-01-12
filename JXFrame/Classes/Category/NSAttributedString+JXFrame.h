//
//  NSAttributedString+JXFrame.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (JXFrame)
+ (NSAttributedString *)jx_attributedStringWithString:(NSString *)string;
+ (NSAttributedString *)jx_attributedStringWithString:(NSString *)string color:(UIColor *)color font:(UIFont *)font;

@end

