//
//  JXCollectionCell.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import "JXCollectionCell.h"
#import "JXFunction.h"

@interface JXCollectionCell ()
@property (nonatomic, strong, readwrite) JXCollectionItem *viewModel;;

@end

@implementation JXCollectionCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
//        self.qmui_borderWidth = PixelOne;
//        self.qmui_borderColor = UIColorSeparator;
//        self.qmui_borderPosition = QMUIViewBorderPositionBottom;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (!self.viewModel) {
        return;
    }
}

- (void)bindViewModel:(JXCollectionItem *)item {
    self.viewModel = item;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

+ (NSString *)identifier {
    return JXStrWithFmt(@"%@Identifier", NSStringFromClass(self));
}

@end
