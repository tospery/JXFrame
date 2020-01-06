//
//  JXLoginViewModel.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/3.
//

#import "JXLoginViewModel.h"

@interface JXLoginViewModel ()
@property (nonatomic, strong, readwrite) RACSignal *validLoginSignal;

@end

@implementation JXLoginViewModel
- (void)didInitialize {
    [super didInitialize];
    
    self.validLoginSignal = [[RACSignal combineLatest:@[RACObserve(self, username), RACObserve(self, password)] reduce:^(NSString *username, NSString *password) {
        return @(username.length > 0 && password.length > 0);
    }] distinctUntilChanged];
}

@end
