//
//  UIApplication+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/4.
//

#import "UIApplication+JXFrame.h"

@implementation UIApplication (JXFrame)
- (NSString *)jx_version {
    return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

- (NSString *)jx_urlScheme {
    NSArray *urlTypes = [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleURLTypes"];
    NSString *scheme = nil;
    for (NSDictionary *info in urlTypes) {
        NSString *urlName = [info objectForKey:@"CFBundleURLName"];
        if ([urlName isEqualToString:@"app"]) {
            NSArray *urlSchemes = [info objectForKey:@"CFBundleURLSchemes"];
            scheme = urlSchemes.firstObject;
            break;
        }
    }
    NSParameterAssert(scheme);
    return scheme;
}

- (NSString *)jx_displayName {
    return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleDisplayName"];
}

- (NSString *)jx_teamID {
    NSDictionary *query = @{(__bridge id)kSecClass : (__bridge id)kSecClassGenericPassword,
                            (__bridge id)kSecAttrAccount : @"bundleSeedID",
                            (__bridge id)kSecAttrService : @"",
                            (__bridge id)kSecReturnAttributes : (__bridge id)kCFBooleanTrue};
    
    CFDictionaryRef result = nil;
    OSStatus status = SecItemCopyMatching((CFDictionaryRef)query, (CFTypeRef *)&result);
    if (status == errSecItemNotFound) {
        status = SecItemAdd((CFDictionaryRef)query, (CFTypeRef *)&result);
    }
    
    if (status != errSecSuccess) {
        return nil;
    }
    
    NSString *accessGroup = [(__bridge NSDictionary *)result objectForKey:(__bridge id)kSecAttrAccessGroup];
    NSArray *components = [accessGroup componentsSeparatedByString:@"."];
    NSString *bundleSeedID = [[components objectEnumerator] nextObject];
    CFRelease(result);
    
    return bundleSeedID;
}

@end
