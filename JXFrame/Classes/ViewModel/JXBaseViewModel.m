//
//  JXBaseViewModel.m
//  ReactHub
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "JXBaseViewModel.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "JXConst.h"
#import "JXFunction.h"
#import "NSObject+JXFrame.h"
#import "NSDictionary+JXFrame.h"
#import "JXBaseViewController.h"

@interface JXBaseViewModel ()
@property (nonatomic, copy, readwrite) NSDictionary<NSString *,id> *parameters;;
@property (nonatomic, strong, readwrite) JXBaseModel *model;
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
- (instancetype)initWithRouteParameters:(NSDictionary<NSString *,id> *)parameters {
    if (self = [super init]) {
        self.parameters = [JXObjWithDft(parameters, @{}) copy];
        self.shouldFetchLocalData = [self.parameters jx_numberForKey:kJXParamFetchLocal withDefault:@(YES)].boolValue;
        self.shouldRequestRemoteData = [self.parameters jx_numberForKey:kJXParamRequestRemote].boolValue;
        self.hidesNavigationBar = [self.parameters jx_numberForKey:kJXParamHideNavBar].boolValue;
        self.hidesNavBottomLine = [self.parameters jx_numberForKey:kJXParamHideNavBottomLine].boolValue;
        self.title = [self.parameters jx_stringForKey:kJXParamTitle];
        id modelObject = [self.parameters jx_stringForKey:kJXParamModel].jx_JSONObject;
        if (modelObject && [modelObject isKindOfClass:NSDictionary.class]) {
            Class modelClass = NSClassFromString([NSStringFromClass(self.class) stringByReplacingOccurrencesOfString:kJXVMSuffix withString:@""]);
            if (modelClass) {
                self.model = [[modelClass alloc] initWithDictionary:(NSDictionary *)modelObject error:nil];
            }
        }
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
    [[self.executing skip:1] subscribeNext:^(NSNumber * _Nullable executing) {
        @strongify(self)
        if (executing.boolValue) {
            [MBProgressHUD showHUDAddedTo:self.viewController.view animated:YES];
        }
    }];
    [self.errors subscribeNext:^(NSError *error) {
        @strongify(self)
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.viewController.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = error.localizedDescription;
        [hud hideAnimated:YES afterDelay:3.f];
    }];
    
    self.backCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSNumber * _Nullable isBack) {
        @strongify(self)
        if (isBack.boolValue) {
            [self.navigator popViewModelAnimated:YES];
        }else {
            [self.navigator dismissViewModelAnimated:YES completion:nil];
        }
        return RACSignal.empty;
    }];
    
//    [[[RACObserve(self, dataSource) skip:1] deliverOnMainThread] subscribeNext:^(id x) {
//        @strongify(self)
//        self.items = nil;
//    }];
    
    self.requestRemoteDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSNumber *page) {
        @strongify(self)
        return [[self requestRemoteDataSignalWithPage:page.integerValue] takeUntil:self.rac_willDeallocSignal];
    }];
    [[self.requestRemoteDataCommand.errors filter:self.requestRemoteDataErrorsFilter] subscribe:self.errors];
    
    // RACSignal *fetchLocalDataSignal = [RACSignal return:[self fetchLocalData]];
    RACSignal *requestRemoteDataSignal = self.requestRemoteDataCommand.executionSignals.switchToLatest;
    if (self.shouldFetchLocalData && !self.shouldRequestRemoteData) {
        RAC(self, dataSource) = [[RACSignal return:[self fetchLocalData]].deliverOnMainThread map:^id(id data) {
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
    return RACSignal.empty;
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
    [[viewModel rac_signalForSelector:@selector(initWithRouteParameters:)] subscribeNext:^(id x) {
        @strongify(viewModel)
        [viewModel didInitialize];
    }];
    return viewModel;
}

@end
