//
//  JXPageViewController.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/9.
//

#import "JXPageViewController.h"
#import "JXFunction.h"
#import "JXPageViewModel.h"
#import "JXPageMenuTitleView.h"
#import "JXPageMenuIndicatorLineView.h"

@interface JXPageViewController ()
@property (nonatomic, strong, readwrite) JXPageViewModel *viewModel;
@property (nonatomic, strong, readwrite) JXPageMenuView *menuView;
@property (nonatomic, strong, readwrite) JXPageContainerView *containerView;

@end

@implementation JXPageViewController
@dynamic viewModel;

#pragma mark - Init
- (instancetype)initWithViewModel:(JXPageViewModel *)viewModel {
    if (self = [super initWithViewModel:viewModel]) {
    }
    return self;
}

#pragma mark - View
- (void)viewDidLoad {
    [super viewDidLoad];
    self.containerView = [self preferredContainerView];
    [self.view addSubview:self.containerView];
    
    self.menuView = [self preferredMenuView];
    self.menuView.containerView = self.containerView;
    self.menuView.delegate = self;
    [self.view addSubview:self.menuView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // self.navigationController.interactivePopGestureRecognizer.enabled = (self.menuView.selectedIndex == 0);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.menuView.frame = CGRectMake(0, self.contentTop, self.view.qmui_width, self.menuView.qmui_height);
    self.containerView.frame = CGRectMake(0, self.menuView.qmui_bottom, self.view.qmui_width, self.view.qmui_height - self.menuView.qmui_bottom - self.contentBottom);
}

#pragma mark - Method
#pragma mark super
- (BOOL)forceEnableInteractivePopGestureRecognizer {
    return (self.menuView.selectedIndex == 0);
}

- (void)bindViewModel {
    [super bindViewModel];
    if ([self.menuView isKindOfClass:JXPageMenuTitleView.class]) {
        JXPageMenuTitleView *menuView = (JXPageMenuTitleView *)self.menuView;
        RAC(menuView, titles) = RACObserve(self.viewModel, dataSource);
    }
}

#pragma mark public
- (JXPageMenuView *)preferredMenuView {
    JXPageMenuTitleView *menuView = [[JXPageMenuTitleView alloc] initWithFrame:CGRectMake(0, 0, self.view.qmui_width, JXMetric(40))];
    menuView.titleColorGradientEnabled = YES;
    JXPageMenuIndicatorLineView *lineView = [[JXPageMenuIndicatorLineView alloc] init];
    lineView.indicatorWidth = JXPageAutomaticDimension;
    menuView.indicators = @[lineView];
    return menuView;
}

- (JXPageContainerView *)preferredContainerView {
    return [[JXPageContainerView alloc] initWithType:JXPageContainerTypeScrollView dataSource:self.viewModel];
}

#pragma mark - Delegate
#pragma mark JXPageViewModelDelegate
- (void)reloadData {
    [super reloadData];
    [self.menuView reloadData];
}

#pragma mark JXPageMenuViewDelegate
- (void)menuView:(JXPageMenuView *)menuView didSelectedItemAtIndex:(NSInteger)index {
    
}

- (void)menuView:(JXPageMenuView *)menuView didScrollSelectedItemAtIndex:(NSInteger)index {
    
}

@end
