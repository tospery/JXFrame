//
//  JXCollectionCell.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import "JXCollectionCell.h"
#import "JXFunction.h"

@interface JXCollectionCell ()
@property (nonatomic, strong, readwrite) QMUILabel *titleLabel;

@end

@implementation JXCollectionCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self didInitialize];
    }
    return self;
}

- (void)didInitialize {
    self.backgroundColor = JXObjWithDft(UIColorForBackground, UIColorWhite);
    [self.contentView addSubview:self.titleLabel];
    self.qmui_borderWidth = PixelOne;
    self.qmui_borderColor = UIColorSeparator;
    self.qmui_borderPosition = QMUIViewBorderPositionBottom;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.qmui_left = 20;
    self.titleLabel.qmui_top = self.titleLabel.qmui_topWhenCenterInSuperview;
}

- (QMUILabel *)titleLabel {
    if (!_titleLabel) {
        QMUILabel *view = [[QMUILabel alloc] init];
        [view sizeToFit];
        _titleLabel = view;
    }
    return _titleLabel;
}

- (void)setItem:(JXCollectionItem *)item {
    _item = item;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

+ (NSString *)identifier {
    return JXStrWithFmt(@"%@Identifier", NSStringFromClass(self));
}

@end
