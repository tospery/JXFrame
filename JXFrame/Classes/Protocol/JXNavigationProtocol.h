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
- (UIViewController *)resetRootViewModel:(JXBaseViewModel *)viewModel;
- (UIViewController *)pushViewModel:(JXBaseViewModel *)viewModel animated:(BOOL)animated;
- (UIViewController *)presentViewModel:(JXBaseViewModel *)viewModel animated:(BOOL)animated completion:(JXVoidBlock)completion;
- (void)popViewModelAnimated:(BOOL)animated;
- (void)popToRootViewModelAnimated:(BOOL)animated;
- (void)dismissViewModelAnimated:(BOOL)animated completion:(JXVoidBlock)completion;

@end

