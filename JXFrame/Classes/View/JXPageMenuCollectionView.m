//
//  JXPageMenuCollectionView.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/10.
//

#import "JXPageMenuCollectionView.h"

@interface JXPageMenuCollectionView ()<UIGestureRecognizerDelegate>

@end

@implementation JXPageMenuCollectionView
- (void)setIndicators:(NSArray<UIView<JXPageMenuIndicator> *> *)indicators {
    for (UIView *indicator in _indicators) {
        //先移除之前的indicator
        [indicator removeFromSuperview];
    }

    _indicators = indicators;

    for (UIView *indicator in indicators) {
        [self addSubview:indicator];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];

    for (UIView<JXPageMenuIndicator> *view in self.indicators) {
        [self bringSubviewToFront:view];
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.gesture && [self.gesture respondsToSelector:@selector(collectionView:gestureRecognizerShouldBegin:)]) {
        return [self.gesture collectionView:self gestureRecognizerShouldBegin:gestureRecognizer];
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (self.gesture && [self.gesture respondsToSelector:@selector(collectionView:gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:)]) {
        return [self.gesture collectionView:self gestureRecognizer:gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:otherGestureRecognizer];
    }
    return NO;
}

@end

