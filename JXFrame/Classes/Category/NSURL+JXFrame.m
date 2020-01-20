//
//  NSURL+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/5.
//

#import "NSURL+JXFrame.h"
#import <QMUIKit/QMUIKit.h>
#import "NSObject+JXFrame.h"
#import "NSString+JXFrame.h"

@implementation NSURL (JXFrame)
- (NSURL *)jx_addQueries:(NSDictionary *)queries {
    if (!queries || ![queries isKindOfClass:NSDictionary.class] || !queries.count) {
        return self;
    }

    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:self.qmui_queryItems];
    for (NSString *key in queries.allKeys) {
        [params setObject:queries[key] forKey:key];
    }

    NSMutableString *urlString = [NSMutableString stringWithFormat:@"%@://%@%@?", self.scheme, self.host, self.path];
    for (NSString *key in params.allKeys) {
        id obj = params[key];
        NSString *value = nil;
        if ([obj isKindOfClass:[NSString class]]) {
            value = obj;
        }else if ([obj isKindOfClass:[NSNumber class]]) {
            value = [(NSNumber *)obj stringValue];
        }else {
            value = [obj jx_JSONString];
        }
        value = [value jx_urlComponentEncoded];
        if (value.length != 0) {
            [urlString appendFormat:@"%@=%@&", key, value];
        }
    }
    if ([urlString hasSuffix:@"?"] || [urlString hasSuffix:@"&"]) {
        [urlString deleteCharactersInRange:NSMakeRange(urlString.length - 1, 1)];
    }

    return [NSURL URLWithString:urlString];
}

+ (NSURL *)jx_urlWithString:(NSString *)urlString {
    if (!urlString || ![urlString isKindOfClass:[NSString class]] || !urlString.length) {
        return nil;
    }
    return [NSURL URLWithString:[urlString jx_urlEncoded]];
}

@end
