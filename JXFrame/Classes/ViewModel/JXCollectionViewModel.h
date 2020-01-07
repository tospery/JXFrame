//
//  JXCollectionViewModel.h
//  ReactHub
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "JXScrollViewModel.h"
#import "JXCollectionItem.h"

@class JXCollectionViewModel;

@protocol JXCollectionViewModelDataSource <UICollectionViewDataSource>
- (JXCollectionItem *)collectionViewModel:(JXCollectionViewModel *)viewModel itemAtIndexPath:(NSIndexPath *)indexPath;
- (Class)collectionViewModel:(JXCollectionViewModel *)viewModel cellClassForItem:(JXCollectionItem *)item;
- (Class)collectionViewModel:(JXCollectionViewModel *)viewModel headerClassForSection:(NSInteger)section;
- (Class)collectionViewModel:(JXCollectionViewModel *)viewModel footerClassForSection:(NSInteger)section;

@end

@protocol JXCollectionViewModelDelegate <JXScrollViewModelDelegate>

@end

@interface JXCollectionViewModel : JXScrollViewModel <JXCollectionViewModelDataSource>
@property (nonatomic, strong) NSDictionary *itemCellMapping;
@property (nonatomic, strong) NSDictionary *headerClassMapping;
@property (nonatomic, strong) NSDictionary *footerClassMapping;
@property (nonatomic, weak) id<JXCollectionViewModelDelegate> delegate;

//@property (nonatomic, strong) id headerVM; // YJX_TODO 新增 collectionHeaderView
//@property (nonatomic, strong) id footerVM;

- (void)configureCell:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withItem:(JXCollectionItem *)item;
- (void)configureHeader:(UICollectionReusableView *)header atIndexPath:(NSIndexPath *)indexPath;
- (void)configureFooter:(UICollectionReusableView *)footer atIndexPath:(NSIndexPath *)indexPath;

@end

