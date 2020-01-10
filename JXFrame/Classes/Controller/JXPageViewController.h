//
//  JXPageViewController.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/9.
//

#import "JXScrollViewController.h"
#import "JXPageViewModel.h"
#import "JXPageMenuView.h"

@interface JXPageViewController : JXScrollViewController <JXPageViewModelDelegate, JXPageMenuViewDelegate>
@property (nonatomic, strong, readonly) JXPageMenuView *menuView;
@property (nonatomic, strong, readonly) JXPageContainerView *containerView;

- (JXPageMenuView *)preferredMenuView;
- (JXPageContainerView *)preferredContainerView;

@end

