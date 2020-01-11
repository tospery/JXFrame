//
//  NSBundle+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/11.
//

#import "NSBundle+JXFrame.h"
#import "JXFunction.h"

@implementation NSBundle (JXFrame)
+ (NSBundle *)jx_bundleWithModule:(NSString *)module {
    if (module.length == 0) {
        return [NSBundle mainBundle];
    }
    
    NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(module)];
    if (!bundle) {
        NSString *identifier = JXStrWithFmt(@"org.cocoapods.%@", module);
        bundle = [NSBundle bundleWithIdentifier:identifier];
    }
    if (!bundle) {
        return [NSBundle mainBundle];
    }
    
    return bundle;
}

@end
