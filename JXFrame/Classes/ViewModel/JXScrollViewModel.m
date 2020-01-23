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
    return self.page.index + 1;
}

- (BOOL)filterError:(NSError *)error {
//
//    switch (self.requestMode) {
//        case JXRequestModeLoad:
//        case JXRequestModeUpdate: {
//            break;
//        }
//        case JXRequestModeRefresh: {
//            [self.scrollView.mj_header endRefreshing];
//            break;
//        }
//        case JXRequestModeMore: {
//            if (JXErrorCodeEmpty == error.code) {
//                nedUpdate = NO;
//                [self.scrollView.mj_footer endRefreshingWithNoMoreData];
//            }else {
//                [self.scrollView.mj_footer endRefreshing];
//            }
//            break;
//        }
//        case JXRequestModeHUD: {
//            [JXDialog hideHUD];
//            break;
//        }
//        default:
//            break;
//    }
//
//    if (JXErrorCodeExpired == error.code) {
//        notFilter = NO;
//
//        [gUser checkLoginWithFinish:^(BOOL isRelogin) {
//            if (isRelogin) {
//                [self triggerLoad];
//            }
//        } error:error];
//    }else if (JXErrorCodeEmpty == error.code) {
//        notFilter = NO;
//    }
//
//    self.error = error;
//    self.requestMode = JXRequestModeNone;
//    if (nedUpdate) {
//        self.dataSource = nil;
//    }
//
//    return notFilter;
    
    BOOL canFilter = YES;
    BOOL needUpdate = YES;

    //    JXRequestModeNone,
    //    JXRequestModeLoad,
    //    JXRequestModeUpdate,
    //    JXRequestModeRefresh,
    //    JXRequestModeMore,
    //    JXRequestModeToast
    
    switch (self.requestMode) {
        case JXRequestModeLoad:
        case JXRequestModeRefresh: {
            canFilter = NO;
            break;
        }
        default:
            break;
    }
    
    return canFilter;
}

#pragma mark - Delegate
#pragma mark DZNEmptyDataSetSource
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    if (!self.error) {
        return nil;
    }
    return [NSAttributedString jx_attributedStringWithString:self.error.jx_displayTitle color:JXColorKey(TEXT) font:JXFont(16.0f)];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    if (!self.error) {
        return nil;
    }
    return [NSAttributedString jx_attributedStringWithString:self.error.jx_displayMessage color:JXColorKey(PLACEHOLDER) font:JXFont(14.0f)];
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    if (!self.error) {
        return nil;
    }
    return [NSAttributedString jx_attributedStringWithString:self.error.jx_retryTitle color:(UIControlStateNormal == state ? JXColorWhite : [JXColorWhite colorWithAlphaComponent:0.8]) font:JXFont(15.0f)];
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
    return self.error.jx_displayImage;
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
