//
//  JXPageMenuIndicatorView.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/10.
//

#import "JXPageMenuIndicatorView.h"
#import "JXPageFactory.h"
#import "JXPageMenuIndicatorBackgroundView.h"

@interface JXPageMenuIndicatorView()

@end

@implementation JXPageMenuIndicatorView

- (void)didInitialize {
    [super didInitialize];

    _separatorLineShowEnabled = NO;
    _separatorLineColor = [UIColor lightGrayColor];
    _separatorLineSize = CGSizeMake(1/[UIScreen mainScreen].scale, 20);
    _cellBackgroundColorGradientEnabled = NO;
    _cellBackgroundUnselectedColor = [UIColor whiteColor];
    _cellBackgroundSelectedColor = [UIColor lightGrayColor];
}

- (void)setIndicators:(NSArray<UIView<JXPageMenuIndicator> *> *)indicators {
    _indicators = indicators;

    self.collectionView.indicators = indicators;
}

- (void)refreshState {
    [super refreshState];

    CGRect selectedCellFrame = CGRectZero;
    JXPageMenuIndicatorItem *selectedItem = nil;
    for (int i = 0; i < self.dataSource.count; i++) {
        JXPageMenuIndicatorItem *item = (JXPageMenuIndicatorItem *)self.dataSource[i];
        item.sepratorLineShowEnabled = self.isSeparatorLineShowEnabled;
        item.separatorLineColor = self.separatorLineColor;
        item.separatorLineSize = self.separatorLineSize;
        item.backgroundViewMaskFrame = CGRectZero;
        item.cellBackgroundColorGradientEnabled = self.isCellBackgroundColorGradientEnabled;
        item.cellBackgroundSelectedColor = self.cellBackgroundSelectedColor;
        item.cellBackgroundUnselectedColor = self.cellBackgroundUnselectedColor;
        if (i == self.dataSource.count - 1) {
            item.sepratorLineShowEnabled = NO;
        }
        if (i == self.selectedIndex) {
            selectedItem = item;
            selectedCellFrame = [self getTargetCellFrame:i];
        }
    }

    for (UIView<JXPageMenuIndicator> *indicator in self.indicators) {
        if (self.dataSource.count <= 0) {
            indicator.hidden = YES;
        }else {
            indicator.hidden = NO;
            JXPageMenuIndicatorModel *indicatorParamsModel = [[JXPageMenuIndicatorModel alloc] init];
            indicatorParamsModel.selectedIndex = self.selectedIndex;
            indicatorParamsModel.selectedCellFrame = selectedCellFrame;
            [indicator refreshState:indicatorParamsModel];

            if ([indicator isKindOfClass:[JXPageMenuIndicatorBackgroundView class]]) {
                CGRect maskFrame = indicator.frame;
                maskFrame.origin.x = maskFrame.origin.x - selectedCellFrame.origin.x;
                selectedItem.backgroundViewMaskFrame = maskFrame;
            }
        }
    }
}

- (void)refreshSelectedItem:(JXPageMenuItem *)selectedItem unselectedItem:(JXPageMenuItem *)unselectedItem {
    [super refreshSelectedItem:selectedItem unselectedItem:unselectedItem];

    JXPageMenuIndicatorItem *myUnselectedItem = (JXPageMenuIndicatorItem *)unselectedItem;
    myUnselectedItem.backgroundViewMaskFrame = CGRectZero;
    myUnselectedItem.cellBackgroundUnselectedColor = self.cellBackgroundUnselectedColor;
    myUnselectedItem.cellBackgroundSelectedColor = self.cellBackgroundSelectedColor;

    JXPageMenuIndicatorItem *myselectedItem = (JXPageMenuIndicatorItem *)selectedItem;
    myselectedItem.cellBackgroundUnselectedColor = self.cellBackgroundUnselectedColor;
    myselectedItem.cellBackgroundSelectedColor = self.cellBackgroundSelectedColor;
}

- (void)contentOffsetOfContentScrollViewDidChanged:(CGPoint)contentOffset {
    [super contentOffsetOfContentScrollViewDidChanged:contentOffset];
    
    CGFloat ratio = contentOffset.x/self.contentScrollView.bounds.size.width;
    if (ratio > self.dataSource.count - 1 || ratio < 0) {
        //超过了边界，不需要处理
        return;
    }
    ratio = MAX(0, MIN(self.dataSource.count - 1, ratio));
    NSInteger baseIndex = floorf(ratio);
    if (baseIndex + 1 >= self.dataSource.count) {
        //右边越界了，不需要处理
        return;
    }
    CGFloat remainderRatio = ratio - baseIndex;

    CGRect leftCellFrame = [self getTargetCellFrame:baseIndex];
    CGRect rightCellFrame = [self getTargetCellFrame:baseIndex + 1];

    JXPageMenuIndicatorModel *indicatorParamsModel = [[JXPageMenuIndicatorModel alloc] init];
    indicatorParamsModel.selectedIndex = self.selectedIndex;
    indicatorParamsModel.leftIndex = baseIndex;
    indicatorParamsModel.leftCellFrame = leftCellFrame;
    indicatorParamsModel.rightIndex = baseIndex + 1;
    indicatorParamsModel.rightCellFrame = rightCellFrame;
    indicatorParamsModel.percent = remainderRatio;
    if (remainderRatio == 0) {
        for (UIView<JXPageMenuIndicator> *indicator in self.indicators) {
            [indicator contentScrollViewDidScroll:indicatorParamsModel];
        }
    }else {
        JXPageMenuIndicatorItem *leftItem = (JXPageMenuIndicatorItem *)self.dataSource[baseIndex];
        leftItem.selectedType = JXPageMenuCellSelectedTypeUnknown;
        JXPageMenuIndicatorItem *rightItem = (JXPageMenuIndicatorItem *)self.dataSource[baseIndex + 1];
        rightItem.selectedType = JXPageMenuCellSelectedTypeUnknown;
        [self refreshLeftItem:leftItem rightItem:rightItem ratio:remainderRatio];

        for (UIView<JXPageMenuIndicator> *indicator in self.indicators) {
            [indicator contentScrollViewDidScroll:indicatorParamsModel];
            if ([indicator isKindOfClass:[JXPageMenuIndicatorBackgroundView class]]) {
                CGRect leftMaskFrame = indicator.frame;
                leftMaskFrame.origin.x = leftMaskFrame.origin.x - leftCellFrame.origin.x;
                leftItem.backgroundViewMaskFrame = leftMaskFrame;

                CGRect rightMaskFrame = indicator.frame;
                rightMaskFrame.origin.x = rightMaskFrame.origin.x - rightCellFrame.origin.x;
                rightItem.backgroundViewMaskFrame = rightMaskFrame;
            }
        }

        JXPageMenuCell *leftCell = (JXPageMenuCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:baseIndex inSection:0]];
        [leftCell bindViewModel:leftItem];
        JXPageMenuCell *rightCell = (JXPageMenuCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:baseIndex + 1 inSection:0]];
        [rightCell bindViewModel:rightItem];
    }
}

- (BOOL)selectCellAtIndex:(NSInteger)index selectedType:(JXPageMenuCellSelectedType)selectedType {
    NSInteger lastSelectedIndex = self.selectedIndex;
    BOOL result = [super selectCellAtIndex:index selectedType:selectedType];
    if (!result) {
        return NO;
    }

    CGRect clickedCellFrame = [self getTargetSelectedCellFrame:index selectedType:selectedType];
    
    JXPageMenuIndicatorItem *selectedItem = (JXPageMenuIndicatorItem *)self.dataSource[index];
    selectedItem.selectedType = selectedType;
    for (UIView<JXPageMenuIndicator> *indicator in self.indicators) {
        JXPageMenuIndicatorModel *indicatorParamsModel = [[JXPageMenuIndicatorModel alloc] init];
        indicatorParamsModel.lastSelectedIndex = lastSelectedIndex;
        indicatorParamsModel.selectedIndex = index;
        indicatorParamsModel.selectedCellFrame = clickedCellFrame;
        indicatorParamsModel.selectedType = selectedType;
        [indicator selectedCell:indicatorParamsModel];
        if ([indicator isKindOfClass:[JXPageMenuIndicatorBackgroundView class]]) {
            CGRect maskFrame = indicator.frame;
            maskFrame.origin.x = maskFrame.origin.x - clickedCellFrame.origin.x;
            selectedItem.backgroundViewMaskFrame = maskFrame;
        }
    }

    JXPageMenuIndicatorCell *selectedCell = (JXPageMenuIndicatorCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
    [selectedCell bindViewModel:selectedItem];

    return YES;
}

@end

@implementation JXPageMenuIndicatorView (UISubclassingIndicatorHooks)

- (void)refreshLeftItem:(JXPageMenuItem *)leftItem rightItem:(JXPageMenuItem *)rightItem ratio:(CGFloat)ratio {
    if (self.isCellBackgroundColorGradientEnabled) {
        //处理cell背景色渐变
        JXPageMenuIndicatorItem *leftModel = (JXPageMenuIndicatorItem *)leftItem;
        JXPageMenuIndicatorItem *rightModel = (JXPageMenuIndicatorItem *)rightItem;
        if (leftModel.isSelected) {
            leftModel.cellBackgroundSelectedColor = [JXPageFactory interpolationColorFrom:self.cellBackgroundSelectedColor to:self.cellBackgroundUnselectedColor percent:ratio];
            leftModel.cellBackgroundUnselectedColor = self.cellBackgroundUnselectedColor;
        }else {
            leftModel.cellBackgroundUnselectedColor = [JXPageFactory interpolationColorFrom:self.cellBackgroundSelectedColor to:self.cellBackgroundUnselectedColor percent:ratio];
            leftModel.cellBackgroundSelectedColor = self.cellBackgroundSelectedColor;
        }
        if (rightModel.isSelected) {
            rightModel.cellBackgroundSelectedColor = [JXPageFactory interpolationColorFrom:self.cellBackgroundUnselectedColor to:self.cellBackgroundSelectedColor percent:ratio];
            rightModel.cellBackgroundUnselectedColor = self.cellBackgroundUnselectedColor;
        }else {
            rightModel.cellBackgroundUnselectedColor = [JXPageFactory interpolationColorFrom:self.cellBackgroundUnselectedColor to:self.cellBackgroundSelectedColor percent:ratio];
            rightModel.cellBackgroundSelectedColor = self.cellBackgroundSelectedColor;
        }
    }

}

@end
