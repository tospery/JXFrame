//
//  JXPageMenuIndicatorComponentView.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/10.
//

#import "JXPageMenuIndicatorComponentView.h"
#import "JXFunction.h"

@implementation JXPageMenuIndicatorComponentView

- (void)didInitialize {
    [super didInitialize];
    _componentPosition = JXPageMenuComponentPositionBottom;
    _scrollEnabled = YES;
    _verticalMargin = 0;
    _scrollAnimationDuration = 0.25;
    _indicatorWidth = JXPageAutomaticDimension;
    _indicatorWidthIncrement = 0;
    _indicatorHeight = 3;
    _indicatorCornerRadius = JXPageAutomaticDimension;
    _indicatorColor = [UIColor redColor];
    _scrollStyle = JXPageMenuIndicatorScrollStyleSimple;
}

- (CGFloat)indicatorWidthValue:(CGRect)cellFrame {
    if (self.indicatorWidth == JXPageAutomaticDimension) {
        return cellFrame.size.width + self.indicatorWidthIncrement;
    }
    return self.indicatorWidth + self.indicatorWidthIncrement;
}

- (CGFloat)indicatorHeightValue:(CGRect)cellFrame {
    if (self.indicatorHeight == JXPageAutomaticDimension) {
        return cellFrame.size.height;
    }
    return self.indicatorHeight;
}

- (CGFloat)indicatorCornerRadiusValue:(CGRect)cellFrame {
    if (self.indicatorCornerRadius == JXPageAutomaticDimension) {
        return [self indicatorHeightValue:cellFrame]/2;
    }
    return self.indicatorCornerRadius;
}

#pragma mark - JXPageMenuIndicator

- (void)refreshState:(JXPageMenuIndicatorModel *)model {

}

- (void)contentScrollViewDidScroll:(JXPageMenuIndicatorModel *)model {

}

- (void)selectedCell:(JXPageMenuIndicatorModel *)model {
    
}

@end
