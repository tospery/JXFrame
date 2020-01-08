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
        [self didInitialize];
    }
    return self;
}

- (void)didInitialize {
    self.backgroundColor = JXObjWithDft(UIColorForBackground, UIColorWhite);
    self.qmui_borderWidth = PixelOne;
    self.qmui_borderColor = UIColorSeparator;
    self.qmui_borderPosition = QMUIViewBorderPositionBottom;
}

- (void)bindViewModel:(JXCollectionItem *)viewModel {
    self.viewModel = viewModel;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

+ (NSString *)identifier {
    return JXStrWithFmt(@"%@Identifier", NSStringFromClass(self));
}

@end
