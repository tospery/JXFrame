//
//  JXBaseViewModel.m
//  ReactHub
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "JXBaseViewModel.h"
#import "JXConst.h"
#import "JXFunc.h"
#import "JXPrompt.h"

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
//        self.hidesNavigationBar = TBBoolMemberWithKeyAndDefault(params, kTBParamHideNavBar, NO);
//        self.hidesNavBottomLine = TBBoolMemberWithKeyAndDefault(params, kTBParamHideNavBottomLine, NO);
//        self.shouldFetchLocalDataOnViewModelInitialize = TBBoolMemberWithKeyAndDefault(params, kTBParamFetchLocal, NO);
//        self.shouldRequestRemoteDataOnViewDidLoad = TBBoolMemberWithKeyAndDefault(params, kTBParamRequestRemote, NO);
//        self.title = TBStrMemberWithKeyAndDefault(params, kTBParamTitle, nil);
//        self.backgroundColor = TBColorMemberWithKeyAndDefaultForString(params, kTBParamBackgroundColor, UIColorForBackground);
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
    if (!_items) {
        if ([self.dataSource isKindOfClass:[NSArray class]]) {
            _items = self.dataSource.firstObject;
            if (![_items isKindOfClass:[NSArray class]]) {
                _items = nil;
            }
        }
    }
    return _items;
}

#pragma mark - Public
- (void)didInitialize {
    @weakify(self)
    
    [[self.executing skip:1] subscribeNext:^(NSNumber * _Nullable executing) {
        if (executing.boolValue) {
            [JXPrompt showToastLoading:nil];
        }
    }];
    
    [self.errors subscribeNext:^(NSError *error) {
        [JXPrompt showToastMessage:error.localizedDescription];
    }];
    
    [[[RACObserve(self, dataSource) skip:1] deliverOnMainThread] subscribeNext:^(id x) {
        @strongify(self)
        self.items = nil;
    }];
    
    self.requestRemoteDataCommand = [[RACCommand alloc] initWithSignalBlock:^(NSNumber *page) {
        @strongify(self)
        return [[self requestRemoteDataSignalWithPage:page.integerValue] takeUntil:self.rac_willDeallocSignal];
    }];
    
    [[self.requestRemoteDataCommand.errors filter:[self requestRemoteDataErrorsFilter]] subscribe:self.errors];
    
    self.backCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSNumber * _Nullable isBack) {
        @strongify(self)
        if (isBack.boolValue) {
            [self.navigator popViewModelAnimated:YES];
        }else {
            [self.navigator dismissViewModelAnimated:YES completion:nil];
        }
        return RACSignal.empty;
    }];
    
    RACSignal *fetchLocalDataSignal = [RACSignal return:[self fetchLocalData]];
    RACSignal *requestRemoteDataSignal = self.requestRemoteDataCommand.executionSignals.switchToLatest;
    if (self.shouldFetchLocalDataOnViewModelInitialize && !self.shouldRequestRemoteDataOnViewDidLoad) {
        RAC(self, dataSource) = [[fetchLocalDataSignal deliverOnMainThread] map:^id(id viewObject) {
            @strongify(self)
            return [self viewObject2DataSource:viewObject];
        }];
    }else if (!self.shouldFetchLocalDataOnViewModelInitialize && self.shouldRequestRemoteDataOnViewDidLoad) {
        RAC(self, dataSource) = [[requestRemoteDataSignal deliverOnMainThread] map:^id(id viewObject) {
            @strongify(self)
            return [self viewObject2DataSource:viewObject];
        }];
    }else if (self.shouldFetchLocalDataOnViewModelInitialize && self.shouldRequestRemoteDataOnViewDidLoad) {
        RAC(self, dataSource) = [[[requestRemoteDataSignal startWith:[self fetchLocalData]] deliverOnMainThread] map:^id(id viewObject) {
            return [self viewObject2DataSource:viewObject];
        }];
    }
}

- (id)viewObject2DataSource:(id)viewObject {
    return nil;// TBDyadicArray(viewObject);
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
