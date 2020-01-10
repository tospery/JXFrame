//
//  JXPageMenuCell.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/10.
//

#import "JXCollectionCell.h"
#import "JXType.h"
#import "JXPageMenuItem.h"
#import "JXPageMenuAnimator.h"

@interface JXPageMenuCell : JXCollectionCell
@property (nonatomic, strong, readonly) JXPageMenuItem *viewModel;
@property (nonatomic, strong, readonly) JXPageMenuAnimator *animator;

- (void)didInitialize NS_REQUIRES_SUPER;
- (void)bindViewModel:(id)viewModel NS_REQUIRES_SUPER;
- (BOOL)checkCanStartSelectedAnimation:(JXPageMenuItem *)item;
- (void)addSelectedAnimationBlock:(JXPageMenuCellSelectedAnimationBlock)block;
- (void)startSelectedAnimationIfNeeded:(JXPageMenuItem *)item;

@end
