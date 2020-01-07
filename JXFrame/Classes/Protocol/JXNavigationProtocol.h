//
//  JXNavigationProtocol.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/3.
//

#import <UIKit/UIKit.h>
#import "JXType.h"

@class JXBaseViewModel;

@protocol JXNavigationProtocol <NSObject>
- (void)pushViewModel:(JXBaseViewModel *)viewModel animated:(BOOL)animated;
- (void)popViewModelAnimated:(BOOL)animated;
- (void)popToRootViewModelAnimated:(BOOL)animated;
- (void)presentViewModel:(JXBaseViewModel *)viewModel animated:(BOOL)animated completion:(JXVoidBlock)completion;
- (void)dismissViewModelAnimated:(BOOL)animated completion:(JXVoidBlock)completion;
- (void)resetRootViewModel:(JXBaseViewModel *)viewModel;

@end

