//
//  JXCollectionViewController.m
//  Pods
//
//  Created by 杨建祥 on 2019/12/30.
//

#import "JXCollectionViewController.h"
#import "JXConst.h"
#import "JXFunction.h"
#import "JXCollectionCell.h"
#import "JXSupplementaryView.h"
#import "UIViewController+JXFrame.h"

@interface JXCollectionViewController ()
@property (nonatomic, strong, readwrite) UICollectionView *collectionView;
@property (nonatomic, strong, readwrite) JXCollectionViewModel *viewModel;

@end

@implementation JXCollectionViewController
@dynamic viewModel;

#pragma mark - Init
- (instancetype)initWithViewModel:(JXCollectionViewModel *)viewModel {
    if (self = [super initWithViewModel:viewModel]) {
    }
    return self;
}

- (void)dealloc {
    _collectionView.dataSource = nil;
    _collectionView.delegate = nil;
    _collectionView.emptyDataSetSource = nil;
    _collectionView.emptyDataSetDelegate = nil;
    _collectionView = nil;
}

#pragma mark - View
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.contentTop, self.view.qmui_width, self.view.qmui_height - self.contentTop - self.contentBottom) collectionViewLayout:[self collectionViewLayout]];
    collectionView.dataSource = self.viewModel;
    collectionView.delegate = self;
    collectionView.emptyDataSetSource = self.viewModel;
    collectionView.emptyDataSetDelegate = self;
    collectionView.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    if (@available(iOS 11.0, *)) {
        collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    [self.collectionView registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:kJXIdentifierCollectionCell];
    [self.collectionView registerClass:JXCollectionCell.class forCellWithReuseIdentifier:[JXCollectionCell identifier]];
    [self.collectionView registerClass:UICollectionReusableView.class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:kJXIdentifierCollectionHeader];
    [self.collectionView registerClass:UICollectionReusableView.class forSupplementaryViewOfKind:UICollectionElementKindSectionFooter  withReuseIdentifier:kJXIdentifierCollectionFooter];
    
    NSArray *itemNames = self.viewModel.itemCellMapping.allKeys;
    for (NSString *itemName in itemNames) {
        Class itemCls = NSClassFromString(itemName);
        if (!itemCls) {
            continue;
        }
        
        NSString *cellName = self.viewModel.itemCellMapping[itemName];
        if (cellName.length == 0) {
            continue;
        }
        
        Class cellCls = NSClassFromString(cellName);
        if (!cellCls) {
            continue;
        }
        
        if (![cellCls respondsToSelector:@selector(identifier)]) {
            continue;
        }
        
        NSString *identifier = [cellCls identifier];
        if (identifier.length == 0) {
            continue;
        }
        
        NSString *cellPath = [NSBundle.mainBundle pathForResource:cellName ofType:@"nib"];
        if (cellPath.length == 0) {
            [self.collectionView registerClass:cellCls forCellWithReuseIdentifier:identifier];
        }else {
            UINib *cellNib = [UINib nibWithNibName:cellName bundle:nil];
            [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:identifier];
        }
    }
    
    for (NSString *kind in self.viewModel.headerClassMapping.allKeys) {
        NSArray *names = self.viewModel.headerClassMapping[kind];
        for (NSString *name in names) {
            Class cls = NSClassFromString(name);
            if (cls && [cls respondsToSelector:@selector(identifier)]) {
                NSString *identifier = [cls identifier];
                if (identifier.length != 0) {
                    [self.collectionView registerClass:cls forSupplementaryViewOfKind:kind  withReuseIdentifier:identifier];
                }
            }
        }
    }
    
    for (NSString *kind in self.viewModel.footerClassMapping.allKeys) {
        NSArray *names = self.viewModel.footerClassMapping[kind];
        for (NSString *name in names) {
            Class cls = NSClassFromString(name);
            if (cls && [cls respondsToSelector:@selector(identifier)]) {
                NSString *identifier = [cls identifier];
                if (identifier.length != 0) {
                    [self.collectionView registerClass:cls forSupplementaryViewOfKind:kind  withReuseIdentifier:identifier];
                }
            }
        }
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (self.jx_pageViewController) {
        self.collectionView.frame = self.view.bounds;
    }
}

#pragma mark - Property
- (void)setCollectionView:(UICollectionView *)collectionView {
    _collectionView = collectionView;
    self.scrollView = collectionView;
}

#pragma mark - Method
- (UICollectionViewLayout *)collectionViewLayout {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 0.0f;
    layout.minimumInteritemSpacing = 0.0f;
    return layout;
}

#pragma mark - Delegate
#pragma mark JXCollectionViewModelDelegate
- (void)reloadData {
    [super reloadData];
    [self.collectionView reloadData];
}

- (void)reloadItemsAtIndexPaths:(NSArray *)indexPaths {
    [self.collectionView reloadItemsAtIndexPaths:indexPaths];
}

- (void)preloadNextPage {
    [self triggerMore];
}

#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (![collectionView.dataSource conformsToProtocol:@protocol(JXCollectionViewModelDataSource)]) {
        return CGSizeZero;
    }
    id<JXCollectionViewModelDataSource> dataSource = (id<JXCollectionViewModelDataSource>)collectionView.dataSource;
    JXCollectionItem *item = [dataSource collectionViewModel:self.viewModel itemAtIndexPath:indexPath];
    return item.cellSize;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (![collectionView.dataSource conformsToProtocol:@protocol(JXCollectionViewModelDataSource)]) {
        return CGSizeZero;
    }
    id<JXCollectionViewModelDataSource> dataSource = (id<JXCollectionViewModelDataSource>)collectionView.dataSource;
    Class cls = [dataSource collectionViewModel:self.viewModel headerClassForSection:section];
    if (cls && [cls respondsToSelector:@selector(sizeForSection:)]) {
        return [cls sizeForSection:section];
    }
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (![collectionView.dataSource conformsToProtocol:@protocol(JXCollectionViewModelDataSource)]) {
        return CGSizeZero;
    }
    id<JXCollectionViewModelDataSource> dataSource = (id<JXCollectionViewModelDataSource>)collectionView.dataSource;
    Class cls = [dataSource collectionViewModel:self.viewModel footerClassForSection:section];
    if (cls && [cls respondsToSelector:@selector(sizeForSection:)]) {
        return [cls sizeForSection:section];
    }
    return CGSizeZero;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (!self.viewModel.canSelectCell) {
        return;
    }
    if (![collectionView.dataSource conformsToProtocol:@protocol(JXCollectionViewModelDataSource)]) {
        return;
    }
    id<JXCollectionViewModelDataSource> dataSource = (id<JXCollectionViewModelDataSource>)collectionView.dataSource;
    JXCollectionItem *item = [dataSource collectionViewModel:self.viewModel itemAtIndexPath:indexPath];
    [self.viewModel.didSelectCommand execute:RACTuplePack(indexPath, item)];
}

#pragma mark - UIScrollViewDelegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//}
//
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//}
//
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//}
//
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//}
//
//- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
//}

@end
