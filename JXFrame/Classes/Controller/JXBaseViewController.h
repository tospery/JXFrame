//
//  JXBaseViewController.h
//  AFNetworking
//
//  Created by 杨建祥 on 2019/12/30.
//

#import <QMUIKit/QMUIKit.h>
#import "JXBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JXBaseViewController : QMUICommonViewController <JXBaseViewModelDelegate>
@property (nonatomic, assign, readonly) CGFloat contentTop;
@property (nonatomic, assign, readonly) CGFloat contentBottom;
@property (nonatomic, strong, readonly) JXBaseViewModel *viewModel;

- (instancetype)initWithViewModel:(JXBaseViewModel *)viewModel;

- (void)bindViewModel;

- (void)beginLoad;
- (void)triggerLoad;
- (void)endLoad;

- (void)beginUpdate;
- (void)triggerUpdate;
- (void)endUpdate;

- (void)backItemPressed:(id)sender;

@end

NS_ASSUME_NONNULL_END
