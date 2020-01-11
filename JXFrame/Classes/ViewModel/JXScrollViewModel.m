//
//  JXScrollViewModel.m
//  ReactHub
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "JXScrollViewModel.h"
#import "JXFunction.h"
#import "JXString.h"
#import "JXFrameManager.h"
#import "NSAttributedString+JXFrame.h"
#import "NSError+JXFrame.h"

@interface JXScrollViewModel ()

@end

@implementation JXScrollViewModel
@dynamic delegate;

#pragma mark - Init
- (instancetype)initWithParams:(NSDictionary *)params {
    if (self = [super initWithParams:params]) {
//        self.shouldPullToRefresh = TBBoolMemberWithKeyAndDefault(params, kTBParamPullRefresh, NO);
//        self.shouldScrollToMore = TBBoolMemberWithKeyAndDefault(params, kTBParamLoadMore, NO);
//        self.pageIndex = TBIntMemberWithKeyAndDefault(params, kTBParamPageIndex, [TBFrameManager sharedInstance].pageIndex);
//        self.pageSize = TBIntMemberWithKeyAndDefault(params, kTBParamPageSize, [TBFrameManager sharedInstance].pageSize);
//        self.pageStart = TBIntMemberWithKeyAndDefault(params, kTBParamPageBegin, self.pageIndex);
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
    return (page - 1) * self.pageSize;
}

- (NSInteger)nextPageIndex {
    return self.pageIndex + 1;
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
    return [NSAttributedString jx_attributedStringWithString:title color:UIColorGrayLighten font:JXFont(14.0f)];
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    if (!self.error) {
        return nil;
    }
    NSString *title = JXStrWithDft([self.error jx_retryTitle], kStringReload);
    return [NSAttributedString jx_attributedStringWithString:title color:(UIControlStateNormal == state ? UIColorWhite : [UIColorWhite colorWithAlphaComponent:0.8]) font:JXFont(15.0f)];
}

- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    UIImage *image = [UIImage qmui_imageWithColor:JXFrameManager.share.primaryColor size:CGSizeMake(120, 30) cornerRadius:2.0f];
    image = [image imageWithAlignmentRectInsets:UIEdgeInsetsMake(0, -120, 0, -120)];
    return (UIControlStateNormal == state ? image : nil);
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return self.error ? [self.error jx_reasonImage] : JXFrameManager.share.loadingImage;
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
    return JXObjWithDft(UIColorForBackground, UIColorWhite);
}

@end
