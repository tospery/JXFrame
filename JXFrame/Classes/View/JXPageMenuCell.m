//
//  JXPageMenuCell.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/10.
//

#import "JXPageMenuCell.h"

@interface JXPageMenuCell ()
@property (nonatomic, strong) JXPageMenuItem *viewModel;
@property (nonatomic, strong) JXPageMenuAnimator *animator;
@property (nonatomic, strong) NSMutableArray <JXPageMenuCellSelectedAnimationBlock> *animationBlockArray;

@end

@implementation JXPageMenuCell
@dynamic viewModel;

- (void)dealloc
{
    [self.animator stop];
}

- (void)prepareForReuse {
    [super prepareForReuse];

    [self.animator stop];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self didInitialize];
    }
    return self;
}

- (void)didInitialize {
    _animationBlockArray = [NSMutableArray array];
}

- (void)bindViewModel:(JXPageMenuItem *)item {
    self.viewModel = item;
    if (item.isSelectedAnimationEnabled) {
        [self.animationBlockArray removeLastObject];
        if ([self checkCanStartSelectedAnimation:item]) {
            _animator = [[JXPageMenuAnimator alloc] init];
            self.animator.duration = item.selectedAnimationDuration;
        }else {
            [self.animator stop];
        }
    }
}

- (BOOL)checkCanStartSelectedAnimation:(JXPageMenuItem *)item {
    if (item.selectedType == JXPageMenuCellSelectedTypeCode || item.selectedType == JXPageMenuCellSelectedTypeClick) {
        return YES;
    }
    return NO;
}

- (void)addSelectedAnimationBlock:(JXPageMenuCellSelectedAnimationBlock)block {
    [self.animationBlockArray addObject:block];
}

- (void)startSelectedAnimationIfNeeded:(JXPageMenuItem *)item {
    if (item.isSelectedAnimationEnabled && [self checkCanStartSelectedAnimation:item]) {
        //需要更新isTransitionAnimating，用于处理在过滤时，禁止响应点击，避免界面异常。
        item.transitionAnimating = YES;
        __weak typeof(self)weakSelf = self;
        self.animator.progressCallback = ^(CGFloat percent) {
            for (JXPageMenuCellSelectedAnimationBlock block in weakSelf.animationBlockArray) {
                block(percent);
            }
        };
        self.animator.completeCallback = ^{
            item.transitionAnimating = NO;
            [weakSelf.animationBlockArray removeAllObjects];
        };
        [self.animator start];
    }
}

@end

