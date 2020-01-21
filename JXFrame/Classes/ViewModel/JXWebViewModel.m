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
#import "JXParam.h"
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
        self.nativeHandlers = JXArrMember(parameters, JXParam.nativeHandlers, nil);
        self.jsHandlers = JXArrMember(parameters, JXParam.jsHandlers, nil);
        self.url = JXObjWithDft(JXURLMember(parameters, JLRouteURLKey, nil), JXURLMember(parameters, JXParam.url, nil));
        self.progressColor = JXColorKey(TINT);
    }
    return self;
}


@end
