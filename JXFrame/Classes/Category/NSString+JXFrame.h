//
//  NSString+JXFrame.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/5.
//

#import <UIKit/UIKit.h>

@interface NSString (JXFrame)
@property (nonatomic, assign, readonly) BOOL jx_isPureInt;
@property (nonatomic, copy, readonly) NSString *jx_underlineFromCamel;
@property (nonatomic, copy, readonly) NSString *jx_camelFromUnderline;
@property (nonatomic, copy, readonly) NSString *jx_firstCharLower;
@property (nonatomic, copy, readonly) NSString *jx_firstCharUpper;
@property (nonatomic, strong, readonly) NSURL *jx_url;

- (NSString *)jx_urlEncoded;
- (NSString *)jx_urlDecoded;
- (NSString *)jx_urlComponentEncoded;
- (NSString *)jx_urlComponentDecoded;

+ (NSString *)jx_stringWithObject:(id)value;
+ (NSString *)jx_filePathInDocuments:(NSString *)fileName;

@end

