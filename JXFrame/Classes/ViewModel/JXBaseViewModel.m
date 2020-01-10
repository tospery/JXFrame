//
//  JXBaseViewModel.m
//  ReactHub
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "JXBaseViewModel.h"
#import "JXConst.h"
#import "JXFunction.h"

@interface JXBaseViewModel ()
@property (nonatomic, copy, readwrite) NSDictionary *params;
@property (nonatomic, strong, readwrite) NSArray *items;
@property (nonatomic, strong, readwrite) JXNavigator *navigator;
@property (nonatomic, strong, readwrite) JXProvider *provider;
@property (nonatomic, strong, readwrite) RACSubject *errors;
@property (nonatomic, strong, readwrite) RACSubject *executing;
@property (nonatomic, strong, readwrite) RACSubject *willDisappearSignal;
@property (nonatomic, strong, readwrite) RACCommand *backCommand;
@property (nonatomic, strong, readwrite) RACCommand *requestRemoteDataCommand;

@end

@implementation JXBaseViewModel
#pragma mark - Init
- (instancetype)initWithParams:(NSDictionary *)params {
    if (self = [super init]) {
        self.shouldFetchLocalData = YES;
        self.shouldRequestRemoteData = NO;
        self.params = params;
    }
    return self;
}

- (void)dealloc {
    
}

#pragma mark - Property
- (RACSubject *)errors {
    if (!_errors) {
        _errors = [RACSubject subject];
    }
    return _errors;
}

- (RACSubject *)executing {
    if (!_executing) {
        _executing = [RACSubject subject];
    }
    return _executing;
}

- (RACSubject *)willDisappearSignal {
    if (!_willDisappearSignal) {
        _willDisappearSignal = [RACSubject subject];
    }
    return _willDisappearSignal;
}

- (JXNavigator *)navigator {
    if (!_navigator) {
        _navigator = JXNavigator.share;
    }
    return _navigator;
}

- (JXProvider *)provider {
    if (!_provider) {
        _provider = JXProvider.share;
    }
    return _provider;
}

- (NSArray *)items {
    if ([self.dataSource isKindOfClass:NSArray.class]) {
        NSArray *items = self.dataSource.firstObject;
        if ([items isKindOfClass:NSArray.class]) {
            return items;
        }
    }
    return nil;
}

#pragma mark - Public
- (void)didInitialize {
    @weakify(self)
    
    self.backCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSNumber * _Nullable isBack) {
        @strongify(self)
        if (isBack.boolValue) {
            [self.navigator popViewModelAnimated:YES];
        }else {
            [self.navigator dismissViewModelAnimated:YES completion:nil];
        }
        return RACSignal.empty;
    }];
    
    [[self.executing skip:1] subscribeNext:^(NSNumber * _Nullable executing) {
        if (executing.boolValue) {
            [QMUITips showLoading:nil inView:JXAppWindow];
        }
    }];
    [self.errors subscribeNext:^(NSError *error) {
        [QMUITips hideAllTips];
        [QMUITips showWithText:error.localizedDescription];
    }];
    
//    [[[RACObserve(self, dataSource) skip:1] deliverOnMainThread] subscribeNext:^(id x) {
//        @strongify(self)
//        self.items = nil;
//    }];
//
//    self.requestRemoteDataCommand = [[RACCommand alloc] initWithSignalBlock:^(NSNumber *page) {
//        @strongify(self)
//        return [[self requestRemoteDataSignalWithPage:page.integerValue] takeUntil:self.rac_willDeallocSignal];
//    }];
//
//    [[self.requestRemoteDataCommand.errors filter:[self requestRemoteDataErrorsFilter]] subscribe:self.errors];
//
    RACSignal *fetchLocalDataSignal = [RACSignal return:[self fetchLocalData]];
    RACSignal *requestRemoteDataSignal = self.requestRemoteDataCommand.executionSignals.switchToLatest;
    if (self.shouldFetchLocalData && !self.shouldRequestRemoteData) {
        RAC(self, dataSource) = [fetchLocalDataSignal.deliverOnMainThread map:^id(id data) {
            @strongify(self)
            return [self data2Source:data];
        }];
    }else if (!self.shouldFetchLocalData && self.shouldRequestRemoteData) {
        RAC(self, dataSource) = [requestRemoteDataSignal.deliverOnMainThread map:^id(id data) {
            @strongify(self)
            return [self data2Source:data];
        }];
    }else if (self.shouldFetchLocalData && self.shouldRequestRemoteData) {
        RAC(self, dataSource) = [[requestRemoteDataSignal startWith:[self fetchLocalData]].deliverOnMainThread map:^id(id data) {
            return [self data2Source:data];
        }];
    }
}

- (NSArray *)data2Source:(id)data {
    return nil;
}

- (id)fetchLocalData {
    return nil;
}

- (RACSignal *)requestRemoteDataSignalWithPage:(NSInteger)page {
    return [RACSignal empty];
}

- (BOOL (^)(NSError *error))requestRemoteDataErrorsFilter {
    return ^(NSError *error) {
        return YES;
    };
}

#pragma mark - Class
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    JXBaseViewModel *viewModel = [super allocWithZone:zone];
    @weakify(viewModel)
    [[viewModel rac_signalForSelector:@selector(initWithParams:)] subscribeNext:^(id x) {
        @strongify(viewModel)
        [viewModel didInitialize];
    }];
    return viewModel;
}

@end
