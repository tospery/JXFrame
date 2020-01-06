//
//  NSString+JXFrame.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JXFrame)

- (NSString *)jx_urlEncoded;
- (NSString *)jx_urlDecoded;
- (NSString *)jx_urlComponentEncoded;
- (NSString *)jx_urlComponentDecoded;

+ (NSString *)jx_stringWithObject:(id)value;

@end

NS_ASSUME_NONNULL_END
