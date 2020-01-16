//
//  JXWebViewModel.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/8.
//

#import "JXWebViewModel.h"
#import <JLRoutes/JLRoutes.h>
#import "JXConst.h"
#import "JXFunction.h"
#import "NSDictionary+JXFrame.h"

@interface JXWebViewModel ()
@property (nonatomic, strong, readwrite) NSURL *url;
@property (nonatomic, strong, readwrite) UIColor *progressColor;

@end

@implementation JXWebViewModel
- (instancetype)initWithRouteParameters:(NSDictionary<NSString *,id> *)parameters {
    if (self = [super initWithRouteParameters:parameters]) {
        self.shouldFetchLocalData = NO;
        self.shouldRequestRemoteData = YES;
        NSURL *url = [self.parameters jx_objectForKey:JLRouteURLKey withDefault:nil baseClass:NSURL.class];
        if (!url) {
            url = JXURLWithStr([self.parameters jx_stringForKey:kJXParamURLString]);
        }
        self.url = url;
        self.progressColor = JXColorKey(TINT);
    }
    return self;
}


@end
