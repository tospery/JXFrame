//
//  JXBaseCommand.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/17.
//

#import "JXBaseCommand.h"

@interface JXBaseCommand ()
@property (nonatomic, strong, readwrite) JXWebViewModel *viewModel;

@end

@implementation JXBaseCommand
- (instancetype)initWithViewModel:(JXWebViewModel *)viewModel {
    if (self = [super init]) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)handle:(id)data responseCallback:(WVJBResponseCallback)responseCallback {
    
}

@end
