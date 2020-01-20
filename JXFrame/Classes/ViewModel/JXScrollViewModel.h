//
//  JXScrollViewModel.h
//  ReactHub
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "JXBaseViewModel.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import "JXPage.h"

@class JXScrollViewModel;

@protocol JXScrollViewModelDataSource <JXBaseViewModelDataSource, DZNEmptyDataSetSource>

@end

@protocol JXScrollViewModelDelegate <JXBaseViewModelDelegate>
- (void)reloadItemsAtIndexPaths:(NSArray *)indexPaths;
- (void)preloadNextPage;

@end

@interface JXScrollViewModel : JXBaseViewModel <JXScrollViewModelDataSource>
@property (nonatomic, assign) BOOL shouldPullToRefresh;
@property (nonatomic, assign) BOOL shouldScrollToMore;
@property (nonatomic, assign) BOOL hasMoreData;
@property (nonatomic, strong) JXPage *page;
@property (nonatomic, strong) NSMutableArray *preloadPages;
@property (nonatomic, strong) RACCommand *didSelectCommand;
@property (nonatomic, weak) id<JXScrollViewModelDelegate> delegate;

- (NSUInteger)offsetForPage:(NSUInteger)page;
- (NSInteger)nextPageIndex;

@end

