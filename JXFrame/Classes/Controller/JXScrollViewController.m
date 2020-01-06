//
//  JXScrollViewController.m
//  Pods
//
//  Created by 杨建祥 on 2019/12/30.
//

#import "JXScrollViewController.h"
#import <MJRefresh/MJRefresh.h>
#import "JXFunc.h"
#import "JXTableViewController.h"
#import "JXCollectionViewController.h"
#import "UIScrollView+JXFrame.h"

@interface JXScrollViewController ()
@property (nonatomic, strong, readwrite) JXScrollViewModel *viewModel;
@property (nonatomic, strong, readwrite) UIScrollView *scrollView;

@end

@implementation JXScrollViewController
@dynamic viewModel;

#pragma mark - View
- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = CGRectMake(0, self.contentTop, self.view.qmui_width, self.view.qmui_height - self.contentTop - self.contentBottom);
    if ([self isKindOfClass:JXTableViewController.class]) {
        self.scrollView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    }else if ([self isKindOfClass:JXCollectionViewController.class]) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        self.scrollView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    }else {
        self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
        self.scrollView.jx_contentView = [[UIView alloc] init];
        self.scrollView.jx_contentView.backgroundColor = JXObjWithDft(UIColorForBackground, UIColorWhite);
        self.scrollView.contentSize = CGSizeMake(frame.size.width, frame.size.height + PixelOne);
    }
    self.scrollView.backgroundColor = JXObjWithDft(UIColorForBackground, UIColorWhite);
    self.scrollView.emptyDataSetSource = self.viewModel;
    self.scrollView.emptyDataSetDelegate = self;
    if (@available(iOS 11.0, *)) {
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.view addSubview:self.scrollView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // self.scrollView.frame = CGRectMake(self.contentTop, 0, self.view.qmui_width, self.view.qmui_height - self.contentTop - self.contentBottom + PixelOne);
}

#pragma mark - Bind
- (void)bindViewModel {
    [super bindViewModel];
    
    // RAC(self.scrollView, backgroundColor) = RACObserve(self.viewModel, backgroundColor);
    
    @weakify(self)
    [[[RACObserve(self.viewModel, shouldPullToRefresh) distinctUntilChanged] deliverOnMainThread] subscribeNext:^(NSNumber *should) {
        @strongify(self)
        [self setupRefresh:should.boolValue];
    }];
    
    [[[RACObserve(self.viewModel, shouldLoadToMore) distinctUntilChanged] deliverOnMainThread] subscribeNext:^(NSNumber *should) {
        @strongify(self)
        [self setupMore:should.boolValue];
    }];
}

#pragma mark - Accessor
- (void)setScrollView:(UIScrollView *)scrollView {
    _scrollView = scrollView;
    _scrollView.emptyDataSetSource = self.viewModel;
    _scrollView.emptyDataSetDelegate = self;
    if (@available(iOS 11.0, *)) {
        _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

#pragma mark - refresh/more
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
        self.scrollView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(triggerMore)];
    }else {
        [self.scrollView.mj_footer removeFromSuperview];
        self.scrollView.mj_footer = nil;
    }
}

- (void)beginRefresh {
    
}

- (void)triggerRefresh {
    //    [self beginRefresh];
    //
    //    self.viewModel.requestMode = TBRequestModeRefresh;
    //    if (self.viewModel.error) {
    //        self.viewModel.error = nil;
    //    }
    //
    //    NSInteger pageIndex = self.viewModel.pageBegin;
    //
    //    @weakify(self)
    //    [[[self.viewModel.requestRemoteDataCommand execute:@(pageIndex)] deliverOnMainThread] subscribeNext:^(id x) {
    //        @strongify(self)
    //        self.viewModel.pageIndex = pageIndex;
    //    } completed:^{
    //        @strongify(self)
    //        self.viewModel.requestMode = TBRequestModeNone;
    //        [self.scrollView.mj_header endRefreshing];
    //        if (self.viewModel.shouldLoadToMore && !self.viewModel.hasMoreData) {
    //            [self.scrollView.mj_footer endRefreshingWithNoMoreData];
    //        }
    //        [self endRefresh];
    //    }];
}

- (void)endRefresh {
    
}

- (void)beginMore {
    
}

- (void)triggerMore {
    //    [self beginMore];
    //
    //    self.viewModel.requestMode = TBRequestModeMore;
    //    NSInteger pageIndex = [self.viewModel nextPageIndex];
    //
    //    @weakify(self)
    //    [[[self.viewModel.requestRemoteDataCommand execute:@(pageIndex)] deliverOnMainThread] subscribeNext:^(id x) {
    //        @strongify(self)
    //        self.viewModel.pageIndex = pageIndex;
    //    } completed:^{
    //        @strongify(self)
    //        self.viewModel.requestMode = TBRequestModeNone;
    //        if (self.viewModel.hasMoreData) {
    //            [self.scrollView.mj_footer endRefreshing];
    //        }else {
    //            [self.scrollView.mj_footer endRefreshingWithNoMoreData];
    //        }
    //        [self endMore];
    //    }];
}

- (void)endMore {
    
}

#pragma mark - Delegate
#pragma mark DZNEmptyDataSetDelegate
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    return (self.viewModel.shouldRequestRemoteDataOnViewDidLoad
            && self.viewModel.dataSource == nil);
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView {
    return YES;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return YES;
}

- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView {
    return (self.viewModel.error == nil);
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
    
    //[self triggerLoad];
}

#pragma mark TBScrollVMDelegate
- (void)reloadData {
    [self.scrollView reloadEmptyDataSet];
}

- (void)reloadItemsAtIndexPaths:(NSArray *)indexPaths {
    
}

- (void)preloadNextPage {
    
}

@end