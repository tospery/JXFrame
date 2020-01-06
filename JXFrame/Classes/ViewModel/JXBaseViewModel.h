//
//  JXBaseViewModel.h
//  ReactHub
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "JXType.h"
#import "JXNavigator.h"
#import "JXProvider.h"

NS_ASSUME_NONNULL_BEGIN

@class JXBaseViewController;

@protocol JXBaseViewModelDelegate <NSObject>
- (void)reloadData;

@end

@interface JXBaseViewModel : NSObject
@property (nonatomic, assign) BOOL hidesNavigationBar;
@property (nonatomic, assign) BOOL hidesNavBottomLine;
@property (nonatomic, assign) BOOL shouldFetchLocalDataOnViewModelInitialize;
@property (nonatomic, assign) BOOL shouldRequestRemoteDataOnViewDidLoad;
//@property (nonatomic, assign) TBTitleViewType titleViewType;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, copy, readonly) NSDictionary *params;
//@property (nonatomic, assign) TBRequestMode requestMode;
@property (nonatomic, strong) NSError *error;
@property (nonatomic, copy) NSArray *dataSource;
@property (nonatomic, strong, readonly) NSArray *items;
@property (nonatomic, copy) JXVoidBlock_id callback;
@property (nonatomic, strong, readonly) JXNavigator *navigator;
@property (nonatomic, strong, readonly) JXProvider *provider;
@property (nonatomic, strong, readonly) RACSubject *errors;
@property (nonatomic, strong, readonly) RACSubject *executing;
@property (nonatomic, strong, readonly) RACSubject *willDisappearSignal;
@property (nonatomic, strong, readonly) RACCommand *backCommand;
@property (nonatomic, strong, readonly) RACCommand *requestRemoteDataCommand;
@property (nonatomic, weak) JXBaseViewController *viewController;
@property (nonatomic, weak) id<JXBaseViewModelDelegate> delegate;

- (instancetype)initWithParams:(nullable NSDictionary *)params;

- (void)didInitialize;
- (id)viewObject2DataSource:(id)viewObject;
- (id)fetchLocalData;
- (RACSignal *)requestRemoteDataSignalWithPage:(NSInteger)page;
- (BOOL (^)(NSError *error))requestRemoteDataErrorsFilter;

@end

NS_ASSUME_NONNULL_END