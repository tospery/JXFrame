//
//  JXScrollViewController.m
//  Pods
//
//  Created by 杨建祥 on 2019/12/30.
//

#import "JXScrollViewController.h"
#import <MJRefresh/MJRefresh.h>
#import "JXFunction.h"
#import "JXTableViewController.h"
#import "JXCollectionViewController.h"
#import "JXTabBarViewController.h"
#import "JXPageViewController.h"
#import "JXWebViewController.h"
#import "UIScrollView+JXFrame.h"

@interface JXScrollViewController ()
@property (nonatomic, strong, readwrite) JXScrollViewModel *viewModel;

@end

@implementation JXScrollViewController
@dynamic viewModel;

#pragma mark - Init
- (instancetype)initWithViewModel:(JXBaseViewModel *)viewModel {
    if (self = [super initWithViewModel:viewModel]) {
    }
    return self;
}

- (void)dealloc {
    _scrollView.delegate = nil;
    _scrollView.emptyDataSetSource = nil;
    _scrollView.emptyDataSetDelegate = nil;
    _scrollView = nil;
}

#pragma mark - View
- (void)viewDidLoad {
    [super viewDidLoad];
    if (![self isKindOfClass:JXTableViewController.class] &&
        ![self isKindOfClass:JXCollectionViewController.class] &&
        ![self isKindOfClass:JXWebViewController.class]) {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.contentTop, self.view.qmui_width, self.view.qmui_height - self.contentTop - self.contentBottom)];
        scrollView.jx_contentView = [[UIView alloc] init];
        scrollView.jx_contentView.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
        scrollView.contentSize = CGSizeMake(scrollView.qmui_width, scrollView.qmui_height + PixelOne);
        scrollView.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
        scrollView.delegate = self;
        scrollView.emptyDataSetSource = self.viewModel;
        scrollView.emptyDataSetDelegate = self;
        if (@available(iOS 11.0, *)) {
            scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [self.view addSubview:scrollView];
        self.scrollView = scrollView;
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // self.scrollView.frame = CGRectMake(self.contentTop, 0, self.view.qmui_width, self.view.qmui_height - self.contentTop - self.contentBottom + PixelOne);
}

#pragma mark - Property
//- (void)setScrollView:(UIScrollView *)scrollView {
//    _scrollView = scrollView;
//    _scrollView.emptyDataSetSource = self.viewModel;
//    _scrollView.emptyDataSetDelegate = self;
//    if (@available(iOS 11.0, *)) {
//        _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    }
//}

#pragma mark - Method
#pragma mark super
- (void)beginLoad {
    [super beginLoad];
    [self setupRefresh:NO];
    [self setupMore:NO];
}

- (void)triggerLoad {
    [self beginLoad];
    @weakify(self)
    [[self.viewModel.requestRemoteDataCommand execute:@(self.viewModel.page.start)].deliverOnMainThread subscribeNext:^(id data) {
        @strongify(self)
        self.viewModel.page.index = self.viewModel.page.start;
    } completed:^{
        @strongify(self)
        [self endLoad];
    }];
}

- (void)endLoad {
    [super endLoad];
    if (self.viewModel.shouldPullToRefresh) {
        [self setupRefresh:YES];
    }
    if (self.viewModel.shouldScrollToMore) {
        [self setupMore:YES];
        if (!self.viewModel.hasMoreData) {
            [self.scrollView.mj_footer endRefreshingWithNoMoreData];
        }
    }
}

- (void)bindViewModel {
    [super bindViewModel];
    
    @weakify(self)
    [[[RACObserve(self.viewModel, shouldPullToRefresh) distinctUntilChanged] deliverOnMainThread] subscribeNext:^(NSNumber *should) {
        @strongify(self)
        [self setupRefresh:should.boolValue];
    }];

    [[[RACObserve(self.viewModel, shouldScrollToMore) distinctUntilChanged] deliverOnMainThread] subscribeNext:^(NSNumber *should) {
        @strongify(self)
        [self setupMore:should.boolValue];
    }];
}

#pragma mark public
- (void)setupRefresh:(BOOL)enable {
    if (enable) {
        self.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(triggerRefresh)];
    }else {
        [self.scrollView.mj_header removeFromSuperview];
        self.scrollView.mj_header = nil;
    }
}

- (void)setupMore:(BOOL)enable {
    if (enable) {
        self.scrollView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(triggerMore)];
    }else {
        [self.scrollView.mj_footer removeFromSuperview];
        self.scrollView.mj_footer = nil;
    }
}

- (void)beginRefresh {
    self.viewModel.requestMode = JXRequestModeRefresh;
    if (self.viewModel.error) {
        self.viewModel.error = nil;
    }
}

- (void)triggerRefresh {
    [self beginRefresh];
    @weakify(self)
    [[self.viewModel.requestRemoteDataCommand execute:@(self.viewModel.page.start)].deliverOnMainThread subscribeNext:^(id data) {
        @strongify(self)
        self.viewModel.page.index = self.viewModel.page.start;
    } completed:^{
        @strongify(self)
        [self endRefresh];
    }];
}

- (void)endRefresh {
    self.viewModel.requestMode = JXRequestModeNone;
    [self.scrollView.mj_header endRefreshing];
    if (self.viewModel.shouldScrollToMore && !self.viewModel.hasMoreData) {
        [self.scrollView.mj_footer endRefreshingWithNoMoreData];
    }
}

- (void)beginMore {
    self.viewModel.requestMode = JXRequestModeMore;
}

- (void)triggerMore {
    [self beginMore];
    @weakify(self)
    NSInteger pageIndex = [self.viewModel nextPageIndex];
    [[self.viewModel.requestRemoteDataCommand execute:@(pageIndex)].deliverOnMainThread subscribeNext:^(id data) {
        @strongify(self)
        self.viewModel.page.index = pageIndex;
    } completed:^{
        @strongify(self)
        [self endMore];
    }];
}

- (void)endMore {
    self.viewModel.requestMode = JXRequestModeNone;
    if (self.viewModel.hasMoreData) {
        [self.scrollView.mj_footer endRefreshing];
    }else {
        [self.scrollView.mj_footer endRefreshingWithNoMoreData];
    }
}

#pragma mark private

#pragma mark - Delegate
#pragma mark DZNEmptyDataSetDelegate
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    return (self.viewModel.shouldRequestRemoteData && !self.viewModel.dataSource);
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView {
    return YES;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return YES;
}

- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView {
    return !self.viewModel.error;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    //    if (TBErrorCodeAppLoginExpired == self.viewModel.error.code) {
    //        [(TBUser *)[TBUser current] openLoginIfNeed:^(BOOL isRelogin) {
    //            if (isRelogin) {
    //                [self triggerLoad];
    //            }
    //        } withError:self.viewModel.error];
    //    }else {
    //        [self triggerLoad];
    //    }

    [self triggerLoad];
}

#pragma mark JXScrollViewModelDelegate
- (void)reloadData {
    [super reloadData];
    if ([self.scrollView isMemberOfClass:UIScrollView.class]) {
        [self.scrollView reloadEmptyDataSet];
    }
}

- (void)reloadItemsAtIndexPaths:(NSArray *)indexPaths {
    
}

- (void)preloadNextPage {
    
}

#pragma mark - Class


@end
