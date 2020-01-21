//
//  JXScrollViewModel.m
//  ReactHub
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "JXScrollViewModel.h"
#import "JXConst.h"
#import "JXFunction.h"
#import "JXString.h"
#import "JXParam.h"
#import "JXFrameManager.h"
#import "NSAttributedString+JXFrame.h"
#import "NSError+JXFrame.h"
#import "NSDictionary+JXFrame.h"

@interface JXScrollViewModel ()

@end

@implementation JXScrollViewModel
@dynamic delegate;

#pragma mark - Init
- (instancetype)initWithRouteParameters:(NSDictionary<NSString *,id> *)parameters {
    if (self = [super initWithRouteParameters:parameters]) {
        self.shouldPullToRefresh = JXBoolMember(parameters, JXParam.pullRefresh, NO);
        self.shouldScrollToMore = JXBoolMember(parameters, JXParam.scrollMore, NO);
        self.page = [[JXPage alloc] init];
        self.page.start = JXIntMember(parameters, JXParam.page, JXFrameManager.share.page.start);
        self.page.size = JXIntMember(parameters, JXParam.pageSize, JXFrameManager.share.page.size);
    }
    return self;
}

- (void)didInitialize {
    [super didInitialize];
}

#pragma mark - Accessor
//- (NSMutableArray *)preloadPages {
//    if (!_preloadPages) {
//        NSMutableArray *mArr = [NSMutableArray array];
//        _preloadPages = mArr;
//    }
//    return _preloadPages;
//}

#pragma mark - Public
- (NSUInteger)offsetForPage:(NSUInteger)page {
    return (page - 1) * self.page.size;
}

- (NSInteger)nextPageIndex {
    return self.page.start + 1;
}

#pragma mark - Delegate
#pragma mark DZNEmptyDataSetSource
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    return nil;
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    if (!self.error) {
        return nil;
    }
    NSString *title = JXStrWithDft(self.error.localizedDescription, kStringDataEmpty);
    return [NSAttributedString jx_attributedStringWithString:title color:JXColorKey(TEXT) font:JXFont(14.0f)];
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    if (!self.error) {
        return nil;
    }
    NSString *title = JXStrWithDft([self.error jx_retryTitle], kStringReload);
    return [NSAttributedString jx_attributedStringWithString:title color:(UIControlStateNormal == state ? JXColorWhite : [JXColorWhite colorWithAlphaComponent:0.8]) font:JXFont(15.0f)];
}

- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    UIImage *image = [UIImage qmui_imageWithColor:JXColorKey(TINT) size:CGSizeMake(120, 30) cornerRadius:2.0f];
    image = [image imageWithAlignmentRectInsets:UIEdgeInsetsMake(0, -120, 0, -120)];
    return (UIControlStateNormal == state ? image : nil);
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    if (!self.error) {
        return [JXFrameManager.share.loadingImage qmui_imageWithTintColor:JXColorKey(TINT)];
    }
    return [self.error jx_reasonImage];
}

- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0) ];
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    return animation;
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return JXColorKey(BG);
}

@end
