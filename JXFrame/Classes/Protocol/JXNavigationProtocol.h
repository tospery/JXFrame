//
//  JXNavigationProtocol.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/3.
//

#import <UIKit/UIKit.h>
#import "JXType.h"

@class JXBaseViewModel;

NS_ASSUME_NONNULL_BEGIN

@protocol JXNavigationProtocol <NSObject>
- (void)pushViewModel:(JXBaseViewModel *)viewModel animated:(BOOL)animated;
- (void)popViewModelAnimated:(BOOL)animated;
- (void)popToRootViewModelAnimated:(BOOL)animated;
- (void)presentViewModel:(JXBaseViewModel *)viewModel animated:(BOOL)animated completion:(nullable JXVoidBlock)completion;
- (void)dismissViewModelAnimated:(BOOL)animated completion:(nullable JXVoidBlock)completion;
- (void)resetRootViewModel:(JXBaseViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
