//
//  JXScrollViewController.h
//  Pods
//
//  Created by 杨建祥 on 2019/12/30.
//

#import "JXBaseViewController.h"
#import "JXScrollViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JXScrollViewController : JXBaseViewController <JXScrollViewModelDelegate, DZNEmptyDataSetDelegate, UIScrollViewDelegate>
@property (nonatomic, strong, readonly) UIScrollView *scrollView;

- (void)setupRefresh:(BOOL)enable;
- (void)setupMore:(BOOL)enable;

- (void)beginRefresh;
- (void)triggerRefresh;
- (void)endRefresh;

- (void)beginMore;
- (void)triggerMore;
- (void)endMore;

@end

NS_ASSUME_NONNULL_END
