//
//  NSURL+JXFrame.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/5.
//

#import <UIKit/UIKit.h>

@interface NSURL (JXFrame)

- (NSURL *)jx_addQueries:(NSDictionary *)queries;

+ (NSURL *)jx_urlWithString:(NSString *)urlString;

@end

