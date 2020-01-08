//
//  JXWebViewModel.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/8.
//

#import "JXWebViewModel.h"
#import "JXConst.h"
#import "JXFunction.h"
#import "NSDictionary+JXFrame.h"

@interface JXWebViewModel ()
@property (nonatomic, strong, readwrite) NSURL *url;
@property (nonatomic, strong, readwrite) UIColor *progressColor;

@end

@implementation JXWebViewModel
- (instancetype)initWithParams:(NSDictionary *)params {
    if (self = [super initWithParams:params]) {
        self.shouldFetchLocalData = NO;
        self.shouldRequestRemoteData = YES;
        self.url = JXURLWithStr([params jx_stringForKey:kJXParamURLString]);
        self.progressColor = JXObjWithDft(UIColorYellow, UIColorWhite);
    }
    return self;
}


@end
