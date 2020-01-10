//
//  JXPageMenuTitleCell.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/10.
//

#import "JXPageMenuIndicatorCell.h"
#import "JXType.h"

@class JXPageMenuTitleItem;

@interface JXPageMenuTitleCell : JXPageMenuIndicatorCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *maskTitleLabel;
@property (nonatomic, strong) NSLayoutConstraint *titleLabelCenterX;
@property (nonatomic, strong) NSLayoutConstraint *titleLabelCenterY;
@property (nonatomic, strong) NSLayoutConstraint *maskTitleLabelCenterX;

- (JXPageMenuCellSelectedAnimationBlock)preferredTitleZoomAnimationBlock:(JXPageMenuTitleItem *)item baseScale:(CGFloat)baseScale;
- (JXPageMenuCellSelectedAnimationBlock)preferredTitleStrokeWidthAnimationBlock:(JXPageMenuTitleItem *)item attributedString:(NSMutableAttributedString *)attributedString;
- (JXPageMenuCellSelectedAnimationBlock)preferredTitleColorAnimationBlock:(JXPageMenuTitleItem *)item;

@end

