//
//  JXPageViewModel.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/10.
//

#import "JXPageViewModel.h"

@interface JXPageViewModel ()

@end

@implementation JXPageViewModel
@dynamic delegate;

#pragma mark - Init
#pragma mark - View
#pragma mark - Property
#pragma mark - Method
#pragma mark super
#pragma mark public
#pragma mark private

#pragma mark - Delegate
#pragma mark JXPageContainerViewDataSource
- (NSInteger)numberOfContentInContainerView:(JXPageContainerView *)containerView {
    return self.dataSource.count;
}

- (id<JXPageContentProtocol>)containerView:(JXPageContainerView *)containerView initContentForIndex:(NSInteger)index {
    return nil;
}

#pragma mark - Class

@end
