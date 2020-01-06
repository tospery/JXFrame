//
//  NSURL+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/5.
//

#import "NSURL+JXFrame.h"
#import "NSString+JXFrame.h"

@implementation NSURL (JXFrame)
+ (NSURL *)jx_urlWithString:(NSString *)urlString {
    if (!urlString || ![urlString isKindOfClass:[NSString class]] || !urlString.length) {
        return nil;
    }
    return [NSURL URLWithString:[urlString jx_urlEncoded]];
}

@end
