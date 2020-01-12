//
//  JXWebProgressView.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/9.
//

#import "JXWebProgressView.h"

@interface JXWebProgressView ()

@end

@implementation JXWebProgressView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.progressBarView = [[UIView alloc] initWithFrame:self.bounds];
        self.progressBarView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        UIColor *tintColor = [UIColor colorWithRed:22.f / 255.f green:126.f / 255.f blue:251.f / 255.f alpha:1.0];
        if ([UIApplication.sharedApplication.delegate.window respondsToSelector:@selector(setTintColor:)] && UIApplication.sharedApplication.delegate.window.tintColor) {
            tintColor = UIApplication.sharedApplication.delegate.window.tintColor;
        }
        self.progressBarView.backgroundColor = tintColor;
        [self addSubview:self.progressBarView];
        
        self.barAnimationDuration = 0.27f;
        self.fadeAnimationDuration = 0.27f;
        self.fadeOutDelay = 0.1f;
    }
    return self;
}

- (void)setProgress:(CGFloat)progress {
    [self setProgress:progress animated:NO];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated {
    BOOL isGrowing = progress > 0.0;
    [UIView animateWithDuration:(isGrowing && animated) ? self.barAnimationDuration : 0.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect frame = self.progressBarView.frame;
        frame.size.width = progress * self.bounds.size.width;
        self.progressBarView.frame = frame;
    } completion:nil];
    
    if (progress >= 1.0) {
        [UIView animateWithDuration:animated ? self.fadeAnimationDuration : 0.0 delay:self.fadeOutDelay options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.progressBarView.alpha = 0.0;
        } completion:^(BOOL completed){
            CGRect frame = self.progressBarView.frame;
            frame.size.width = 0;
            self.progressBarView.frame = frame;
        }];
    } else {
        [UIView animateWithDuration:animated ? self.fadeAnimationDuration : 0.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.progressBarView.alpha = 1.0;
        } completion:nil];
    }
}

@end
