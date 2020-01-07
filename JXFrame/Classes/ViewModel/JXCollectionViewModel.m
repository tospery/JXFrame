//
//  JXCollectionViewModel.m
//  ReactHub
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "JXCollectionViewModel.h"
#import <QMUIKit/QMUIKit.h>
#import "JXCollectionCell.h"
#import "NSArray+JXFrame.h"
#import "NSDictionary+JXFrame.h"

@interface JXCollectionViewModel ()

@end

@implementation JXCollectionViewModel
@dynamic delegate;

#pragma mark - Init
- (instancetype)initWithParams:(NSDictionary *)params {
    if (self = [super initWithParams:params]) {
    }
    return self;
}

- (void)didInitialize {
    [super didInitialize];
}

#pragma mark - View
#pragma mark - Property
#pragma mark - Method
#pragma mark super
//- (BOOL (^)(NSError *error))requestRemoteDataErrorsFilter {
//    return ^(NSError *error) {
//        switch (self.requestMode) {
//            case TBRequestModeMore: {
//                if (TBErrorCodeAppDataEmpty != error.code) {
//                    // [self.preloadPages removeObject:@([self nextPageIndex])];
//                }
//                break;
//            }
//            default:
//                break;
//        }
//        return YES;
//    };
//}

#pragma mark public
- (void)configureCell:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withItem:(JXCollectionItem *)item {
    
}

- (void)configureHeader:(UICollectionReusableView *)header atIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)configureFooter:(UICollectionReusableView *)footer atIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark private
#pragma mark - Delegate
#pragma mark JXCollectionViewModelDataSource
- (JXCollectionItem *)collectionViewModel:(JXCollectionViewModel *)viewModel itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.dataSource[indexPath.section][indexPath.row];
}

- (Class)collectionViewModel:(JXCollectionViewModel *)viewModel cellClassForItem:(JXCollectionItem *)item {
    NSString *name = [self.itemCellMapping objectForKey:NSStringFromClass(item.class)];
    return NSClassFromString(name);
}

- (Class)collectionViewModel:(JXCollectionViewModel *)viewModel headerClassForSection:(NSInteger)section {
    NSArray *names = [self.headerClassMapping jx_arrayForKey:UICollectionElementKindSectionHeader];
    NSString *name = [names jx_objectAtIndex:section];
    return NSClassFromString(name);
}

- (Class)collectionViewModel:(JXCollectionViewModel *)viewModel footerClassForSection:(NSInteger)section {
    NSArray *names = [self.footerClassMapping jx_arrayForKey:UICollectionElementKindSectionFooter];
    NSString *name = [names jx_objectAtIndex:section];
    return NSClassFromString(name);
}

#pragma mark UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [(NSArray *)self.dataSource[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JXCollectionItem *item = [self collectionViewModel:self itemAtIndexPath:indexPath];
    Class cls = [self collectionViewModel:self cellClassForItem:item];
    NSString *identifier = [cls identifier];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if ([cell isKindOfClass:JXCollectionCell.class]) {
        [(JXCollectionCell *)cell setItem:item];
    }
    [self configureCell:cell atIndexPath:indexPath withItem:item];
    
//    NSArray *items = (NSArray *)self.dataSource.lastObject;
//    if (self.shouldLoadToMore &&
//        (items.count - indexPath.row) < self.pageSize &&
//        ![self.preloadPages containsObject:@(items.count)]) {
//        [self.preloadPages addObject:@(items.count)];
//        [self.delegate preloadNextPage];
//    }
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *view = nil;
    Class cls = nil;
    BOOL isHeader = NO;
    if ([self.headerClassMapping.allKeys containsObject:kind]) {
        isHeader = YES;
        cls = [self collectionViewModel:self headerClassForSection:indexPath.section];
    }else if ([self.footerClassMapping.allKeys containsObject:kind]) {
        cls = [self collectionViewModel:self footerClassForSection:indexPath.section];
    }
    if (cls && [cls respondsToSelector:@selector(identifier)]) {
        NSString *identifier = [cls identifier];
        if (identifier.length != 0) {
            view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifier forIndexPath:indexPath];
            // view.backgroundColor = self.backgroundColor;
            if (isHeader) {
                [self configureHeader:view atIndexPath:indexPath];
            }else {
                [self configureFooter:view atIndexPath:indexPath];
            }
        }
    }
    return view;
}

#pragma mark - Class


@end
