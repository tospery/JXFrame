//
//  NSError+JXFrame.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/11.
//

#import <UIKit/UIKit.h>
#import "JXType.h"

NSString * JXErrorCodeString(JXErrorCode code);

@interface NSError (JXFrame)
- (NSError *)jx_adaptError;

- (NSString *)jx_retryTitle;
- (UIImage *)jx_reasonImage;

+ (NSError *)jx_errorWithCode:(JXErrorCode)code;
+ (NSError *)jx_errorWithCode:(NSInteger)code description:(NSString *)description;

@end

