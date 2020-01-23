//
//  NSError+JXFrame.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/11.
//

#import <UIKit/UIKit.h>
#import "JXType.h"

//NSString * JXErrorCodeString(JXErrorCode code);

@interface NSError (JXFrame)
// jx_isNetwork, jx_isServer YJX_TODO
@property (nonatomic, strong, readonly) NSString *jx_retryTitle;
@property (nonatomic, strong, readonly) NSString *jx_displayTitle;
@property (nonatomic, strong, readonly) NSString *jx_displayMessage;
@property (nonatomic, strong, readonly) UIImage *jx_displayImage;

- (NSError *)jx_adaptError;

//- (NSString *)jx_retryTitle;
//- (UIImage *)jx_reasonImage;

//+ (NSError *)jx_errorWithCode:(JXErrorCode)code;
+ (NSError *)jx_errorWithCode:(NSInteger)code description:(NSString *)description;

@end

